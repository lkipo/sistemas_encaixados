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
	
	pid_f = fork(); // crea un proceso fillo identico ao pai, un duplicado, sendo o indicador do proceso fillo pid_f

	// ao crear un proceso paralelo o proceso pai, no cal pid_f non é igual a cero, entra no if
	if(pid_f!=0){
		printf("Son o proceso pai %u, creei o fillo %u. Variable=%d con direccion %p\n", pid, pid_f,variable,&variable);
		variable= 10;
		printf("Son o proceso pai %u, cambio o valor de variable. Variable=%d con direccion %p\n", pid,variable,&variable);
	// no else entra o proceso fillo, pois no proceso fillo pid_f si que é igual a cero por non terse executado ningún fork en el	
	}else{
		sleep(3);
		pid=getpid(); // obten o proceso actual, que será o proceso do fillo (pid do pai+1)
		int exit_status=68;
		printf("Son o proceso fillo %u, creoume meu pai %u.Variable=%d con direccion %p\n", pid, getppid(),variable,&variable);
		variable = 55; // cambiamos a variable no proceso fillo gardandoa na mesma dirección de memoria e mostramolo na liña seguinte 
		printf("Son o proceso fillo %u, cambio variable=%d con direccion %p. Saindo con exit status %d\n", pid,variable,&variable, exit_status);
		exit(exit_status); // saimos do programa con valor 68 (exit_status)
	}
	ret = wait(&status); // esperamos á saída do programa e gardamos o valor de saída do proceso ret (fillo) na variable status, a cal consultaremos coa macro WEXITSTATUS na seguinte liña. 
	printf("Son o proceso pai %u, o meu %u fillo acabou con saida %d. Variable=%d con direccion %p\n", pid, ret, WEXITSTATUS(status), variable,&variable); // vemos que a variable ten o valor 10, e dicir, que non se veu afectada polo proceso fillo e garda o valor que lle asignou o proceso pai
	exit(0);
}
	
