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
