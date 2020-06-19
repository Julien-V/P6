CREATE DATABASE oc_pizza DEFAULT CHARACTER SET utf8;
USE oc_pizza;
CREATE TABLE oc_pizza_localisation (
	id int AUTO_INCREMENT NOT NULL,
	address text NOT NULL,
	city text NOT NULL,
	phone text NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_pizzeria (
	id int AUTO_INCREMENT NOT NULL,
	_localisation_id int,
	name text NOT NULL,
	description text NOT NULL,
	CONSTRAINT fk_pizzeria_localisation_id
		FOREIGN KEY (_localisation_id) REFERENCES oc_pizza_localisation(id)
		ON DELETE SET NULL,
	UNIQUE (_localisation_id),
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_user (
	id int AUTO_INCREMENT NOT NULL,
	_localisation_id int,
	_pizzeria_id int,
	account_type ENUM('Client', 'Livreur', 'Pizzaiolo', 'Responsable') NOT NULL,
	first_name text NOT NULL,
	last_name text NOT NULL,
	email text,
	CONSTRAINT fk_user_localisation_id
		FOREIGN KEY (_localisation_id) REFERENCES oc_pizza_localisation(id)
		ON DELETE SET NULL,
	CONSTRAINT fk_user_pizzeria_id
		FOREIGN KEY (_pizzeria_id) REFERENCES oc_pizza_pizzeria(id)
		ON DELETE SET NULL,
	UNIQUE (_localisation_id),
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_order (
	id int AUTO_INCREMENT NOT NULL,
	_user_id int NOT NULL,
	paid boolean NOT NULL,
	to_deliver boolean NOT NULL,
	ordered_ts int NOT NULL,
	status int,
	end_ts int,
	CONSTRAINT fk_order_user_id
		FOREIGN KEY (_user_id) REFERENCES oc_pizza_user(id)
		ON DELETE CASCADE,
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_ingredient (
	id int AUTO_INCREMENT NOT NULL,
	name text NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_pizza (
	id int AUTO_INCREMENT NOT NULL,
	name text NOT NULL,
	price float NOT NULL,
	recipe text NOT NULL,
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_pizzeria_order (
	id int AUTO_INCREMENT NOT NULL,
	_pizzeria_id int NOT NULL,
	_order_id int NOT NULL,
	CONSTRAINT fk_p_o_pizzeria_id
		FOREIGN KEY (_pizzeria_id) REFERENCES oc_pizza_pizzeria(id)
		ON DELETE CASCADE,
	CONSTRAINT fk_p_o_order_id
		FOREIGN KEY (_order_id) REFERENCES oc_pizza_order(id)
		ON DELETE CASCADE,
	PRIMARY KEY (id)
);
CREATE TABLE oc_pizza_order_pizza (
	_order_id int NOT NULL,
	_pizza_id int NOT NULL,
	quantity int NOT NULL,
	CONSTRAINT fk_o_p_order_id
		FOREIGN KEY (_order_id) REFERENCES oc_pizza_order(id)
		ON DELETE CASCADE,
	CONSTRAINT fk_o_p_pizza_id
		FOREIGN KEY (_pizza_id) REFERENCES oc_pizza_pizza(id)
		ON DELETE CASCADE,
	PRIMARY KEY (_order_id, _pizza_id)
);
CREATE TABLE oc_pizza_pizza_ingredient (
	_ingredient_id int NOT NULL,
	_pizza_id int NOT NULL,
	quantity float NOT NULL,
	CONSTRAINT fk_p_i_ingredient_id
		FOREIGN KEY (_ingredient_id) REFERENCES oc_pizza_ingredient(id)
		ON DELETE CASCADE,
	CONSTRAINT fk_p_i_pizza_id
		FOREIGN KEY (_pizza_id) REFERENCES oc_pizza_pizza(id)
		ON DELETE CASCADE,
	PRIMARY KEY (_ingredient_id, _pizza_id)
);
CREATE TABLE oc_pizza_stock (
	_ingredient_id int NOT NULL,
	_pizzeria_id int NOT NULL,
	quantity float,
	CONSTRAINT fk_stock_ingredient_id
		FOREIGN KEY (_ingredient_id) REFERENCES oc_pizza_ingredient(id)
		ON DELETE CASCADE,
	CONSTRAINT fk_stock_pizzeria_id
		FOREIGN KEY (_pizzeria_id) REFERENCES oc_pizza_pizzeria(id)
		ON DELETE CASCADE,
	PRIMARY KEY (_ingredient_id, _pizzeria_id)
);