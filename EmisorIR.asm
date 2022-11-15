Notes:
Rsi de entrada
PIN0: Freq 40khz ,estat a 0/1 



//Vars

unsigned short VCodes[10][34] =
{{0x0F07, 0x0101, 0x0101, 0x0101, 0x0104, 0x0101, …, 0x013B},
{0x0F07, 0x0101, 0x0101, 0x0104, 0x0101, 0x0104, …, 0x013B},
…
{0x0F07, 0x0101, 0x0104, 0x0101, 0x0101, 0x0101, …, 0x013B}};
unsigned char current_code;    // índice código actual

unsigned char current_pair;    // índice par ON/OFF actual

unsigned char state; // estado actual (1=ON, 0=OFF)

unsigned char tics;    // tics pendientes


main{

inicializaciones() 
do{
    swiWaitForVBlank()
    scanKeys() 
    if(keysDown() & REG_KEYINPUT ){
        activar_timer0(1700)
        if(tics==0){
            tics=194

            obtener_tics(&VCodes, current_code, current_pair, state)
            desactivar_timer0(1700)
            
        }
    }

}while(1)

}

Carregar Pin0,
anar comprovant 
1700tics/1s
decrementar tics i gaurdarlos
if tics ==0 pasa seguent estat i si es necessari alseg par
actualitzar bit 0 de IR
RSI:

push{lr}


ldr REG_IR


pop{lr}
