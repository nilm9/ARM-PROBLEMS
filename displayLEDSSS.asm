#DEFINE numVector 17

unsigned char vector[numVector] ={"C'est la vie \0"}
unsigned char num_col=0; fins a 6
unsigned char currentChar;
unsigned char volta = 0;
main{
    inicializaciones() 
do{
    tareas_independientes() 
    if(currentChar == "\0" & (volta>=12)){
        volta==0
        swiWaitForVBlank()
        for (int i=0; i<numVector; i++){

            printf("%d", numVector[i]) 
        }
    }

} while(1)

}

-sincronitzar volta
1.accederá al carácter actual a través de una variable global currentChar
2.gestionará la columna actual a visualizar mediante otra variable global num_col
3.llamar a la rutina obtener_puntos
4.enviar el estado de los puntos,
5.generar la señal de strobe, es decir, poner el bit 7 a '1' y, después de un cierto tiempo, poner el bit 
7 a '0', para indicar al display que debe introducir una nueva columna.

RSItimer0
push{lr}

@contador
ldr r0, =volta
ldrb r1, [r0]

@accedima l caracter actual
ldr r4, =currentChar
ldrb r3, [r4]
mov r5, #0
cmp r1, #12
addeq r5, #1
ldr r2, =vector
ldrb r3, [r2, r5]
ldr r6, =num_col
ldrh r7, [r6]
cmp r7, #5
movhs r7, #0

push{r0, r1}
mov r0, r3
mov r1, r7
bl obtener_puntos
mov r8, r0
pop{r0, r1}


add r7, #1
strb r7, [r6]
add r1, #1
strb r1, [r0]

pop{pc}


l retornará el estado de los puntos de una columna 
de un carácter, a partir del código ASCII del carácter y del número de columna 
actual que se pasarán por parámetro:

char obtener_puntos(char caracter, char num_columna);
push{lr}

ldr r0, =REG_DISP
ldrb r1,[r0]
and r1, #0xFF


pop{pc}