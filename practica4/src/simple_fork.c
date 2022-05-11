#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int variable=5;

int main(){
	pid_t pid;
	pid_t pid_f;
	pid_t ret;
	int status;
	
	pid = getpid();
	printf("Son o proceso %u\n", pid);
	
	pid_f = fork();
	
	if(pid_f!=0){
		printf("Son o proceso pai %u, creei o fillo %u. Variable=%d con direccion %p\n", pid, pid_f,variable,&variable);
		variable= 10;
		printf("Son o proceso pai %u, cambio o valor de variable. Variable=%d con direccion %p\n", pid,variable,&variable);
	}else{
		sleep(3);
		pid=getpid();
		int exit_status=68;
		printf("Son o proceso fillo %u, creoume meu pai %u.Variable=%d con direccion %p\n", pid, getppid(),variable,&variable);
		variable = 55;
		printf("Son o proceso fillo %u, cambio variable=%d con direccion %p. Saindo con exit status %d\n", pid,variable,&variable, exit_status);
		exit(exit_status);
	}
	ret = wait(&status);
	printf("Son o proceso pai %u, o meu %u fillo acabou con saida %d. Variable=%d con direccion %p\n", pid, ret, WEXITSTATUS(status), variable,&variable);
	exit(0);
}
	