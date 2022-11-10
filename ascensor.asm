@Notes
RSI->interrupt: quan ascensor arribi a una planta (RA_Detect)
-Anar mirant si hi ha peticions (RA_Botons) (RSI tst) si hi ha
    -cerrar()
    -activar motor(reg)
    -mover ascensor


MAIN:

#define NUM_PLANT 4 // número de plantas a gestionar
unsigned char planta_actual = 0; // número de planta actual
unsigned char sentido = 1; // sentido de movimiento actual
                            // = 1 → subida,
                            // = 2 → bajada
unsigned short peticiones=;  // estado actual de los bits de petición
unsigned char p_futura;




void main
{
    //inicializaciones

do{
    tareas_independientes() 
    if(peticiones == 1){
        cerrar_puerta()
        p_futura = siguiente_movimiento()
        if(s_actual==1){
            //subir
        }
        if(s_actual==2){
            //baixar
        }
        p_actual = p_futura;
        p_futura =0
        peticiones=0
        abrir_puerta()
        swiWaitForVBlank() 
        printf("Planta: %d ", &p_actual)
        printf("Peticiones/n")
        for(int i=0; i<NUM_PLANT; i++){

        }



    }



} while(1);



}







RSI:


push{,lr}

ldr r0, =RA_Botons
ldrh r1, [r0] 
ldr r2, =
ldr r2, =
tst r1, #0 @Mirem si hi ha algun boto pitjat
beq .LNoPressed



@cerrar puerta



mov r2, #15
.LDetectPressedBtns:
mov r3, 

.LNoPressed:



pop{,pc}

