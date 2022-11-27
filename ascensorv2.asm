#define NUM_PLANT 4 // número de plantas a gestionar
unsigned char planta_actual = 0; // número de planta actual
unsigned char sentido = 1; // sentido de movimiento actual
                            // = 1 → subida,
                            // = 2 → bajada
unsigned char nueva_planta

void main{
inicializaciones() 
do{
    tareas_independientes() 
    if(peticiones !=0){
        cerrar_puerta() 
        @mover ascensor
        RA_MOTOR=1
        if(RA_MOTOR && (RA_detect!=0)){
            swiWaitForVBlank() 
            printf(char *format,...)
            if(peticiones == RA_detect)   abrir_puerta() 

        }


        peticiones = 0;

    }

} while(1)
}


@s activa quan s'activa un bit del RA_detect, quan es pari
RSItimer0

push{lr}

ldr r0, =nueva_planta
ldrb r1, [r0]
ldr r1, =planta_actual
ldrb r1, [r2]
ldr r3, =RA_BOTONS
ldr r5, =RA_MOTOR
ldr r4, [r3, r1]
cmp r4, #1
moveq r6, #0
strbeq r6, [r5]

pop{pc}


siguiente_movimiento
push{lr}

pop{pc}