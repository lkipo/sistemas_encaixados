/*
 * NOTE:  Console input and output relies on Linux system calls, which can
 * interfere with the execution of the FreeRTOS Linux port. This demo only
 * uses Linux system call occasionally. Heavier use of Linux system calls
 * may crash the port.
 */

#include <stdio.h>
#include <pthread.h>

/* Kernel includes. */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "semphr.h"

/* Local includes. */
#include "console.h"

#define PRIORITY1    ( tskIDLE_PRIORITY + 2 )
#define PRIORITY2       ( tskIDLE_PRIORITY + 1 )

// ↓ funcion sobre a cal se van a crear as tarefas
static void vASimpleTask( void * pvParameters ){
/bin/bash: .wq: orden no encontrada
	int delay = *(int*) pvParameters; // recuperamos os parametros que pasamos á funcion
	const TickType_t xDelay = delay / portTICK_PERIOD_MS; // dividimos o retraso en ms que queremos pasar entre o periodo do reloxo en ms para ter un retraso en ciclos de reloxo
	for(;;)
	{
		console_print( "Tarefa %s con retraso %d\n",pcTaskGetName(NULL),delay );
		vTaskDelay(xDelay); // funcion para xestionar o retraso
	}
}

void main_blinky( void )
{
		int delay1 = 500;
		int delay2 = 1000;
		TaskHandle_t xHandle1 = NULL;
		TaskHandle_t xHandle2 = NULL;
		xTaskCreate( vASimpleTask,             
                     "S1",                            
                     configMINIMAL_STACK_SIZE, 
                     (void *) &delay1, 
                     PRIORITY1,
                     &xHandle1);  // funcion para crear tarefas. Os parametros son, por este orde, funcion sobre a que queremos crear a tarefa, nome da tarefa, tamaño da pila que debemos reservar, parámetros, prioridade e unha referencia que neste caso é NULL

        xTaskCreate( vASimpleTask, "S2", configMINIMAL_STACK_SIZE, (void *) &delay2, PRIORITY2, &xHandle2);

        vTaskStartScheduler(); // Aqui comeza o calendurizador

    for( ; ; ) // Bucle infinito para que queden as tarefas executandose ate que o usuario finalize o programa
    {
    }
}
