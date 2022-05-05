#include "types.h"
#include "param.h"
#include "memlayout.h"
#include "riscv.h"
#include "spinlock.h"
#include "proc.h"
#include "defs.h"

struct spinlock tickslock;
uint ticks;

extern char trampoline[], uservec[], userret[];

// in kernelvec.S, calls kerneltrap().
void kernelvec();

extern int devintr();

void
trapinit(void)
{
  initlock(&tickslock, "time");
}

// set up to take exceptions and traps while in the kernel.
void
trapinithart(void)
{
  w_stvec((uint64)kernelvec);
}

void
restore_context_by_id(int thrdstop_context_id)
{
  // printf("load_context_by_id\n");
  struct proc *p = myproc();
  // reload context from thrdstop_context[thrdstop_context_id]
  // p->trapframe = &(p->thrdstop_context[thrdstop_context_id]);
  p->trapframe->s0 = p->thrdstop_context[thrdstop_context_id].s0;
  p->trapframe->s1 = p->thrdstop_context[thrdstop_context_id].s1;
  p->trapframe->s2 = p->thrdstop_context[thrdstop_context_id].s2;
  p->trapframe->s3 = p->thrdstop_context[thrdstop_context_id].s3;
  p->trapframe->s4 = p->thrdstop_context[thrdstop_context_id].s4;
  p->trapframe->s5 = p->thrdstop_context[thrdstop_context_id].s5;
  p->trapframe->s6 = p->thrdstop_context[thrdstop_context_id].s6;
  p->trapframe->s7 = p->thrdstop_context[thrdstop_context_id].s7;
  p->trapframe->s8 = p->thrdstop_context[thrdstop_context_id].s8;
  p->trapframe->s9 = p->thrdstop_context[thrdstop_context_id].s9;
  p->trapframe->s10 = p->thrdstop_context[thrdstop_context_id].s10;
  p->trapframe->s11 = p->thrdstop_context[thrdstop_context_id].s11;
  p->trapframe->t0 = p->thrdstop_context[thrdstop_context_id].t0;
  p->trapframe->t1 = p->thrdstop_context[thrdstop_context_id].t1;
  p->trapframe->t2 = p->thrdstop_context[thrdstop_context_id].t2;
  p->trapframe->t3 = p->thrdstop_context[thrdstop_context_id].t3;
  p->trapframe->t4 = p->thrdstop_context[thrdstop_context_id].t4;
  p->trapframe->t5 = p->thrdstop_context[thrdstop_context_id].t5;
  p->trapframe->t6 = p->thrdstop_context[thrdstop_context_id].t6;
  p->trapframe->a0 = p->thrdstop_context[thrdstop_context_id].a0;
  p->trapframe->a1 = p->thrdstop_context[thrdstop_context_id].a1;
  p->trapframe->a2 = p->thrdstop_context[thrdstop_context_id].a2;
  p->trapframe->a3 = p->thrdstop_context[thrdstop_context_id].a3;
  p->trapframe->a4 = p->thrdstop_context[thrdstop_context_id].a4;
  p->trapframe->a5 = p->thrdstop_context[thrdstop_context_id].a5;
  p->trapframe->a6 = p->thrdstop_context[thrdstop_context_id].a6;
  p->trapframe->a7 = p->thrdstop_context[thrdstop_context_id].a7;
  p->trapframe->epc = p->thrdstop_context[thrdstop_context_id].epc;
  p->trapframe->ra = p->thrdstop_context[thrdstop_context_id].ra;
  p->trapframe->sp = p->thrdstop_context[thrdstop_context_id].sp;
  p->trapframe->gp = p->thrdstop_context[thrdstop_context_id].gp;
  p->trapframe->tp = p->thrdstop_context[thrdstop_context_id].tp;
}

