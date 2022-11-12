notes:

Sistema 32leds, 256fraccions

RDISP_STATUS: (reg 16bits, fem servir el bit 0) activa a 1 quan el motor passa per l'angle 0
RDISP_STATUS:: (reg 32 bits ) determina el estat dels 32 leds


Main: 
tareasindep
recibir img
convertir img a circular
transferir continuamente el estado de los leds al display de rotacion
segun:
-color
-angulo
además de ajustar a cero el ángulo actual según el bit 0 del registro de estado del dispositivo


//Vars

unsigned char rect_img[64*64]; 
unsigned int circ_img[2][256*3];

main
{ 
inicializaciones(); 
do
{ swiWaitForVBlank(); 
tareas_independientes();
if (wifiReceiveImage(rect_img)) // si recepción nueva imagen
{ 
convertirImagen(rect_img, circ_img[1 - current_ci]); 
swiWaitForVBlank();
mostrarImagen(rect_img); 
current_ci = 1 – current_ci;
} 
} while (1); // repetir siempre
} 




@;transferir_radio: a partir de la dirección base de una imagen circular
@; y del número de radio (ángulo) que se pasan por parámetro, obtener el
@; estado de los bits de rojo, verde y azul para los 32 áxels, y
@; generar un patrón de 32 bits donde cada bit indicará si el LED
@; correspondiente debe estar encendido o apagado, según el estado del
@; botón SELECT:
@; soltado (=1): activar LED si el bit verde está a 1 y alguno de los
@; otros dos bits está a 1 (pero no los dos a la vez)
@; pulsado (=0): activar LED si algún bit de color está a 1,
@; La rutina envía los 32 bits resultantes por el registro de datos del
@; dispositivo.
@; Parámetros:
@; R0 = dirección base de la imagen circular
@; R1 = número de radio (ángulo : [0..255]) 
transferir_radio:
push {r0-r3, lr}

ldr r3, =SELECT
ldrb r4, [r3]
cmp r4, #0
beq .LAlgunActiu

and 
orr
.LAlgunActiu:
orr


pop {r0-r3, pc}