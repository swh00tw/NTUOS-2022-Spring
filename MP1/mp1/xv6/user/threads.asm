
user/_threads:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <preorder_find_next>:
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;
// TODO: necessary declares, if any
// Algorithm ref: https://www.geeksforgeeks.org/preorder-successor-node-binary-tree/
struct thread* preorder_find_next(struct thread* root, struct thread* current){
   0:	1141                	addi	sp,sp,-16
   2:	e422                	sd	s0,8(sp)
   4:	0800                	addi	s0,sp,16
    if (current->left){
   6:	6dc8                	ld	a0,152(a1)
   8:	c501                	beqz	a0,10 <preorder_find_next+0x10>
    }
    if (parent==NULL){
        return NULL;
    }
    return parent->right;
}
   a:	6422                	ld	s0,8(sp)
   c:	0141                	addi	sp,sp,16
   e:	8082                	ret
    if (current->right){
  10:	71c8                	ld	a0,160(a1)
  12:	fd65                	bnez	a0,a <preorder_find_next+0xa>
    struct thread *curr = current, *parent = current->parent;
  14:	75dc                	ld	a5,168(a1)
        return NULL;
  16:	853e                	mv	a0,a5
    while(parent!=NULL && parent->right==curr){
  18:	dbed                	beqz	a5,a <preorder_find_next+0xa>
  1a:	73c8                	ld	a0,160(a5)
  1c:	feb517e3          	bne	a0,a1,a <preorder_find_next+0xa>
        curr = curr->parent;
  20:	75cc                	ld	a1,168(a1)
        parent = parent->parent;
  22:	77dc                	ld	a5,168(a5)
    while(parent!=NULL && parent->right==curr){
  24:	fbfd                	bnez	a5,1a <preorder_find_next+0x1a>
        return NULL;
  26:	853e                	mv	a0,a5
  28:	b7cd                	j	a <preorder_find_next+0xa>

000000000000002a <preorder_search_last_node>:

// ref: pass pointer and recursive change value: https://stackoverflow.com/questions/46469803/pointer-change-its-address-after-exiting-a-recursive-function
void preorder_search_last_node(struct thread *current_traverse, struct thread **last_thread) {
    if (current_traverse){
  2a:	c91d                	beqz	a0,60 <preorder_search_last_node+0x36>
void preorder_search_last_node(struct thread *current_traverse, struct thread **last_thread) {
  2c:	1101                	addi	sp,sp,-32
  2e:	ec06                	sd	ra,24(sp)
  30:	e822                	sd	s0,16(sp)
  32:	e426                	sd	s1,8(sp)
  34:	e04a                	sd	s2,0(sp)
  36:	1000                	addi	s0,sp,32
  38:	84aa                	mv	s1,a0
  3a:	892e                	mv	s2,a1
        *last_thread = current_traverse;
  3c:	e188                	sd	a0,0(a1)
        preorder_search_last_node(current_traverse->left, last_thread);
  3e:	6d48                	ld	a0,152(a0)
  40:	00000097          	auipc	ra,0x0
  44:	fea080e7          	jalr	-22(ra) # 2a <preorder_search_last_node>
        preorder_search_last_node(current_traverse->right, last_thread);
  48:	85ca                	mv	a1,s2
  4a:	70c8                	ld	a0,160(s1)
  4c:	00000097          	auipc	ra,0x0
  50:	fde080e7          	jalr	-34(ra) # 2a <preorder_search_last_node>
    };
};
  54:	60e2                	ld	ra,24(sp)
  56:	6442                	ld	s0,16(sp)
  58:	64a2                	ld	s1,8(sp)
  5a:	6902                	ld	s2,0(sp)
  5c:	6105                	addi	sp,sp,32
  5e:	8082                	ret
  60:	8082                	ret

0000000000000062 <thread_create>:


struct thread *thread_create(void (*f)(void *), void *arg){
  62:	7179                	addi	sp,sp,-48
  64:	f406                	sd	ra,40(sp)
  66:	f022                	sd	s0,32(sp)
  68:	ec26                	sd	s1,24(sp)
  6a:	e84a                	sd	s2,16(sp)
  6c:	e44e                	sd	s3,8(sp)
  6e:	1800                	addi	s0,sp,48
  70:	89aa                	mv	s3,a0
  72:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
  74:	0b000513          	li	a0,176
  78:	00001097          	auipc	ra,0x1
  7c:	a22080e7          	jalr	-1502(ra) # a9a <malloc>
  80:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
  82:	6505                	lui	a0,0x1
  84:	80050513          	addi	a0,a0,-2048 # 800 <vprintf+0x30>
  88:	00001097          	auipc	ra,0x1
  8c:	a12080e7          	jalr	-1518(ra) # a9a <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
  90:	0134b023          	sd	s3,0(s1)
    t->arg = arg;
  94:	0124b423          	sd	s2,8(s1)
    t->ID  = id;
  98:	00001717          	auipc	a4,0x1
  9c:	b7c70713          	addi	a4,a4,-1156 # c14 <id>
  a0:	431c                	lw	a5,0(a4)
  a2:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
  a6:	0804aa23          	sw	zero,148(s1)
    t->stack = (void*) new_stack;
  aa:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
  ac:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
  b0:	ec88                	sd	a0,24(s1)
    id++;
  b2:	2785                	addiw	a5,a5,1
  b4:	c31c                	sw	a5,0(a4)
    return t;
}
  b6:	8526                	mv	a0,s1
  b8:	70a2                	ld	ra,40(sp)
  ba:	7402                	ld	s0,32(sp)
  bc:	64e2                	ld	s1,24(sp)
  be:	6942                	ld	s2,16(sp)
  c0:	69a2                	ld	s3,8(sp)
  c2:	6145                	addi	sp,sp,48
  c4:	8082                	ret

00000000000000c6 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
  c6:	1101                	addi	sp,sp,-32
  c8:	ec06                	sd	ra,24(sp)
  ca:	e822                	sd	s0,16(sp)
  cc:	e426                	sd	s1,8(sp)
  ce:	1000                	addi	s0,sp,32
  d0:	84aa                	mv	s1,a0
    if(current_thread == NULL){
  d2:	00001797          	auipc	a5,0x1
  d6:	b4e7b783          	ld	a5,-1202(a5) # c20 <current_thread>
  da:	c385                	beqz	a5,fa <thread_add_runqueue+0x34>
        root_thread = t;
        current_thread = t;
    }
    else{
        // TODO
        if (!current_thread->left){
  dc:	6fd8                	ld	a4,152(a5)
  de:	cb1d                	beqz	a4,114 <thread_add_runqueue+0x4e>
            current_thread->left = t;
            t->parent = current_thread;
        } else if (!current_thread->right){
  e0:	73d8                	ld	a4,160(a5)
  e2:	cf05                	beqz	a4,11a <thread_add_runqueue+0x54>
            current_thread->right = t;
            t->parent = current_thread;
        }
        // else, discard t by free thread and stack frame
        else {
            free(t->stack);
  e4:	6908                	ld	a0,16(a0)
  e6:	00001097          	auipc	ra,0x1
  ea:	92c080e7          	jalr	-1748(ra) # a12 <free>
            free(t);
  ee:	8526                	mv	a0,s1
  f0:	00001097          	auipc	ra,0x1
  f4:	922080e7          	jalr	-1758(ra) # a12 <free>
        }
    }
}
  f8:	a809                	j	10a <thread_add_runqueue+0x44>
        root_thread = t;
  fa:	00001797          	auipc	a5,0x1
  fe:	b0a7bf23          	sd	a0,-1250(a5) # c18 <root_thread>
        current_thread = t;
 102:	00001797          	auipc	a5,0x1
 106:	b0a7bf23          	sd	a0,-1250(a5) # c20 <current_thread>
}
 10a:	60e2                	ld	ra,24(sp)
 10c:	6442                	ld	s0,16(sp)
 10e:	64a2                	ld	s1,8(sp)
 110:	6105                	addi	sp,sp,32
 112:	8082                	ret
            current_thread->left = t;
 114:	efc8                	sd	a0,152(a5)
            t->parent = current_thread;
 116:	f55c                	sd	a5,168(a0)
 118:	bfcd                	j	10a <thread_add_runqueue+0x44>
            current_thread->right = t;
 11a:	f3c8                	sd	a0,160(a5)
            t->parent = current_thread;
 11c:	f55c                	sd	a5,168(a0)
 11e:	b7f5                	j	10a <thread_add_runqueue+0x44>

0000000000000120 <dispatch>:
        current_thread->buf_set = 1;
        schedule(); // update current thread
        dispatch(); // execute
    }
}
void dispatch(void){
 120:	1141                	addi	sp,sp,-16
 122:	e406                	sd	ra,8(sp)
 124:	e022                	sd	s0,0(sp)
 126:	0800                	addi	s0,sp,16
    // TODO
    // if never run before
    if (current_thread->buf_set == 0){
 128:	00001517          	auipc	a0,0x1
 12c:	af853503          	ld	a0,-1288(a0) # c20 <current_thread>
 130:	09452783          	lw	a5,148(a0)
 134:	e3b1                	bnez	a5,178 <dispatch+0x58>
        // initialize the stack
        int jmpVal = setjmp(env_tmp);
 136:	00001517          	auipc	a0,0x1
 13a:	afa50513          	addi	a0,a0,-1286 # c30 <env_tmp>
 13e:	00001097          	auipc	ra,0x1
 142:	a40080e7          	jalr	-1472(ra) # b7e <setjmp>
        if (jmpVal==0){
 146:	c909                	beqz	a0,158 <dispatch+0x38>
            env_tmp->sp = (unsigned long)current_thread->stack_p;
            longjmp(env_tmp, 1);
        } else {
            // run the thread's function
            current_thread->fp(current_thread->arg);
 148:	00001797          	auipc	a5,0x1
 14c:	ad87b783          	ld	a5,-1320(a5) # c20 <current_thread>
 150:	6398                	ld	a4,0(a5)
 152:	6788                	ld	a0,8(a5)
 154:	9702                	jalr	a4
 156:	a805                	j	186 <dispatch+0x66>
            env_tmp->sp = (unsigned long)current_thread->stack_p;
 158:	00001517          	auipc	a0,0x1
 15c:	ad850513          	addi	a0,a0,-1320 # c30 <env_tmp>
 160:	00001797          	auipc	a5,0x1
 164:	ac07b783          	ld	a5,-1344(a5) # c20 <current_thread>
 168:	6f9c                	ld	a5,24(a5)
 16a:	f53c                	sd	a5,104(a0)
            longjmp(env_tmp, 1);
 16c:	4585                	li	a1,1
 16e:	00001097          	auipc	ra,0x1
 172:	a48080e7          	jalr	-1464(ra) # bb6 <longjmp>
 176:	a801                	j	186 <dispatch+0x66>
            //thread_exit();
        }
    } 
    // else, resume by longjmp with value 1
    else{
        longjmp(current_thread->env,1);
 178:	4585                	li	a1,1
 17a:	02050513          	addi	a0,a0,32
 17e:	00001097          	auipc	ra,0x1
 182:	a38080e7          	jalr	-1480(ra) # bb6 <longjmp>
    }
}
 186:	60a2                	ld	ra,8(sp)
 188:	6402                	ld	s0,0(sp)
 18a:	0141                	addi	sp,sp,16
 18c:	8082                	ret