void
store_context_by_id(int thrdstop_context_id)
{
  // printf("store_context_by_id\n");
  struct proc *p = myproc();
  // p->thrdstop_context[thrdstop_context_id] = *p->trapframe;
  p->thrdstop_context[thrdstop_context_id].s0 = p->trapframe->s0;
  p->thrdstop_context[thrdstop_context_id].s1 = p->trapframe->s1;
  p->thrdstop_context[thrdstop_context_id].s2 = p->trapframe->s2;
  p->thrdstop_context[thrdstop_context_id].s3 = p->trapframe->s3;
  p->thrdstop_context[thrdstop_context_id].s4 = p->trapframe->s4;
  p->thrdstop_context[thrdstop_context_id].s5 = p->trapframe->s5;
  p->thrdstop_context[thrdstop_context_id].s6 = p->trapframe->s6;
  p->thrdstop_context[thrdstop_context_id].s7 = p->trapframe->s7;
  p->thrdstop_context[thrdstop_context_id].s8 = p->trapframe->s8;
  p->thrdstop_context[thrdstop_context_id].s9 = p->trapframe->s9;
  p->thrdstop_context[thrdstop_context_id].s10 = p->trapframe->s10;
  p->thrdstop_context[thrdstop_context_id].s11 = p->trapframe->s11;
  p->thrdstop_context[thrdstop_context_id].t0 = p->trapframe->t0;
  p->thrdstop_context[thrdstop_context_id].t1 = p->trapframe->t1;
  p->thrdstop_context[thrdstop_context_id].t2 = p->trapframe->t2;
  p->thrdstop_context[thrdstop_context_id].t3 = p->trapframe->t3;
  p->thrdstop_context[thrdstop_context_id].t4 = p->trapframe->t4;
  p->thrdstop_context[thrdstop_context_id].t5 = p->trapframe->t5;
  p->thrdstop_context[thrdstop_context_id].t6 = p->trapframe->t6;
  p->thrdstop_context[thrdstop_context_id].a0 = p->trapframe->a0;
  p->thrdstop_context[thrdstop_context_id].a1 = p->trapframe->a1;
  p->thrdstop_context[thrdstop_context_id].a2 = p->trapframe->a2;
  p->thrdstop_context[thrdstop_context_id].a3 = p->trapframe->a3;
  p->thrdstop_context[thrdstop_context_id].a4 = p->trapframe->a4;
  p->thrdstop_context[thrdstop_context_id].a5 = p->trapframe->a5;
  p->thrdstop_context[thrdstop_context_id].a6 = p->trapframe->a6;
  p->thrdstop_context[thrdstop_context_id].a7 = p->trapframe->a7;
  p->thrdstop_context[thrdstop_context_id].epc = p->trapframe->epc;
  p->thrdstop_context[thrdstop_context_id].ra = p->trapframe->ra;
  p->thrdstop_context[thrdstop_context_id].sp = p->trapframe->sp;
  p->thrdstop_context[thrdstop_context_id].gp = p->trapframe->gp;
  p->thrdstop_context[thrdstop_context_id].tp = p->trapframe->tp;
}
 
//
// handle an interrupt, exception, or system call from user space.
// called from trampoline.S
//
void
usertrap(void)
{
  int which_dev = 0;

  if((r_sstatus() & SSTATUS_SPP) != 0)
    panic("usertrap: not from user mode");

  // send interrupts and exceptions to kerneltrap(),
  // since we're now in the kernel.
  w_stvec((uint64)kernelvec);

  struct proc *p = myproc();
  
  // save user program counter.
  p->trapframe->epc = r_sepc();
  
  if(r_scause() == 8){
    // system call

    if(p->killed)
      exit(-1);

    // sepc points to the ecall instruction,
    // but we want to return to the next instruction.
    p->trapframe->epc += 4;

    // an interrupt will change sstatus &c registers,
    // so don't enable until done with those registers.
    intr_on();

    syscall();
  } else if((which_dev = devintr()) != 0){
    // ok
  } else {
    printf("usertrap(): unexpected scause %p pid=%d\n", r_scause(), p->pid);
    printf("            sepc=%p stval=%p\n", r_sepc(), r_stval());
    p->killed = 1;
  }

  if(p->killed)
    exit(-1);

  // give up the CPU if this is a timer interrupt.
  if(which_dev == 2)
  {
    if (p->thrdstop_delay!=-1){
      p->ticks++;
      if (p->ticks >= p->thrdstop_delay){
        // save context first
        store_context_by_id(p->thrdstop_context_id);
        // reset delay (timer)
        p->thrdstop_delay = -1;
        // switch to handler by manipulating the program counter
        p->trapframe->a0 = p->handler_arg;
        p->trapframe->epc = p->thrdstop_handler;
      }
    } else {
      // Give up the CPU for one scheduling round.
      yield();
    }
  }
  usertrapret();
}

