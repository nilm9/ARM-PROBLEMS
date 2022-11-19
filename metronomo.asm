vars que s'han d'actualitzar desde la rsi:
-bpm: 10-180
brats

-mirar vars globals per moure el dibuuix

RSI VBL:

push{lr}

ldr r0, =paused
ldrb r1, [r0]
tst r1, #1
beq .LPausat
ldr r0, =ang_actual
ldr r1, [r0]    
mov r2, r1, lsr #12             @treiem la paryt decimal
bic r2, #0x10000000000000000000 @treiem el bit de signe
cmp r2, #360
movhs r2,#0    @si es igual o més gran reseteja
add r1, #1      @!!!!!!!Sumar fraccion??????
and r1, #0x111111111111 @sumem la part decimal
mov r2, r2 lsl #12
orr r2, r1  @ ajuntem tot menys el signe
mov r3, #0
mov r3, r3, ror #1
orr r3 ,r2  @ ajuntem tot amb el signe
str r3, [r0]
@podem tutlitzar tots menys r2=angel actual
ldr r0, =ang_pos
mul r3, r2, #4
ldr r1, [r0, r3]    @captuerem px de l'anngle actual
add r1, #1
strh r1, [r0, r3]   @actualitzem
add r3, #2
ldr r2, [r0, r3 ]    @captuerem py de l'anngle actual
add r2, #1
strh r2, [r0, r3]   @actualitzem
mov r0, r1
mov r1, r2
bl SPR_moverSprite<
@???SPR_actualizarSprites


.LPausat:

pop{pc}

activar_beat pot estar en RSI ja que t=5ms i RSI=100ms

fraccion = 360 / accent
