vars que s'han d'actualitzar desde la rsi:
-bpm: 10-180
brats

-mirar vars globals per moure el dibuuix





RSI VBL:

RSI VBL:

            push{r0-r3, lr}              ;;; apilar registres

             

            ldr r0, =paused

            ldrb r1, [r0]

            tst r1, #1                      ;;; r1 = 0001  --> r1 AND #1 = 0001  --> FZ = 0

                                                            ;;; r1 = 0000  --> r1 AND #1 = 0000  --> FZ = 1

            bne .LPausat   ;;; beq salta si FZ == 1,  bne salta si FZ = 0

            ldr r0, =ang_actual

            ldr r1, [r0]    

            ;mov r2, r1, lsr #12             @;treiem la part decimal

                        ;;; part entera de ang_actual en R2

                        ;;; format 1.19.12 (coma fixa 12 bits decimals i signe) --> 'asr'

                        ;;; format 0.20.12 (coma fixa 12 bits decimals sense signe) --> 'lsr'

            ;bic r2, #0b10000000000000000000 @;treiem el bit de signe

                        ;;; cmp r1, #0

                        ;;; rsble r1, r1, #0                      @; calcula valor absolut de l'angle

            ;cmp r2, #360

            ;movhs r2,#0    @;si es igual o més gran reseteja

                        ;;; millor ajustar després d'actualitzar (incrementar)

                        ;;; l'angle, abans de guardar-lo a memòria (var. ang_actual)

            ;add r1, #1      @;!!!!!!!Sumar fraccion??????

                        ;;; cal sumar la fracció

            ldr r4, =fraccio

            ldr r4, [r4]

            add r1, r4         ;;; cal sumar el valor de fracció (part entera + part decimal)

                                                            ;;; compte amb la SINCRONITZACIÓ! El valor de fracció

                                                            ;;; permet sincronitzar el gir de la circumferència petita

                                                            ;;; amb l'activació de la RSI (a 60 Hz)

           

            ;and r1, #0b111111111111 @;sumem la part decimal

                                                            ;;; filtra els 12 bits baixos (R1 = part decimal)

            ;mov r2, r2 lsl #12

            ;orr r2, r1  @; ajuntem tot menys el signe

                                                            ;;; ajunta part entera i decimal, però no permet que el

                                                            ;;; "carry" passi a la part entera

            ;mov r3, #0

            ;mov r3, r3, ror #1                    ;;; no té sentit rotar (p desplaçar) una màscara

                                                                                    ;;; tota a zeros

            ;orr r3 ,r2  @; ajuntem tot amb el signe

                                                ;;; no té sentit fer una OR amb una màscara tota a zeros

           

            cmp r1, #360*4096                  ;;; comparem R1 amb 360 graus (en format Q12)

                                                                                    ;;; (es pot passar un cert valor decimal de graus)

            subhs r1, #360*4096               ;;; si es igual o més gran, substrau 360 graus

           

            str r1, [r0]                                 ;;; actualitzar variable global ang_actual

           

            @;podem utlitzar tots menys r2=angle actual

            ldr r0, =ang_pos

            ;mul r3, r2, #4

            mov r3, r1, lsr #12                   ;;; R3 = part entera de l'angle actual

            mov r3, r3, lsl #2                      ;;; R3 = part entera multiplicada per 4

                                                                        ;;; R1 = 0101.1001   (en format Q4)

                                                                        ;;; mov r3, r1, lsr #4  --> R3 = 0000 0101

                                                                        ;;; mov r3, r3, lsl #2      --> R3 = 0001 0100

                                                                        ;;; --------------------------------------

                                                                        ;;; mov r3, r1, lsr #2  --> R3 = 0001 0110

                                                                        ;;; bic r3, r3, #3             --> R3 = 0001 0100

 

            ldsh r1, [r0, r3] @;captuerem px (short) de l'angle actual en R1

            ;add r1, #1

            ;strh r1, [r0, r3]   @;actualitzem

            add r3, #2

            ldsh r2, [r0, r3] @;captuerem py (short) de l'angle actual en R2

            ;add r2, #1

            ;strh r2, [r0, r3]   @;actualitzem

 

            mov r0, #0                               ;;; passem per paràmetre índex de l'sprite a 0

            ;mov r1, r2                               ;;; els paràmetres de R1 i R2 ja estan carregats

            bl SPR_moverSprite

           

            ;@???SPR_actualizarSprites

            mov r0, #0x07000000              ;;; base de l'OAM del processador gràfic principal

            mov r1, #1                               ;;; límit = 1 per actualitzar només l'sprite 0

            bl SPR_actualizarSprites

             

.LPausat:

            pop{r0-r3, pc}

 

activar_beat pot estar en RSI ja que t=5ms i RSI=100ms

fraccion = 360 / accent
