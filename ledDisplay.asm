//notes

unsigned char string []="C'est la vie"
unsigned char canviarChar=0;
unsigned char currentchar;
unsigned char estat =0
unsigned char num_col

void main{

    int i =0;
    inicializaciones() 
    do{
        tareas_independientes()

        if(canviarChar!=0){
            canviarChar =0;
            currentchar = string[i++]

            if(currentchar=="\0"){
                i=0
                currenChar = string[i++]
            }

      }  



    }while(1)


}


//RSI
-accedeix al char actual a traves de currentChar i el mateix amb num_col
-llama a obtener_puntos
-enviar el estado de los puntos
-RSI debe generar la señal de 
strobe, es decir, poner el bit 7 a '1' y, después de un cierto tiempo, poner el bit 
7 a '0', para indicar al display que debe introducir una nueva columna.


push{rx-ry, lr}
 
ldr r2, =currentChar
ldrb r0, [r2]
ldr r3, =num_col
ldrb r1, [r3]

bl obtener_puntos

ldr r5, =estado
tst r0,#FF
moveq r6, #0
movne r6, #1
strb r6, [r5]


pop{rx-ry, pc}

s(char caracter, char num_columna)
r0:retorna estat dels punts d'una columna d'un caràcter
obtener_puntos:

