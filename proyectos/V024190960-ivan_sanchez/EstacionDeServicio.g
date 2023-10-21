TITLE
Estacion de servicio en galatea 
NETWORK
    Entrada (I){
        Capacidad = UNIFI(20, 40); 
        IT(POISSSON(2.0));
        SENDTO(Taquilla);
    }
    Taquilla (R) {
        STAY(EXPO(15.0));
        total=dolar*Capacidad;
        RELEASE SENDTO(Servidor);     
    }
    Servidor (R) {
        STAY(NORM(5.0,2.0));
        RELEASE {
        	Diff = Tanque-Capacidad; 
         
        	IF (Diff>0) {
                caja=caja+total;
        		Tanque = Tanque-Capacidad;
        		SENDTO(Salida);
        	} ELSE {
                   		SENDTO(Resentimiento);
        	}
        }
    }
    Salida (E) { 
    	WRITE("En el minuto: %6.2f, sale un vehiculo dejando el tanque en %f litros , se tiene en caja un total en dolares de: %f\n ", TIME, Tanque,caja);
    }
    Resentimiento (E) {

    	WRITE("En el minuto: %6.2f, sale un vehiculo que no pudo cargar %f litros, se hizo una devolucion en dolares de %f, se tiene en caja un total en dolares de: %f\n", TIME, Capacidad, total,caja );
    ENDSIMUL;
    }
INIT
  TRACE;
  ACT(Entrada,0); TSIM=10800;
  Tanque=30000;
  dolar=0.5;
  caja=0;

DECL
  DOUBLE Tanque, Diff, dolar, Total,caja; 
  MESSAGES Entrada(DOUBLE Capacidad);
  STATISTICS ALLNODES, Tanque, caja;
END