000000000000018e <schedule>:
void schedule(void){ // determine the next thread to run (preorder), change current_thread
 18e:	1101                	addi	sp,sp,-32
 190:	ec06                	sd	ra,24(sp)
 192:	e822                	sd	s0,16(sp)
 194:	e426                	sd	s1,8(sp)
 196:	1000                	addi	s0,sp,32
    // TODO
    struct thread *next_thread = preorder_find_next(root_thread, current_thread);
 198:	00001497          	auipc	s1,0x1
 19c:	a804b483          	ld	s1,-1408(s1) # c18 <root_thread>
 1a0:	00001597          	auipc	a1,0x1
 1a4:	a805b583          	ld	a1,-1408(a1) # c20 <current_thread>
 1a8:	8526                	mv	a0,s1
 1aa:	00000097          	auipc	ra,0x0
 1ae:	e56080e7          	jalr	-426(ra) # 0 <preorder_find_next>
    if (next_thread==NULL){
 1b2:	c911                	beqz	a0,1c6 <schedule+0x38>
        next_thread = root_thread;
    }
    //printf("next id: %d\n", next_thread->ID);
    current_thread = next_thread;
 1b4:	00001797          	auipc	a5,0x1
 1b8:	a6a7b623          	sd	a0,-1428(a5) # c20 <current_thread>
}
 1bc:	60e2                	ld	ra,24(sp)
 1be:	6442                	ld	s0,16(sp)
 1c0:	64a2                	ld	s1,8(sp)
 1c2:	6105                	addi	sp,sp,32
 1c4:	8082                	ret
        next_thread = root_thread;
 1c6:	8526                	mv	a0,s1
 1c8:	b7f5                	j	1b4 <schedule+0x26>

00000000000001ca <thread_yield>:
void thread_yield(void){
 1ca:	1141                	addi	sp,sp,-16
 1cc:	e406                	sd	ra,8(sp)
 1ce:	e022                	sd	s0,0(sp)
 1d0:	0800                	addi	s0,sp,16
    int jmpVal = setjmp(current_thread->env); // save current thread context
 1d2:	00001517          	auipc	a0,0x1
 1d6:	a4e53503          	ld	a0,-1458(a0) # c20 <current_thread>
 1da:	02050513          	addi	a0,a0,32
 1de:	00001097          	auipc	ra,0x1
 1e2:	9a0080e7          	jalr	-1632(ra) # b7e <setjmp>
    if (jmpVal ==0){
 1e6:	c509                	beqz	a0,1f0 <thread_yield+0x26>
}
 1e8:	60a2                	ld	ra,8(sp)
 1ea:	6402                	ld	s0,0(sp)
 1ec:	0141                	addi	sp,sp,16
 1ee:	8082                	ret
        current_thread->buf_set = 1;
 1f0:	00001797          	auipc	a5,0x1
 1f4:	a307b783          	ld	a5,-1488(a5) # c20 <current_thread>
 1f8:	4705                	li	a4,1
 1fa:	08e7aa23          	sw	a4,148(a5)
        schedule(); // update current thread
 1fe:	00000097          	auipc	ra,0x0
 202:	f90080e7          	jalr	-112(ra) # 18e <schedule>
        dispatch(); // execute
 206:	00000097          	auipc	ra,0x0
 20a:	f1a080e7          	jalr	-230(ra) # 120 <dispatch>
}
 20e:	bfe9                	j	1e8 <thread_yield+0x1e>

