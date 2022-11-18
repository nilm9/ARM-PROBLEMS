//vars
#DEFINE posX1 = 0
#DEFINE posX2  =180

unsigned char  posY1, posY2
unsigned char posY1Ant=0, posY2Ant = 0 
unsinged char faseAnt=0, faseAct=0

char s_derecha[] = {1, 3, 0, 2};
char s_izquierda[] = {2, 0, 3, 1};


void main{

inicializaciones()
inicializar_timer0(300)

do{

tareas_independientes() 

//if movime
if(posY1Ant=!posY1){
    posY1Ant=posY1
    swiWaitForVBlank() 
    dibujar_raqueta( posX1, short posY1)
}

} while(1)

}


RSI:
consultar si hi ha moviment 16 bits específico que se encuentra en la posición 0x0A000000
if si crivar a 
if no final ctualittar var no vanvi
push{lr}

posY1

posY1Ant

ldr r0, =0x0A000000
ldrh r1, [r0]
ldr r3, =faseAnt
ldrb r4, [r3]
ldr r5, =faseAct
ldrb r6, [r5]
ldr r7, =posY1
ldrb r8, [r7]
mov r2, lsr #1
and r0, r2, #3
str r0, [r3]            @guardem nova pos actual
cmp r4, r6
beq .LNoCanvi
mov r0, r4
mov r1, r6
bl detectar_sentido
cmp r0, #0
addhi r8, #1
sublo r8, #1
strb r8, [r7]

.LNoCanvi:

mov r4, r6
strb r4, [r3]

pop{pc}


r0:faseAnt
r1:faseAct
detectar_sentido

push{lr}

ldr r3, =s_derecha
ldr r4, =s_izquierda
add r7, #2
ldr r5, [r3]
ldr r6, [r3, r7]
cmp r5, r0
moveq r8, #1
cmp r6, r1
moveq r9, #1
and r10, r8, r9
cmp r10, #1
moveq r0, #1
rsbne r0, 1


pop{pc}