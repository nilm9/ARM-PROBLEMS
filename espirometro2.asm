



@ Llegir reg
@ 

RSItimer0

unsigned short flujo;
unsigned short tiempo;
unsigned short tics;

unsigned int px 
unsigned int py

main{
inicializaciones()
inicializar_timer0(2000)
int teclas = 0
do{

    scanKeys()
    teclas= keysDown()
do{
    swiWaitForVBlank()
} while(teclas & KEY_START);

swiWaitForVBlank()
dibujar_ejes() 
if( tics >= 100 ){
    tics = 0
    add_pixel( px,  py) 
    actualizar_grafico() 
}
if(tiempo == 10){
 
}

} while(1);


}

push{lr}

ldr r0, = tics
ldrh r1, [r0]
add r1, #1
strh r1, [r0]
ldr r0, 



pop{pc}