0000000000000210 <thread_exit>:
void thread_exit(void){
 210:	7179                	addi	sp,sp,-48
 212:	f406                	sd	ra,40(sp)
 214:	f022                	sd	s0,32(sp)
 216:	ec26                	sd	s1,24(sp)
 218:	e84a                	sd	s2,16(sp)
 21a:	1800                	addi	s0,sp,48
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 21c:	00001497          	auipc	s1,0x1
 220:	a044b483          	ld	s1,-1532(s1) # c20 <current_thread>
 224:	00001917          	auipc	s2,0x1
 228:	9f493903          	ld	s2,-1548(s2) # c18 <root_thread>
 22c:	0d248e63          	beq	s1,s2,308 <thread_exit+0xf8>
        longjmp(env_st,1);
    }
    else{
        // TODO
        // if leaf case, simply remove
        if (current_thread->left == NULL && current_thread->right == NULL){
 230:	6cdc                	ld	a5,152(s1)
 232:	e781                	bnez	a5,23a <thread_exit+0x2a>
 234:	70dc                	ld	a5,160(s1)
 236:	10078b63          	beqz	a5,34c <thread_exit+0x13c>
            dispatch();
        }
        // else, find next thread by preorder searching
        else {
            struct thread *temp = current_thread;
            struct thread *last_thread = NULL;
 23a:	fc043c23          	sd	zero,-40(s0)
            preorder_search_last_node(current_thread, &last_thread);
 23e:	fd840593          	addi	a1,s0,-40
 242:	8526                	mv	a0,s1
 244:	00000097          	auipc	ra,0x0
 248:	de6080e7          	jalr	-538(ra) # 2a <preorder_search_last_node>
            // ----- migration node in tree ------
            // if current has parent
            if (current_thread->parent){
 24c:	74dc                	ld	a5,168(s1)
 24e:	c799                	beqz	a5,25c <thread_exit+0x4c>
                // if it's left child
                if (current_thread == current_thread->parent->left){
 250:	6fd8                	ld	a4,152(a5)
 252:	12e48d63          	beq	s1,a4,38c <thread_exit+0x17c>
                    current_thread->parent->left=last_thread;
                } 
                // if it's right child
                else if (current_thread == current_thread->parent->right){
 256:	73d8                	ld	a4,160(a5)
 258:	12e48e63          	beq	s1,a4,394 <thread_exit+0x184>
                    current_thread->parent->right=last_thread;
                }
            }
            // if current has right child but it's not last thread
            if (current_thread->right && current_thread->right->ID != last_thread->ID){
 25c:	70dc                	ld	a5,160(s1)
 25e:	cb91                	beqz	a5,272 <thread_exit+0x62>
 260:	fd843703          	ld	a4,-40(s0)
 264:	0907a603          	lw	a2,144(a5)
 268:	09072683          	lw	a3,144(a4)
 26c:	00d60363          	beq	a2,a3,272 <thread_exit+0x62>
                current_thread->right->parent = last_thread;
 270:	f7d8                	sd	a4,168(a5)
            }
            // if current has left child but it's not last thread
            if (current_thread->left && current_thread->left->ID != last_thread->ID){
 272:	6cdc                	ld	a5,152(s1)
 274:	cb91                	beqz	a5,288 <thread_exit+0x78>
 276:	fd843703          	ld	a4,-40(s0)
 27a:	0907a603          	lw	a2,144(a5)
 27e:	09072683          	lw	a3,144(a4)
 282:	00d60363          	beq	a2,a3,288 <thread_exit+0x78>
                current_thread->left->parent = last_thread;
 286:	f7d8                	sd	a4,168(a5)
            }
            // update last_thread's parent, if parent!=current_thread
            if (last_thread->parent->left->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 288:	fd843783          	ld	a5,-40(s0)
 28c:	77d8                	ld	a4,168(a5)
 28e:	6f54                	ld	a3,152(a4)
 290:	0906a603          	lw	a2,144(a3)
 294:	0907a683          	lw	a3,144(a5)
 298:	10d60263          	beq	a2,a3,39c <thread_exit+0x18c>
                last_thread->parent->left=NULL;
            }
            if (last_thread->parent->right->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 29c:	77d8                	ld	a4,168(a5)
 29e:	7354                	ld	a3,160(a4)
 2a0:	0906a603          	lw	a2,144(a3)
 2a4:	0907a683          	lw	a3,144(a5)
 2a8:	10d60363          	beq	a2,a3,3ae <thread_exit+0x19e>
                last_thread->parent->right=NULL;
            }
            last_thread->parent = current_thread->parent;
 2ac:	74d8                	ld	a4,168(s1)
 2ae:	f7d8                	sd	a4,168(a5)
            // update last_thread's left child if it's not left child of current
            if (current_thread->left->ID != last_thread->ID){
 2b0:	6cd4                	ld	a3,152(s1)
 2b2:	0907a703          	lw	a4,144(a5)
 2b6:	0906a603          	lw	a2,144(a3)
 2ba:	00e60363          	beq	a2,a4,2c0 <thread_exit+0xb0>
                last_thread->left = current_thread->left;
 2be:	efd4                	sd	a3,152(a5)
            }
            // update last_thread's right child if it's not right child of current
            if (current_thread->right->ID != last_thread->ID){
 2c0:	70d4                	ld	a3,160(s1)
 2c2:	0906a603          	lw	a2,144(a3)
 2c6:	00e60363          	beq	a2,a4,2cc <thread_exit+0xbc>
                last_thread->right = current_thread->right;
 2ca:	f3d4                	sd	a3,160(a5)
            }
            // if current is root, update root
            if (root_thread->ID == current_thread->ID){
 2cc:	09092683          	lw	a3,144(s2)
 2d0:	0904a703          	lw	a4,144(s1)
 2d4:	0ee68663          	beq	a3,a4,3c0 <thread_exit+0x1b0>
                root_thread = last_thread;
            }
            // update next current_thread ??
            // current_thread = last_thread;
            schedule();
 2d8:	00000097          	auipc	ra,0x0
 2dc:	eb6080e7          	jalr	-330(ra) # 18e <schedule>
            free(temp->stack);
 2e0:	6888                	ld	a0,16(s1)
 2e2:	00000097          	auipc	ra,0x0
 2e6:	730080e7          	jalr	1840(ra) # a12 <free>
            free(temp);
 2ea:	8526                	mv	a0,s1
 2ec:	00000097          	auipc	ra,0x0
 2f0:	726080e7          	jalr	1830(ra) # a12 <free>
            dispatch();
 2f4:	00000097          	auipc	ra,0x0
 2f8:	e2c080e7          	jalr	-468(ra) # 120 <dispatch>
        }
    }
}
 2fc:	70a2                	ld	ra,40(sp)
 2fe:	7402                	ld	s0,32(sp)
 300:	64e2                	ld	s1,24(sp)
 302:	6942                	ld	s2,16(sp)
 304:	6145                	addi	sp,sp,48
 306:	8082                	ret
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 308:	6cdc                	ld	a5,152(s1)
 30a:	fb85                	bnez	a5,23a <thread_exit+0x2a>
 30c:	70dc                	ld	a5,160(s1)
 30e:	f795                	bnez	a5,23a <thread_exit+0x2a>
        free(current_thread->stack);
 310:	6888                	ld	a0,16(s1)
 312:	00000097          	auipc	ra,0x0
 316:	700080e7          	jalr	1792(ra) # a12 <free>
        free(current_thread);
 31a:	00001497          	auipc	s1,0x1
 31e:	90648493          	addi	s1,s1,-1786 # c20 <current_thread>
 322:	6088                	ld	a0,0(s1)
 324:	00000097          	auipc	ra,0x0
 328:	6ee080e7          	jalr	1774(ra) # a12 <free>
        current_thread=NULL;
 32c:	0004b023          	sd	zero,0(s1)
        root_thread=NULL;
 330:	00001797          	auipc	a5,0x1
 334:	8e07b423          	sd	zero,-1816(a5) # c18 <root_thread>
        longjmp(env_st,1);
 338:	4585                	li	a1,1
 33a:	00001517          	auipc	a0,0x1
 33e:	96650513          	addi	a0,a0,-1690 # ca0 <env_st>
 342:	00001097          	auipc	ra,0x1
 346:	874080e7          	jalr	-1932(ra) # bb6 <longjmp>
 34a:	bf4d                	j	2fc <thread_exit+0xec>
            if (current_thread == current_thread->parent->left){
 34c:	74dc                	ld	a5,168(s1)
 34e:	6fd8                	ld	a4,152(a5)
 350:	02e48863          	beq	s1,a4,380 <thread_exit+0x170>
            } else if (current_thread == current_thread->parent->right){
 354:	73d8                	ld	a4,160(a5)
 356:	02e48863          	beq	s1,a4,386 <thread_exit+0x176>
            schedule();
 35a:	00000097          	auipc	ra,0x0
 35e:	e34080e7          	jalr	-460(ra) # 18e <schedule>
            free(temp->stack);
 362:	6888                	ld	a0,16(s1)
 364:	00000097          	auipc	ra,0x0
 368:	6ae080e7          	jalr	1710(ra) # a12 <free>
            free(temp);
 36c:	8526                	mv	a0,s1
 36e:	00000097          	auipc	ra,0x0
 372:	6a4080e7          	jalr	1700(ra) # a12 <free>
            dispatch();
 376:	00000097          	auipc	ra,0x0
 37a:	daa080e7          	jalr	-598(ra) # 120 <dispatch>
        if (current_thread->left == NULL && current_thread->right == NULL){
 37e:	bfbd                	j	2fc <thread_exit+0xec>
                current_thread->parent->left=NULL;
 380:	0807bc23          	sd	zero,152(a5)
 384:	bfd9                	j	35a <thread_exit+0x14a>
                current_thread->parent->right=NULL;
 386:	0a07b023          	sd	zero,160(a5)
 38a:	bfc1                	j	35a <thread_exit+0x14a>
                    current_thread->parent->left=last_thread;
 38c:	fd843703          	ld	a4,-40(s0)
 390:	efd8                	sd	a4,152(a5)
 392:	b5e9                	j	25c <thread_exit+0x4c>
                    current_thread->parent->right=last_thread;
 394:	fd843703          	ld	a4,-40(s0)
 398:	f3d8                	sd	a4,160(a5)
 39a:	b5c9                	j	25c <thread_exit+0x4c>
            if (last_thread->parent->left->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 39c:	0904a603          	lw	a2,144(s1)
 3a0:	09072683          	lw	a3,144(a4)
 3a4:	f0d604e3          	beq	a2,a3,2ac <thread_exit+0x9c>
                last_thread->parent->left=NULL;
 3a8:	08073c23          	sd	zero,152(a4)
 3ac:	bdc5                	j	29c <thread_exit+0x8c>
            if (last_thread->parent->right->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 3ae:	0904a603          	lw	a2,144(s1)
 3b2:	09072683          	lw	a3,144(a4)
 3b6:	eed60be3          	beq	a2,a3,2ac <thread_exit+0x9c>
                last_thread->parent->right=NULL;
 3ba:	0a073023          	sd	zero,160(a4)
 3be:	b5fd                	j	2ac <thread_exit+0x9c>
                root_thread = last_thread;
 3c0:	00001717          	auipc	a4,0x1
 3c4:	84f73c23          	sd	a5,-1960(a4) # c18 <root_thread>
 3c8:	bf01                	j	2d8 <thread_exit+0xc8>

00000000000003ca <thread_start_threading>:
void thread_start_threading(void){
 3ca:	1141                	addi	sp,sp,-16
 3cc:	e406                	sd	ra,8(sp)
 3ce:	e022                	sd	s0,0(sp)
 3d0:	0800                	addi	s0,sp,16
    // TODO
    int jmpVal = setjmp(env_st);
 3d2:	00001517          	auipc	a0,0x1
 3d6:	8ce50513          	addi	a0,a0,-1842 # ca0 <env_st>
 3da:	00000097          	auipc	ra,0x0
 3de:	7a4080e7          	jalr	1956(ra) # b7e <setjmp>
    if (jmpVal==0) {
 3e2:	c509                	beqz	a0,3ec <thread_start_threading+0x22>
	    dispatch();
    }
 3e4:	60a2                	ld	ra,8(sp)
 3e6:	6402                	ld	s0,0(sp)
 3e8:	0141                	addi	sp,sp,16
 3ea:	8082                	ret
	    dispatch();
 3ec:	00000097          	auipc	ra,0x0
 3f0:	d34080e7          	jalr	-716(ra) # 120 <dispatch>
 3f4:	bfc5                	j	3e4 <thread_start_threading+0x1a>

00000000000003f6 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 3f6:	1141                	addi	sp,sp,-16
 3f8:	e422                	sd	s0,8(sp)
 3fa:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 3fc:	87aa                	mv	a5,a0
 3fe:	0585                	addi	a1,a1,1
 400:	0785                	addi	a5,a5,1
 402:	fff5c703          	lbu	a4,-1(a1)
 406:	fee78fa3          	sb	a4,-1(a5)
 40a:	fb75                	bnez	a4,3fe <strcpy+0x8>
    ;
  return os;
}
 40c:	6422                	ld	s0,8(sp)
 40e:	0141                	addi	sp,sp,16
 410:	8082                	ret

0000000000000412 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 412:	1141                	addi	sp,sp,-16
 414:	e422                	sd	s0,8(sp)
 416:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 418:	00054783          	lbu	a5,0(a0)
 41c:	cb91                	beqz	a5,430 <strcmp+0x1e>
 41e:	0005c703          	lbu	a4,0(a1)
 422:	00f71763          	bne	a4,a5,430 <strcmp+0x1e>
    p++, q++;
 426:	0505                	addi	a0,a0,1
 428:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 42a:	00054783          	lbu	a5,0(a0)
 42e:	fbe5                	bnez	a5,41e <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 430:	0005c503          	lbu	a0,0(a1)
}
 434:	40a7853b          	subw	a0,a5,a0
 438:	6422                	ld	s0,8(sp)
 43a:	0141                	addi	sp,sp,16
 43c:	8082                	ret

000000000000043e <strlen>:

uint
strlen(const char *s)
{
 43e:	1141                	addi	sp,sp,-16
 440:	e422                	sd	s0,8(sp)
 442:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 444:	00054783          	lbu	a5,0(a0)
 448:	cf91                	beqz	a5,464 <strlen+0x26>
 44a:	0505                	addi	a0,a0,1
 44c:	87aa                	mv	a5,a0
 44e:	4685                	li	a3,1
 450:	9e89                	subw	a3,a3,a0
 452:	00f6853b          	addw	a0,a3,a5
 456:	0785                	addi	a5,a5,1
 458:	fff7c703          	lbu	a4,-1(a5)
 45c:	fb7d                	bnez	a4,452 <strlen+0x14>
    ;
  return n;
}
 45e:	6422                	ld	s0,8(sp)
 460:	0141                	addi	sp,sp,16
 462:	8082                	ret
  for(n = 0; s[n]; n++)
 464:	4501                	li	a0,0
 466:	bfe5                	j	45e <strlen+0x20>

0000000000000468 <memset>:

void*
memset(void *dst, int c, uint n)
{
 468:	1141                	addi	sp,sp,-16
 46a:	e422                	sd	s0,8(sp)
 46c:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 46e:	ca19                	beqz	a2,484 <memset+0x1c>
 470:	87aa                	mv	a5,a0
 472:	1602                	slli	a2,a2,0x20
 474:	9201                	srli	a2,a2,0x20
 476:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 47a:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 47e:	0785                	addi	a5,a5,1
 480:	fee79de3          	bne	a5,a4,47a <memset+0x12>
  }
  return dst;
}
 484:	6422                	ld	s0,8(sp)
 486:	0141                	addi	sp,sp,16
 488:	8082                	ret

000000000000048a <strchr>:

char*
strchr(const char *s, char c)
{
 48a:	1141                	addi	sp,sp,-16
 48c:	e422                	sd	s0,8(sp)
 48e:	0800                	addi	s0,sp,16
  for(; *s; s++)
 490:	00054783          	lbu	a5,0(a0)
 494:	cb99                	beqz	a5,4aa <strchr+0x20>
    if(*s == c)
 496:	00f58763          	beq	a1,a5,4a4 <strchr+0x1a>
  for(; *s; s++)
 49a:	0505                	addi	a0,a0,1
 49c:	00054783          	lbu	a5,0(a0)
 4a0:	fbfd                	bnez	a5,496 <strchr+0xc>
      return (char*)s;
  return 0;
 4a2:	4501                	li	a0,0
}
 4a4:	6422                	ld	s0,8(sp)
 4a6:	0141                	addi	sp,sp,16
 4a8:	8082                	ret
  return 0;
 4aa:	4501                	li	a0,0
 4ac:	bfe5                	j	4a4 <strchr+0x1a>

00000000000004ae <gets>:

char*
gets(char *buf, int max)
{
 4ae:	711d                	addi	sp,sp,-96
 4b0:	ec86                	sd	ra,88(sp)
 4b2:	e8a2                	sd	s0,80(sp)
 4b4:	e4a6                	sd	s1,72(sp)
 4b6:	e0ca                	sd	s2,64(sp)
 4b8:	fc4e                	sd	s3,56(sp)
 4ba:	f852                	sd	s4,48(sp)
 4bc:	f456                	sd	s5,40(sp)
 4be:	f05a                	sd	s6,32(sp)
 4c0:	ec5e                	sd	s7,24(sp)
 4c2:	1080                	addi	s0,sp,96
 4c4:	8baa                	mv	s7,a0
 4c6:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c8:	892a                	mv	s2,a0
 4ca:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 4cc:	4aa9                	li	s5,10
 4ce:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 4d0:	89a6                	mv	s3,s1
 4d2:	2485                	addiw	s1,s1,1
 4d4:	0344d863          	bge	s1,s4,504 <gets+0x56>
    cc = read(0, &c, 1);
 4d8:	4605                	li	a2,1
 4da:	faf40593          	addi	a1,s0,-81
 4de:	4501                	li	a0,0
 4e0:	00000097          	auipc	ra,0x0
 4e4:	19c080e7          	jalr	412(ra) # 67c <read>
    if(cc < 1)
 4e8:	00a05e63          	blez	a0,504 <gets+0x56>
    buf[i++] = c;
 4ec:	faf44783          	lbu	a5,-81(s0)
 4f0:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 4f4:	01578763          	beq	a5,s5,502 <gets+0x54>
 4f8:	0905                	addi	s2,s2,1
 4fa:	fd679be3          	bne	a5,s6,4d0 <gets+0x22>
  for(i=0; i+1 < max; ){
 4fe:	89a6                	mv	s3,s1
 500:	a011                	j	504 <gets+0x56>
 502:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 504:	99de                	add	s3,s3,s7
 506:	00098023          	sb	zero,0(s3)
  return buf;
}
 50a:	855e                	mv	a0,s7
 50c:	60e6                	ld	ra,88(sp)
 50e:	6446                	ld	s0,80(sp)
 510:	64a6                	ld	s1,72(sp)
 512:	6906                	ld	s2,64(sp)
 514:	79e2                	ld	s3,56(sp)
 516:	7a42                	ld	s4,48(sp)
 518:	7aa2                	ld	s5,40(sp)
 51a:	7b02                	ld	s6,32(sp)
 51c:	6be2                	ld	s7,24(sp)
 51e:	6125                	addi	sp,sp,96
 520:	8082                	ret

0000000000000522 <stat>:

int
stat(const char *n, struct stat *st)
{
 522:	1101                	addi	sp,sp,-32
 524:	ec06                	sd	ra,24(sp)
 526:	e822                	sd	s0,16(sp)
 528:	e426                	sd	s1,8(sp)
 52a:	e04a                	sd	s2,0(sp)
 52c:	1000                	addi	s0,sp,32
 52e:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 530:	4581                	li	a1,0
 532:	00000097          	auipc	ra,0x0
 536:	172080e7          	jalr	370(ra) # 6a4 <open>
  if(fd < 0)
 53a:	02054563          	bltz	a0,564 <stat+0x42>
 53e:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 540:	85ca                	mv	a1,s2
 542:	00000097          	auipc	ra,0x0
 546:	17a080e7          	jalr	378(ra) # 6bc <fstat>
 54a:	892a                	mv	s2,a0
  close(fd);
 54c:	8526                	mv	a0,s1
 54e:	00000097          	auipc	ra,0x0
 552:	13e080e7          	jalr	318(ra) # 68c <close>
  return r;
}
 556:	854a                	mv	a0,s2
 558:	60e2                	ld	ra,24(sp)
 55a:	6442                	ld	s0,16(sp)
 55c:	64a2                	ld	s1,8(sp)
 55e:	6902                	ld	s2,0(sp)
 560:	6105                	addi	sp,sp,32
 562:	8082                	ret
    return -1;
 564:	597d                	li	s2,-1
 566:	bfc5                	j	556 <stat+0x34>

0000000000000568 <atoi>:

int
atoi(const char *s)
{
 568:	1141                	addi	sp,sp,-16
 56a:	e422                	sd	s0,8(sp)
 56c:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 56e:	00054603          	lbu	a2,0(a0)
 572:	fd06079b          	addiw	a5,a2,-48
 576:	0ff7f793          	andi	a5,a5,255
 57a:	4725                	li	a4,9
 57c:	02f76963          	bltu	a4,a5,5ae <atoi+0x46>
 580:	86aa                	mv	a3,a0
  n = 0;
 582:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 584:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 586:	0685                	addi	a3,a3,1
 588:	0025179b          	slliw	a5,a0,0x2
 58c:	9fa9                	addw	a5,a5,a0
 58e:	0017979b          	slliw	a5,a5,0x1
 592:	9fb1                	addw	a5,a5,a2
 594:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 598:	0006c603          	lbu	a2,0(a3)
 59c:	fd06071b          	addiw	a4,a2,-48
 5a0:	0ff77713          	andi	a4,a4,255
 5a4:	fee5f1e3          	bgeu	a1,a4,586 <atoi+0x1e>
  return n;
}
 5a8:	6422                	ld	s0,8(sp)
 5aa:	0141                	addi	sp,sp,16
 5ac:	8082                	ret
  n = 0;
 5ae:	4501                	li	a0,0
 5b0:	bfe5                	j	5a8 <atoi+0x40>

00000000000005b2 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 5b2:	1141                	addi	sp,sp,-16
 5b4:	e422                	sd	s0,8(sp)
 5b6:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 5b8:	02b57463          	bgeu	a0,a1,5e0 <memmove+0x2e>
    while(n-- > 0)
 5bc:	00c05f63          	blez	a2,5da <memmove+0x28>
 5c0:	1602                	slli	a2,a2,0x20
 5c2:	9201                	srli	a2,a2,0x20
 5c4:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 5c8:	872a                	mv	a4,a0
      *dst++ = *src++;
 5ca:	0585                	addi	a1,a1,1
 5cc:	0705                	addi	a4,a4,1
 5ce:	fff5c683          	lbu	a3,-1(a1)
 5d2:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 5d6:	fee79ae3          	bne	a5,a4,5ca <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 5da:	6422                	ld	s0,8(sp)
 5dc:	0141                	addi	sp,sp,16
 5de:	8082                	ret
    dst += n;
 5e0:	00c50733          	add	a4,a0,a2
    src += n;
 5e4:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 5e6:	fec05ae3          	blez	a2,5da <memmove+0x28>
 5ea:	fff6079b          	addiw	a5,a2,-1
 5ee:	1782                	slli	a5,a5,0x20
 5f0:	9381                	srli	a5,a5,0x20
 5f2:	fff7c793          	not	a5,a5
 5f6:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 5f8:	15fd                	addi	a1,a1,-1
 5fa:	177d                	addi	a4,a4,-1
 5fc:	0005c683          	lbu	a3,0(a1)
 600:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 604:	fee79ae3          	bne	a5,a4,5f8 <memmove+0x46>
 608:	bfc9                	j	5da <memmove+0x28>

000000000000060a <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 60a:	1141                	addi	sp,sp,-16
 60c:	e422                	sd	s0,8(sp)
 60e:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 610:	ca05                	beqz	a2,640 <memcmp+0x36>
 612:	fff6069b          	addiw	a3,a2,-1
 616:	1682                	slli	a3,a3,0x20
 618:	9281                	srli	a3,a3,0x20
 61a:	0685                	addi	a3,a3,1
 61c:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 61e:	00054783          	lbu	a5,0(a0)
 622:	0005c703          	lbu	a4,0(a1)
 626:	00e79863          	bne	a5,a4,636 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 62a:	0505                	addi	a0,a0,1
    p2++;
 62c:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 62e:	fed518e3          	bne	a0,a3,61e <memcmp+0x14>
  }
  return 0;
 632:	4501                	li	a0,0
 634:	a019                	j	63a <memcmp+0x30>
      return *p1 - *p2;
 636:	40e7853b          	subw	a0,a5,a4
}
 63a:	6422                	ld	s0,8(sp)
 63c:	0141                	addi	sp,sp,16
 63e:	8082                	ret
  return 0;
 640:	4501                	li	a0,0
 642:	bfe5                	j	63a <memcmp+0x30>

0000000000000644 <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 644:	1141                	addi	sp,sp,-16
 646:	e406                	sd	ra,8(sp)
 648:	e022                	sd	s0,0(sp)
 64a:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 64c:	00000097          	auipc	ra,0x0
 650:	f66080e7          	jalr	-154(ra) # 5b2 <memmove>
}
 654:	60a2                	ld	ra,8(sp)
 656:	6402                	ld	s0,0(sp)
 658:	0141                	addi	sp,sp,16
 65a:	8082                	ret

