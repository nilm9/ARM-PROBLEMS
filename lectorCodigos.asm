
unsigned char contador = 1

unsigned char t_abs[45];
unsigned char t_rel[45];

unsigned char t_unitario=0
unsigned char interrup=0

main{
inicializaciones()

do{
tareas_independientes() 

if(interrup>=45){
    interrup=0
    normalizar_tiempos(t_abs, t_rel)
    swiWaitForVBlank()
    decodificar_codigo(t_rel)
}  

} while(1)

}

@obtenir eltemps absolut 
@cpuStartTiming(int timer) -> inici interrupt
@ cpuGetTiming() -> retorna número de tics transcurridos 
@ entre las dos interrupciones
@guardar valor en la matriu i incrementar index fins 74
@3 primers fer mitja i guardar t_unit
RSItimer0

push{rx-ry, lr}

ldr r0, =interrup
ldrb r1, [r0]


mov r0, #0
bl cpuStartTiming
bl cpuGetTiming
@r0 ->tics
ldr r2, =t_abs
strb r0, [r2, r1]

cmp r1, #4
bne .LNoInicial
push {r0,r3-r9}
mov r4, #0
ldrb r3, [r2, r4]
mov r5, #1
ldrb r6, [r2, r5]
mov r7, #2
ldrb r8, [r2, r7]
add r9, r3, r6
add r9, r8
mov r0, r9
mov r1, #3
swi 9   @-> tunitari
ldr r3, =t_unit
strb r0, [r3]
push {r0,r3-r9}
.LNoInicial:
ldr r0, =interrup
add r1, #1
strb r1, [r0]

pop{rx-ry, pc}




@realiza la dividio de cada temps rel per el temps unitari i les guarda a t rel
normalizar_tiempos:
push{rx-ry, lr}
ldr r3, =t_unit
ldrb r4, [r3]
mov r2, #0
.LforDivisio:
cmp r2, #45
bhs .FiDiv
ldrb r3, [r0, r2] 

push {r0- r1}
mov r0, r3
mov r0, r4
swi 9
mov r3, r0
push {r0}

strb r3, [r1, r2] 

add r2, #1
bl .LforDivisio
.FiDiv:
pop{rx-ry, pc}