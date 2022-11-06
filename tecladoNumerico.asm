//VArs

unsigned short tempKey;
short currentKey=-1;

main
{

inicializaciones() 

do
{
    tareas_independientes()
    if (currentKey != -1){

        swiWaitForVBlank() 
        processKey(key)
    }


} while(1)


}

@ ___________________________________________

RSI Timer0;

push{lr}

ldr r0, =REG_TECL
ldrh r0, [r0]
mov r7, #0 @flag de escriptura lectura 0=escriptura
ldr r4, =currentKey
ldrh r5, [r4] 

@ bucle de files ultims  bits
mov r1, #4 @comencem a contar per la 4ta pos de fila
mov r6, #0 @Contador de keys
mov r7, #0 @Tempkey
.Lfiles:
cmp r1, #8
bhi .LfiFiles
mov r2, #0 @index de 0
.LColumna:
cmp r2, #4 @index de columna
bhi .LfiColumna
ldrb r3, [r0, r2] @contem columna
@mirem si hem de llegir o escriure
cmp r7, #0
bne .Read
mov r7, #1   @canviem a write

mov r3, #1   @sumem 1 a cada posicio


.Read: 
mov r7, #0   @canviem a write
cmp r3, #1 
beq .LfiRead
mov r7, r6   @ Actualitzem valor pitjat

.LfiRead:
add r6, #1 
add r2, #1
.LfiColumna:

add r1, #1
.LfiLfiFiles:

mov r5, r7
strh r5 , [r4]  @guardem currentKey
bl descodificar_tecla

pop{pc}