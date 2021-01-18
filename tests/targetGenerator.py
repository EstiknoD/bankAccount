import random
import MySQLdb

miConexion = MySQLdb.connect( host='localhost', user= 'root', passwd='David2007', db='bankaccount' )
cursor = miConexion.cursor()

id = int(input("Pon el usuario de la targeta (pon 0 si no quieres que aparezca): "))
num = random.randint(50000, 500000000000000)
pin = random.randint(1000, 9999)

### Ver si hay otro numero de targeta igual ###
cursor.execute('SELECT * FROM targets WHERE target_num = ' + str(num))

results = cursor.fetchall()

if(len(results) > 0):
    while(True):
        num = random.randint(50000, 500000000000000)
        if(len(results) == 0):
            break

## Insertar los datos de la nueva targeta ###

print(pin)
print(id)

if(id == 0):
    cursor.execute(f'INSERT INTO targets(user_id, target_num, target_pin) VALUES (NULL, {str(num)}, {str(pin)})')
else:
    cursor.execute(f'INSERT INTO targets(user_id, target_num, target_pin) VALUES ({str(id)}, {str(num)}, {str(pin)})')

miConexion.commit()

### Cerrar la conexion con la base de datos ###

print('Se creo la targeta exitosamente')

miConexion.close()