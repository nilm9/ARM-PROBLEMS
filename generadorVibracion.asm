unsigned short vibracion=0


void main{

inicializaciones()
inicializar_timer0(300)
int teclas=0
do{

scanKeys() 
teclas = keysDown()
if(teclas & KEY_X){
    vibracion=5
}
if(teclas & KEY_Y){
    vibracion=20
}
if(teclas & KEY_A){
    vibracion=50
}
if(vibracion){
    if (frec != 0)
{ 
generar_vibracion(frec); // activar vibración 
retardo(5); // esperar medio segundo 
generar_vibracion(0); // parar vibración 
swiWaitForVBlank();
printf(“Ultima frecuencia = %d\n”, frec);
} 
} while (1); 
return(0);
} 

-inicia la vibración a la frecuencia especificada por parámetro
-Si la frecuencia es cero, se parará la vibración.
cambiar a 1 el bit reg rubmle a la freq requerida
:r0= freq
generar_vibracion:
push{r0-r2, lr}

ldr r1, =REG_RUMBLE
cmp r0, #0
beq .LficarA0
mov r2, #1
str r2, [r1]

.LficarA0:
mov r2, #0  
str r2, [r1]


pop {r0-r2, pc}    



RSItimer0
push{r0-r2, lr}
ldr r2, =TIMER0_CR
ldr r3, [r2]
and r3, #3

ldr r4, =vibracion
ldrh r1, [r4]
mov r0, r1
mov r1, r3
swi 9
rsb r0, r0, #0
ldr r2, =TIMER0_DATA
strh r0, [r2]

pop {r0-r2, pc}    

8 1000
9 1001
A 1010
b 1011
c 1100
d 1101
e 1110
f 1111