

@main
@
@

unsigned char matriz[8][8]; //valores de los LEDs, en cada posición:
// = 0 → vacía (apagado) 
// = 1 → ficha jugador 1 (rojo)
// = 2 → ficha jugador 2 (verde)
unsigned char turno = 1; // número de jugador actual 
unsigned char fil = 1, col = 4; // fila y columna de la ficha que
// se está colocando
unsigned char fase =0 
unsigned char hayGanador=0
unsigned char contFila=1
unsigned char countTimer0=0

void main{

inicializaciones()
int keys = 0
do {
scanKeys()
keys = keysDown()
//seleccionar columna
if(fase == 0){
    if((keys & KEY_RIGHT) & (col<8)) col++
    if(keys & KEY_LEFT & (col>0)) col--
    fase=1
}
// caída ficha
if(fase == 1){
     if((keys & KEY_RIGHT) & (matriz[fil][col]==0))
     swiWaitForVBlank()
     printf("Jug: %d \t col: %d \n", turno, col )

     fase = 2
}

// comprobar ganador 
if(fase==2){
    hayGanador =  comprobar_4(matriz,fil, col)
    if(hayGanador){
        printf("Ganador %d", turno)
        fase = 3
        hayGanador=0

    }
    turno = 3- turno
    fil = 1, col = 4; 
    fase =0 

    
}

//final partida
if(fase==3){
    do{
    } while(1)
}
} while(1)
} 




@RSItimer0 -> f240 Hz : Realizar el barrido periódico de la matriz
RSItimer0:
push{lr}
ldr r0, =countTimer0
ldrb r1, [r0]
ldr r2, =fase
ldrb r2, [r2]
cmp r2, #3
beq .LfiTimer0
cmp r1 , #7
movhs r1, #0

mov r3, #FF
mov r4, #FF
mov r5, #1
ldr r7, =matrix

mov r6, #1  @contador matrix
.LbucleFila:
mov r2, #0
cmp r6, #8
bhi .LfiBucle

mla r8, r6, r1, r7
ldrb r9, [r8]
cmp r9, #1
moveq r2, #1
moveq r2, r2, lsr r6
biceq r3, r2
cmp r9, #2
moveq r2, #1
moveq r2, r2, lsr r6
biceq r4, r2

add r6, #1
b .LbucleFila

.LfiBucle:
mov r6, #1
mov r6, r6, lsl r1
@tenimits baixos
mov r3, r3, lsr #8
orr r3, r6
mov r4, r4 , lsr #16
orr r4, r3

ldr r2, =RegMLED
str r4, [r2]

add r1, #1
strb r1, [r0]



.LfiTimer0:

pop{pc}




@RSItimer1 -> f 3Hz : Generar el efecto de caída de las fichas
@mostrar fich inin
RSItimer1:
    count
     while((matriz[count+1][col]==0) || count==8){
        matriz[count+1][col]=turno:
        matriz[count][col]=0:
        count++
     }

push{lr}

ldr r0, =fase
ldrh r0, [r0]
ldr r2, =turno
ldrh r2, [r2]
ldr r3, =matriz
ldr r4, =contFila
ldrb r5, [r4]
cmp  r0, #1
bne .LfiTimer1
cmp r5, #8
movhs r5, #1
strb r5, [r4]
bhs .LfiTimer1
mov r7, #8
add r6, r3
ldrb r1, [r6, r7]
cmp r1, #0
bne .LfiTimer
mov r1, #0
strb r1, [r6]
add r6, #8
mov r1, r2
strb r1, [r6]
strb r6, [r4]

.LfiTimer1:

pop{pc}