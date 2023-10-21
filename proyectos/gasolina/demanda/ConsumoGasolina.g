TITLE
consumo de gasolina en galatea 
NETWORK
    Entrada (I){
        Capacidad = 40; 
        RendimientoKmLt = 11.0; // 11 km/lt
        RendimientoKmH = 1.2; // 1.2 km/h
        //IT(TSIM);
        SENDTO(Carga);
    }
    Carga (R) {
        STAY(GAUSS(3.0,2.0));
        RELEASE {
        	Iteracion = Iteracion + 1; 
        	WRITE("En el minuto: %6.2f, cargué por %d vez, después de %6.2f kms\n", TIME, Iteracion, Distancia);
        	SENDTO(Consume);
        }     
    }
    Consume (R) {
    	TiempoMedioConsumo = Capacidad/(RendimientoKmH/RendimientoKmLt); 
    	TiempoConsumo = GAUSS(TiempoMedioConsumo,TiempoMedioConsumo/3);
    	Distancia = RendimientoKmH*TiempoConsumo; 
        STAY(TiempoConsumo);
        RELEASE SENDTO(Carga); 
    }
INIT
  TRACE;
  ACT(Entrada,0); TSIM=720;
  Iteracion=0; Distancia=0;

DECL
  DOUBLE TiempoMedioConsumo, TiempoConsumo, Distancia; INT Iteracion; 
  MESSAGES Entrada(DOUBLE Capacidad, DOUBLE RendimientoKmLt, DOUBLE RendimientoKmH);
  STATISTICS ALLNODES, TiempoConsumo, Distancia;
END
