#include "kernel/types.h"
#include "kernel/fs.h"
#include "kernel/stat.h"
#include "user/user.h"
#include "kernel/fcntl.h"

// count num of nodes in a directory
int countChildren(char *path){
    int fd;
    int count = 0;
    struct dirent de;
    struct stat st;

    if((fd = open(path, O_RDONLY)) < 0)
        return 0;
    if(fstat(fd, &st) < 0)
        return 0;
    if(st.type != T_DIR)
        return 0;

    while(read(fd, &de, sizeof(de)) == sizeof(de)){
        count++;
    }
    close(fd);
    return count;
}

char*
fmtname(char *path)
{
  char *p;

  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
    ;
  p++;

  return p;
}

void
listDir(char *path, int level, int* fileCount, int* dirCount, int is_last){
    char buf[512], *p;
    int fd, i;
    // skip . and ..
    int skip = 2;
    struct dirent de;
    struct stat st;

    if((fd = open(path, 0)) < 0){
        printf("tree: cannot open %s\n", path);
        return;
    }

    if(fstat(fd, &st) < 0){
        printf("tree: cannot stat %s\n", path);
        close(fd);
        return;
    }

    switch(st.type){
        case T_FILE:
            (*fileCount)++;
            break;

        case T_DIR:
            if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
                printf("tree: path too long\n");
                break;
            }
            (*dirCount)++;
            strcpy(buf, path);
            p = buf+strlen(buf);
            *p++ = '/';
            
            int count = countChildren(path);
            int child_idx = 1;
            while(read(fd, &de, sizeof(de)) == sizeof(de)){
                if(de.inum == 0)
                    continue;
                memmove(p, de.name, DIRSIZ);
                // printf("name: %s\n", de.name);
                p[DIRSIZ] = 0;
                if(stat(buf, &st) < 0){
                    printf("tree: cannot stat %s\n", buf);
                    continue;
                }
                // not . or ..
                if (skip==0){
                    for (i = 0; i < level; i++)
                        if (is_last && i==level-2){
                            if (i!=0)
                                printf("    ");
                            else
                                printf(" ");
                        } else {
                            if (i!=0)
                                printf("   |");
                            else
                                printf("|");
                        }
                    printf("\n");
                    for (i = 0; i < level-1; i++)
                        if (is_last && i==level-2){
                            printf("    ");
                        } else {
                            printf("|   ");
                        }
                    printf("+-- ");
                    printf("%s\n", fmtname(buf));
                }
                // recursive if directory not . or ..
                if (skip){
                    skip--;
                }
                else {
                    listDir(buf, level+1, fileCount, dirCount, child_idx==count);
                }
                child_idx++;
            }
            break;
    }
    close(fd);
}

int main(int argc, char *argv[]) {
    int files_count;
    int dirs_count;
    int p[2];
    if (pipe(p) < 0)
        exit(1);

    int id = fork();
    if (id == 0){
        // child process
        // check argument is exist or not
        struct stat st;
        int fd = open(argv[1],O_RDONLY);
        if(fd<0){
            printf("%s [error opening dir]\n", argv[1]);
            exit(1);
        }
        // check is directory or not
        if(fstat(fd, &st) < 0){
            printf("ls: cannot stat %s\n", argv[1]);
            close(fd);
            exit(1);
        } else if(st.type != T_DIR){
            printf("%s [error opening dir]\n", argv[1]);
            close(fd);
            exit(1);
        }

        // print first line
        printf("%s\n", argv[1]);

        // dfs all files and print them
        // count the num of files & directories
        int num_files = 0;
        int num_dirs = -1;
        int level = 1;

        listDir(argv[1], level, &num_files, &num_dirs, 0);

        // send num_files and num_dirs to parent
        close(p[0]);
        write(p[1], &num_files, sizeof(num_files));
        write(p[1], &num_dirs, sizeof(num_dirs));
        close(p[1]);
    } else {
        // parent process
        wait(&id);
        // read only, so close write end
        close(p[1]);
        // read num_files and num_dirs from child
        read(p[0], &files_count, sizeof(files_count));
        read(p[0], &dirs_count, sizeof(dirs_count));
        printf("\n%d directories, %d files\n", dirs_count<0?0:dirs_count, files_count);
        // finsh reading, so close read end
        close(p[0]);
    }

    exit(0);
}