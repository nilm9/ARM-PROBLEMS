main:
-Recibir palabras a vocalizar
-transcribir dichas palabras a “fonemas” 
-visualizar la palabra actual en la pantalla inferior de la NDS
-enviar cada fonema de la palabra actual al registro de E/S durante el tiempo asociado al fonema

#define MAX_CAR 16
#define MAX_FON 50
char palabra[MAX_CAR+1]; //palabra a vocalizar 
unsigned int fonemas[MAX_FON]; //fonemas a vocalizar
unsigned char fcs[MAX_FON]; //tiempo de cada fonema, en centésimas 
unsigned char num_fon = 0; //número de fonemas a vocalizar

main{

inicializaciones()
int nfrec=0
int palabra

do{
tareas_independientes()
palabra =  siguiente_palabra(char *string)

num_fon= pal2fon(palabra, fonemas, fcs)


int frec = 100/fcs[nfrec]
activar_timer0( frec)
if(nfrec=>num_fon){
    nfrec=0
    desactivar_timer0() 
}
swiWaitForVBlank()
printf(char *format,...) 



} while(1)
}
      

Gestionar el envio de de fonemas al registro de E/S : 
-detectar si se ha agotado el tiempo actual -> activar el siguiente fonema, si hay pendientes
        increme nfrec++



RSi:
push{lr}

pop{pc}






func: