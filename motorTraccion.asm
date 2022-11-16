dubtes

ldsb Rd, [Md2] Rd = Ext24(Mem8[Md2])
vs subs










signed short vel
unsigned short avn
unsigned short frec
unsigned short pasos
unsigned char movAnt=0

obtener y ejecutar las consignas de movimiento del vehículo, generando los cambios de fase correspondientes. Cada consigna se 
obtendrá con una llamada a la rutina siguiente_movimiento()


void main {

inicializaciones()

do{

tareas_independientes()
if(movAnt=0)   @modificar desde la rsi
    movAnt=1
    siguiente_movimiento(&vel, &avn)
    signed short avnInicial
        do{
            if(pasos >= 243){

                pasos = 0  @sumar desde la rsi
                avnInicial++
                swiWaitForVBlank() 
                printf("v = %s", vel)
                if(vel>0) printf("f = %s", avn) 
                if(vel<0) printf("b = %s", avn)    
                else printf(" ")                   
                
                //printar i calcular v i x
                movAnt=0
            }
        } while(avn>avnInicial)
} while(1)
}








Accede a  bits b7-b4 de un registro de E/S de 32 bits, al cual se accederá 
a través de la dirección de memoria 0x0A000000.
-No modificar el registro
-actualitzarlos

genera cambis de fase
RSI:
push{lr}
ldr r0, =pasos
ldrb r1,[r0]    
add r1, #1
ldr r0, =0x0A000000
ldrb r1,[r0]    
mov r1, r1 lsr #4
and r1, #f
and r2, #8
and r3, #4
cmp r2, r3






pop{pc}




intr_main:
push{lr}
ldr r0, =REG_IF
ldrb r1,[r0]
tst r1, #1
bne activar_timer00




pop{pc}