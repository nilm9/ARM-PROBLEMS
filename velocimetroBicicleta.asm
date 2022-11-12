

unsigned short Perimetro; // perímetro de la rueda (en cm) 
unsigned char Nrayos; // número de rayos de la rueda 
unsigned short Drayos; // número de rayos por segundo 
unsigned short Vinst; // velocidad instantánea (en cm/s) 
unsigned int Vmed; // velocidad media (en dam/hora)
unsigned int Tdist; // distancia total (en cm) 
unsigned int Ttiempo; // tiempo total (en semisegundos)
unsigned char ind; // indice posición actual buffer Vinst 
unsigned short buffVinst[180];
unsigned char tempsSeg=1
main{

inicializaciones() 
int teclaStart=0;
do{

    scanKeys()
    teclaStart=keysDown() 
    swiWaitForVBlank() 
    representarInfo( vinst, vmed, dist,  &buffVinst, index)
    if(teclaStart=1) {
        Ttiempo =0
        Tdist=0
        vinst=0
        vmed=0
        dist=0
        for (int i=0; i<index; i++){
            buffVinst[i]=0;
        }
        index=0
    }
    if(tempsSeg==2){
        tempsSeg=1


    }

} while(1)
}



controlar el tiempo, con el fin de poder calcular 
velocidades. Tinterrupcion cada 2hz.
calcular vinst, es necessita el temps amb
-drayos, -vinst
cada 1/2 se almacene vinst en una pos diferente
RSI del timer 0
push{rx-ry,lr}
ldr r0,=Drayos
ldrh r1, [r0]
mov r2, #2
mul r2, r1   @Vinst
ldr r3, =Vinst
strh r2, [r3] 
ldr r0, =buffVinst
ldr r0, [r0]
ldr r1, =index
ldr r3, [r1]
str r2, [r0, r3]
add r3, #1
strb r3, [r1]
@Contador pel temps
ldr r4, =Ttiempo
ldrh r5, [r4]
ldr r3, =tempsSeg
ldrb r2, [r3]
cmp r2, #1
addeq r2, #1
subne r2, #1
addne r5, #1 @sumem un segon al temps total
@Calculem x total
ldr 






strh r1, [r0]

pop{rx-ry,pc}





vinst=(2*x)/(t)
Estima la distancia recorrida por la rueda 
calcular vmed: Tdist, Ttiempo
anar sumant a nrayos i dividir entre el temps ->drayos
RSI del sensor 
push{rx-ry,lr}
ldr r0,=Drayos
ldrh r1, [r0]
add r1, #1
strh r1, [r0]

pop{rx-ry,pc}