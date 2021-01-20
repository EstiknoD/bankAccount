import random
import MySQLdb

miConexion = MySQLdb.connect( host='localhost', user= 'root', passwd='David2007', db='bankaccount' )
cursor = miConexion.cursor()

cantitate = int(input("Pon la cantidad de dolares que quieres que haya en el cheque: "))
fromperson = input("Quien ha hecho el cheque?: ")
code = random.randint(50000, 500000000000000)
pin = random.randint(1000, 9999)

### Ver si hay otro numero de check igual ###
cursor.execute('SELECT * FROM checks WHERE code = ' + str(code))

results = cursor.fetchall()

if(len(results) > 0):
    while(True):
        num = random.randint(50000, 500000000000000)
        if(len(results) == 0):
            break

## Insertar los datos de la nueva targeta ###
print(f'INSERT INTO checks(cantitate, from_person, code, pin) VALUES({str(cantitate)}, {fromperson}, {str(code)}, {str(pin)})')

cursor.execute(f'INSERT INTO checks(cantitate, from_person, code, pin) VALUES({str(cantitate)}, {fromperson}, {str(code)}, {str(pin)})')

miConexion.commit()

### Cerrar la conexion con la base de datos ###

print('Se creo el cheque exitosamente')

print('El codigo es: ' + code)
print('El pin es: ' + pin)

miConexion.close()