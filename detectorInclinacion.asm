
unsigned short inc_x=0
unsigned short inc_y=0
unsigned short inc_x_ant=0
unsigned short inc_y_ant=0
unsigned short calib[6];


main {

//ini
inicializaciones()

do{
tareas_independientes()

calibrar_inclinacion(&calib)
if((inc_x =!inc_x_ant) || (inc_y =! inc_y_ant){

    swiWaitForVBlank() 
    dibujar_inclinacion(inc_x, 
    inc_y)
    inc_x_ant=inc_x
    inc_y_ant=inc_y


}while(1)
    
}

freq = 10
RSI
push{r0-r3, lr}
ldr r7, =calib
bl iniciar_MK6
mov r0, #0x0
bl enviar_MK6
bl recibir_MK6
mov r1, r0 
mov r0, =inc_x
ldrh r2, [r7, #0]
ldrh r3, [r7, #6 ]
bl convertirr_aceleracion

mov r0, #0x02
bl enviar_MK6
bl recibir_MK6
mov r1, r0
strh r1, [r7, #2]
bl finalizar_MK6
pop{r0-r3, pc}

convertirr_aceleracion:
push{lr}
ldr r4, =inc_x
ldrh r5, [r4]
sub r1, r2
mla r0, r1, r3, r0

strh r0 , [r4]
pop{pc}