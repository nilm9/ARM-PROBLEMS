unsigned short tics =0
unsigned short freqVent =0
unsigned char wait=0

efectúa la gestión del biestable J-K para medir la 
velocidad actual (instantánea) del viento
main{
    inicializaciones() 
    inicializar_timer0_01(100)
    float vel=0
    int count=0

do
{
    tareas_independientes()
    @cada 3s
    if (tics >= 300)
    {
        tics=0
        vel = 55.88 * freqVent / 150.0;;
        
        swiWaitForVBlank() 
        printf("%d:\t %f ",++count, vel) 
        vel = 0;
        freqVent = 0;
    }

} while(1);

}


pin 5: leer el estado interno del J-K (salida Q), 
pin 4: realizar un reset del J-K 

conversio -> 1 Hz → 1,12 m/s

carregar i llegir 
-incrementar tics
-para detectar el '1' en el pin 5
y volver a poner el biestable a '0' con la señal de 
reset invertido, es decir, poniendo el pin 4 a '0'.
-el señal de reset se 
debe mantener a '0' durante 10 ms, y luego se debe volver a poner a '1
fq-> 100hz
RSItimer0


push{r0-r7,lr}
ldr r0, =tics
ldrh r1, [r0]
add r1, #1
strh r1, [r0]

@comprovar wait

mov r0, #0x0A000000
ldr r1, [r0]
ldr r2, =freqVent
ldrh r3, [r2]
mov r5, r1, lsr #5   @estat pin 5
@;and r5, #1
tst r5, #1
beq .Lfinal     @esta a zero no fem res
add r3, #1      @si esta a 1 infrementem freq vent

@resetejem
bic r1, #0x04
strb r1, [r0]
ldr r6, =wait
ldrb r7, [r6]
add r7, #1
cmp r7, #2
blo .Lfinal
mov r7, #0
orr r1, #0x04
strb r1, [r0]

.Lfinal:
strb r7, [r6]
pop{r0-r7,pc}




calcular el divisor de frecuencia asociado a la frecuencia de salida
requerida, utilizando la segunda frecuencia de entrada más alta disponible 
(523.656,96875 Hz)

datos y de control del timer 0 se definen simbólicamente como TIMER0_DATA y TIMER0_CR, respectivamente, y que en el registro de control hay que activar los bits 7 y 6 para iniciar el timer y generar interrupciones, 
mientras que en los bits 1 y 0 hay que indicar el código de la frecuencia de entrada requerida, que en nuestro caso será '01'

inicializar_timer0_01(unsigned int frec)
push{r0-r3,lr}
mov r1, r0
ldr r0, =523657
swi 9
rsb r0, r0, #0 @girem al signe com a la fomrula
ldr r1, =TIMER0_DATA
strh r0, [r1]
ldr r0, =TIMER0_CR 
@;ldrb r1, [r0]
@;bic r1, #0xFF
mov r3, #0b11000001
@;orr r1, r3
strb r3, [r0]
pop{r0-r3,pc}





