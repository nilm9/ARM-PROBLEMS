


mai:

//VArs
//vector de generación de los dígitos decimales en 7 segmentos
unsigned char Vsegments[] = {63, 6, 91, 79, 102, 109, 125, 7, 127, 111};

#define MAX_CAPTURAS 10 // máximo número de capturas 
// (en un segundo)
unsigned char n_vals = 0; // número de capturas actual
float valores[MAX_CAPTURAS]; // vector de valores capturados
unsigned char Vdigits[4]; // vector de dígitos
unsigned char num_dent; // número de dígitos enteros
unsigned char num_ddec; // número de dígitos decimales
unsigned char ciclo=0

unsigned float sum=0
unsigned float prom=0


main{
inicializaciones()
inicializar_timer0(40)


do{


    if(ciclo=>4){
        ciclo=0   @incrementar en la RSI
        valores[n_vals]=capturar_dato()
        n_vals++
        if(n_vals==MAX_CAPTURAS){
            n_vals=0
            for (int i=0; i<MAX_CAPTURAS;  i++){
                sum+=valores[i]
            }
            prom=sum/MAX_CAPTURAS;
            convertir_numero(prom, 
            &Vdigitos, &Dent, &Ddec)


            swiWaitForVBlank()
            for(int i=0; i<4; i++){
                switch(num_dent)
                    case 1 (num_dent=1)
                        printf("%d: \t %d.",Vdigitos[0] )
                        printf("%d",Vdigitos[1] )
                        printf("%d",Vdigitos[2] )
                        printf("%d",Vdigitos[3] )
            }

            prom=0
            sum=0
        }

} while(1)


}





carregar reg_data ia analitzar
activar los 7 segmentos más el punto decimal:
fixar un instant consicutivament 0001, 
fixar a 1 i lsl guardar etc
b0-b7 envia codi, repeat
0010...

f-> 40cicles / 1s
RSI:

push{r0-r8,lr}

ldr r5, =ciclo
ldrb r6, [r5]
add r6, #1      
strb r6, [r5]
ldr r0, =REG_DATA
ldrh r1, [r0]
and r9, r1 , #0b11111111
mov r2, r1, lsr #3
mov r3 , #1
orr r2, r3
strb r2, [r0]        @esta mal deplaaçat

ldr r4, =VSegments
ldr r4, [r4]
mov r7, #0       @contador
.LforDigit:
cmp r7, #10
bhs .LfiforDigit
ldr r8, [r4, r7]
cmp r8, r9
beq .LfiforDigit

add r7, #1

b .LforDigit

.LfiforDigit:
ldr r4, =valores
ldr r4, [r4]
str r8, [r4, r6]   @guardem a valors desplaçat el contador

mov r3, r3 lsl #1
cmp r3, #16          @mirem que no faci mes de 4
moveq r3, #1


pop{r0-r8,pc}