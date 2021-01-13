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