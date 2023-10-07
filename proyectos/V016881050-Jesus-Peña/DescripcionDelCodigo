1. Inicialización (procedimiento "setup"):
   - Se inicializan variables globales como "total_gasoline_produced, total_gasoline_demand, total_gasoline_distributed y storage_capacity".
- Se crea un centro de distribución con un suministro inicial de gasolina de 50.000 unidades, una tasa de producción de 1.000 unidades por tick, un tiempo de carga de 30 minutos y una forma triangular.
    • Se crea una gasolinera con una capacidad disponible de 305.000 unidades y forma circular.
    • Se crean diez camiones con posiciones aleatorias y las siguientes propiedades:
        ◦ "current_capacity" inicializada a 0.
        ◦ "max_capacity" fijada en 35.000 litros o 18.000 litros.
        ◦ "travel_speed": 5 unidades por tick.
        ◦ "unloading_time": 45 minutos.
        ◦ "fuel_capacity": 5.000 litros.

2. Distribución de gasolina (procedimiento "distribute-gasoline"):
    • Calcula la cantidad de gasolina producida en el centro de distribución en base a su tasa de producción y tiempo de carga.
    • Comprueba si la gasolina disponible en el centro de distribución más la cantidad recién producida está dentro de los límites disponibles.
    • Actualiza las variables globales de producción y demanda total de gasolina.
    • Calcula la capacidad total disponible de todos los camiones.
    • Calcula el déficit como la diferencia entre la demanda y la capacidad disponible.
    • Distribuye la gasolina:
        ◦ Si hay suficiente gasolina, se distribuye proporcionalmente a los camiones y gasolineras en función de su capacidad.
        ◦ Si no hay suficiente gasolina, distribuye la disponible proporcionalmente.

3. Movimiento de camiones (procedimiento "move-trucks"):
    • Para cada camión:
        ◦ Comprueba si el camión lleva gasolina y si hay alguna gasolinera disponible con capacidad.
        ◦ Si es así, busca la gasolinera más cercana y se desplaza hasta allí, descarga la gasolina y actualiza las capacidades.
        ◦ Si el camión no tiene gasolina, busca el centro de distribución más cercano, se desplaza hasta allí y rellena su depósito.
        ◦ Calcula el tiempo de viaje en función de la velocidad y el estado de carga/descarga.
        ◦ Deduce el consumo de combustible en función de la distancia recorrida y actualiza la capacidad de combustible.
        ◦ Mueve el camión si hay suficiente combustible.

4. Estado del sistema (procedimiento "system-status"):
    • Calcula y reporta varias métricas del estado del sistema, incluyendo producción de gasolina, demanda, distribución, escasez, utilización del almacenamiento y niveles de combustible del camión.

5. Simulación (procedimiento "go"):
    • La simulación se ejecuta durante 1.000 ticks.
    • En cada tick, los camiones mueven y distribuyen gasolina, y se actualiza la capacidad de almacenamiento.
    • En cada tick se imprime el estado del sistema.

