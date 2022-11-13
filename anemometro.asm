genera un contacto eléctrico entre sus dos terminales cada vez 
que el rotor, impulsado por el viento, da una vuelta completa

E/s: pin 4,5 32 pins 32 bits s'accedeix a partir de 0xa00
-Pin5: permite leer el estado interno del J-K (salida Q)
-pin4: el pin 4 permite realizar un reset del J-K (~RST, señal negada).

Freq max: 50hz, min 2ms

MAIN: 
-Valor de la velocidad se debe ir 
escribiendo por la pantalla inferior de la NDS, cada 3 segundos (aprox.)


#define FREQ 96875

unsigned char senyal=0
unsigned char wait=0
unsigned short tics=0
unsigned short contador=0
unsigned float vFinal=0

main
{

inicializaciones()
inicializar_timer0_01(FREQ)
do{

    tareas_independientes() 

    if(wait==3){
    wait=0
    swiWaitForVBlank() 
    contador++
    printf("%s: %f m/s",&contador, &vFinal) 

    }


} while(1)

}





FREQ 100HZ
canviar clock de 0 a 1  i guardarlo
primer detectat el 5 a 1 posarlo a 0 esperar 10ms ->bucle al main perque esperi amb index de contador
esperar 10ds i dividir entre els impulsos per obtenir v
incrementar wait fins a 3 3s
RSI: DETECTAR EL FLANCO A 1 I POSARLO A 0
push{lr}

ldr r0, =0x0A000000
ldr r1, [r0]
mov r2, r1 lsr #4
and r2, #1          @pin4
mov r3, r1 lsr #5
and r3, #1          @pin5
ldr r6, =tics
ldrh r7, [r6]

cmp r3, #1
moveq r3, #0
addeq r7, #1    @sumem un tic
@esperar
str r3, [r0]         
moveq r2, #0
str r2, [r0]      

mov r0, r7


ldr r4, =wait
ldrb r5, [r4]
@augmentar wait




pop{pc}


r0:freq
inicializar_timer0_01;
push {}
ldr r1, = TIMER0_CR
ldr r2, [r1]
mov r3, #3
mov r3, r3 lsl #5
orr r2, r3
orr r2, #0x01
str r2, [r1]

pop {}