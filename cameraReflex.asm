main

unsigned char num_disp = 0; // número de disparos pendientes
unsigned char ind_p1 = 0; // índice del periodo p1
unsigned char ind_p2 = 0; // índice del periodo p2
unsigned char status = 0; // estado actual (0 → parado,
                            // 1 → half press,
                            // 2 → half+full press)
unsigned char actualizar_info = 0; // indica si hay que actualizar
// información en pantalla
unsigned short time;


-enviará un 1 por el bit 4 durante 350 milisegundos
-enviará un 1 por los bits 4 y 5 durante un determinado periodo de exposición especificado por el 
usuario (p2) (activar timer)

-usuario indicar al programa que realice un cierto número de fotos consecutivas, con otro determinado intervalo de tiempo entre foto y foto (p1
-incrementar num_disp amb KEY_aTART
-usuario podrá cambiar el valor del índice ind_p2 con los botones KEY_UP y 
-rango entre 1 y 512 segundos. El usuario podrá cambiar el valor del índice ind_p1 con los botones KEY_LEFT 
y KEY_RIGHT
-actualitzar stautu a 012  1 (half press), 2 (half+full press), 0 (reposo)
-cambios (main/rsi)-> acutalizar info=1 printar
void main
{
inicializaciones() 
int tecla
time=ind_p1

do{
tareas_independientes() 
scanKeys() 
tecla = keysDown()

if(tecla & KEY_START) num_disp++
if(tecla & KEY_UP) {
    if(ind_p2<10) ind_p2++
}

if(tecla & KEY_DOWN){
    if(ind_p2>=0) ind_p2--
}

if(tecla & KEY_LEFT) {
    if(ind_p2<10) ind_p1++
}

if(tecla & KEY_RIGHT){
    if(ind_p2>=0) ind_p1--
    
}
if(time==ind_p1){
    time=0
    activar_timers01(1/ind_p1));
    activar_timers02(1/ind_p2));
}

if(tecla)     actualizar_info =1
if(actualizar_info ){
    printf("Periodo 1: %d s\n", ind_p1);
    printf("Periodo 2: %d ms\n", ind_p2);
    printf(Disparos pendientes: %d, num_disp);
    actualizar_info =0
}


} while(1);
} 


gestionar la activación automática de disparos:
-generar un nuevo disparo si quedan disparos pendientes cada vez que pase el tiempo 
correspondiente al periodo p1.
-Si no quedan más disparos ->  desactivar los timers 0 y 1 para detener el proceso automático
RSI1

time = 0
sumar fins a ind_p1
quan time == ind_p2+350ms parar
push{lr}
ldr r0, =actualizar_info
ldrb r1, [r0]
tst r1, #1
beq .Lfinal
ldr r0, =num_disp
ldrb r1, [r0]
cmp r1, #0
beq .Lfinal
ldr r2, =time
add r3, #1
strh r3, [r2]
ldr r5, =ind_p2
ldrb r6, [r5]
ldr r4, #350
add r3, r4
cmp r3, r6
movhs r0, #3
blhs desactivar_timers

.Lfinal:
mov r0, #0
bl desactivar_timers
pop{pc}

controlar el estado de los bits de cada disparo,
-pasando de half press a half+full press después de 350 milisegundos desde el inicio de la activación
- half+full press a reposo después de los milisegundos correspondientes al periodo p2
-desactivando el timer 2 en esta segunda transición
RSI2

push{lr}


pop{pc}