000000000000065c <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 65c:	4885                	li	a7,1
 ecall
 65e:	00000073          	ecall
 ret
 662:	8082                	ret

0000000000000664 <exit>:
.global exit
exit:
 li a7, SYS_exit
 664:	4889                	li	a7,2
 ecall
 666:	00000073          	ecall
 ret
 66a:	8082                	ret

000000000000066c <wait>:
.global wait
wait:
 li a7, SYS_wait
 66c:	488d                	li	a7,3
 ecall
 66e:	00000073          	ecall
 ret
 672:	8082                	ret

0000000000000674 <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 674:	4891                	li	a7,4
 ecall
 676:	00000073          	ecall
 ret
 67a:	8082                	ret

000000000000067c <read>:
.global read
read:
 li a7, SYS_read
 67c:	4895                	li	a7,5
 ecall
 67e:	00000073          	ecall
 ret
 682:	8082                	ret

0000000000000684 <write>:
.global write
write:
 li a7, SYS_write
 684:	48c1                	li	a7,16
 ecall
 686:	00000073          	ecall
 ret
 68a:	8082                	ret

000000000000068c <close>:
.global close
close:
 li a7, SYS_close
 68c:	48d5                	li	a7,21
 ecall
 68e:	00000073          	ecall
 ret
 692:	8082                	ret

