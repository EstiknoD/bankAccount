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

CREATE TABLE targets(
    id INT(11) NOT NULL,
    user_id INT(11),
    target_num TEXT,
    target_pin INT(4)
);

ALTER TABLE targets
    ADD PRIMARY KEY (id);

ALTER TABLE targets
    MODIFY id INT(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT = 1;

DESCRIBE targets;

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