RA (Right Ascension) -> horas, minutos y segundos: rango total de 24 horas para los 360º circumferencia
Dec (Declination) -> ángulo entre -90º y 90º sexagesimales
búsqueda -> M1 y M2, 
seguimiento -> controlar el motor M1

RSI del timer 0: realizar el seguimiento: reajustar la coordenada RA del objetivo continuamente

a -> 14
b -> 1
c ->  86.400

RSItimer0:

push{lr}

@generar pulsos por el bit 7, a la frecuencia adecuada,

ldr r0, =REG_TEL
ldrb r1, [r0]
mov r2, r1, lsr #7
mov r3, #1
and r2, r3  @ a r2 teinm ascenento o desc
bicne r1, #7
moveq r1, #0x80
strb r1, [r0]

ldr r3, =ra_actual
lds r4, [r3]
ldr r5, =ra_objetivo
ldr r6, [r5]
cmp r4, r6
@si es mes petit incrementar | si es igual para | si es igual o mes gran guardar que actual es objetivo
movlo r1, #0x40 
strblo r1, [r0]
strhs r6, [r3] @si es mes gran o igual actualitzar

sub r7, r6, r4
cmp r7, #120
blo .LnoGiroGrueso
bic r1, #5
strb r1, [r0]

.LnoGiroGrueso:
cmp r7 #0
bls .LnoGirfi
mov r1, #0x40 
strb r1, [r0]

.LnoGirfi:
cmp r6, r4
bne .LnoSeguimiento


.LnoSeguimiento:


pop{pc}