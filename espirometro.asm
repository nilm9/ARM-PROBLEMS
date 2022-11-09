@notes
-impulsoses detecta x bit 0 de 0x0A000180, carregar b i fer mascara rsi
-timer freq 2000hz
-200punts >= para
-contador de 100 per capturar cada pulsacio


main:esperar flag START,
variable global?
add_pixel
 actualizar_grafico

 coord x temps
 coord y puls


@main

//Vars

unsigned int teclaStart = 0;
unsigned int px, py;

short tiempo
short flujo

int main{

inicializaciones() 


do
{
scanKeys() 
teclaStart = keysDown()
if(teclaStart ==1){
    dibujar_ejes() ;
    if(cilce =>200){
    add_pixel(px, py) ;
    actualizar_grafico()
    }
}
} while (1);

return 0;
}

rsi
push{lr}

ldr 


pop{pc}



r0;tiempo
r1;flujo
convertir_punto
push{r2,lr}
add r0, #20
mov r2, #6
mul r1, r1, r2
rsb r1, #180



pop{r2, pc}