0000000000000694 <kill>:
.global kill
kill:
 li a7, SYS_kill
 694:	4899                	li	a7,6
 ecall
 696:	00000073          	ecall
 ret
 69a:	8082                	ret

000000000000069c <exec>:
.global exec
exec:
 li a7, SYS_exec
 69c:	489d                	li	a7,7
 ecall
 69e:	00000073          	ecall
 ret
 6a2:	8082                	ret

00000000000006a4 <open>:
.global open
open:
 li a7, SYS_open
 6a4:	48bd                	li	a7,15
 ecall
 6a6:	00000073          	ecall
 ret
 6aa:	8082                	ret

00000000000006ac <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 6ac:	48c5                	li	a7,17
 ecall
 6ae:	00000073          	ecall
 ret
 6b2:	8082                	ret

00000000000006b4 <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 6b4:	48c9                	li	a7,18
 ecall
 6b6:	00000073          	ecall
 ret
 6ba:	8082                	ret

00000000000006bc <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 6bc:	48a1                	li	a7,8
 ecall
 6be:	00000073          	ecall
 ret
 6c2:	8082                	ret

00000000000006c4 <link>:
.global link
link:
 li a7, SYS_link
 6c4:	48cd                	li	a7,19
 ecall
 6c6:	00000073          	ecall
 ret
 6ca:	8082                	ret

