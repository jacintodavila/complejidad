TITLE
estacion de servicio en galatea 
NETWORK
    Entrada (I){
        Capacidad = UNIFI(20, 40); 
        IT(EXPO(1.0));
        SENDTO(Taquilla);
    }
    Taquilla (R) {
        STAY(GAUSS(5.0,2.0)); 
        RELEASE SENDTO(Servidor);     
    }
    Servidor (R) {
        STAY(GAUSS(5.0,2.0));
        RELEASE {
        	Diff = Tanque-Capacidad; 
        	IF (Diff>0) {
        		Tanque = Tanque-Capacidad;
        		SENDTO(Salida);
        	} ELSE {
        		SENDTO(Resentimiento);
        	}
        }
    }
    Salida (E) { 
    	WRITE("En el minuto: %6.2f, sale un vehiculo dejando el tanque en %f litros\n", TIME, Tanque);
    }
    Resentimiento (E) {
    	WRITE("En el minuto: %6.2f, sale un vehiculo que no pudo cargar %f litros\n", TIME, Capacidad);
    }
INIT
  TRACE;
  ACT(Entrada,0); TSIM=1000;
  Tanque=30000;

DECL
  DOUBLE Tanque, Diff; 
  MESSAGES Entrada(DOUBLE Capacidad);
  STATISTICS ALLNODES, Tanque;
END
