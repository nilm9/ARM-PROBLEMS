
unsigned char interrupt = 0
unsigned short time = 0
unsigned short space = 0
unsigned char count = 1
unsigned shprt tics;


main{

inicializaciones() 
do{
tareas_independientes() 
//quan ja hagin hagut les 2 interrup
if( interrup==0) startPulse()
if(interrupt >=2){
    space = calcular_distancia(time)
    swiWaitForVBlank()     
    printf("%d: \t %dcm", count, space) 
    count++
    tics=0
    time=0
    space=0
}

} while(1)

}


té 2 interrupciones quan inicia i quan torna
tenim temps i velocitat volem espai entre 2cm i 314cm
sumar 1 a interrupcio 
guardar temps entre interrupt i tics
RSItimer0
push{lr}

ldr r0, =interrup
ldrb r1, [r0]
cmp r1, #1
bne .LInici

ldr r2, =tics
push{r0}
mov r0, #0
bl cpuStartTiming
bl cpuGetTiming
strh r0, [r2]
pop{r0}

.LInici:
add r1, #1
strb r1, [r0]
pop{pc}


calcular amb equivalencia de tics vel sonido i temps
recibirá por parámetro el número de tics correspondientes al tiempo del pulso de eco (tIN) y devolverá la distancia 
correspondiente, en centímetros: 
calcular_distancia(int t_in);
push{r1-r2,lr}
ldr r1, =6703
ldr r2, =10000
mul r1, r1, r2
swi 9
ldr r1, = 340000
mul r0, r0, r1

pop{r1-r2,pc}