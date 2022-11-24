@main

unsigned char ciclo=0
unsigned char num_fila=0  <4
unsigned char tempKey = -1
unsigned char key = 0



main{
inicializaciones() 

do{
tareas_independientes() 

if(ciclo>=10){
    @ja te un barrido
    ciclo=0
    if(tempKey!=-1){
        swiWaitForVBlank()
            ciclo=0
            processKey(key)
    }
}

} while(1)


}

@llegir ldrh REG_TECL fent servir els 8 ultims
@ llegir bucle de fila per cada un i tenir var global 
@fixar tos els bits a 1 menys el que es va a llegir
@al cap de poc tempsllegir de r0-r3 si algun esta a 0
@mirar var global al final i anar actualitzant temporal

e controlar el barrido de las 4 filas del teclado
guardar en una variable global de nombre currentKey 

si no es -1
un cop llegides les 16  descodificar_tecla
@var de fila
@var global temp

RSItimer0:

push{lr}
ldr r0, =ciclo
ldrb r1, [r0]
cmp r1, #10
bhs .LfinalTics
add r1, #1
strb r1, [r0]

ldr r0, =REG_TECL
ldrh r1, [r0]
ldr r3, =num_fila
ldrb r4, [r3]
cmp r4, #4
movhs r4, #0
bhs .LfinalTics
and r1, #0xFF
mov r2, #0x10
mov r2, r2, lsl r4
bic r1, r2
strh r1, [r0]   @guardem fila activada
ldr r7, =tempKey
ldrh r8, [r7]
mov r5, #3
.LforFila:
mov r6, #8
mov r6, r6, lsr r5
and r1, r6
cmp r1, #0
bne .LnoActivo
rsbeq r5, #3
moveq r4, r4, lsl 2
addeq r4, r5
moveq r8, r4

ldr r9, =key
ldrb r10, [r9]
cmp r8, r10
strbhs r8, [r9]

bl  descodificar_tecla
.LnoActivo:

sub r5, #1
cmp r5, #0
beq .LfiForFila
b .LforFila
.LfiForFila:

cmp 


add r4, #0x10
strb r4, [r3]
.LfinalTics:



pop{pc}