#define _GNU_SOURCE //para que funcione gettid()
#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <unistd.h>
#include <sys/syscall.h>

//Isto non vos preocupedes moito del
#ifndef SYS_gettid
#error "SYS_gettid unavailable on this system"
#endif

#define gettid() ((pid_t)syscall(SYS_gettid))

void * ola(void *entrada);
int variable=5;

int main(){
	pid_t pid;
	int status;
	pthread_t fio1; //non o mesmo que o TID, identificador propio
	int res;
	
	pid = getpid(); // obtemos o identificador do programa principal
	printf("Son o proceso %u\n", pid); // imprimimolo
	
	res = pthread_create(&fio1, NULL, ola, "Ola mundo"); // creamos un fio, fio1, cos parametros por defecto (NULL), usando a funcion phtread_create e decimoslle que execute a funcion ola co parámetro "Ola mundo"
	if(res!=0){
		// en caso de que haxa algún fallo, e dicir, que res, a variable de saída da funcion pthread_create non sexa 0, saimos do programa principal con valor -1
		printf("Erro creando o fío\n");
		exit(-1);
	}
	printf("Son o proceso %u, creei o fio %lu. Variable=%d con direccion %p\n", pid, fio1,variable,&variable);
	variable= 10;
	printf("Son o proceso pai %u, cambio o valor de variable. Variable=%d con direccion %p\n", pid,variable,&variable); // mostramos o pid do proceso pai, o valor da variable e a súa direccion de memoria
	pthread_join(fio1,NULL); // esperamos a que o fio1 acabe e xuntamolo co programa principal 
	printf("Son o proceso pai %u, acabou o meu fío %lu. Variable=%d con direccion %p\n", pid,fio1,variable,&variable); // aqui podemos observar que o valor da variable é o mesmo que o valor despois do fío, pois son o mesmo programa
	exit(0);
}

void * ola(void *entrada){
	sleep(2); // como o fío se comeza a executar de maneira case pseudo-paralela colocamos unha espera de dous segundos para que se executen as operacions do fío despois que as do programa principal
    printf("Son o fío con pid %u e tid %u. Variable=%d con direccion %p, %s\n", getpid(), gettid(),variable,&variable,(char *)entrada);
    variable = 78; // cambiamos o valor da variable a 78, valor que será conservado no fio principal.
    printf("Son o fío con pid %u e tid %u. Cambio o valor de variable=%d con direccion %p\n", getpid(), gettid(), variable,&variable); // mostra o pid, tid, valor e dirección da variable. O valor da direccion de memoria da variable é o mesmo en todo o programa, pois son varios fíos dun mesmo proceso, é dicir, que comparten memoria que modifican todos os fios, a difrencia do exercicio anterior cando eran dous procesos distintos.
    pthread_exit(NULL);
}
