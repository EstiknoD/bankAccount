# BankAccount

Este es un proyecto en el que podras tener un banco virtual para simular acciones reales.

## Tabla de contenidos:
---

- [Pre requisitos](#pre-requisitos)
- [Instalación](#instalación)
- [Ejecutando el programa](#ejecutando-el-programa)
- [Licencia](#licencia)

### Pre-requisitos

Necessitas Nodejs para poder utilizar el programa y mysql como gestor de bases de datos.

### Instalación

Cuando tengas el repositorio clonado simplemente abres la carpeta de este en una terminal y ejecutas los siguientes comandos.

```
cd bankAccount

npm i
```

Luego habres mysql en una terminal como **root** y ejecutas los siguientes comando para crear la base de datos, estos tambien los tendras en una carpeta del proyecto llamada **database** en el fichero **db.sql**.

```
CREATE DATABASE bankaccount;

USE bankaccount;

--users table
CREATE TABLE users(
    id INT(11) NOT NULL,
    username VARCHAR(16) NOT NULL,
    password VARCHAR(60) NOT NULL,
    fullname VARCHAR(100) NOT NULL
);

ALTER TABLE users
    ADD PRIMARY KEY (id);

ALTER TABLE users
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE users;

--Accounts tables

CREATE TABLE mainAccount(
    id INT(11) NOT NULL,
    money INT(11) NOT NULL,
    user_id INT(11),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE mainAccount
    ADD PRIMARY KEY (id);

ALTER TABLE mainAccount
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE mainAccount;

CREATE TABLE saveAccount(
    id INT(11) NOT NULL,
    money INT(11) NOT NULL,
    user_id INT(11),
    CONSTRAINT fl_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE saveAccount
    ADD PRIMARY KEY (id);

ALTER TABLE saveAccount
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE saveAccount;

CREATE TABLE expenses(
    id INT(11) NOT NULL,
    user_id INT(11),
    for_person VARCHAR(16),
    cantitate INT(11),
    CONSTRAINT fh_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE expenses
    ADD PRIMARY KEY (id);

ALTER TABLE expenses
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE expenses;

CREATE TABLE inserts(
    id INT(11) NOT NULL,
    user_id INT(11),
    from_person VARCHAR(60) NOT NULL,
    cantitate INT(11) NOT NULL,
    CONSTRAINT fr_user FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE inserts
    ADD PRIMARY KEY (id);

ALTER TABLE inserts
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE inserts;

CREATE TABLE checks(
    id INT(11) NOT NULL,
    cantitate INT(11) NOT NULL,
    from_person TEXT NOT NULL,
    code TEXT NOT NULL,
    pin INT(11) NOT NULL
);

ALTER TABLE checks
    ADD PRIMARY KEY (id);

ALTER TABLE checks
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE checks;
```

Para terminar tendras que abri el archivo **keys.js** en la carpeta **src** y modificar la contraseña y poner la que tienes, en mi caso he puesto una de prueba.

Y con esto ya tendras el programa listo para funcionar.

## Ejecutando el programa

Para poder ejecutarlo tienes que ir a la carpeta raiz del proyecto y ejecutar el siguiente comando:

```
node src/index.js
```

Algo importante es que despues de ejecutar el programa, crear cuentas y iniciar en ellas en tu base de datos se te habra creado una nueva tabla llamada **sessions**, esto es normal y no tienes que borrarla ni tocar nada para prevenir errores.

En la terminal te dira en que puerto esta corriendo el programa, simplemente vas al navegador y pones:

```
localhost: (numero del puerto que te ha salido)
```

Y ya estaras utilizando el programa, ojo esto sirve si lo ejecutas en tu ordenado, si lo ejecutas en otro (que es la gracia del proyecto) tienes que poner la ip del ordenador junto al puertom, tal que asi:

```
(ip del ordenador servidor):(numero del puerto que te ha salido)
```

## Licencia 
---
[LICENCIA](https://github.com/EstiknoD/bankAccount/blob/master/LICENSE.md)
