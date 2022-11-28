@243 pasos para avanzar o retroceder 1 cm
unsigned char Vphases[] = {0x80, 0xC0, 0x40, 0x60, 0x20, 0x30, 0x10, 0x90};
char vel =0
unsigned char avn=0
unsigned char avnPasos=0
unsigned char fase=0  // 1davant //2 endarre

void main{

inicializaciones()
intr_main()

do{
tareas_independientes() 

fijar_frecuencia(1000) 


if(avn==0){
    siguiente_movimiento(*vel, *avn)

    if(pasos==243){
        avnPasos++
        pasos=0

        if(avn==avnPasos ){
            swiWaitForVBlank() 
            printf("v = %dcm/s", vel) 
            if(vel>0) printf("f=%d ", avn) 
            if(vel<0) printf("b=%d ", avn) 
            avn=0
            avnAvançat=0
            vel=0

        }
    }
}

} while(1)

}




F-> 1000hz
RSItimer0
generar los cambios de fase, a la frecuencia necesaria para conseguir una velocidad del vehículo determinada.

mirar els cms avançats i estan comperts setejarlos a 0 i desactivar_timer0() i v tembe
push{lr}

ldr r0, =pasos
ldrb r1, [r0]
add r1, #1
strb r1, [r0]

ldr r0, =vel
ldsb r1, [r0]
ldr r2, =avn
ldrb r3, [r2]
ldr r4, =Vphases
ldrb r5, =fase
ldrb r6, [r5]
ldr r7, =0x0A000000
ldr r8, [r7]
@r8 tenim els bits a modificar mb orr desplaçat

push{r4-r7}
ldr r4, =pasos

pop{r4-r7}


cmp r1, #0
bgt .Lavançar
blt .Lretrocedir
beq .Lfinal

.Lavançar:
@comprovar que ja hagi arribat
cmp r6, #7
moveq r6, #0
ldr r10, [r4, r6]
orr r8, r10
str r8, [r7]
add r6, #1
b .Lfinal
.Lretrocedir:
cmp r6, #0
moveq r6, #7
ldr r10, [r4, r6]
orr r8, r10
str r8, [r7]
sub r6, #1

.Lfinal:
strb r6, [r5]
mov r9, #0
strb r9, [r2]

pop{pc}





detectar si se ha activado el bit IRQ_TIMER0 en el registro REG_IF 
en caso afirmativo, debe invocar la RSI del timer 0.

e notificar la resolución de cualquier IRQ que se haya producido sobre el propio registro REG_IF
asi como sobre la posición de memoria INTR_WAIT_FLAGS,


intr_main
push{r0-r5, lr}
ldr r0, =REG_IF 
ldrb r1,[r0]
ldr r2, =IRQ_TIMER0 @(es un valor)
and r2, r1
cmp r2, #1
push{r0}
moveq r0, #0
bleq activartimer
pop{r0}
ldr r3, =INTR_WAIT_FLAGS

tst r1, #FF
movne r4, #1
strbne r4, [r3]

pop{r0-r5, pc}