00000000000006cc <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 6cc:	48d1                	li	a7,20
 ecall
 6ce:	00000073          	ecall
 ret
 6d2:	8082                	ret

00000000000006d4 <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 6d4:	48a5                	li	a7,9
 ecall
 6d6:	00000073          	ecall
 ret
 6da:	8082                	ret

00000000000006dc <dup>:
.global dup
dup:
 li a7, SYS_dup
 6dc:	48a9                	li	a7,10
 ecall
 6de:	00000073          	ecall
 ret
 6e2:	8082                	ret

00000000000006e4 <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 6e4:	48ad                	li	a7,11
 ecall
 6e6:	00000073          	ecall
 ret
 6ea:	8082                	ret

00000000000006ec <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 6ec:	48b1                	li	a7,12
 ecall
 6ee:	00000073          	ecall
 ret
 6f2:	8082                	ret

00000000000006f4 <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 6f4:	48b5                	li	a7,13
 ecall
 6f6:	00000073          	ecall
 ret
 6fa:	8082                	ret

00000000000006fc <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 6fc:	48b9                	li	a7,14
 ecall
 6fe:	00000073          	ecall
 ret
 702:	8082                	ret

0000000000000704 <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 704:	1101                	addi	sp,sp,-32
 706:	ec06                	sd	ra,24(sp)
 708:	e822                	sd	s0,16(sp)
 70a:	1000                	addi	s0,sp,32
 70c:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 710:	4605                	li	a2,1
 712:	fef40593          	addi	a1,s0,-17
 716:	00000097          	auipc	ra,0x0
 71a:	f6e080e7          	jalr	-146(ra) # 684 <write>
}
 71e:	60e2                	ld	ra,24(sp)
 720:	6442                	ld	s0,16(sp)
 722:	6105                	addi	sp,sp,32
 724:	8082                	ret

0000000000000726 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 726:	7139                	addi	sp,sp,-64
 728:	fc06                	sd	ra,56(sp)
 72a:	f822                	sd	s0,48(sp)
 72c:	f426                	sd	s1,40(sp)
 72e:	f04a                	sd	s2,32(sp)
 730:	ec4e                	sd	s3,24(sp)
 732:	0080                	addi	s0,sp,64
 734:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 736:	c299                	beqz	a3,73c <printint+0x16>
 738:	0805c863          	bltz	a1,7c8 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 73c:	2581                	sext.w	a1,a1
  neg = 0;
 73e:	4881                	li	a7,0
 740:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 744:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 746:	2601                	sext.w	a2,a2
 748:	00000517          	auipc	a0,0x0
 74c:	4b850513          	addi	a0,a0,1208 # c00 <digits>
 750:	883a                	mv	a6,a4
 752:	2705                	addiw	a4,a4,1
 754:	02c5f7bb          	remuw	a5,a1,a2
 758:	1782                	slli	a5,a5,0x20
 75a:	9381                	srli	a5,a5,0x20
 75c:	97aa                	add	a5,a5,a0
 75e:	0007c783          	lbu	a5,0(a5)
 762:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 766:	0005879b          	sext.w	a5,a1
 76a:	02c5d5bb          	divuw	a1,a1,a2
 76e:	0685                	addi	a3,a3,1
 770:	fec7f0e3          	bgeu	a5,a2,750 <printint+0x2a>
  if(neg)
 774:	00088b63          	beqz	a7,78a <printint+0x64>
    buf[i++] = '-';
 778:	fd040793          	addi	a5,s0,-48
 77c:	973e                	add	a4,a4,a5
 77e:	02d00793          	li	a5,45
 782:	fef70823          	sb	a5,-16(a4)
 786:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 78a:	02e05863          	blez	a4,7ba <printint+0x94>
 78e:	fc040793          	addi	a5,s0,-64
 792:	00e78933          	add	s2,a5,a4
 796:	fff78993          	addi	s3,a5,-1
 79a:	99ba                	add	s3,s3,a4
 79c:	377d                	addiw	a4,a4,-1
 79e:	1702                	slli	a4,a4,0x20
 7a0:	9301                	srli	a4,a4,0x20
 7a2:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 7a6:	fff94583          	lbu	a1,-1(s2)
 7aa:	8526                	mv	a0,s1
 7ac:	00000097          	auipc	ra,0x0
 7b0:	f58080e7          	jalr	-168(ra) # 704 <putc>
  while(--i >= 0)
 7b4:	197d                	addi	s2,s2,-1
 7b6:	ff3918e3          	bne	s2,s3,7a6 <printint+0x80>
}
 7ba:	70e2                	ld	ra,56(sp)
 7bc:	7442                	ld	s0,48(sp)
 7be:	74a2                	ld	s1,40(sp)
 7c0:	7902                	ld	s2,32(sp)
 7c2:	69e2                	ld	s3,24(sp)
 7c4:	6121                	addi	sp,sp,64
 7c6:	8082                	ret
    x = -xx;
 7c8:	40b005bb          	negw	a1,a1
    neg = 1;
 7cc:	4885                	li	a7,1
    x = -xx;
 7ce:	bf8d                	j	740 <printint+0x1a>

