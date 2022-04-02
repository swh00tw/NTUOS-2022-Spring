#include "param.h"
#include "types.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "defs.h"
#include "proc.h"

/* NTU OS 2022 */
/* Page fault handler */
int handle_pgfault() {
  /* Find the address that caused the fault */
  uint64 va = r_stval();

  /* TODO */
  // allocated physical address and retrieve it
  uint64 pa = (uint64)kalloc();
  struct proc *p = myproc();
  pte_t *pte = walk(p->pagetable, va, 0);

  // page fault handler for swapped page
  if (*pte & PTE_S){
    char* pa = kalloc();
    uint64 blockno = PTE2BLOCKNO(*pte);
    // read page from disk to physical memory
    begin_op();
    read_page_from_disk(ROOTDEV, pa, blockno);
    bfree_page(ROOTDEV, blockno);
    end_op();

    *pte = PA2PTE(pa) | PTE_FLAGS(*pte); // set pa
    *pte &= ~PTE_S; // unset PTE_S bit
    *pte |= PTE_V; // set PTE_V bit

    return 0;
  }

  if (pa == 0) {
    // panic("out of memory");
    return -1;
  } else {
    // starting allocation address
    // initialize the page starting from pointer pa to zero
    memset((void*)pa,0,PGSIZE);
    // walk(p->pagetable, va, 1);
    va=PGROUNDDOWN(va);
    int res = mappages(p->pagetable, va, PGSIZE, pa, PTE_U|PTE_R|PTE_W|PTE_X);
    if (res!=0){
      // panic("mappages failed");
      // deallocate the physical address
      kfree((void*)pa);
      return -1;
    } else {
      // successfully allocated a page
      return 0;
    }
  }
}
// return -1 if there are no memory to be allocated or mappages failed, process has to be killed
// return 0 if handler end successfully
