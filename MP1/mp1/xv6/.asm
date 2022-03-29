
user/_mp1-5:     file format elf64-littleriscv


Disassembly of section .text:

0000000000000000 <f5>:
#include "user/threads.h"

#define NULL 0

void f5(void *arg)
{
   0:	7179                	addi	sp,sp,-48
   2:	f406                	sd	ra,40(sp)
   4:	f022                	sd	s0,32(sp)
   6:	ec26                	sd	s1,24(sp)
   8:	e84a                	sd	s2,16(sp)
   a:	e44e                	sd	s3,8(sp)
   c:	1800                	addi	s0,sp,48
    int i = 0;
   e:	4481                	li	s1,0
    while (1) {
        printf(" ( ) \n");
  10:	00001997          	auipc	s3,0x1
  14:	ea898993          	addi	s3,s3,-344 # eb8 <thread_start_threading+0x30>
        if(++i == 1){
  18:	4905                	li	s2,1
  1a:	a809                	j	2c <f5+0x2c>
            thread_exit();
  1c:	00001097          	auipc	ra,0x1
  20:	cb2080e7          	jalr	-846(ra) # cce <thread_exit>
        }
        thread_yield();
  24:	00001097          	auipc	ra,0x1
  28:	c64080e7          	jalr	-924(ra) # c88 <thread_yield>
        printf(" ( ) \n");
  2c:	854e                	mv	a0,s3
  2e:	00001097          	auipc	ra,0x1
  32:	878080e7          	jalr	-1928(ra) # 8a6 <printf>
        if(++i == 1){
  36:	2485                	addiw	s1,s1,1
  38:	ff2482e3          	beq	s1,s2,1c <f5+0x1c>
  3c:	b7e5                	j	24 <f5+0x24>

000000000000003e <f4>:
    }
}

void f4(void *arg)
{
  3e:	7179                	addi	sp,sp,-48
  40:	f406                	sd	ra,40(sp)
  42:	f022                	sd	s0,32(sp)
  44:	ec26                	sd	s1,24(sp)
  46:	e84a                	sd	s2,16(sp)
  48:	e44e                	sd	s3,8(sp)
  4a:	e052                	sd	s4,0(sp)
  4c:	1800                	addi	s0,sp,48
    int i = 0;
    while (1) {
        printf(" (.) \n");
  4e:	00001517          	auipc	a0,0x1
  52:	e7250513          	addi	a0,a0,-398 # ec0 <thread_start_threading+0x38>
  56:	00001097          	auipc	ra,0x1
  5a:	850080e7          	jalr	-1968(ra) # 8a6 <printf>
        struct thread *t5 = thread_create(f5, NULL);
  5e:	4581                	li	a1,0
  60:	00000517          	auipc	a0,0x0
  64:	fa050513          	addi	a0,a0,-96 # 0 <f5>
  68:	00001097          	auipc	ra,0x1
  6c:	ab8080e7          	jalr	-1352(ra) # b20 <thread_create>
        thread_add_runqueue(t5);
  70:	00001097          	auipc	ra,0x1
  74:	b14080e7          	jalr	-1260(ra) # b84 <thread_add_runqueue>
        if(++i == 2){
  78:	4485                	li	s1,1
        printf(" (.) \n");
  7a:	00001a17          	auipc	s4,0x1
  7e:	e46a0a13          	addi	s4,s4,-442 # ec0 <thread_start_threading+0x38>
        struct thread *t5 = thread_create(f5, NULL);
  82:	00000997          	auipc	s3,0x0
  86:	f7e98993          	addi	s3,s3,-130 # 0 <f5>
        if(++i == 2){
  8a:	4909                	li	s2,2
            thread_exit();
        }
        thread_yield();
  8c:	00001097          	auipc	ra,0x1
  90:	bfc080e7          	jalr	-1028(ra) # c88 <thread_yield>
        printf(" (.) \n");
  94:	8552                	mv	a0,s4
  96:	00001097          	auipc	ra,0x1
  9a:	810080e7          	jalr	-2032(ra) # 8a6 <printf>
        struct thread *t5 = thread_create(f5, NULL);
  9e:	4581                	li	a1,0
  a0:	854e                	mv	a0,s3
  a2:	00001097          	auipc	ra,0x1
  a6:	a7e080e7          	jalr	-1410(ra) # b20 <thread_create>
        thread_add_runqueue(t5);
  aa:	00001097          	auipc	ra,0x1
  ae:	ada080e7          	jalr	-1318(ra) # b84 <thread_add_runqueue>
        if(++i == 2){
  b2:	2485                	addiw	s1,s1,1
  b4:	fd249ce3          	bne	s1,s2,8c <f4+0x4e>
            thread_exit();
  b8:	00001097          	auipc	ra,0x1
  bc:	c16080e7          	jalr	-1002(ra) # cce <thread_exit>
  c0:	b7f1                	j	8c <f4+0x4e>

00000000000000c2 <f3>:
    }
}

void f3(void *arg)
{
  c2:	7179                	addi	sp,sp,-48
  c4:	f406                	sd	ra,40(sp)
  c6:	f022                	sd	s0,32(sp)
  c8:	ec26                	sd	s1,24(sp)
  ca:	e84a                	sd	s2,16(sp)
  cc:	e44e                	sd	s3,8(sp)
  ce:	e052                	sd	s4,0(sp)
  d0:	1800                	addi	s0,sp,48
    int i = 0;
    while (1) {
        printf(" (-) \n");
  d2:	00001517          	auipc	a0,0x1
  d6:	df650513          	addi	a0,a0,-522 # ec8 <thread_start_threading+0x40>
  da:	00000097          	auipc	ra,0x0
  de:	7cc080e7          	jalr	1996(ra) # 8a6 <printf>
        struct thread *t4 = thread_create(f4, NULL);
  e2:	4581                	li	a1,0
  e4:	00000517          	auipc	a0,0x0
  e8:	f5a50513          	addi	a0,a0,-166 # 3e <f4>
  ec:	00001097          	auipc	ra,0x1
  f0:	a34080e7          	jalr	-1484(ra) # b20 <thread_create>
        thread_add_runqueue(t4);
  f4:	00001097          	auipc	ra,0x1
  f8:	a90080e7          	jalr	-1392(ra) # b84 <thread_add_runqueue>
        if(++i == 3){
  fc:	4485                	li	s1,1
        printf(" (-) \n");
  fe:	00001a17          	auipc	s4,0x1
 102:	dcaa0a13          	addi	s4,s4,-566 # ec8 <thread_start_threading+0x40>
        struct thread *t4 = thread_create(f4, NULL);
 106:	00000997          	auipc	s3,0x0
 10a:	f3898993          	addi	s3,s3,-200 # 3e <f4>
        if(++i == 3){
 10e:	490d                	li	s2,3
            thread_exit();
        }
        thread_yield();
 110:	00001097          	auipc	ra,0x1
 114:	b78080e7          	jalr	-1160(ra) # c88 <thread_yield>
        printf(" (-) \n");
 118:	8552                	mv	a0,s4
 11a:	00000097          	auipc	ra,0x0
 11e:	78c080e7          	jalr	1932(ra) # 8a6 <printf>
        struct thread *t4 = thread_create(f4, NULL);
 122:	4581                	li	a1,0
 124:	854e                	mv	a0,s3
 126:	00001097          	auipc	ra,0x1
 12a:	9fa080e7          	jalr	-1542(ra) # b20 <thread_create>
        thread_add_runqueue(t4);
 12e:	00001097          	auipc	ra,0x1
 132:	a56080e7          	jalr	-1450(ra) # b84 <thread_add_runqueue>
        if(++i == 3){
 136:	2485                	addiw	s1,s1,1
 138:	fd249ce3          	bne	s1,s2,110 <f3+0x4e>
            thread_exit();
 13c:	00001097          	auipc	ra,0x1
 140:	b92080e7          	jalr	-1134(ra) # cce <thread_exit>
 144:	b7f1                	j	110 <f3+0x4e>

0000000000000146 <f2>:
    }
}

void f2(void *arg)
{
 146:	7179                	addi	sp,sp,-48
 148:	f406                	sd	ra,40(sp)
 14a:	f022                	sd	s0,32(sp)
 14c:	ec26                	sd	s1,24(sp)
 14e:	e84a                	sd	s2,16(sp)
 150:	e44e                	sd	s3,8(sp)
 152:	e052                	sd	s4,0(sp)
 154:	1800                	addi	s0,sp,48
    int i = 0;
    while(1) {
        printf(" (o) \n");
 156:	00001517          	auipc	a0,0x1
 15a:	d7a50513          	addi	a0,a0,-646 # ed0 <thread_start_threading+0x48>
 15e:	00000097          	auipc	ra,0x0
 162:	748080e7          	jalr	1864(ra) # 8a6 <printf>
        struct thread *t3 = thread_create(f3, NULL);
 166:	4581                	li	a1,0
 168:	00000517          	auipc	a0,0x0
 16c:	f5a50513          	addi	a0,a0,-166 # c2 <f3>
 170:	00001097          	auipc	ra,0x1
 174:	9b0080e7          	jalr	-1616(ra) # b20 <thread_create>
        thread_add_runqueue(t3);
 178:	00001097          	auipc	ra,0x1
 17c:	a0c080e7          	jalr	-1524(ra) # b84 <thread_add_runqueue>
        if (++i == 4) {
 180:	4485                	li	s1,1
        printf(" (o) \n");
 182:	00001a17          	auipc	s4,0x1
 186:	d4ea0a13          	addi	s4,s4,-690 # ed0 <thread_start_threading+0x48>
        struct thread *t3 = thread_create(f3, NULL);
 18a:	00000997          	auipc	s3,0x0
 18e:	f3898993          	addi	s3,s3,-200 # c2 <f3>
        if (++i == 4) {
 192:	4911                	li	s2,4
            thread_exit();
        }
        thread_yield();
 194:	00001097          	auipc	ra,0x1
 198:	af4080e7          	jalr	-1292(ra) # c88 <thread_yield>
        printf(" (o) \n");
 19c:	8552                	mv	a0,s4
 19e:	00000097          	auipc	ra,0x0
 1a2:	708080e7          	jalr	1800(ra) # 8a6 <printf>
        struct thread *t3 = thread_create(f3, NULL);
 1a6:	4581                	li	a1,0
 1a8:	854e                	mv	a0,s3
 1aa:	00001097          	auipc	ra,0x1
 1ae:	976080e7          	jalr	-1674(ra) # b20 <thread_create>
        thread_add_runqueue(t3);
 1b2:	00001097          	auipc	ra,0x1
 1b6:	9d2080e7          	jalr	-1582(ra) # b84 <thread_add_runqueue>
        if (++i == 4) {
 1ba:	2485                	addiw	s1,s1,1
 1bc:	fd249ce3          	bne	s1,s2,194 <f2+0x4e>
            thread_exit();
 1c0:	00001097          	auipc	ra,0x1
 1c4:	b0e080e7          	jalr	-1266(ra) # cce <thread_exit>
 1c8:	b7f1                	j	194 <f2+0x4e>

00000000000001ca <f1>:
    }
}

void f1(void *arg)
{
 1ca:	7179                	addi	sp,sp,-48
 1cc:	f406                	sd	ra,40(sp)
 1ce:	f022                	sd	s0,32(sp)
 1d0:	ec26                	sd	s1,24(sp)
 1d2:	e84a                	sd	s2,16(sp)
 1d4:	e44e                	sd	s3,8(sp)
 1d6:	1800                	addi	s0,sp,48
    int i = 0;
    
    while(1) {
        printf("-( )-\n");
 1d8:	00001517          	auipc	a0,0x1
 1dc:	d0050513          	addi	a0,a0,-768 # ed8 <thread_start_threading+0x50>
 1e0:	00000097          	auipc	ra,0x0
 1e4:	6c6080e7          	jalr	1734(ra) # 8a6 <printf>
        struct thread *t2 = thread_create(f2, NULL);
 1e8:	4581                	li	a1,0
 1ea:	00000517          	auipc	a0,0x0
 1ee:	f5c50513          	addi	a0,a0,-164 # 146 <f2>
 1f2:	00001097          	auipc	ra,0x1
 1f6:	92e080e7          	jalr	-1746(ra) # b20 <thread_create>
        thread_add_runqueue(t2);
 1fa:	00001097          	auipc	ra,0x1
 1fe:	98a080e7          	jalr	-1654(ra) # b84 <thread_add_runqueue>
 202:	4491                	li	s1,4
        printf("-( )-\n");
 204:	00001997          	auipc	s3,0x1
 208:	cd498993          	addi	s3,s3,-812 # ed8 <thread_start_threading+0x50>
        struct thread *t2 = thread_create(f2, NULL);
 20c:	00000917          	auipc	s2,0x0
 210:	f3a90913          	addi	s2,s2,-198 # 146 <f2>
        if (++i == 5) {
            return;
        }
        thread_yield();
 214:	00001097          	auipc	ra,0x1
 218:	a74080e7          	jalr	-1420(ra) # c88 <thread_yield>
        printf("-( )-\n");
 21c:	854e                	mv	a0,s3
 21e:	00000097          	auipc	ra,0x0
 222:	688080e7          	jalr	1672(ra) # 8a6 <printf>
        struct thread *t2 = thread_create(f2, NULL);
 226:	4581                	li	a1,0
 228:	854a                	mv	a0,s2
 22a:	00001097          	auipc	ra,0x1
 22e:	8f6080e7          	jalr	-1802(ra) # b20 <thread_create>
        thread_add_runqueue(t2);
 232:	00001097          	auipc	ra,0x1
 236:	952080e7          	jalr	-1710(ra) # b84 <thread_add_runqueue>
        if (++i == 5) {
 23a:	34fd                	addiw	s1,s1,-1
 23c:	fce1                	bnez	s1,214 <f1+0x4a>
    }
}
 23e:	70a2                	ld	ra,40(sp)
 240:	7402                	ld	s0,32(sp)
 242:	64e2                	ld	s1,24(sp)
 244:	6942                	ld	s2,16(sp)
 246:	69a2                	ld	s3,8(sp)
 248:	6145                	addi	sp,sp,48
 24a:	8082                	ret

000000000000024c <main>:

int main(int argc, char **argv)
{
 24c:	1141                	addi	sp,sp,-16
 24e:	e406                	sd	ra,8(sp)
 250:	e022                	sd	s0,0(sp)
 252:	0800                	addi	s0,sp,16
    printf("mp1-5\n");
 254:	00001517          	auipc	a0,0x1
 258:	c8c50513          	addi	a0,a0,-884 # ee0 <thread_start_threading+0x58>
 25c:	00000097          	auipc	ra,0x0
 260:	64a080e7          	jalr	1610(ra) # 8a6 <printf>
    printf(" \\ / \n");
 264:	00001517          	auipc	a0,0x1
 268:	c8450513          	addi	a0,a0,-892 # ee8 <thread_start_threading+0x60>
 26c:	00000097          	auipc	ra,0x0
 270:	63a080e7          	jalr	1594(ra) # 8a6 <printf>
    struct thread *t1 = thread_create(f1, NULL);
 274:	4581                	li	a1,0
 276:	00000517          	auipc	a0,0x0
 27a:	f5450513          	addi	a0,a0,-172 # 1ca <f1>
 27e:	00001097          	auipc	ra,0x1
 282:	8a2080e7          	jalr	-1886(ra) # b20 <thread_create>
    thread_add_runqueue(t1);
 286:	00001097          	auipc	ra,0x1
 28a:	8fe080e7          	jalr	-1794(ra) # b84 <thread_add_runqueue>
    thread_start_threading();
 28e:	00001097          	auipc	ra,0x1
 292:	bfa080e7          	jalr	-1030(ra) # e88 <thread_start_threading>
    printf(" / \\ \n");
 296:	00001517          	auipc	a0,0x1
 29a:	c5a50513          	addi	a0,a0,-934 # ef0 <thread_start_threading+0x68>
 29e:	00000097          	auipc	ra,0x0
 2a2:	608080e7          	jalr	1544(ra) # 8a6 <printf>
    printf("\nexited\n");
 2a6:	00001517          	auipc	a0,0x1
 2aa:	c5250513          	addi	a0,a0,-942 # ef8 <thread_start_threading+0x70>
 2ae:	00000097          	auipc	ra,0x0
 2b2:	5f8080e7          	jalr	1528(ra) # 8a6 <printf>
    exit(0);
 2b6:	4501                	li	a0,0
 2b8:	00000097          	auipc	ra,0x0
 2bc:	276080e7          	jalr	630(ra) # 52e <exit>

00000000000002c0 <strcpy>:
#include "kernel/fcntl.h"
#include "user/user.h"

char*
strcpy(char *s, const char *t)
{
 2c0:	1141                	addi	sp,sp,-16
 2c2:	e422                	sd	s0,8(sp)
 2c4:	0800                	addi	s0,sp,16
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 2c6:	87aa                	mv	a5,a0
 2c8:	0585                	addi	a1,a1,1
 2ca:	0785                	addi	a5,a5,1
 2cc:	fff5c703          	lbu	a4,-1(a1)
 2d0:	fee78fa3          	sb	a4,-1(a5)
 2d4:	fb75                	bnez	a4,2c8 <strcpy+0x8>
    ;
  return os;
}
 2d6:	6422                	ld	s0,8(sp)
 2d8:	0141                	addi	sp,sp,16
 2da:	8082                	ret

00000000000002dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2dc:	1141                	addi	sp,sp,-16
 2de:	e422                	sd	s0,8(sp)
 2e0:	0800                	addi	s0,sp,16
  while(*p && *p == *q)
 2e2:	00054783          	lbu	a5,0(a0)
 2e6:	cb91                	beqz	a5,2fa <strcmp+0x1e>
 2e8:	0005c703          	lbu	a4,0(a1)
 2ec:	00f71763          	bne	a4,a5,2fa <strcmp+0x1e>
    p++, q++;
 2f0:	0505                	addi	a0,a0,1
 2f2:	0585                	addi	a1,a1,1
  while(*p && *p == *q)
 2f4:	00054783          	lbu	a5,0(a0)
 2f8:	fbe5                	bnez	a5,2e8 <strcmp+0xc>
  return (uchar)*p - (uchar)*q;
 2fa:	0005c503          	lbu	a0,0(a1)
}
 2fe:	40a7853b          	subw	a0,a5,a0
 302:	6422                	ld	s0,8(sp)
 304:	0141                	addi	sp,sp,16
 306:	8082                	ret

0000000000000308 <strlen>:

uint
strlen(const char *s)
{
 308:	1141                	addi	sp,sp,-16
 30a:	e422                	sd	s0,8(sp)
 30c:	0800                	addi	s0,sp,16
  int n;

  for(n = 0; s[n]; n++)
 30e:	00054783          	lbu	a5,0(a0)
 312:	cf91                	beqz	a5,32e <strlen+0x26>
 314:	0505                	addi	a0,a0,1
 316:	87aa                	mv	a5,a0
 318:	4685                	li	a3,1
 31a:	9e89                	subw	a3,a3,a0
 31c:	00f6853b          	addw	a0,a3,a5
 320:	0785                	addi	a5,a5,1
 322:	fff7c703          	lbu	a4,-1(a5)
 326:	fb7d                	bnez	a4,31c <strlen+0x14>
    ;
  return n;
}
 328:	6422                	ld	s0,8(sp)
 32a:	0141                	addi	sp,sp,16
 32c:	8082                	ret
  for(n = 0; s[n]; n++)
 32e:	4501                	li	a0,0
 330:	bfe5                	j	328 <strlen+0x20>

0000000000000332 <memset>:

void*
memset(void *dst, int c, uint n)
{
 332:	1141                	addi	sp,sp,-16
 334:	e422                	sd	s0,8(sp)
 336:	0800                	addi	s0,sp,16
  char *cdst = (char *) dst;
  int i;
  for(i = 0; i < n; i++){
 338:	ca19                	beqz	a2,34e <memset+0x1c>
 33a:	87aa                	mv	a5,a0
 33c:	1602                	slli	a2,a2,0x20
 33e:	9201                	srli	a2,a2,0x20
 340:	00a60733          	add	a4,a2,a0
    cdst[i] = c;
 344:	00b78023          	sb	a1,0(a5)
  for(i = 0; i < n; i++){
 348:	0785                	addi	a5,a5,1
 34a:	fee79de3          	bne	a5,a4,344 <memset+0x12>
  }
  return dst;
}
 34e:	6422                	ld	s0,8(sp)
 350:	0141                	addi	sp,sp,16
 352:	8082                	ret

0000000000000354 <strchr>:

char*
strchr(const char *s, char c)
{
 354:	1141                	addi	sp,sp,-16
 356:	e422                	sd	s0,8(sp)
 358:	0800                	addi	s0,sp,16
  for(; *s; s++)
 35a:	00054783          	lbu	a5,0(a0)
 35e:	cb99                	beqz	a5,374 <strchr+0x20>
    if(*s == c)
 360:	00f58763          	beq	a1,a5,36e <strchr+0x1a>
  for(; *s; s++)
 364:	0505                	addi	a0,a0,1
 366:	00054783          	lbu	a5,0(a0)
 36a:	fbfd                	bnez	a5,360 <strchr+0xc>
      return (char*)s;
  return 0;
 36c:	4501                	li	a0,0
}
 36e:	6422                	ld	s0,8(sp)
 370:	0141                	addi	sp,sp,16
 372:	8082                	ret
  return 0;
 374:	4501                	li	a0,0
 376:	bfe5                	j	36e <strchr+0x1a>

0000000000000378 <gets>:

char*
gets(char *buf, int max)
{
 378:	711d                	addi	sp,sp,-96
 37a:	ec86                	sd	ra,88(sp)
 37c:	e8a2                	sd	s0,80(sp)
 37e:	e4a6                	sd	s1,72(sp)
 380:	e0ca                	sd	s2,64(sp)
 382:	fc4e                	sd	s3,56(sp)
 384:	f852                	sd	s4,48(sp)
 386:	f456                	sd	s5,40(sp)
 388:	f05a                	sd	s6,32(sp)
 38a:	ec5e                	sd	s7,24(sp)
 38c:	1080                	addi	s0,sp,96
 38e:	8baa                	mv	s7,a0
 390:	8a2e                	mv	s4,a1
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 392:	892a                	mv	s2,a0
 394:	4481                	li	s1,0
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
 396:	4aa9                	li	s5,10
 398:	4b35                	li	s6,13
  for(i=0; i+1 < max; ){
 39a:	89a6                	mv	s3,s1
 39c:	2485                	addiw	s1,s1,1
 39e:	0344d863          	bge	s1,s4,3ce <gets+0x56>
    cc = read(0, &c, 1);
 3a2:	4605                	li	a2,1
 3a4:	faf40593          	addi	a1,s0,-81
 3a8:	4501                	li	a0,0
 3aa:	00000097          	auipc	ra,0x0
 3ae:	19c080e7          	jalr	412(ra) # 546 <read>
    if(cc < 1)
 3b2:	00a05e63          	blez	a0,3ce <gets+0x56>
    buf[i++] = c;
 3b6:	faf44783          	lbu	a5,-81(s0)
 3ba:	00f90023          	sb	a5,0(s2)
    if(c == '\n' || c == '\r')
 3be:	01578763          	beq	a5,s5,3cc <gets+0x54>
 3c2:	0905                	addi	s2,s2,1
 3c4:	fd679be3          	bne	a5,s6,39a <gets+0x22>
  for(i=0; i+1 < max; ){
 3c8:	89a6                	mv	s3,s1
 3ca:	a011                	j	3ce <gets+0x56>
 3cc:	89a6                	mv	s3,s1
      break;
  }
  buf[i] = '\0';
 3ce:	99de                	add	s3,s3,s7
 3d0:	00098023          	sb	zero,0(s3)
  return buf;
}
 3d4:	855e                	mv	a0,s7
 3d6:	60e6                	ld	ra,88(sp)
 3d8:	6446                	ld	s0,80(sp)
 3da:	64a6                	ld	s1,72(sp)
 3dc:	6906                	ld	s2,64(sp)
 3de:	79e2                	ld	s3,56(sp)
 3e0:	7a42                	ld	s4,48(sp)
 3e2:	7aa2                	ld	s5,40(sp)
 3e4:	7b02                	ld	s6,32(sp)
 3e6:	6be2                	ld	s7,24(sp)
 3e8:	6125                	addi	sp,sp,96
 3ea:	8082                	ret

00000000000003ec <stat>:

int
stat(const char *n, struct stat *st)
{
 3ec:	1101                	addi	sp,sp,-32
 3ee:	ec06                	sd	ra,24(sp)
 3f0:	e822                	sd	s0,16(sp)
 3f2:	e426                	sd	s1,8(sp)
 3f4:	e04a                	sd	s2,0(sp)
 3f6:	1000                	addi	s0,sp,32
 3f8:	892e                	mv	s2,a1
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3fa:	4581                	li	a1,0
 3fc:	00000097          	auipc	ra,0x0
 400:	172080e7          	jalr	370(ra) # 56e <open>
  if(fd < 0)
 404:	02054563          	bltz	a0,42e <stat+0x42>
 408:	84aa                	mv	s1,a0
    return -1;
  r = fstat(fd, st);
 40a:	85ca                	mv	a1,s2
 40c:	00000097          	auipc	ra,0x0
 410:	17a080e7          	jalr	378(ra) # 586 <fstat>
 414:	892a                	mv	s2,a0
  close(fd);
 416:	8526                	mv	a0,s1
 418:	00000097          	auipc	ra,0x0
 41c:	13e080e7          	jalr	318(ra) # 556 <close>
  return r;
}
 420:	854a                	mv	a0,s2
 422:	60e2                	ld	ra,24(sp)
 424:	6442                	ld	s0,16(sp)
 426:	64a2                	ld	s1,8(sp)
 428:	6902                	ld	s2,0(sp)
 42a:	6105                	addi	sp,sp,32
 42c:	8082                	ret
    return -1;
 42e:	597d                	li	s2,-1
 430:	bfc5                	j	420 <stat+0x34>

0000000000000432 <atoi>:

int
atoi(const char *s)
{
 432:	1141                	addi	sp,sp,-16
 434:	e422                	sd	s0,8(sp)
 436:	0800                	addi	s0,sp,16
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 438:	00054603          	lbu	a2,0(a0)
 43c:	fd06079b          	addiw	a5,a2,-48
 440:	0ff7f793          	andi	a5,a5,255
 444:	4725                	li	a4,9
 446:	02f76963          	bltu	a4,a5,478 <atoi+0x46>
 44a:	86aa                	mv	a3,a0
  n = 0;
 44c:	4501                	li	a0,0
  while('0' <= *s && *s <= '9')
 44e:	45a5                	li	a1,9
    n = n*10 + *s++ - '0';
 450:	0685                	addi	a3,a3,1
 452:	0025179b          	slliw	a5,a0,0x2
 456:	9fa9                	addw	a5,a5,a0
 458:	0017979b          	slliw	a5,a5,0x1
 45c:	9fb1                	addw	a5,a5,a2
 45e:	fd07851b          	addiw	a0,a5,-48
  while('0' <= *s && *s <= '9')
 462:	0006c603          	lbu	a2,0(a3)
 466:	fd06071b          	addiw	a4,a2,-48
 46a:	0ff77713          	andi	a4,a4,255
 46e:	fee5f1e3          	bgeu	a1,a4,450 <atoi+0x1e>
  return n;
}
 472:	6422                	ld	s0,8(sp)
 474:	0141                	addi	sp,sp,16
 476:	8082                	ret
  n = 0;
 478:	4501                	li	a0,0
 47a:	bfe5                	j	472 <atoi+0x40>

000000000000047c <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 47c:	1141                	addi	sp,sp,-16
 47e:	e422                	sd	s0,8(sp)
 480:	0800                	addi	s0,sp,16
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  if (src > dst) {
 482:	02b57463          	bgeu	a0,a1,4aa <memmove+0x2e>
    while(n-- > 0)
 486:	00c05f63          	blez	a2,4a4 <memmove+0x28>
 48a:	1602                	slli	a2,a2,0x20
 48c:	9201                	srli	a2,a2,0x20
 48e:	00c507b3          	add	a5,a0,a2
  dst = vdst;
 492:	872a                	mv	a4,a0
      *dst++ = *src++;
 494:	0585                	addi	a1,a1,1
 496:	0705                	addi	a4,a4,1
 498:	fff5c683          	lbu	a3,-1(a1)
 49c:	fed70fa3          	sb	a3,-1(a4)
    while(n-- > 0)
 4a0:	fee79ae3          	bne	a5,a4,494 <memmove+0x18>
    src += n;
    while(n-- > 0)
      *--dst = *--src;
  }
  return vdst;
}
 4a4:	6422                	ld	s0,8(sp)
 4a6:	0141                	addi	sp,sp,16
 4a8:	8082                	ret
    dst += n;
 4aa:	00c50733          	add	a4,a0,a2
    src += n;
 4ae:	95b2                	add	a1,a1,a2
    while(n-- > 0)
 4b0:	fec05ae3          	blez	a2,4a4 <memmove+0x28>
 4b4:	fff6079b          	addiw	a5,a2,-1
 4b8:	1782                	slli	a5,a5,0x20
 4ba:	9381                	srli	a5,a5,0x20
 4bc:	fff7c793          	not	a5,a5
 4c0:	97ba                	add	a5,a5,a4
      *--dst = *--src;
 4c2:	15fd                	addi	a1,a1,-1
 4c4:	177d                	addi	a4,a4,-1
 4c6:	0005c683          	lbu	a3,0(a1)
 4ca:	00d70023          	sb	a3,0(a4)
    while(n-- > 0)
 4ce:	fee79ae3          	bne	a5,a4,4c2 <memmove+0x46>
 4d2:	bfc9                	j	4a4 <memmove+0x28>

00000000000004d4 <memcmp>:

int
memcmp(const void *s1, const void *s2, uint n)
{
 4d4:	1141                	addi	sp,sp,-16
 4d6:	e422                	sd	s0,8(sp)
 4d8:	0800                	addi	s0,sp,16
  const char *p1 = s1, *p2 = s2;
  while (n-- > 0) {
 4da:	ca05                	beqz	a2,50a <memcmp+0x36>
 4dc:	fff6069b          	addiw	a3,a2,-1
 4e0:	1682                	slli	a3,a3,0x20
 4e2:	9281                	srli	a3,a3,0x20
 4e4:	0685                	addi	a3,a3,1
 4e6:	96aa                	add	a3,a3,a0
    if (*p1 != *p2) {
 4e8:	00054783          	lbu	a5,0(a0)
 4ec:	0005c703          	lbu	a4,0(a1)
 4f0:	00e79863          	bne	a5,a4,500 <memcmp+0x2c>
      return *p1 - *p2;
    }
    p1++;
 4f4:	0505                	addi	a0,a0,1
    p2++;
 4f6:	0585                	addi	a1,a1,1
  while (n-- > 0) {
 4f8:	fed518e3          	bne	a0,a3,4e8 <memcmp+0x14>
  }
  return 0;
 4fc:	4501                	li	a0,0
 4fe:	a019                	j	504 <memcmp+0x30>
      return *p1 - *p2;
 500:	40e7853b          	subw	a0,a5,a4
}
 504:	6422                	ld	s0,8(sp)
 506:	0141                	addi	sp,sp,16
 508:	8082                	ret
  return 0;
 50a:	4501                	li	a0,0
 50c:	bfe5                	j	504 <memcmp+0x30>

000000000000050e <memcpy>:

void *
memcpy(void *dst, const void *src, uint n)
{
 50e:	1141                	addi	sp,sp,-16
 510:	e406                	sd	ra,8(sp)
 512:	e022                	sd	s0,0(sp)
 514:	0800                	addi	s0,sp,16
  return memmove(dst, src, n);
 516:	00000097          	auipc	ra,0x0
 51a:	f66080e7          	jalr	-154(ra) # 47c <memmove>
}
 51e:	60a2                	ld	ra,8(sp)
 520:	6402                	ld	s0,0(sp)
 522:	0141                	addi	sp,sp,16
 524:	8082                	ret

0000000000000526 <fork>:
# generated by usys.pl - do not edit
#include "kernel/syscall.h"
.global fork
fork:
 li a7, SYS_fork
 526:	4885                	li	a7,1
 ecall
 528:	00000073          	ecall
 ret
 52c:	8082                	ret

000000000000052e <exit>:
.global exit
exit:
 li a7, SYS_exit
 52e:	4889                	li	a7,2
 ecall
 530:	00000073          	ecall
 ret
 534:	8082                	ret

0000000000000536 <wait>:
.global wait
wait:
 li a7, SYS_wait
 536:	488d                	li	a7,3
 ecall
 538:	00000073          	ecall
 ret
 53c:	8082                	ret

000000000000053e <pipe>:
.global pipe
pipe:
 li a7, SYS_pipe
 53e:	4891                	li	a7,4
 ecall
 540:	00000073          	ecall
 ret
 544:	8082                	ret

0000000000000546 <read>:
.global read
read:
 li a7, SYS_read
 546:	4895                	li	a7,5
 ecall
 548:	00000073          	ecall
 ret
 54c:	8082                	ret

000000000000054e <write>:
.global write
write:
 li a7, SYS_write
 54e:	48c1                	li	a7,16
 ecall
 550:	00000073          	ecall
 ret
 554:	8082                	ret

0000000000000556 <close>:
.global close
close:
 li a7, SYS_close
 556:	48d5                	li	a7,21
 ecall
 558:	00000073          	ecall
 ret
 55c:	8082                	ret

000000000000055e <kill>:
.global kill
kill:
 li a7, SYS_kill
 55e:	4899                	li	a7,6
 ecall
 560:	00000073          	ecall
 ret
 564:	8082                	ret

0000000000000566 <exec>:
.global exec
exec:
 li a7, SYS_exec
 566:	489d                	li	a7,7
 ecall
 568:	00000073          	ecall
 ret
 56c:	8082                	ret

000000000000056e <open>:
.global open
open:
 li a7, SYS_open
 56e:	48bd                	li	a7,15
 ecall
 570:	00000073          	ecall
 ret
 574:	8082                	ret

0000000000000576 <mknod>:
.global mknod
mknod:
 li a7, SYS_mknod
 576:	48c5                	li	a7,17
 ecall
 578:	00000073          	ecall
 ret
 57c:	8082                	ret

000000000000057e <unlink>:
.global unlink
unlink:
 li a7, SYS_unlink
 57e:	48c9                	li	a7,18
 ecall
 580:	00000073          	ecall
 ret
 584:	8082                	ret

0000000000000586 <fstat>:
.global fstat
fstat:
 li a7, SYS_fstat
 586:	48a1                	li	a7,8
 ecall
 588:	00000073          	ecall
 ret
 58c:	8082                	ret

000000000000058e <link>:
.global link
link:
 li a7, SYS_link
 58e:	48cd                	li	a7,19
 ecall
 590:	00000073          	ecall
 ret
 594:	8082                	ret

0000000000000596 <mkdir>:
.global mkdir
mkdir:
 li a7, SYS_mkdir
 596:	48d1                	li	a7,20
 ecall
 598:	00000073          	ecall
 ret
 59c:	8082                	ret

000000000000059e <chdir>:
.global chdir
chdir:
 li a7, SYS_chdir
 59e:	48a5                	li	a7,9
 ecall
 5a0:	00000073          	ecall
 ret
 5a4:	8082                	ret

00000000000005a6 <dup>:
.global dup
dup:
 li a7, SYS_dup
 5a6:	48a9                	li	a7,10
 ecall
 5a8:	00000073          	ecall
 ret
 5ac:	8082                	ret

00000000000005ae <getpid>:
.global getpid
getpid:
 li a7, SYS_getpid
 5ae:	48ad                	li	a7,11
 ecall
 5b0:	00000073          	ecall
 ret
 5b4:	8082                	ret

00000000000005b6 <sbrk>:
.global sbrk
sbrk:
 li a7, SYS_sbrk
 5b6:	48b1                	li	a7,12
 ecall
 5b8:	00000073          	ecall
 ret
 5bc:	8082                	ret

00000000000005be <sleep>:
.global sleep
sleep:
 li a7, SYS_sleep
 5be:	48b5                	li	a7,13
 ecall
 5c0:	00000073          	ecall
 ret
 5c4:	8082                	ret

00000000000005c6 <uptime>:
.global uptime
uptime:
 li a7, SYS_uptime
 5c6:	48b9                	li	a7,14
 ecall
 5c8:	00000073          	ecall
 ret
 5cc:	8082                	ret

00000000000005ce <putc>:

static char digits[] = "0123456789ABCDEF";

static void
putc(int fd, char c)
{
 5ce:	1101                	addi	sp,sp,-32
 5d0:	ec06                	sd	ra,24(sp)
 5d2:	e822                	sd	s0,16(sp)
 5d4:	1000                	addi	s0,sp,32
 5d6:	feb407a3          	sb	a1,-17(s0)
  write(fd, &c, 1);
 5da:	4605                	li	a2,1
 5dc:	fef40593          	addi	a1,s0,-17
 5e0:	00000097          	auipc	ra,0x0
 5e4:	f6e080e7          	jalr	-146(ra) # 54e <write>
}
 5e8:	60e2                	ld	ra,24(sp)
 5ea:	6442                	ld	s0,16(sp)
 5ec:	6105                	addi	sp,sp,32
 5ee:	8082                	ret

00000000000005f0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5f0:	7139                	addi	sp,sp,-64
 5f2:	fc06                	sd	ra,56(sp)
 5f4:	f822                	sd	s0,48(sp)
 5f6:	f426                	sd	s1,40(sp)
 5f8:	f04a                	sd	s2,32(sp)
 5fa:	ec4e                	sd	s3,24(sp)
 5fc:	0080                	addi	s0,sp,64
 5fe:	84aa                	mv	s1,a0
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 600:	c299                	beqz	a3,606 <printint+0x16>
 602:	0805c863          	bltz	a1,692 <printint+0xa2>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 606:	2581                	sext.w	a1,a1
  neg = 0;
 608:	4881                	li	a7,0
 60a:	fc040693          	addi	a3,s0,-64
  }

  i = 0;
 60e:	4701                	li	a4,0
  do{
    buf[i++] = digits[x % base];
 610:	2601                	sext.w	a2,a2
 612:	00001517          	auipc	a0,0x1
 616:	8fe50513          	addi	a0,a0,-1794 # f10 <digits>
 61a:	883a                	mv	a6,a4
 61c:	2705                	addiw	a4,a4,1
 61e:	02c5f7bb          	remuw	a5,a1,a2
 622:	1782                	slli	a5,a5,0x20
 624:	9381                	srli	a5,a5,0x20
 626:	97aa                	add	a5,a5,a0
 628:	0007c783          	lbu	a5,0(a5)
 62c:	00f68023          	sb	a5,0(a3)
  }while((x /= base) != 0);
 630:	0005879b          	sext.w	a5,a1
 634:	02c5d5bb          	divuw	a1,a1,a2
 638:	0685                	addi	a3,a3,1
 63a:	fec7f0e3          	bgeu	a5,a2,61a <printint+0x2a>
  if(neg)
 63e:	00088b63          	beqz	a7,654 <printint+0x64>
    buf[i++] = '-';
 642:	fd040793          	addi	a5,s0,-48
 646:	973e                	add	a4,a4,a5
 648:	02d00793          	li	a5,45
 64c:	fef70823          	sb	a5,-16(a4)
 650:	0028071b          	addiw	a4,a6,2

  while(--i >= 0)
 654:	02e05863          	blez	a4,684 <printint+0x94>
 658:	fc040793          	addi	a5,s0,-64
 65c:	00e78933          	add	s2,a5,a4
 660:	fff78993          	addi	s3,a5,-1
 664:	99ba                	add	s3,s3,a4
 666:	377d                	addiw	a4,a4,-1
 668:	1702                	slli	a4,a4,0x20
 66a:	9301                	srli	a4,a4,0x20
 66c:	40e989b3          	sub	s3,s3,a4
    putc(fd, buf[i]);
 670:	fff94583          	lbu	a1,-1(s2)
 674:	8526                	mv	a0,s1
 676:	00000097          	auipc	ra,0x0
 67a:	f58080e7          	jalr	-168(ra) # 5ce <putc>
  while(--i >= 0)
 67e:	197d                	addi	s2,s2,-1
 680:	ff3918e3          	bne	s2,s3,670 <printint+0x80>
}
 684:	70e2                	ld	ra,56(sp)
 686:	7442                	ld	s0,48(sp)
 688:	74a2                	ld	s1,40(sp)
 68a:	7902                	ld	s2,32(sp)
 68c:	69e2                	ld	s3,24(sp)
 68e:	6121                	addi	sp,sp,64
 690:	8082                	ret
    x = -xx;
 692:	40b005bb          	negw	a1,a1
    neg = 1;
 696:	4885                	li	a7,1
    x = -xx;
 698:	bf8d                	j	60a <printint+0x1a>

000000000000069a <vprintf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
vprintf(int fd, const char *fmt, va_list ap)
{
 69a:	7119                	addi	sp,sp,-128
 69c:	fc86                	sd	ra,120(sp)
 69e:	f8a2                	sd	s0,112(sp)
 6a0:	f4a6                	sd	s1,104(sp)
 6a2:	f0ca                	sd	s2,96(sp)
 6a4:	ecce                	sd	s3,88(sp)
 6a6:	e8d2                	sd	s4,80(sp)
 6a8:	e4d6                	sd	s5,72(sp)
 6aa:	e0da                	sd	s6,64(sp)
 6ac:	fc5e                	sd	s7,56(sp)
 6ae:	f862                	sd	s8,48(sp)
 6b0:	f466                	sd	s9,40(sp)
 6b2:	f06a                	sd	s10,32(sp)
 6b4:	ec6e                	sd	s11,24(sp)
 6b6:	0100                	addi	s0,sp,128
  char *s;
  int c, i, state;

  state = 0;
  for(i = 0; fmt[i]; i++){
 6b8:	0005c903          	lbu	s2,0(a1)
 6bc:	18090f63          	beqz	s2,85a <vprintf+0x1c0>
 6c0:	8aaa                	mv	s5,a0
 6c2:	8b32                	mv	s6,a2
 6c4:	00158493          	addi	s1,a1,1
  state = 0;
 6c8:	4981                	li	s3,0
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 6ca:	02500a13          	li	s4,37
      if(c == 'd'){
 6ce:	06400c13          	li	s8,100
        printint(fd, va_arg(ap, int), 10, 1);
      } else if(c == 'l') {
 6d2:	06c00c93          	li	s9,108
        printint(fd, va_arg(ap, uint64), 10, 0);
      } else if(c == 'x') {
 6d6:	07800d13          	li	s10,120
        printint(fd, va_arg(ap, int), 16, 0);
      } else if(c == 'p') {
 6da:	07000d93          	li	s11,112
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 6de:	00001b97          	auipc	s7,0x1
 6e2:	832b8b93          	addi	s7,s7,-1998 # f10 <digits>
 6e6:	a839                	j	704 <vprintf+0x6a>
        putc(fd, c);
 6e8:	85ca                	mv	a1,s2
 6ea:	8556                	mv	a0,s5
 6ec:	00000097          	auipc	ra,0x0
 6f0:	ee2080e7          	jalr	-286(ra) # 5ce <putc>
 6f4:	a019                	j	6fa <vprintf+0x60>
    } else if(state == '%'){
 6f6:	01498f63          	beq	s3,s4,714 <vprintf+0x7a>
  for(i = 0; fmt[i]; i++){
 6fa:	0485                	addi	s1,s1,1
 6fc:	fff4c903          	lbu	s2,-1(s1)
 700:	14090d63          	beqz	s2,85a <vprintf+0x1c0>
    c = fmt[i] & 0xff;
 704:	0009079b          	sext.w	a5,s2
    if(state == 0){
 708:	fe0997e3          	bnez	s3,6f6 <vprintf+0x5c>
      if(c == '%'){
 70c:	fd479ee3          	bne	a5,s4,6e8 <vprintf+0x4e>
        state = '%';
 710:	89be                	mv	s3,a5
 712:	b7e5                	j	6fa <vprintf+0x60>
      if(c == 'd'){
 714:	05878063          	beq	a5,s8,754 <vprintf+0xba>
      } else if(c == 'l') {
 718:	05978c63          	beq	a5,s9,770 <vprintf+0xd6>
      } else if(c == 'x') {
 71c:	07a78863          	beq	a5,s10,78c <vprintf+0xf2>
      } else if(c == 'p') {
 720:	09b78463          	beq	a5,s11,7a8 <vprintf+0x10e>
        printptr(fd, va_arg(ap, uint64));
      } else if(c == 's'){
 724:	07300713          	li	a4,115
 728:	0ce78663          	beq	a5,a4,7f4 <vprintf+0x15a>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 72c:	06300713          	li	a4,99
 730:	0ee78e63          	beq	a5,a4,82c <vprintf+0x192>
        putc(fd, va_arg(ap, uint));
      } else if(c == '%'){
 734:	11478863          	beq	a5,s4,844 <vprintf+0x1aa>
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 738:	85d2                	mv	a1,s4
 73a:	8556                	mv	a0,s5
 73c:	00000097          	auipc	ra,0x0
 740:	e92080e7          	jalr	-366(ra) # 5ce <putc>
        putc(fd, c);
 744:	85ca                	mv	a1,s2
 746:	8556                	mv	a0,s5
 748:	00000097          	auipc	ra,0x0
 74c:	e86080e7          	jalr	-378(ra) # 5ce <putc>
      }
      state = 0;
 750:	4981                	li	s3,0
 752:	b765                	j	6fa <vprintf+0x60>
        printint(fd, va_arg(ap, int), 10, 1);
 754:	008b0913          	addi	s2,s6,8
 758:	4685                	li	a3,1
 75a:	4629                	li	a2,10
 75c:	000b2583          	lw	a1,0(s6)
 760:	8556                	mv	a0,s5
 762:	00000097          	auipc	ra,0x0
 766:	e8e080e7          	jalr	-370(ra) # 5f0 <printint>
 76a:	8b4a                	mv	s6,s2
      state = 0;
 76c:	4981                	li	s3,0
 76e:	b771                	j	6fa <vprintf+0x60>
        printint(fd, va_arg(ap, uint64), 10, 0);
 770:	008b0913          	addi	s2,s6,8
 774:	4681                	li	a3,0
 776:	4629                	li	a2,10
 778:	000b2583          	lw	a1,0(s6)
 77c:	8556                	mv	a0,s5
 77e:	00000097          	auipc	ra,0x0
 782:	e72080e7          	jalr	-398(ra) # 5f0 <printint>
 786:	8b4a                	mv	s6,s2
      state = 0;
 788:	4981                	li	s3,0
 78a:	bf85                	j	6fa <vprintf+0x60>
        printint(fd, va_arg(ap, int), 16, 0);
 78c:	008b0913          	addi	s2,s6,8
 790:	4681                	li	a3,0
 792:	4641                	li	a2,16
 794:	000b2583          	lw	a1,0(s6)
 798:	8556                	mv	a0,s5
 79a:	00000097          	auipc	ra,0x0
 79e:	e56080e7          	jalr	-426(ra) # 5f0 <printint>
 7a2:	8b4a                	mv	s6,s2
      state = 0;
 7a4:	4981                	li	s3,0
 7a6:	bf91                	j	6fa <vprintf+0x60>
        printptr(fd, va_arg(ap, uint64));
 7a8:	008b0793          	addi	a5,s6,8
 7ac:	f8f43423          	sd	a5,-120(s0)
 7b0:	000b3983          	ld	s3,0(s6)
  putc(fd, '0');
 7b4:	03000593          	li	a1,48
 7b8:	8556                	mv	a0,s5
 7ba:	00000097          	auipc	ra,0x0
 7be:	e14080e7          	jalr	-492(ra) # 5ce <putc>
  putc(fd, 'x');
 7c2:	85ea                	mv	a1,s10
 7c4:	8556                	mv	a0,s5
 7c6:	00000097          	auipc	ra,0x0
 7ca:	e08080e7          	jalr	-504(ra) # 5ce <putc>
 7ce:	4941                	li	s2,16
    putc(fd, digits[x >> (sizeof(uint64) * 8 - 4)]);
 7d0:	03c9d793          	srli	a5,s3,0x3c
 7d4:	97de                	add	a5,a5,s7
 7d6:	0007c583          	lbu	a1,0(a5)
 7da:	8556                	mv	a0,s5
 7dc:	00000097          	auipc	ra,0x0
 7e0:	df2080e7          	jalr	-526(ra) # 5ce <putc>
  for (i = 0; i < (sizeof(uint64) * 2); i++, x <<= 4)
 7e4:	0992                	slli	s3,s3,0x4
 7e6:	397d                	addiw	s2,s2,-1
 7e8:	fe0914e3          	bnez	s2,7d0 <vprintf+0x136>
        printptr(fd, va_arg(ap, uint64));
 7ec:	f8843b03          	ld	s6,-120(s0)
      state = 0;
 7f0:	4981                	li	s3,0
 7f2:	b721                	j	6fa <vprintf+0x60>
        s = va_arg(ap, char*);
 7f4:	008b0993          	addi	s3,s6,8
 7f8:	000b3903          	ld	s2,0(s6)
        if(s == 0)
 7fc:	02090163          	beqz	s2,81e <vprintf+0x184>
        while(*s != 0){
 800:	00094583          	lbu	a1,0(s2)
 804:	c9a1                	beqz	a1,854 <vprintf+0x1ba>
          putc(fd, *s);
 806:	8556                	mv	a0,s5
 808:	00000097          	auipc	ra,0x0
 80c:	dc6080e7          	jalr	-570(ra) # 5ce <putc>
          s++;
 810:	0905                	addi	s2,s2,1
        while(*s != 0){
 812:	00094583          	lbu	a1,0(s2)
 816:	f9e5                	bnez	a1,806 <vprintf+0x16c>
        s = va_arg(ap, char*);
 818:	8b4e                	mv	s6,s3
      state = 0;
 81a:	4981                	li	s3,0
 81c:	bdf9                	j	6fa <vprintf+0x60>
          s = "(null)";
 81e:	00000917          	auipc	s2,0x0
 822:	6ea90913          	addi	s2,s2,1770 # f08 <thread_start_threading+0x80>
        while(*s != 0){
 826:	02800593          	li	a1,40
 82a:	bff1                	j	806 <vprintf+0x16c>
        putc(fd, va_arg(ap, uint));
 82c:	008b0913          	addi	s2,s6,8
 830:	000b4583          	lbu	a1,0(s6)
 834:	8556                	mv	a0,s5
 836:	00000097          	auipc	ra,0x0
 83a:	d98080e7          	jalr	-616(ra) # 5ce <putc>
 83e:	8b4a                	mv	s6,s2
      state = 0;
 840:	4981                	li	s3,0
 842:	bd65                	j	6fa <vprintf+0x60>
        putc(fd, c);
 844:	85d2                	mv	a1,s4
 846:	8556                	mv	a0,s5
 848:	00000097          	auipc	ra,0x0
 84c:	d86080e7          	jalr	-634(ra) # 5ce <putc>
      state = 0;
 850:	4981                	li	s3,0
 852:	b565                	j	6fa <vprintf+0x60>
        s = va_arg(ap, char*);
 854:	8b4e                	mv	s6,s3
      state = 0;
 856:	4981                	li	s3,0
 858:	b54d                	j	6fa <vprintf+0x60>
    }
  }
}
 85a:	70e6                	ld	ra,120(sp)
 85c:	7446                	ld	s0,112(sp)
 85e:	74a6                	ld	s1,104(sp)
 860:	7906                	ld	s2,96(sp)
 862:	69e6                	ld	s3,88(sp)
 864:	6a46                	ld	s4,80(sp)
 866:	6aa6                	ld	s5,72(sp)
 868:	6b06                	ld	s6,64(sp)
 86a:	7be2                	ld	s7,56(sp)
 86c:	7c42                	ld	s8,48(sp)
 86e:	7ca2                	ld	s9,40(sp)
 870:	7d02                	ld	s10,32(sp)
 872:	6de2                	ld	s11,24(sp)
 874:	6109                	addi	sp,sp,128
 876:	8082                	ret

0000000000000878 <fprintf>:

void
fprintf(int fd, const char *fmt, ...)
{
 878:	715d                	addi	sp,sp,-80
 87a:	ec06                	sd	ra,24(sp)
 87c:	e822                	sd	s0,16(sp)
 87e:	1000                	addi	s0,sp,32
 880:	e010                	sd	a2,0(s0)
 882:	e414                	sd	a3,8(s0)
 884:	e818                	sd	a4,16(s0)
 886:	ec1c                	sd	a5,24(s0)
 888:	03043023          	sd	a6,32(s0)
 88c:	03143423          	sd	a7,40(s0)
  va_list ap;

  va_start(ap, fmt);
 890:	fe843423          	sd	s0,-24(s0)
  vprintf(fd, fmt, ap);
 894:	8622                	mv	a2,s0
 896:	00000097          	auipc	ra,0x0
 89a:	e04080e7          	jalr	-508(ra) # 69a <vprintf>
}
 89e:	60e2                	ld	ra,24(sp)
 8a0:	6442                	ld	s0,16(sp)
 8a2:	6161                	addi	sp,sp,80
 8a4:	8082                	ret

00000000000008a6 <printf>:

void
printf(const char *fmt, ...)
{
 8a6:	711d                	addi	sp,sp,-96
 8a8:	ec06                	sd	ra,24(sp)
 8aa:	e822                	sd	s0,16(sp)
 8ac:	1000                	addi	s0,sp,32
 8ae:	e40c                	sd	a1,8(s0)
 8b0:	e810                	sd	a2,16(s0)
 8b2:	ec14                	sd	a3,24(s0)
 8b4:	f018                	sd	a4,32(s0)
 8b6:	f41c                	sd	a5,40(s0)
 8b8:	03043823          	sd	a6,48(s0)
 8bc:	03143c23          	sd	a7,56(s0)
  va_list ap;

  va_start(ap, fmt);
 8c0:	00840613          	addi	a2,s0,8
 8c4:	fec43423          	sd	a2,-24(s0)
  vprintf(1, fmt, ap);
 8c8:	85aa                	mv	a1,a0
 8ca:	4505                	li	a0,1
 8cc:	00000097          	auipc	ra,0x0
 8d0:	dce080e7          	jalr	-562(ra) # 69a <vprintf>
}
 8d4:	60e2                	ld	ra,24(sp)
 8d6:	6442                	ld	s0,16(sp)
 8d8:	6125                	addi	sp,sp,96
 8da:	8082                	ret

00000000000008dc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8dc:	1141                	addi	sp,sp,-16
 8de:	e422                	sd	s0,8(sp)
 8e0:	0800                	addi	s0,sp,16
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8e2:	ff050693          	addi	a3,a0,-16
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e6:	00000797          	auipc	a5,0x0
 8ea:	6427b783          	ld	a5,1602(a5) # f28 <freep>
 8ee:	a805                	j	91e <free+0x42>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 8f0:	4618                	lw	a4,8(a2)
 8f2:	9db9                	addw	a1,a1,a4
 8f4:	feb52c23          	sw	a1,-8(a0)
    bp->s.ptr = p->s.ptr->s.ptr;
 8f8:	6398                	ld	a4,0(a5)
 8fa:	6318                	ld	a4,0(a4)
 8fc:	fee53823          	sd	a4,-16(a0)
 900:	a091                	j	944 <free+0x68>
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 902:	ff852703          	lw	a4,-8(a0)
 906:	9e39                	addw	a2,a2,a4
 908:	c790                	sw	a2,8(a5)
    p->s.ptr = bp->s.ptr;
 90a:	ff053703          	ld	a4,-16(a0)
 90e:	e398                	sd	a4,0(a5)
 910:	a099                	j	956 <free+0x7a>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 912:	6398                	ld	a4,0(a5)
 914:	00e7e463          	bltu	a5,a4,91c <free+0x40>
 918:	00e6ea63          	bltu	a3,a4,92c <free+0x50>
{
 91c:	87ba                	mv	a5,a4
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91e:	fed7fae3          	bgeu	a5,a3,912 <free+0x36>
 922:	6398                	ld	a4,0(a5)
 924:	00e6e463          	bltu	a3,a4,92c <free+0x50>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 928:	fee7eae3          	bltu	a5,a4,91c <free+0x40>
  if(bp + bp->s.size == p->s.ptr){
 92c:	ff852583          	lw	a1,-8(a0)
 930:	6390                	ld	a2,0(a5)
 932:	02059713          	slli	a4,a1,0x20
 936:	9301                	srli	a4,a4,0x20
 938:	0712                	slli	a4,a4,0x4
 93a:	9736                	add	a4,a4,a3
 93c:	fae60ae3          	beq	a2,a4,8f0 <free+0x14>
    bp->s.ptr = p->s.ptr;
 940:	fec53823          	sd	a2,-16(a0)
  if(p + p->s.size == bp){
 944:	4790                	lw	a2,8(a5)
 946:	02061713          	slli	a4,a2,0x20
 94a:	9301                	srli	a4,a4,0x20
 94c:	0712                	slli	a4,a4,0x4
 94e:	973e                	add	a4,a4,a5
 950:	fae689e3          	beq	a3,a4,902 <free+0x26>
  } else
    p->s.ptr = bp;
 954:	e394                	sd	a3,0(a5)
  freep = p;
 956:	00000717          	auipc	a4,0x0
 95a:	5cf73923          	sd	a5,1490(a4) # f28 <freep>
}
 95e:	6422                	ld	s0,8(sp)
 960:	0141                	addi	sp,sp,16
 962:	8082                	ret

0000000000000964 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 964:	7139                	addi	sp,sp,-64
 966:	fc06                	sd	ra,56(sp)
 968:	f822                	sd	s0,48(sp)
 96a:	f426                	sd	s1,40(sp)
 96c:	f04a                	sd	s2,32(sp)
 96e:	ec4e                	sd	s3,24(sp)
 970:	e852                	sd	s4,16(sp)
 972:	e456                	sd	s5,8(sp)
 974:	e05a                	sd	s6,0(sp)
 976:	0080                	addi	s0,sp,64
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 978:	02051493          	slli	s1,a0,0x20
 97c:	9081                	srli	s1,s1,0x20
 97e:	04bd                	addi	s1,s1,15
 980:	8091                	srli	s1,s1,0x4
 982:	0014899b          	addiw	s3,s1,1
 986:	0485                	addi	s1,s1,1
  if((prevp = freep) == 0){
 988:	00000517          	auipc	a0,0x0
 98c:	5a053503          	ld	a0,1440(a0) # f28 <freep>
 990:	c515                	beqz	a0,9bc <malloc+0x58>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 992:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 994:	4798                	lw	a4,8(a5)
 996:	02977f63          	bgeu	a4,s1,9d4 <malloc+0x70>
 99a:	8a4e                	mv	s4,s3
 99c:	0009871b          	sext.w	a4,s3
 9a0:	6685                	lui	a3,0x1
 9a2:	00d77363          	bgeu	a4,a3,9a8 <malloc+0x44>
 9a6:	6a05                	lui	s4,0x1
 9a8:	000a0b1b          	sext.w	s6,s4
  p = sbrk(nu * sizeof(Header));
 9ac:	004a1a1b          	slliw	s4,s4,0x4
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 9b0:	00000917          	auipc	s2,0x0
 9b4:	57890913          	addi	s2,s2,1400 # f28 <freep>
  if(p == (char*)-1)
 9b8:	5afd                	li	s5,-1
 9ba:	a88d                	j	a2c <malloc+0xc8>
    base.s.ptr = freep = prevp = &base;
 9bc:	00000797          	auipc	a5,0x0
 9c0:	58478793          	addi	a5,a5,1412 # f40 <base>
 9c4:	00000717          	auipc	a4,0x0
 9c8:	56f73223          	sd	a5,1380(a4) # f28 <freep>
 9cc:	e39c                	sd	a5,0(a5)
    base.s.size = 0;
 9ce:	0007a423          	sw	zero,8(a5)
    if(p->s.size >= nunits){
 9d2:	b7e1                	j	99a <malloc+0x36>
      if(p->s.size == nunits)
 9d4:	02e48b63          	beq	s1,a4,a0a <malloc+0xa6>
        p->s.size -= nunits;
 9d8:	4137073b          	subw	a4,a4,s3
 9dc:	c798                	sw	a4,8(a5)
        p += p->s.size;
 9de:	1702                	slli	a4,a4,0x20
 9e0:	9301                	srli	a4,a4,0x20
 9e2:	0712                	slli	a4,a4,0x4
 9e4:	97ba                	add	a5,a5,a4
        p->s.size = nunits;
 9e6:	0137a423          	sw	s3,8(a5)
      freep = prevp;
 9ea:	00000717          	auipc	a4,0x0
 9ee:	52a73f23          	sd	a0,1342(a4) # f28 <freep>
      return (void*)(p + 1);
 9f2:	01078513          	addi	a0,a5,16
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 9f6:	70e2                	ld	ra,56(sp)
 9f8:	7442                	ld	s0,48(sp)
 9fa:	74a2                	ld	s1,40(sp)
 9fc:	7902                	ld	s2,32(sp)
 9fe:	69e2                	ld	s3,24(sp)
 a00:	6a42                	ld	s4,16(sp)
 a02:	6aa2                	ld	s5,8(sp)
 a04:	6b02                	ld	s6,0(sp)
 a06:	6121                	addi	sp,sp,64
 a08:	8082                	ret
        prevp->s.ptr = p->s.ptr;
 a0a:	6398                	ld	a4,0(a5)
 a0c:	e118                	sd	a4,0(a0)
 a0e:	bff1                	j	9ea <malloc+0x86>
  hp->s.size = nu;
 a10:	01652423          	sw	s6,8(a0)
  free((void*)(hp + 1));
 a14:	0541                	addi	a0,a0,16
 a16:	00000097          	auipc	ra,0x0
 a1a:	ec6080e7          	jalr	-314(ra) # 8dc <free>
  return freep;
 a1e:	00093503          	ld	a0,0(s2)
      if((p = morecore(nunits)) == 0)
 a22:	d971                	beqz	a0,9f6 <malloc+0x92>
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a24:	611c                	ld	a5,0(a0)
    if(p->s.size >= nunits){
 a26:	4798                	lw	a4,8(a5)
 a28:	fa9776e3          	bgeu	a4,s1,9d4 <malloc+0x70>
    if(p == freep)
 a2c:	00093703          	ld	a4,0(s2)
 a30:	853e                	mv	a0,a5
 a32:	fef719e3          	bne	a4,a5,a24 <malloc+0xc0>
  p = sbrk(nu * sizeof(Header));
 a36:	8552                	mv	a0,s4
 a38:	00000097          	auipc	ra,0x0
 a3c:	b7e080e7          	jalr	-1154(ra) # 5b6 <sbrk>
  if(p == (char*)-1)
 a40:	fd5518e3          	bne	a0,s5,a10 <malloc+0xac>
        return 0;
 a44:	4501                	li	a0,0
 a46:	bf45                	j	9f6 <malloc+0x92>

0000000000000a48 <setjmp>:
 a48:	e100                	sd	s0,0(a0)
 a4a:	e504                	sd	s1,8(a0)
 a4c:	01253823          	sd	s2,16(a0)
 a50:	01353c23          	sd	s3,24(a0)
 a54:	03453023          	sd	s4,32(a0)
 a58:	03553423          	sd	s5,40(a0)
 a5c:	03653823          	sd	s6,48(a0)
 a60:	03753c23          	sd	s7,56(a0)
 a64:	05853023          	sd	s8,64(a0)
 a68:	05953423          	sd	s9,72(a0)
 a6c:	05a53823          	sd	s10,80(a0)
 a70:	05b53c23          	sd	s11,88(a0)
 a74:	06153023          	sd	ra,96(a0)
 a78:	06253423          	sd	sp,104(a0)
 a7c:	4501                	li	a0,0
 a7e:	8082                	ret

0000000000000a80 <longjmp>:
 a80:	6100                	ld	s0,0(a0)
 a82:	6504                	ld	s1,8(a0)
 a84:	01053903          	ld	s2,16(a0)
 a88:	01853983          	ld	s3,24(a0)
 a8c:	02053a03          	ld	s4,32(a0)
 a90:	02853a83          	ld	s5,40(a0)
 a94:	03053b03          	ld	s6,48(a0)
 a98:	03853b83          	ld	s7,56(a0)
 a9c:	04053c03          	ld	s8,64(a0)
 aa0:	04853c83          	ld	s9,72(a0)
 aa4:	05053d03          	ld	s10,80(a0)
 aa8:	05853d83          	ld	s11,88(a0)
 aac:	06053083          	ld	ra,96(a0)
 ab0:	06853103          	ld	sp,104(a0)
 ab4:	c199                	beqz	a1,aba <longjmp_1>
 ab6:	852e                	mv	a0,a1
 ab8:	8082                	ret

0000000000000aba <longjmp_1>:
 aba:	4505                	li	a0,1
 abc:	8082                	ret

0000000000000abe <preorder_find_next>:
static int id = 1;
static jmp_buf env_st;
static jmp_buf env_tmp;
// TODO: necessary declares, if any
// Algorithm ref: https://www.geeksforgeeks.org/preorder-successor-node-binary-tree/
struct thread* preorder_find_next(struct thread* root, struct thread* current){
 abe:	1141                	addi	sp,sp,-16
 ac0:	e422                	sd	s0,8(sp)
 ac2:	0800                	addi	s0,sp,16
    if (current->left){
 ac4:	6dc8                	ld	a0,152(a1)
 ac6:	c501                	beqz	a0,ace <preorder_find_next+0x10>
    }
    if (parent==NULL){
        return NULL;
    }
    return parent->right;
}
 ac8:	6422                	ld	s0,8(sp)
 aca:	0141                	addi	sp,sp,16
 acc:	8082                	ret
    if (current->right){
 ace:	71c8                	ld	a0,160(a1)
 ad0:	fd65                	bnez	a0,ac8 <preorder_find_next+0xa>
    struct thread *curr = current, *parent = current->parent;
 ad2:	75dc                	ld	a5,168(a1)
        return NULL;
 ad4:	853e                	mv	a0,a5
    while(parent!=NULL && parent->right==curr){
 ad6:	dbed                	beqz	a5,ac8 <preorder_find_next+0xa>
 ad8:	73c8                	ld	a0,160(a5)
 ada:	feb517e3          	bne	a0,a1,ac8 <preorder_find_next+0xa>
        curr = curr->parent;
 ade:	75cc                	ld	a1,168(a1)
        parent = parent->parent;
 ae0:	77dc                	ld	a5,168(a5)
    while(parent!=NULL && parent->right==curr){
 ae2:	fbfd                	bnez	a5,ad8 <preorder_find_next+0x1a>
        return NULL;
 ae4:	853e                	mv	a0,a5
 ae6:	b7cd                	j	ac8 <preorder_find_next+0xa>

0000000000000ae8 <preorder_search_last_node>:

// ref: pass pointer and recursive change value: https://stackoverflow.com/questions/46469803/pointer-change-its-address-after-exiting-a-recursive-function
void preorder_search_last_node(struct thread *current_traverse, struct thread **last_thread) {
    if (current_traverse){
 ae8:	c91d                	beqz	a0,b1e <preorder_search_last_node+0x36>
void preorder_search_last_node(struct thread *current_traverse, struct thread **last_thread) {
 aea:	1101                	addi	sp,sp,-32
 aec:	ec06                	sd	ra,24(sp)
 aee:	e822                	sd	s0,16(sp)
 af0:	e426                	sd	s1,8(sp)
 af2:	e04a                	sd	s2,0(sp)
 af4:	1000                	addi	s0,sp,32
 af6:	84aa                	mv	s1,a0
 af8:	892e                	mv	s2,a1
        *last_thread = current_traverse;
 afa:	e188                	sd	a0,0(a1)
        preorder_search_last_node(current_traverse->left, last_thread);
 afc:	6d48                	ld	a0,152(a0)
 afe:	00000097          	auipc	ra,0x0
 b02:	fea080e7          	jalr	-22(ra) # ae8 <preorder_search_last_node>
        preorder_search_last_node(current_traverse->right, last_thread);
 b06:	85ca                	mv	a1,s2
 b08:	70c8                	ld	a0,160(s1)
 b0a:	00000097          	auipc	ra,0x0
 b0e:	fde080e7          	jalr	-34(ra) # ae8 <preorder_search_last_node>
    };
};
 b12:	60e2                	ld	ra,24(sp)
 b14:	6442                	ld	s0,16(sp)
 b16:	64a2                	ld	s1,8(sp)
 b18:	6902                	ld	s2,0(sp)
 b1a:	6105                	addi	sp,sp,32
 b1c:	8082                	ret
 b1e:	8082                	ret

0000000000000b20 <thread_create>:


struct thread *thread_create(void (*f)(void *), void *arg){
 b20:	7179                	addi	sp,sp,-48
 b22:	f406                	sd	ra,40(sp)
 b24:	f022                	sd	s0,32(sp)
 b26:	ec26                	sd	s1,24(sp)
 b28:	e84a                	sd	s2,16(sp)
 b2a:	e44e                	sd	s3,8(sp)
 b2c:	1800                	addi	s0,sp,48
 b2e:	89aa                	mv	s3,a0
 b30:	892e                	mv	s2,a1
    struct thread *t = (struct thread*) malloc(sizeof(struct thread));
 b32:	0b000513          	li	a0,176
 b36:	00000097          	auipc	ra,0x0
 b3a:	e2e080e7          	jalr	-466(ra) # 964 <malloc>
 b3e:	84aa                	mv	s1,a0
    //unsigned long stack_p = 0;
    unsigned long new_stack_p;
    unsigned long new_stack;
    new_stack = (unsigned long) malloc(sizeof(unsigned long)*0x100);
 b40:	6505                	lui	a0,0x1
 b42:	80050513          	addi	a0,a0,-2048 # 800 <vprintf+0x166>
 b46:	00000097          	auipc	ra,0x0
 b4a:	e1e080e7          	jalr	-482(ra) # 964 <malloc>
    new_stack_p = new_stack +0x100*8-0x2*8;
    t->fp = f;
 b4e:	0134b023          	sd	s3,0(s1)
    t->arg = arg;
 b52:	0124b423          	sd	s2,8(s1)
    t->ID  = id;
 b56:	00000717          	auipc	a4,0x0
 b5a:	3ce70713          	addi	a4,a4,974 # f24 <id>
 b5e:	431c                	lw	a5,0(a4)
 b60:	08f4a823          	sw	a5,144(s1)
    t->buf_set = 0;
 b64:	0804aa23          	sw	zero,148(s1)
    t->stack = (void*) new_stack;
 b68:	e888                	sd	a0,16(s1)
    new_stack_p = new_stack +0x100*8-0x2*8;
 b6a:	7f050513          	addi	a0,a0,2032
    t->stack_p = (void*) new_stack_p;
 b6e:	ec88                	sd	a0,24(s1)
    id++;
 b70:	2785                	addiw	a5,a5,1
 b72:	c31c                	sw	a5,0(a4)
    return t;
}
 b74:	8526                	mv	a0,s1
 b76:	70a2                	ld	ra,40(sp)
 b78:	7402                	ld	s0,32(sp)
 b7a:	64e2                	ld	s1,24(sp)
 b7c:	6942                	ld	s2,16(sp)
 b7e:	69a2                	ld	s3,8(sp)
 b80:	6145                	addi	sp,sp,48
 b82:	8082                	ret

0000000000000b84 <thread_add_runqueue>:
void thread_add_runqueue(struct thread *t){
 b84:	1101                	addi	sp,sp,-32
 b86:	ec06                	sd	ra,24(sp)
 b88:	e822                	sd	s0,16(sp)
 b8a:	e426                	sd	s1,8(sp)
 b8c:	1000                	addi	s0,sp,32
 b8e:	84aa                	mv	s1,a0
    if(current_thread == NULL){
 b90:	00000797          	auipc	a5,0x0
 b94:	3a87b783          	ld	a5,936(a5) # f38 <current_thread>
 b98:	c385                	beqz	a5,bb8 <thread_add_runqueue+0x34>
        root_thread = t;
        current_thread = t;
    }
    else{
        // TODO
        if (!current_thread->left){
 b9a:	6fd8                	ld	a4,152(a5)
 b9c:	cb1d                	beqz	a4,bd2 <thread_add_runqueue+0x4e>
            current_thread->left = t;
            t->parent = current_thread;
        } else if (!current_thread->right){
 b9e:	73d8                	ld	a4,160(a5)
 ba0:	cf05                	beqz	a4,bd8 <thread_add_runqueue+0x54>
            current_thread->right = t;
            t->parent = current_thread;
        }
        // else, discard t by free thread and stack frame
        else {
            free(t->stack);
 ba2:	6908                	ld	a0,16(a0)
 ba4:	00000097          	auipc	ra,0x0
 ba8:	d38080e7          	jalr	-712(ra) # 8dc <free>
            free(t);
 bac:	8526                	mv	a0,s1
 bae:	00000097          	auipc	ra,0x0
 bb2:	d2e080e7          	jalr	-722(ra) # 8dc <free>
        }
    }
}
 bb6:	a809                	j	bc8 <thread_add_runqueue+0x44>
        root_thread = t;
 bb8:	00000797          	auipc	a5,0x0
 bbc:	36a7bc23          	sd	a0,888(a5) # f30 <root_thread>
        current_thread = t;
 bc0:	00000797          	auipc	a5,0x0
 bc4:	36a7bc23          	sd	a0,888(a5) # f38 <current_thread>
}
 bc8:	60e2                	ld	ra,24(sp)
 bca:	6442                	ld	s0,16(sp)
 bcc:	64a2                	ld	s1,8(sp)
 bce:	6105                	addi	sp,sp,32
 bd0:	8082                	ret
            current_thread->left = t;
 bd2:	efc8                	sd	a0,152(a5)
            t->parent = current_thread;
 bd4:	f55c                	sd	a5,168(a0)
 bd6:	bfcd                	j	bc8 <thread_add_runqueue+0x44>
            current_thread->right = t;
 bd8:	f3c8                	sd	a0,160(a5)
            t->parent = current_thread;
 bda:	f55c                	sd	a5,168(a0)
 bdc:	b7f5                	j	bc8 <thread_add_runqueue+0x44>

0000000000000bde <dispatch>:
        current_thread->buf_set = 1;
        schedule(); // update current thread
        dispatch(); // execute
    }
}
void dispatch(void){
 bde:	1141                	addi	sp,sp,-16
 be0:	e406                	sd	ra,8(sp)
 be2:	e022                	sd	s0,0(sp)
 be4:	0800                	addi	s0,sp,16
    // TODO
    // if never run before
    if (current_thread->buf_set == 0){
 be6:	00000517          	auipc	a0,0x0
 bea:	35253503          	ld	a0,850(a0) # f38 <current_thread>
 bee:	09452783          	lw	a5,148(a0)
 bf2:	e3b1                	bnez	a5,c36 <dispatch+0x58>
        // initialize the stack
        int jmpVal = setjmp(env_tmp);
 bf4:	00000517          	auipc	a0,0x0
 bf8:	35c50513          	addi	a0,a0,860 # f50 <env_tmp>
 bfc:	00000097          	auipc	ra,0x0
 c00:	e4c080e7          	jalr	-436(ra) # a48 <setjmp>
        if (jmpVal==0){
 c04:	c909                	beqz	a0,c16 <dispatch+0x38>
            env_tmp->sp = (unsigned long)current_thread->stack_p;
            longjmp(env_tmp, 1);
        } else {
            // run the thread's function
            current_thread->fp(current_thread->arg);
 c06:	00000797          	auipc	a5,0x0
 c0a:	3327b783          	ld	a5,818(a5) # f38 <current_thread>
 c0e:	6398                	ld	a4,0(a5)
 c10:	6788                	ld	a0,8(a5)
 c12:	9702                	jalr	a4
 c14:	a805                	j	c44 <dispatch+0x66>
            env_tmp->sp = (unsigned long)current_thread->stack_p;
 c16:	00000517          	auipc	a0,0x0
 c1a:	33a50513          	addi	a0,a0,826 # f50 <env_tmp>
 c1e:	00000797          	auipc	a5,0x0
 c22:	31a7b783          	ld	a5,794(a5) # f38 <current_thread>
 c26:	6f9c                	ld	a5,24(a5)
 c28:	f53c                	sd	a5,104(a0)
            longjmp(env_tmp, 1);
 c2a:	4585                	li	a1,1
 c2c:	00000097          	auipc	ra,0x0
 c30:	e54080e7          	jalr	-428(ra) # a80 <longjmp>
 c34:	a801                	j	c44 <dispatch+0x66>
            //thread_exit();
        }
    } 
    // else, resume by longjmp with value 1
    else{
        longjmp(current_thread->env,1);
 c36:	4585                	li	a1,1
 c38:	02050513          	addi	a0,a0,32
 c3c:	00000097          	auipc	ra,0x0
 c40:	e44080e7          	jalr	-444(ra) # a80 <longjmp>
    }
}
 c44:	60a2                	ld	ra,8(sp)
 c46:	6402                	ld	s0,0(sp)
 c48:	0141                	addi	sp,sp,16
 c4a:	8082                	ret

0000000000000c4c <schedule>:
void schedule(void){ // determine the next thread to run (preorder), change current_thread
 c4c:	1101                	addi	sp,sp,-32
 c4e:	ec06                	sd	ra,24(sp)
 c50:	e822                	sd	s0,16(sp)
 c52:	e426                	sd	s1,8(sp)
 c54:	1000                	addi	s0,sp,32
    // TODO
    struct thread *next_thread = preorder_find_next(root_thread, current_thread);
 c56:	00000497          	auipc	s1,0x0
 c5a:	2da4b483          	ld	s1,730(s1) # f30 <root_thread>
 c5e:	00000597          	auipc	a1,0x0
 c62:	2da5b583          	ld	a1,730(a1) # f38 <current_thread>
 c66:	8526                	mv	a0,s1
 c68:	00000097          	auipc	ra,0x0
 c6c:	e56080e7          	jalr	-426(ra) # abe <preorder_find_next>
    if (next_thread==NULL){
 c70:	c911                	beqz	a0,c84 <schedule+0x38>
        next_thread = root_thread;
    }
    //printf("next id: %d\n", next_thread->ID);
    current_thread = next_thread;
 c72:	00000797          	auipc	a5,0x0
 c76:	2ca7b323          	sd	a0,710(a5) # f38 <current_thread>
}
 c7a:	60e2                	ld	ra,24(sp)
 c7c:	6442                	ld	s0,16(sp)
 c7e:	64a2                	ld	s1,8(sp)
 c80:	6105                	addi	sp,sp,32
 c82:	8082                	ret
        next_thread = root_thread;
 c84:	8526                	mv	a0,s1
 c86:	b7f5                	j	c72 <schedule+0x26>

0000000000000c88 <thread_yield>:
void thread_yield(void){
 c88:	1141                	addi	sp,sp,-16
 c8a:	e406                	sd	ra,8(sp)
 c8c:	e022                	sd	s0,0(sp)
 c8e:	0800                	addi	s0,sp,16
    int jmpVal = setjmp(current_thread->env); // save current thread context
 c90:	00000517          	auipc	a0,0x0
 c94:	2a853503          	ld	a0,680(a0) # f38 <current_thread>
 c98:	02050513          	addi	a0,a0,32
 c9c:	00000097          	auipc	ra,0x0
 ca0:	dac080e7          	jalr	-596(ra) # a48 <setjmp>
    if (jmpVal ==0){
 ca4:	c509                	beqz	a0,cae <thread_yield+0x26>
}
 ca6:	60a2                	ld	ra,8(sp)
 ca8:	6402                	ld	s0,0(sp)
 caa:	0141                	addi	sp,sp,16
 cac:	8082                	ret
        current_thread->buf_set = 1;
 cae:	00000797          	auipc	a5,0x0
 cb2:	28a7b783          	ld	a5,650(a5) # f38 <current_thread>
 cb6:	4705                	li	a4,1
 cb8:	08e7aa23          	sw	a4,148(a5)
        schedule(); // update current thread
 cbc:	00000097          	auipc	ra,0x0
 cc0:	f90080e7          	jalr	-112(ra) # c4c <schedule>
        dispatch(); // execute
 cc4:	00000097          	auipc	ra,0x0
 cc8:	f1a080e7          	jalr	-230(ra) # bde <dispatch>
}
 ccc:	bfe9                	j	ca6 <thread_yield+0x1e>

0000000000000cce <thread_exit>:
void thread_exit(void){
 cce:	7179                	addi	sp,sp,-48
 cd0:	f406                	sd	ra,40(sp)
 cd2:	f022                	sd	s0,32(sp)
 cd4:	ec26                	sd	s1,24(sp)
 cd6:	e84a                	sd	s2,16(sp)
 cd8:	1800                	addi	s0,sp,48
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 cda:	00000497          	auipc	s1,0x0
 cde:	25e4b483          	ld	s1,606(s1) # f38 <current_thread>
 ce2:	00000917          	auipc	s2,0x0
 ce6:	24e93903          	ld	s2,590(s2) # f30 <root_thread>
 cea:	0d248e63          	beq	s1,s2,dc6 <thread_exit+0xf8>
        longjmp(env_st,1);
    }
    else{
        // TODO
        // if leaf case, simply remove
        if (current_thread->left == NULL && current_thread->right == NULL){
 cee:	6cdc                	ld	a5,152(s1)
 cf0:	e781                	bnez	a5,cf8 <thread_exit+0x2a>
 cf2:	70dc                	ld	a5,160(s1)
 cf4:	10078b63          	beqz	a5,e0a <thread_exit+0x13c>
            dispatch();
        }
        // else, find next thread by preorder searching
        else {
            struct thread *temp = current_thread;
            struct thread *last_thread = NULL;
 cf8:	fc043c23          	sd	zero,-40(s0)
            preorder_search_last_node(current_thread, &last_thread);
 cfc:	fd840593          	addi	a1,s0,-40
 d00:	8526                	mv	a0,s1
 d02:	00000097          	auipc	ra,0x0
 d06:	de6080e7          	jalr	-538(ra) # ae8 <preorder_search_last_node>
            // ----- migration node in tree ------
            // if current has parent
            if (current_thread->parent){
 d0a:	74dc                	ld	a5,168(s1)
 d0c:	c799                	beqz	a5,d1a <thread_exit+0x4c>
                // if it's left child
                if (current_thread == current_thread->parent->left){
 d0e:	6fd8                	ld	a4,152(a5)
 d10:	12e48d63          	beq	s1,a4,e4a <thread_exit+0x17c>
                    current_thread->parent->left=last_thread;
                } 
                // if it's right child
                else if (current_thread == current_thread->parent->right){
 d14:	73d8                	ld	a4,160(a5)
 d16:	12e48e63          	beq	s1,a4,e52 <thread_exit+0x184>
                    current_thread->parent->right=last_thread;
                }
            }
            // if current has right child but it's not last thread
            if (current_thread->right && current_thread->right->ID != last_thread->ID){
 d1a:	70dc                	ld	a5,160(s1)
 d1c:	cb91                	beqz	a5,d30 <thread_exit+0x62>
 d1e:	fd843703          	ld	a4,-40(s0)
 d22:	0907a603          	lw	a2,144(a5)
 d26:	09072683          	lw	a3,144(a4)
 d2a:	00d60363          	beq	a2,a3,d30 <thread_exit+0x62>
                current_thread->right->parent = last_thread;
 d2e:	f7d8                	sd	a4,168(a5)
            }
            // if current has left child but it's not last thread
            if (current_thread->left && current_thread->left->ID != last_thread->ID){
 d30:	6cdc                	ld	a5,152(s1)
 d32:	cb91                	beqz	a5,d46 <thread_exit+0x78>
 d34:	fd843703          	ld	a4,-40(s0)
 d38:	0907a603          	lw	a2,144(a5)
 d3c:	09072683          	lw	a3,144(a4)
 d40:	00d60363          	beq	a2,a3,d46 <thread_exit+0x78>
                current_thread->left->parent = last_thread;
 d44:	f7d8                	sd	a4,168(a5)
            }
            // update last_thread's parent, if parent!=current_thread
            if (last_thread->parent->left->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 d46:	fd843783          	ld	a5,-40(s0)
 d4a:	77d8                	ld	a4,168(a5)
 d4c:	6f54                	ld	a3,152(a4)
 d4e:	0906a603          	lw	a2,144(a3) # 1090 <__BSS_END__+0x60>
 d52:	0907a683          	lw	a3,144(a5)
 d56:	10d60263          	beq	a2,a3,e5a <thread_exit+0x18c>
                last_thread->parent->left=NULL;
            }
            if (last_thread->parent->right->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 d5a:	77d8                	ld	a4,168(a5)
 d5c:	7354                	ld	a3,160(a4)
 d5e:	0906a603          	lw	a2,144(a3)
 d62:	0907a683          	lw	a3,144(a5)
 d66:	10d60363          	beq	a2,a3,e6c <thread_exit+0x19e>
                last_thread->parent->right=NULL;
            }
            last_thread->parent = current_thread->parent;
 d6a:	74d8                	ld	a4,168(s1)
 d6c:	f7d8                	sd	a4,168(a5)
            // update last_thread's left child if it's not left child of current
            if (current_thread->left->ID != last_thread->ID){
 d6e:	6cd4                	ld	a3,152(s1)
 d70:	0907a703          	lw	a4,144(a5)
 d74:	0906a603          	lw	a2,144(a3)
 d78:	00e60363          	beq	a2,a4,d7e <thread_exit+0xb0>
                last_thread->left = current_thread->left;
 d7c:	efd4                	sd	a3,152(a5)
            }
            // update last_thread's right child if it's not right child of current
            if (current_thread->right->ID != last_thread->ID){
 d7e:	70d4                	ld	a3,160(s1)
 d80:	0906a603          	lw	a2,144(a3)
 d84:	00e60363          	beq	a2,a4,d8a <thread_exit+0xbc>
                last_thread->right = current_thread->right;
 d88:	f3d4                	sd	a3,160(a5)
            }
            // if current is root, update root
            if (root_thread->ID == current_thread->ID){
 d8a:	09092683          	lw	a3,144(s2)
 d8e:	0904a703          	lw	a4,144(s1)
 d92:	0ee68663          	beq	a3,a4,e7e <thread_exit+0x1b0>
                root_thread = last_thread;
            }
            // update next current_thread ??
            // current_thread = last_thread;
            schedule();
 d96:	00000097          	auipc	ra,0x0
 d9a:	eb6080e7          	jalr	-330(ra) # c4c <schedule>
            free(temp->stack);
 d9e:	6888                	ld	a0,16(s1)
 da0:	00000097          	auipc	ra,0x0
 da4:	b3c080e7          	jalr	-1220(ra) # 8dc <free>
            free(temp);
 da8:	8526                	mv	a0,s1
 daa:	00000097          	auipc	ra,0x0
 dae:	b32080e7          	jalr	-1230(ra) # 8dc <free>
            dispatch();
 db2:	00000097          	auipc	ra,0x0
 db6:	e2c080e7          	jalr	-468(ra) # bde <dispatch>
        }
    }
}
 dba:	70a2                	ld	ra,40(sp)
 dbc:	7402                	ld	s0,32(sp)
 dbe:	64e2                	ld	s1,24(sp)
 dc0:	6942                	ld	s2,16(sp)
 dc2:	6145                	addi	sp,sp,48
 dc4:	8082                	ret
    if(current_thread == root_thread && current_thread->left == NULL && current_thread->right == NULL){
 dc6:	6cdc                	ld	a5,152(s1)
 dc8:	fb85                	bnez	a5,cf8 <thread_exit+0x2a>
 dca:	70dc                	ld	a5,160(s1)
 dcc:	f795                	bnez	a5,cf8 <thread_exit+0x2a>
        free(current_thread->stack);
 dce:	6888                	ld	a0,16(s1)
 dd0:	00000097          	auipc	ra,0x0
 dd4:	b0c080e7          	jalr	-1268(ra) # 8dc <free>
        free(current_thread);
 dd8:	00000497          	auipc	s1,0x0
 ddc:	16048493          	addi	s1,s1,352 # f38 <current_thread>
 de0:	6088                	ld	a0,0(s1)
 de2:	00000097          	auipc	ra,0x0
 de6:	afa080e7          	jalr	-1286(ra) # 8dc <free>
        current_thread=NULL;
 dea:	0004b023          	sd	zero,0(s1)
        root_thread=NULL;
 dee:	00000797          	auipc	a5,0x0
 df2:	1407b123          	sd	zero,322(a5) # f30 <root_thread>
        longjmp(env_st,1);
 df6:	4585                	li	a1,1
 df8:	00000517          	auipc	a0,0x0
 dfc:	1c850513          	addi	a0,a0,456 # fc0 <env_st>
 e00:	00000097          	auipc	ra,0x0
 e04:	c80080e7          	jalr	-896(ra) # a80 <longjmp>
 e08:	bf4d                	j	dba <thread_exit+0xec>
            if (current_thread == current_thread->parent->left){
 e0a:	74dc                	ld	a5,168(s1)
 e0c:	6fd8                	ld	a4,152(a5)
 e0e:	02e48863          	beq	s1,a4,e3e <thread_exit+0x170>
            } else if (current_thread == current_thread->parent->right){
 e12:	73d8                	ld	a4,160(a5)
 e14:	02e48863          	beq	s1,a4,e44 <thread_exit+0x176>
            schedule();
 e18:	00000097          	auipc	ra,0x0
 e1c:	e34080e7          	jalr	-460(ra) # c4c <schedule>
            free(temp->stack);
 e20:	6888                	ld	a0,16(s1)
 e22:	00000097          	auipc	ra,0x0
 e26:	aba080e7          	jalr	-1350(ra) # 8dc <free>
            free(temp);
 e2a:	8526                	mv	a0,s1
 e2c:	00000097          	auipc	ra,0x0
 e30:	ab0080e7          	jalr	-1360(ra) # 8dc <free>
            dispatch();
 e34:	00000097          	auipc	ra,0x0
 e38:	daa080e7          	jalr	-598(ra) # bde <dispatch>
        if (current_thread->left == NULL && current_thread->right == NULL){
 e3c:	bfbd                	j	dba <thread_exit+0xec>
                current_thread->parent->left=NULL;
 e3e:	0807bc23          	sd	zero,152(a5)
 e42:	bfd9                	j	e18 <thread_exit+0x14a>
                current_thread->parent->right=NULL;
 e44:	0a07b023          	sd	zero,160(a5)
 e48:	bfc1                	j	e18 <thread_exit+0x14a>
                    current_thread->parent->left=last_thread;
 e4a:	fd843703          	ld	a4,-40(s0)
 e4e:	efd8                	sd	a4,152(a5)
 e50:	b5e9                	j	d1a <thread_exit+0x4c>
                    current_thread->parent->right=last_thread;
 e52:	fd843703          	ld	a4,-40(s0)
 e56:	f3d8                	sd	a4,160(a5)
 e58:	b5c9                	j	d1a <thread_exit+0x4c>
            if (last_thread->parent->left->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 e5a:	0904a603          	lw	a2,144(s1)
 e5e:	09072683          	lw	a3,144(a4)
 e62:	f0d604e3          	beq	a2,a3,d6a <thread_exit+0x9c>
                last_thread->parent->left=NULL;
 e66:	08073c23          	sd	zero,152(a4)
 e6a:	bdc5                	j	d5a <thread_exit+0x8c>
            if (last_thread->parent->right->ID == last_thread->ID && current_thread->ID !=last_thread->parent->ID){
 e6c:	0904a603          	lw	a2,144(s1)
 e70:	09072683          	lw	a3,144(a4)
 e74:	eed60be3          	beq	a2,a3,d6a <thread_exit+0x9c>
                last_thread->parent->right=NULL;
 e78:	0a073023          	sd	zero,160(a4)
 e7c:	b5fd                	j	d6a <thread_exit+0x9c>
                root_thread = last_thread;
 e7e:	00000717          	auipc	a4,0x0
 e82:	0af73923          	sd	a5,178(a4) # f30 <root_thread>
 e86:	bf01                	j	d96 <thread_exit+0xc8>

0000000000000e88 <thread_start_threading>:
void thread_start_threading(void){
 e88:	1141                	addi	sp,sp,-16
 e8a:	e406                	sd	ra,8(sp)
 e8c:	e022                	sd	s0,0(sp)
 e8e:	0800                	addi	s0,sp,16
    // TODO
    int jmpVal = setjmp(env_st);
 e90:	00000517          	auipc	a0,0x0
 e94:	13050513          	addi	a0,a0,304 # fc0 <env_st>
 e98:	00000097          	auipc	ra,0x0
 e9c:	bb0080e7          	jalr	-1104(ra) # a48 <setjmp>
    if (jmpVal==0) {
 ea0:	c509                	beqz	a0,eaa <thread_start_threading+0x22>
	    dispatch();
    }
 ea2:	60a2                	ld	ra,8(sp)
 ea4:	6402                	ld	s0,0(sp)
 ea6:	0141                	addi	sp,sp,16
 ea8:	8082                	ret
	    dispatch();
 eaa:	00000097          	auipc	ra,0x0
 eae:	d34080e7          	jalr	-716(ra) # bde <dispatch>
 eb2:	bfc5                	j	ea2 <thread_start_threading+0x1a>
