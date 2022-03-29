#include "kernel/types.h"
#include "user/setjmp.h"
#include "user/threads.h"
#include "user/user.h"
#define NULL 0

static struct thread* current_thread = NULL;
static struct thread* root_thread = NULL;
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;
// TODO: necessary declares, if any
// Algorithm ref: https://www.geeksforgeeks.org/preorder-successor-node-binary-tree/
struct thread* preorder_find_next(struct thread* root, struct thread* current){
    if (current->left){
        return current->left;
    }
    if (current->right){
        return current->right;
    }
    struct thread *curr = current, *parent = current->parent;
    while(parent!=NULL && parent->right==curr){
        curr = curr->parent;
        parent = parent->parent;
    }
    if (parent==NULL){
        return NULL;
    }
    return parent->right;
}

// ref: pass pointer and recursive change value: https://stackoverflow.com/questions/46469803/pointer-change-its-address-after-exiting-a-recursive-function
void preorder_search_last_node(struct thread *current_traverse, struct thread **last_thread) {
    if (current_traverse){
        *last_thread = current_traverse;
        preorder_search_last_node(current_traverse->left, last_thread);
        preorder_search_last_node(current_traverse->right, last_thread);
    };
};


struct thread *thread_create(void (*f)(void *), void *arg){
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
    t->arg = arg;
    t->ID  = id;
    t->buf_set = 0;
    t->stack = (void*) new_stack;
    t->stack_p = (void*) new_stack_p;
    id++;
    return t;
}
void thread_add_runqueue(struct thread *t){
    if(current_thread == NULL){
        // TODO: make thread t as the root thread
        root_thread = t;
        current_thread = t;
    }
    else{
        // TODO
        if (!current_thread->left){
            current_thread->left = t;
            t->parent = current_thread;
        } else if (!current_thread->right){
            current_thread->right = t;
            t->parent = current_thread;
        }
        // else, discard t by free thread and stack frame
        else {
            free(t->stack);
            free(t);
        }
    }
}
void thread_yield(void){
    // TODO
    int jmpVal = setjmp(current_thread->env); // save current thread context
    if (jmpVal ==0){
        current_thread->buf_set = 1;
        schedule(); // update current thread
        dispatch(); // execute
    }
}
void dispatch(void){
    // TODO
    // if never run before
    if (current_thread->buf_set == 0){
        // initialize the stack
        int jmpVal = setjmp(env_tmp);
        if (jmpVal==0){
            env_tmp->sp = (unsigned long)current_thread->stack_p;
            longjmp(env_tmp, 1);
        } else {
            // run the thread's function
            current_thread->fp(current_thread->arg);
            //thread_exit();
        }
    } 
    // else, resume by longjmp with value 1
    else{
        longjmp(current_thread->env,1);
    }
}
void schedule(void){ // determine the next thread to run (preorder), change current_thread
    // TODO
    struct thread *next_thread = preorder_find_next(root_thread, current_thread);
    if (next_thread==NULL){
        next_thread = root_thread;
    }
    //printf("next id: %d\n", next_thread->ID);
    current_thread = next_thread;
}
void thread_exit(void){
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
        // TODO
        // Hint: No more thread to execute
        free(current_thread->stack);
        free(current_thread);
        current_thread=NULL;
        root_thread=NULL;
        longjmp(env_st,1);
    }
    else{
        // TODO
        // if leaf case, simply remove
        if (current_thread->left == NULL && current_thread->right == NULL){
            if (current_thread == current_thread->parent->left){
                current_thread->parent->left=NULL;
            } else if (current_thread == current_thread->parent->right){
                current_thread->parent->right=NULL;
            }
            struct thread *temp = current_thread;
            schedule();
            free(temp->stack);
            free(temp);
            dispatch();
        }
        // else, find next thread by preorder searching
        else {
            struct thread *temp = current_thread;
            struct thread *last_thread = NULL;
            preorder_search_last_node(current_thread, &last_thread);
            // ----- migration node in tree ------
            // if current has parent
            if (current_thread->parent){
                // if it's left child
                if (current_thread == current_thread->parent->left){
                    current_thread->parent->left=last_thread;
                } 
                // if it's right child
                else if (current_thread == current_thread->parent->right){
                    current_thread->parent->right=last_thread;
                }
            }
            // if current has right child but it's not last thread
            if (current_thread->right && current_thread->right->ID != last_thread->ID){
                current_thread->right->parent = last_thread;
            }
            // if current has left child but it's not last thread
            if (current_thread->left && current_thread->left->ID != last_thread->ID){
                current_thread->left->parent = last_thread;
            }
            // update last_thread's parent, if parent!=current_thread
            if (last_thread->parent->left->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
                last_thread->parent->left=NULL;
            }
            if (last_thread->parent->right->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
                last_thread->parent->right=NULL;
            }
            last_thread->parent = current_thread->parent;
            // update last_thread's left child if it's not left child of current
            if (current_thread->left->ID != last_thread->ID){
                last_thread->left = current_thread->left;
            }
            // update last_thread's right child if it's not right child of current
            if (current_thread->right->ID != last_thread->ID){
                last_thread->right = current_thread->right;
            }
            // if current is root, update root
            if (root_thread->ID == current_thread->ID){
                root_thread = last_thread;
            }
            // update next current_thread ??
            // current_thread = last_thread;
            schedule();
            free(temp->stack);
            free(temp);
            dispatch();
        }
    }
}
void thread_start_threading(void){
    // TODO
    int jmpVal = setjmp(env_st);
    if (jmpVal==0) {
	    dispatch();
    }
}