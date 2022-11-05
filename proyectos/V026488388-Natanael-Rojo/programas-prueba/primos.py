num = int(input('Ingrese un numero: '))
aux = 0

for i in range(1, num + 1):
    if num % i == 0:
        aux += 1

if aux == 1 or aux == 2:
    print('El numero es primo')
else:
    print('El numero no es primo')
