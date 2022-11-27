modificar el bit 5





RSItimer0 


fer servir desactivar timer

push{lr}

ldr r0, =curr_bit
ldrb r1, [r0]
sub r1, #1

ldr r2, =curr_ind
ldrb r3, [r2]
ldr r4, =transmsg
ldr r5, [r4, r3]
@tenim index
ldr r6, =nbcode
ldr r7, [r6, r5, lsl #2] //tenim tot el valor, necessitem 24 primerso
mov r8, #0xFF
and r8, r7, lsr #24
bic r7, #0xFF000000
and r8, r7 @tenim bitcode a r8
@bit que es fa servir
and r9, r8, r1

ldr r4, =REG_DATA
ldrb r6, [r4]
mov r5, r9, lsl #5
orr r6, r5
strb r6, [r4]


cmp r1, #0
addeq r3, #1
moveq r1, #0

strb r1, [r0]
strb r3, [r2]

ldr r0, =lontr
ldrb r0, [r0]
cmp r3, r0
movhs r0, #0
blhs desactivar_timer


pop{pc}