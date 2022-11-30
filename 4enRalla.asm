unsigned char matriz[8][8]; //valores de los LEDs, en cada posición:
// = 0 → vacía (apagado)
// = 1 → ficha jugador 1 (rojo)
// = 2 → ficha jugador 2 (verde)
unsigned char turno = 1; // número de jugador actual 
unsigned char fil = 1, col = 4; // fila y columna de la ficha que
// se está colocando
unsigned char fase = 0; // fase actual del programa: 
// = 0 → seleccionar columna
// = 1 → caída de ficha
// = 2 → comprobar ganador
// = 3 → final de partida 
unsigned char f_refresco = 0; // índice de fila que se tiene
// que refrescar en el display
void main()
{ int keys;
inicializaciones(); // la matriz estará toda a ceros, 
matriz[0][col-1] = turno; // excepto la posición de salida 
do
{ 
    swiWaitForVBlank(); // relajar bucle principal 
    switch (fase)
    { 
    case 0: // selección de columna 
    scanKeys();
    keys = keysDown();
    if ((keys & KEY_LEFT) && (col > 1))
        { 
        matriz[0][col-1] = 0; 
        col--; 
        matriz[0][col-1] = turno;
        } 
    if ((keys & KEY_RIGHT) && (col < 8))
        { 
        matriz[0][col-1] = 0; 
        col++;
        matriz[0][col-1] = turno;
        } 
    if ((keys & KEY_SELECT) && (matriz[1][col-1] == 0))
        { 
        printf(“Jug: %d\tCol: %d\n”, turno, col); 
        fase = 1;
        } 
    break;
    case 1: // esperar caída de ficha 
    break;
    case 2: if (comprobar_4(&matriz[1][0], 7, 8))
        { // detección de ganador 
        mostrar_ganador(turno);
        fase = 3; // programa finalizado
        } 
    else // cambio de turno
        { turno = 3 - turno;
        fil = 1; col = 4; // inicializaciones para 
        matriz[0][col-1] = turno; // la nueva selección 
        fase = 0;
        } 
    break;
    } 
} 
} while (1);
} 

freq ->  240Hz
acceder a una de las filas de la matriz y 
generar los 24 bits de información para el refresco de esa fila. Obviamente, este proceso se 
debe realizar periódicamente para todas las filas de la matriz.
RSItimer0:
push{r0-r8,lr}
@carregar variables
ldr r0, = f_refresco
ldrb r1, [r0]
ldr r2, =matriz
mov r3, #0 @index fila fins a 7
mov r5, #0xFF       @rojo
mov r6, #0xFF       @verd

.LBucleFila:
mov r4, #8          
mla r3, r4, r1, r3 @ NCOL*i +j
add r2, r3           @ base + NCOL*i +j
ldr r4, [r2]          
@mirem si esta activat i si ho esta 
@marquem la mascara corresponent

cmp r4, #1
bichi r6, r4
biceq r5, r4

add r3, #1 @incrementar index de bucle
cmp r3, #7 @si no ha arribat a la ultima reinicia bucle
moveq r3, #0
b .LBucleFila

mov r7, #1
mov r7, r7, lsl r1
orr r7, r5, lsl #8
orr r7, r6 lsl #16
ldr r8, =RegMLED
str r7, [r8]

add r1, #1  @incrementrm fila visitada
strb r1, [r0]

pop{r0-r8, pc}


RSItimer1:
push{r0-r8, lr}
@mirem si 
ldr r0, =fase
ldrb r1, [r0]
cmp r1, #1
bne .LnoCaida
ldr r2, =fil
ldrb r3, [r2]
ldr r4, =col
ldrb r5, [r4]
ldr r6, =matriz
cmp r3, #8      @si ja esta al final no pot caure
beq .LnoCaida
mov r7, #8
add r9, r3, #1
@ base + ncol*fil +col
mla r10, r7, r3, r5 @pos valor actual
mla r7, r7, r9, r5  @ pos val seguent

add r7, r6
add r10, r6
ldr r8, [r7]  @sota
ldr r11, [r10] @act

cmp r8, #0
bne .LnoCaida       @si no esta buida final

strb r11, [r7]
mov r11, #0
strb r11, [r10]

add r1, #1
strb r1, [r0] @pasa fsse 2
.LnoCaida:



pop{r0-r8, pc}