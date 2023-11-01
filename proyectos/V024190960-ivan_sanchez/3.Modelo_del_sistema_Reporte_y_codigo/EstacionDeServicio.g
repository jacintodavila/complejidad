TITLE
Estacion de servicio en galatea 
NETWORK
    Entrada (I){
        Capacidad = UNIFI(20, 40);
        WRITE("En el minuto: %6.2f, llega un vehiculo con capacidad de %6.2f litros\n ", TIME, Capacidad);
        IT(EXPO(1.0));
        SENDTO(Taquilla[UNIFI(0,2)]);
    }
    Taquilla [3] (R) {
     USE=1;
        STAY(GAUSS(1.0,0.5));
        RELEASE SENDTO(Servidor[UNIFI(0,5)]);     
    }
    Servidor [6] (R) {
     USE = 1; 
        STAY(GAUSS(5.0,1.0));
        //STAY(1);
        RELEASE {
         Diff = Tanque-Capacidad; 
         IF (Diff>0) {
                 caja=caja+dolar*Capacidad;
                 Tanque = Tanque-Capacidad;
          SENDTO(Salida);
         } ELSE {
                    SENDTO(Resentimiento);
         }
        }
    }
    Salida (E)  {
  
    	WRITE("En el minuto: %6.2f, sale un vehiculo dejando el tanque en %f litros , se tiene en caja un total en dolares de: %f\n", TIME, Tanque,caja);
    }
    Resentimiento(E){

    	WRITE("En el minuto: %6.2f, sale un vehiculo que no pudo cargar %f litros", TIME, Capacidad );
     
    }

INIT
  TRACE;
  ACT(Entrada,0);
  TSIM=360;
  Tanque=30000;
  dolar=0.5;
  caja=0;

DECL
  DOUBLE Tanque, Diff, dolar,caja;
  MESSAGES Entrada(DOUBLE Capacidad);
  STATISTICS ALLNODES , Tanque, caja;
END