//
// return to user space
//
void
usertrapret(void)
{
  struct proc *p = myproc();
  // if thrd_resume, restore context
  if (p->trapframe->a7==23){
    // restore context
    restore_context_by_id(p->thrdstop_context_id);
  }

  // we're about to switch the destination of traps from
  // kerneltrap() to usertrap(), so turn off interrupts until
  // we're back in user space, where usertrap() is correct.
  intr_off();

  // send syscalls, interrupts, and exceptions to trampoline.S
  w_stvec(TRAMPOLINE + (uservec - trampoline));

  // set up trapframe values that uservec will need when
  // the process next re-enters the kernel.
  p->trapframe->kernel_satp = r_satp();         // kernel page table
  p->trapframe->kernel_sp = p->kstack + PGSIZE; // process's kernel stack
  p->trapframe->kernel_trap = (uint64)usertrap;
  p->trapframe->kernel_hartid = r_tp();         // hartid for cpuid()


  // set up the registers that trampoline.S's sret will use
  // to get to user space.
  
  // set S Previous Privilege mode to User.
  unsigned long x = r_sstatus();
  x &= ~SSTATUS_SPP; // clear SPP to 0 for user mode
  x |= SSTATUS_SPIE; // enable interrupts in user mode
  w_sstatus(x);

  // set S Exception Program Counter to the saved user pc.
  w_sepc(p->trapframe->epc);

  // tell trampoline.S the user page table to switch to.
  uint64 satp = MAKE_SATP(p->pagetable);
  // jump to trampoline.S at the top of memory, which 
  // switches to the user page table, restores user registers,
  // and switches to user mode with sret.
  uint64 fn = TRAMPOLINE + (userret - trampoline);
  
  ((void (*)(uint64,uint64))fn)(TRAPFRAME, satp);
}

// interrupts and exceptions from kernel code go here via kernelvec,
// on whatever the current kernel stack is.
void 
kerneltrap()
{
  int which_dev = 0;
  uint64 sepc = r_sepc();
  uint64 sstatus = r_sstatus();
  uint64 scause = r_scause();
  
  if((sstatus & SSTATUS_SPP) == 0)
    panic("kerneltrap: not from supervisor mode");
  if(intr_get() != 0)
    panic("kerneltrap: interrupts enabled");

  if((which_dev = devintr()) == 0){
    printf("scause %p\n", scause);
    printf("sepc=%p stval=%p\n", r_sepc(), r_stval());
    panic("kerneltrap");
  }

  // give up the CPU if this is a timer interrupt.
  struct proc *p = myproc();
  if(which_dev == 2 && myproc() != 0 && myproc()->state == RUNNING)
  {
    if (p->thrdstop_delay!=-1){
      p->ticks++;
      if (p->ticks == p->thrdstop_delay){
        // save context first
        store_context_by_id(p->thrdstop_context_id);
        // reset delay (timer)
        // p->thrdstop_delay = -1;
        // switch to handler by manipulating the program counter
        // p->trapframe->a0 = p->handler_arg;
        // p->trapframe->epc = p->thrdstop_handler;
      }
    } else {
      // Give up the CPU for one scheduling round.
      yield();
    }
  }

  // the yield() may have caused some traps to occur,
  // so restore trap registers for use by kernelvec.S's sepc instruction.
  w_sepc(sepc);
  w_sstatus(sstatus);

}

void
clockintr()
{
  acquire(&tickslock);
  ticks++;
  wakeup(&ticks);
  release(&tickslock);
}

// check if it's an external interrupt or software interrupt,
// and handle it.
// returns 2 if timer interrupt,
// 1 if other device,
// 0 if not recognized.
int
devintr()
{
  uint64 scause = r_scause();

  if((scause & 0x8000000000000000L) &&
     (scause & 0xff) == 9){
    // this is a supervisor external interrupt, via PLIC.

    // irq indicates which device interrupted.
    int irq = plic_claim();

    if(irq == UART0_IRQ){
      uartintr();
    } else if(irq == VIRTIO0_IRQ){
      virtio_disk_intr();
    } else if(irq){
      printf("unexpected interrupt irq=%d\n", irq);
    }

    // the PLIC allows each device to raise at most one
    // interrupt at a time; tell the PLIC the device is
    // now allowed to interrupt again.
    if(irq)
      plic_complete(irq);

    return 1;
  } else if(scause == 0x8000000000000001L){
    // software interrupt from a machine-mode timer interrupt,
    // forwarded by timervec in kernelvec.S.

    if(cpuid() == 0){
      clockintr();
    }
    
    // acknowledge the software interrupt by clearing
    // the SSIP bit in sip.
    w_sip(r_sip() & ~2);

    return 2;
  } else {
    return 0;
  }
}