00000000000007d0 <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 7d0:	7119                	addi	sp,sp,-128
 7d2:	fc86                	sd	ra,120(sp)
 7d4:	f8a2                	sd	s0,112(sp)
 7d6:	f4a6                	sd	s1,104(sp)
 7d8:	f0ca                	sd	s2,96(sp)
 7da:	ecce                	sd	s3,88(sp)
 7dc:	e8d2                	sd	s4,80(sp)
 7de:	e4d6                	sd	s5,72(sp)
 7e0:	e0da                	sd	s6,64(sp)
 7e2:	fc5e                	sd	s7,56(sp)
 7e4:	f862                	sd	s8,48(sp)
 7e6:	f466                	sd	s9,40(sp)
 7e8:	f06a                	sd	s10,32(sp)
 7ea:	ec6e                	sd	s11,24(sp)
 7ec:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 7ee:	0005c903          	lbu	s2,0(a1)
 7f2:	18090f63          	beqz	s2,990 <vprintf+0x1c0>
 7f6:	8aaa                	mv	s5,a0
 7f8:	8b32                	mv	s6,a2
 7fa:	00158493          	addi	s1,a1,1
  state = 0;
 7fe:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 800:	02500a13          	li	s4,37
      if(c == 'd'){
 804:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 808:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 80c:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 810:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 814:	00000b97          	auipc	s7,0x0
 818:	3ecb8b93          	addi	s7,s7,1004 # c00 <digits>
 81c:	a839                	j	83a <vprintf+0x6a>
        putc(fd, c);
 81e:	85ca                	mv	a1,s2
 820:	8556                	mv	a0,s5
 822:	00000097          	auipc	ra,0x0
 826:	ee2080e7          	jalr	-286(ra) # 704 <putc>
 82a:	a019                	j	830 <vprintf+0x60>
    } else if(state == '%'){
 82c:	01498f63          	beq	s3,s4,84a <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 830:	0485                	addi	s1,s1,1
 832:	fff4c903          	lbu	s2,-1(s1)
 836:	14090d63          	beqz	s2,990 <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 83a:	0009079b          	sext.w	a5,s2
    if(state == 0){
 83e:	fe0997e3          	bnez	s3,82c <vprintf+0x5c>
      if(c == '%'){
 842:	fd479ee3          	bne	a5,s4,81e <vprintf+0x4e>
        state = '%';
 846:	89be                	mv	s3,a5
 848:	b7e5                	j	830 <vprintf+0x60>
      if(c == 'd'){
 84a:	05878063          	beq	a5,s8,88a <vprintf+0xba>
      } else if(c == 'l') {
 84e:	05978c63          	beq	a5,s9,8a6 <vprintf+0xd6>
      } else if(c == 'x') {
 852:	07a78863          	beq	a5,s10,8c2 <vprintf+0xf2>
      } else if(c == 'p') {
 856:	09b78463          	beq	a5,s11,8de <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 85a:	07300713          	li	a4,115
 85e:	0ce78663          	beq	a5,a4,92a <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 862:	06300713          	li	a4,99
 866:	0ee78e63          	beq	a5,a4,962 <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 86a:	11478863          	beq	a5,s4,97a <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 86e:	85d2                	mv	a1,s4
 870:	8556                	mv	a0,s5
 872:	00000097          	auipc	ra,0x0
 876:	e92080e7          	jalr	-366(ra) # 704 <putc>
        putc(fd, c);
 87a:	85ca                	mv	a1,s2
 87c:	8556                	mv	a0,s5
 87e:	00000097          	auipc	ra,0x0
 882:	e86080e7          	jalr	-378(ra) # 704 <putc>
      }
      state = 0;
 886:	4981                	li	s3,0
 888:	b765                	j	830 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 88a:	008b0913          	addi	s2,s6,8
 88e:	4685                	li	a3,1
 890:	4629                	li	a2,10
 892:	000b2583          	lw	a1,0(s6)
 896:	8556                	mv	a0,s5
 898:	00000097          	auipc	ra,0x0
 89c:	e8e080e7          	jalr	-370(ra) # 726 <printint>
 8a0:	8b4a                	mv	s6,s2
      state = 0;
 8a2:	4981                	li	s3,0
 8a4:	b771                	j	830 <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 8a6:	008b0913          	addi	s2,s6,8
 8aa:	4681                	li	a3,0
 8ac:	4629                	li	a2,10
 8ae:	000b2583          	lw	a1,0(s6)
 8b2:	8556                	mv	a0,s5
 8b4:	00000097          	auipc	ra,0x0
 8b8:	e72080e7          	jalr	-398(ra) # 726 <printint>
 8bc:	8b4a                	mv	s6,s2
      state = 0;
 8be:	4981                	li	s3,0
 8c0:	bf85                	j	830 <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 8c2:	008b0913          	addi	s2,s6,8
 8c6:	4681                	li	a3,0
 8c8:	4641                	li	a2,16
 8ca:	000b2583          	lw	a1,0(s6)
 8ce:	8556                	mv	a0,s5
 8d0:	00000097          	auipc	ra,0x0
 8d4:	e56080e7          	jalr	-426(ra) # 726 <printint>
 8d8:	8b4a                	mv	s6,s2
      state = 0;
 8da:	4981                	li	s3,0
 8dc:	bf91                	j	830 <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 8de:	008b0793          	addi	a5,s6,8
 8e2:	f8f43423          	sd	a5,-120(s0)
 8e6:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 8ea:	03000593          	li	a1,48
 8ee:	8556                	mv	a0,s5
 8f0:	00000097          	auipc	ra,0x0
 8f4:	e14080e7          	jalr	-492(ra) # 704 <putc>
  putc(fd, 'x');
 8f8:	85ea                	mv	a1,s10
 8fa:	8556                	mv	a0,s5
 8fc:	00000097          	auipc	ra,0x0
 900:	e08080e7          	jalr	-504(ra) # 704 <putc>
 904:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 906:	03c9d793          	srli	a5,s3,0x3c
 90a:	97de                	add	a5,a5,s7
 90c:	0007c583          	lbu	a1,0(a5)
 910:	8556                	mv	a0,s5
 912:	00000097          	auipc	ra,0x0
 916:	df2080e7          	jalr	-526(ra) # 704 <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 91a:	0992                	slli	s3,s3,0x4
 91c:	397d                	addiw	s2,s2,-1
 91e:	fe0914e3          	bnez	s2,906 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 922:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 926:	4981                	li	s3,0
 928:	b721                	j	830 <vprintf+0x60>
        s = va_arg(ap, char*);
 92a:	008b0993          	addi	s3,s6,8
 92e:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 932:	02090163          	beqz	s2,954 <vprintf+0x184>
        while(*s != 0){
 936:	00094583          	lbu	a1,0(s2)
 93a:	c9a1                	beqz	a1,98a <vprintf+0x1ba>
          putc(fd, *s);
 93c:	8556                	mv	a0,s5
 93e:	00000097          	auipc	ra,0x0
 942:	dc6080e7          	jalr	-570(ra) # 704 <putc>
          s++;
 946:	0905                	addi	s2,s2,1
        while(*s != 0){
 948:	00094583          	lbu	a1,0(s2)
 94c:	f9e5                	bnez	a1,93c <vprintf+0x16c>
        s = va_arg(ap, char*);
 94e:	8b4e                	mv	s6,s3
      state = 0;
 950:	4981                	li	s3,0
 952:	bdf9                	j	830 <vprintf+0x60>
          s = "(null)";
 954:	00000917          	auipc	s2,0x0
 958:	2a490913          	addi	s2,s2,676 # bf8 <longjmp_1+0x8>
        while(*s != 0){
 95c:	02800593          	li	a1,40
 960:	bff1                	j	93c <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 962:	008b0913          	addi	s2,s6,8
 966:	000b4583          	lbu	a1,0(s6)
 96a:	8556                	mv	a0,s5
 96c:	00000097          	auipc	ra,0x0
 970:	d98080e7          	jalr	-616(ra) # 704 <putc>
 974:	8b4a                	mv	s6,s2
      state = 0;
 976:	4981                	li	s3,0
 978:	bd65                	j	830 <vprintf+0x60>
        putc(fd, c);
 97a:	85d2                	mv	a1,s4
 97c:	8556                	mv	a0,s5
 97e:	00000097          	auipc	ra,0x0
 982:	d86080e7          	jalr	-634(ra) # 704 <putc>
      state = 0;
 986:	4981                	li	s3,0
 988:	b565                	j	830 <vprintf+0x60>
        s = va_arg(ap, char*);
 98a:	8b4e                	mv	s6,s3
      state = 0;
 98c:	4981                	li	s3,0
 98e:	b54d                	j	830 <vprintf+0x60>
    }
  }
}
 990:	70e6                	ld	ra,120(sp)
 992:	7446                	ld	s0,112(sp)
 994:	74a6                	ld	s1,104(sp)
 996:	7906                	ld	s2,96(sp)
 998:	69e6                	ld	s3,88(sp)
 99a:	6a46                	ld	s4,80(sp)
 99c:	6aa6                	ld	s5,72(sp)
 99e:	6b06                	ld	s6,64(sp)
 9a0:	7be2                	ld	s7,56(sp)
 9a2:	7c42                	ld	s8,48(sp)
 9a4:	7ca2                	ld	s9,40(sp)
 9a6:	7d02                	ld	s10,32(sp)
 9a8:	6de2                	ld	s11,24(sp)
 9aa:	6109                	addi	sp,sp,128
 9ac:	8082                	ret

00000000000009ae <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 9ae:	715d                	addi	sp,sp,-80
 9b0:	ec06                	sd	ra,24(sp)
 9b2:	e822                	sd	s0,16(sp)
 9b4:	1000                	addi	s0,sp,32
 9b6:	e010                	sd	a2,0(s0)
 9b8:	e414                	sd	a3,8(s0)
 9ba:	e818                	sd	a4,16(s0)
 9bc:	ec1c                	sd	a5,24(s0)
 9be:	03043023          	sd	a6,32(s0)
 9c2:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 9c6:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 9ca:	8622                	mv	a2,s0
 9cc:	00000097          	auipc	ra,0x0
 9d0:	e04080e7          	jalr	-508(ra) # 7d0 <vprintf>
}
 9d4:	60e2                	ld	ra,24(sp)
 9d6:	6442                	ld	s0,16(sp)
 9d8:	6161                	addi	sp,sp,80
 9da:	8082                	ret

00000000000009dc <printf>:

void
printf(const char *fmt, ...)
{
 9dc:	711d                	addi	sp,sp,-96
 9de:	ec06                	sd	ra,24(sp)
 9e0:	e822                	sd	s0,16(sp)
 9e2:	1000                	addi	s0,sp,32
 9e4:	e40c                	sd	a1,8(s0)
 9e6:	e810                	sd	a2,16(s0)
 9e8:	ec14                	sd	a3,24(s0)
 9ea:	f018                	sd	a4,32(s0)
 9ec:	f41c                	sd	a5,40(s0)
 9ee:	03043823          	sd	a6,48(s0)
 9f2:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 9f6:	00840613          	addi	a2,s0,8
 9fa:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 9fe:	85aa                	mv	a1,a0
 a00:	4505                	li	a0,1
 a02:	00000097          	auipc	ra,0x0
 a06:	dce080e7          	jalr	-562(ra) # 7d0 <vprintf>
}
 a0a:	60e2                	ld	ra,24(sp)
 a0c:	6442                	ld	s0,16(sp)
 a0e:	6125                	addi	sp,sp,96
 a10:	8082                	ret

0000000000000a12 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a12:	1141                	addi	sp,sp,-16
 a14:	e422                	sd	s0,8(sp)
 a16:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a18:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1c:	00000797          	auipc	a5,0x0
 a20:	20c7b783          	ld	a5,524(a5) # c28 <freep>
 a24:	a805                	j	a54 <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 a26:	4618                	lw	a4,8(a2)
 a28:	9db9                	addw	a1,a1,a4
 a2a:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 a2e:	6398                	ld	a4,0(a5)
 a30:	6318                	ld	a4,0(a4)
 a32:	fee53823          	sd	a4,-16(a0)
 a36:	a091                	j	a7a <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 a38:	ff852703          	lw	a4,-8(a0)
 a3c:	9e39                	addw	a2,a2,a4
 a3e:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 a40:	ff053703          	ld	a4,-16(a0)
 a44:	e398                	sd	a4,0(a5)
 a46:	a099                	j	a8c <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a48:	6398                	ld	a4,0(a5)
 a4a:	00e7e463          	bltu	a5,a4,a52 <free+0x40>
 a4e:	00e6ea63          	bltu	a3,a4,a62 <free+0x50>
{
 a52:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a54:	fed7fae3          	bgeu	a5,a3,a48 <free+0x36>
 a58:	6398                	ld	a4,0(a5)
 a5a:	00e6e463          	bltu	a3,a4,a62 <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a5e:	fee7eae3          	bltu	a5,a4,a52 <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 a62:	ff852583          	lw	a1,-8(a0)
 a66:	6390                	ld	a2,0(a5)
 a68:	02059713          	slli	a4,a1,0x20
 a6c:	9301                	srli	a4,a4,0x20
 a6e:	0712                	slli	a4,a4,0x4
 a70:	9736                	add	a4,a4,a3
 a72:	fae60ae3          	beq	a2,a4,a26 <free+0x14>
    bp->s.ptr = p->s.ptr;
 a76:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 a7a:	4790                	lw	a2,8(a5)
 a7c:	02061713          	slli	a4,a2,0x20
 a80:	9301                	srli	a4,a4,0x20
 a82:	0712                	slli	a4,a4,0x4
 a84:	973e                	add	a4,a4,a5
 a86:	fae689e3          	beq	a3,a4,a38 <free+0x26>
  } else
    p->s.ptr = bp;
 a8a:	e394                	sd	a3,0(a5)
  freep = p;
 a8c:	00000717          	auipc	a4,0x0
 a90:	18f73e23          	sd	a5,412(a4) # c28 <freep>
}
 a94:	6422                	ld	s0,8(sp)
 a96:	0141                	addi	sp,sp,16
 a98:	8082                	ret

0000000000000a9a <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 a9a:	7139                	addi	sp,sp,-64
 a9c:	fc06                	sd	ra,56(sp)
 a9e:	f822                	sd	s0,48(sp)
 aa0:	f426                	sd	s1,40(sp)
 aa2:	f04a                	sd	s2,32(sp)
 aa4:	ec4e                	sd	s3,24(sp)
 aa6:	e852                	sd	s4,16(sp)
 aa8:	e456                	sd	s5,8(sp)
 aaa:	e05a                	sd	s6,0(sp)
 aac:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 aae:	02051493          	slli	s1,a0,0x20
 ab2:	9081                	srli	s1,s1,0x20
 ab4:	04bd                	addi	s1,s1,15
 ab6:	8091                	srli	s1,s1,0x4
 ab8:	0014899b          	addiw	s3,s1,1
 abc:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 abe:	00000517          	auipc	a0,0x0
 ac2:	16a53503          	ld	a0,362(a0) # c28 <freep>
 ac6:	c515                	beqz	a0,af2 <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ac8:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 aca:	4798                	lw	a4,8(a5)
 acc:	02977f63          	bgeu	a4,s1,b0a <malloc+0x70>
 ad0:	8a4e                	mv	s4,s3
 ad2:	0009871b          	sext.w	a4,s3
 ad6:	6685                	lui	a3,0x1
 ad8:	00d77363          	bgeu	a4,a3,ade <malloc+0x44>
 adc:	6a05                	lui	s4,0x1
 ade:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 ae2:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 ae6:	00000917          	auipc	s2,0x0
 aea:	14290913          	addi	s2,s2,322 # c28 <freep>
  if(p == (char*)-1)
 aee:	5afd                	li	s5,-1
 af0:	a88d                	j	b62 <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 af2:	00000797          	auipc	a5,0x0
 af6:	21e78793          	addi	a5,a5,542 # d10 <base>
 afa:	00000717          	auipc	a4,0x0
 afe:	12f73723          	sd	a5,302(a4) # c28 <freep>
 b02:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 b04:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 b08:	b7e1                	j	ad0 <malloc+0x36>
      if(p->s.size == nunits)
 b0a:	02e48b63          	beq	s1,a4,b40 <malloc+0xa6>
        p->s.size -= nunits;
 b0e:	4137073b          	subw	a4,a4,s3
 b12:	c798                	sw	a4,8(a5)
        p += p->s.size;
 b14:	1702                	slli	a4,a4,0x20
 b16:	9301                	srli	a4,a4,0x20
 b18:	0712                	slli	a4,a4,0x4
 b1a:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 b1c:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 b20:	00000717          	auipc	a4,0x0
 b24:	10a73423          	sd	a0,264(a4) # c28 <freep>
      return (void*)(p + 1);
 b28:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 b2c:	70e2                	ld	ra,56(sp)
 b2e:	7442                	ld	s0,48(sp)
 b30:	74a2                	ld	s1,40(sp)
 b32:	7902                	ld	s2,32(sp)
 b34:	69e2                	ld	s3,24(sp)
 b36:	6a42                	ld	s4,16(sp)
 b38:	6aa2                	ld	s5,8(sp)
 b3a:	6b02                	ld	s6,0(sp)
 b3c:	6121                	addi	sp,sp,64
 b3e:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 b40:	6398                	ld	a4,0(a5)
 b42:	e118                	sd	a4,0(a0)
 b44:	bff1                	j	b20 <malloc+0x86>
  hp->s.size = nu;
 b46:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 b4a:	0541                	addi	a0,a0,16
 b4c:	00000097          	auipc	ra,0x0
 b50:	ec6080e7          	jalr	-314(ra) # a12 <free>
  return freep;
 b54:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 b58:	d971                	beqz	a0,b2c <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b5a:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 b5c:	4798                	lw	a4,8(a5)
 b5e:	fa9776e3          	bgeu	a4,s1,b0a <malloc+0x70>
    if(p == freep)
 b62:	00093703          	ld	a4,0(s2)
 b66:	853e                	mv	a0,a5
 b68:	fef719e3          	bne	a4,a5,b5a <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 b6c:	8552                	mv	a0,s4
 b6e:	00000097          	auipc	ra,0x0
 b72:	b7e080e7          	jalr	-1154(ra) # 6ec <sbrk>
  if(p == (char*)-1)
 b76:	fd5518e3          	bne	a0,s5,b46 <malloc+0xac>
        return 0;
 b7a:	4501                	li	a0,0
 b7c:	bf45                	j	b2c <malloc+0x92>

0000000000000b7e <setjmp>:
 b7e:	e100                	sd	s0,0(a0)
 b80:	e504                	sd	s1,8(a0)
 b82:	01253823          	sd	s2,16(a0)
 b86:	01353c23          	sd	s3,24(a0)
 b8a:	03453023          	sd	s4,32(a0)
 b8e:	03553423          	sd	s5,40(a0)
 b92:	03653823          	sd	s6,48(a0)
 b96:	03753c23          	sd	s7,56(a0)
 b9a:	05853023          	sd	s8,64(a0)
 b9e:	05953423          	sd	s9,72(a0)
 ba2:	05a53823          	sd	s10,80(a0)
 ba6:	05b53c23          	sd	s11,88(a0)
 baa:	06153023          	sd	ra,96(a0)
 bae:	06253423          	sd	sp,104(a0)
 bb2:	4501                	li	a0,0
 bb4:	8082                	ret

0000000000000bb6 <longjmp>:
 bb6:	6100                	ld	s0,0(a0)
 bb8:	6504                	ld	s1,8(a0)
 bba:	01053903          	ld	s2,16(a0)
 bbe:	01853983          	ld	s3,24(a0)
 bc2:	02053a03          	ld	s4,32(a0)
 bc6:	02853a83          	ld	s5,40(a0)
 bca:	03053b03          	ld	s6,48(a0)
 bce:	03853b83          	ld	s7,56(a0)
 bd2:	04053c03          	ld	s8,64(a0)
 bd6:	04853c83          	ld	s9,72(a0)
 bda:	05053d03          	ld	s10,80(a0)
 bde:	05853d83          	ld	s11,88(a0)
 be2:	06053083          	ld	ra,96(a0)
 be6:	06853103          	ld	sp,104(a0)
 bea:	c199                	beqz	a1,bf0 <longjmp_1>
 bec:	852e                	mv	a0,a1
 bee:	8082                	ret

0000000000000bf0 <longjmp_1>:
 bf0:	4505                	li	a0,1
 bf2:	8082                	ret
