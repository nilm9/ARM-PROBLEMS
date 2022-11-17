
MAIN:
controlar fiches dels jugadors:
-jug1: rojas, 2 verdes, Alternar jug i actualitzar color

-jugador seleccionar columna
inicialmenta a f1, col 4 mostrar ficha de color i 
-pot cambiar la col amb keys, fer ifs
començar a baixar amb keyselect (si no hi ha altres fiches)
llavors:

--PRINTAR Jug: i (tabulador) Col: j (1 ≤ i ≤ 2) (1 ≤ j ≤ 8)
--caure ficha fins que trobi seguent o tope
llavors:
comprovar 4 en ralla
if si -parar i decalrar vencedor
else continua

@vars
unsigned short pos=0
unsigned char posFil=0
unsigned char posCol=0
unsigned char fase=0@(seleccionar columna 0, caída ficha 1, comprobar ganador 1, final partida 2 ).
unsigned char matriz[8][8]; //valores de los LEDs, en cada posición:
// = 0 → vacía (apagado) 
// = 1 → ficha jugador 1 (rojo)
// = 2 → ficha jugador 2 (verde)
unsigned char turno = 1; // número de jugador actual 
unsigned char fil = 1, col = 4; // fila y columna de la ficha que
// se está colocando
main{
inicializaciones() 
int hayGanador = 0; 
do{
    if(fase==0){
        do{
        scanKeys() 
        if( keysDown() &  KEY_RIGHT) col++
        if( keysDown() &  KEY_LEFT) col--
        } while((keysDown() &  !KEY_SELECT) & !matriz[fil][col]==0);
        swiWaitForVBlank()
        printf("Jug: %d \t Col: %d \n", turno, col) 
        fase=1
    }
    if(fase==1){
        @RSI tmier 1 bajar fichas
        fase=2
    }
    if(fase==2){
        @comprobar ganador
        hayGanador= comprobar_4(&matriz, nfil, ncol) 
    }
    else{
        if(hayGanador==1){
            printf("Jug: %d has ganado!! \n", &turno) 

            do{
                swiWaitForVBlank() 
            } while(1)
        

        }

    }
    if(turno == 1) turno =2; @cmabiar a la RSI del timer1



} while(1)



} 





RSI timer0:
freq 240cicles /s
-controlar i canviar estat de les files
acceder a una de las filas de la matriz y 
generar los 24 bits de información para el refresco de esa fila
CONTADOR FINS A 8 DESPRES TORNA A COMENÇAR

push{lr}  

ldr r0, =RegMLED
ldr r1, r0
ldr r2, =matriz
ldr r2, [r2]
ldr r3, =posFil
ldrb r3, [r3]
ldr r4, =posCol
ldrb r4, [r4] 
cmp r3, #7
moveq r3, #0
cmp r4, #8
addeq r3, #1
moveq r4, #0
mla r2, r3, r4
ldr r5, [r2]
add r4, #1
cmp r5, #1
moveq r10, 
cmp r5, #2
beq .LActivarVerd
bne .LES0

.LActivarVermell:





.LES0: 
strh r3, [rx]
strh r3, [ry]

pop{pc}

RSI timer1
freq 3cicles /s
generar el efecto de caída de las fichas
 si el fase = 1 baja pos de ficha
  si esta fila 8 o es detecta altre, canviar de fase a 2

push{r0-r5,lr}

ldr r0, =fase
ldrb r1, [r0]
cmp r1, #1
bne .Lfinal
ldr r2, =fil
ldrb r2, [r2]
ldr r3, =col
ldrb r3, [r3]
ldr r4, =matriz
ldr r4, [r4]
add r2, #1
mla r7, r4, r2, r3
ldr r5, [r7]
cmp r5, #0
bne .Lfinal
sub r2, #1
mla r4, r2, r3
ldr r6, [r4]
mov r5, r6
str r5, [r7]

.Lfinal:
add r1, #1
strb r1, [r0]

pop{r0-r5,pc}
