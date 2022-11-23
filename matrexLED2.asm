

@main
@
@

unsigned char matriz[8][8]; //valores de los LEDs, en cada posición:
// = 0 → vacía (apagado) 
// = 1 → ficha jugador 1 (rojo)
// = 2 → ficha jugador 2 (verde)
unsigned char turno = 1; // número de jugador actual 
unsigned char fil = 1, col = 4; // fila y columna de la ficha que
// se está colocando
unsigned char fase =0 

void main{

inicializaciones()
int keys = 0
do {
scanKeys()
keys = keysDown()
//seleccionar columna
if(fase == 0){
    if((keys & KEY_RIGHT) & (col<8)) col++
    if(keys & KEY_LEFT & (col>0)) col--
    fase=1
}
// caída ficha
if(fase == 1){
     if((keys & KEY_RIGHT) & (matriz[fil][col]==0))
     swiWaitForVBlank()
     printf("Jug: %d \t col: %d \n", turno, col )
     int count=1
     while((matriz[count+1][col]==0) || count==8){
        matriz[count+1][col]=turno:
        matriz[count][col]=0:
        count++
     }
     fase = 2
}

// comprobar ganador 
if(fase==2){

}

//final partida

} while(1)


} 




@RSItimer0 -> f240 Hz : Realizar el barrido periódico de la matriz




@RSItimer1 -> f 3Hz : Generar el efecto de caída de las fichas
@mostrar fich inin