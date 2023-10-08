TITLE
estacion de servicio en galatea  modelo con errores , no se como alterar la variable global tanque  , el modelo trata de simular
la estacionde servicio a la que acceden dos tipos de vehiculos , la idea  es que cada tipo tiene una capacidad
de llenado distinta . que se al entrar al servidor funcionara para restarle al tanque dicha cantidad
NETWORK

    Entrada (I) {
        Tipovehiculo=UNIFI(0,1);
        IT(20);
        
        WRITE("EL TIPO DE VEHICULO QUE ENTRO ES  %d Y EL TANQUE DE GASOLINA TIENE %d\n",Tipovehiculo,tanque );
     
        SENDTO(Cola[Tipovehiculo]);
    }
    Cola[2] (L) {
    
        WRITE("Enter Someone of Type %d\n",Tipovehiculo);
        SENDTO(Taquilla);
       
    }
    Taquilla (G) {
        IT(100);      
        SENDTO(Servidor);     
    }

    Servidor(R) {
        STAY(GAUSS(MeanWait[Tipovehiculo],DeviWait[Tipovehiculo])) 
       
        RELEASE SENDTO(exit);
    }
    Exit (E) {
        WRITE("Someone of Type %d got out after %8.2fsec. in the system,  tanque %d",tipovehiculo, TIME-GT, tanque);
       
        WRITE("\n");
        PAUSE;
    }
INIT
  TRACE;
  ACT(Entrada,0); TSIM=1000;
 
  tanque=2000;

DECL
  
  DOUBLE[] MeanWait = {40, 39, 12, 62};
  DOUBLE[] DeviWait = {4, 5, 3, 12};
  GLOBAL INT tanque, tanqueactual;
  
  MESSAGES Entrada(INT Tipovehiculo);
 
  STATISTICS ALLNODES;
END
