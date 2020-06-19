USE oc_pizza;
-- Pizzeria
INSERT INTO oc_pizza_localisation (address, city, phone) VALUES ("Adresse-pizzeria-1", "Ville-pizzeria-1", "11111111111");
INSERT INTO oc_pizza_pizzeria (_localisation_id, name, description) VALUES (1, "Nom-pizzeria-1", "Description-pizzeria-1");
-- User 1 - Client
INSERT INTO oc_pizza_localisation (address, city, phone) VALUES ("Adresse-User-1", "Ville-User-1", "11111111112");
INSERT INTO oc_pizza_user (_localisation_id, _pizzeria_id, account_type, first_name, last_name, email) VALUES (2, 1, "Client", "Prénom-User-1", "Nom-User-1", "Email-User-1");
-- User 2 - Livreur
INSERT INTO oc_pizza_localisation (address, city, phone) VALUES ("Adresse-User-2", "Ville-User-2", "11111111113");
INSERT INTO oc_pizza_user (_localisation_id, _pizzeria_id, account_type, first_name, last_name) VALUES (3, 1, "Livreur", "Prénom-User-2", "Nom-User-2");
-- User 3 - Pizzaiolo
INSERT INTO oc_pizza_localisation (address, city, phone) VALUES ("Adresse-User-3", "Ville-User-3", "11111111114");
INSERT INTO oc_pizza_user (_localisation_id, _pizzeria_id, account_type, first_name, last_name) VALUES (4, 1, "Pizzaiolo", "Prénom-User-3", "Nom-User-3");
-- User 4 - Responsable
INSERT INTO oc_pizza_localisation (address, city, phone) VALUES ("Adresse-User-4", "Ville-User-4", "11111111115");
INSERT INTO oc_pizza_user (_localisation_id, _pizzeria_id, account_type, first_name, last_name) VALUES (5, 1, "Responsable", "Prénom-User-4", "Nom-User-4");
-- Pizza
INSERT INTO oc_pizza_pizza (name, price, recipe) VALUES ("Nom-Pizza-1", 12.0, "Recette-Pizza-1");
INSERT INTO oc_pizza_pizza (name, price, recipe) VALUES ("Nom-Pizza-2", 13.0, "Recette-Pizza-2");
-- Old Order
INSERT INTO oc_pizza_order (_user_id, paid, to_deliver, ordered_ts, status, end_ts) VALUES (1, 0, 1, 1592492400, 4, 1592494200);
-- Order
INSERT INTO oc_pizza_order (_user_id, paid, to_deliver, ordered_ts) VALUES (1, 1, 1, 1592568913);
-- Ingredient
INSERT INTO oc_pizza_ingredient (name) VALUES ("Ingredient-1");
INSERT INTO oc_pizza_ingredient (name) VALUES ("Ingredient-2");
INSERT INTO oc_pizza_ingredient (name) VALUES ("Ingredient-3");
-- Order_Pizzeria
INSERT INTO oc_pizza_pizzeria_order (_pizzeria_id, _order_id) VALUES (1, 1);
INSERT INTO oc_pizza_pizzeria_order (_pizzeria_id, _order_id) VALUES (1, 2);
-- Order_Pizza
INSERT INTO oc_pizza_order_pizza (_order_id, _pizza_id, quantity) VALUES (1, 1, 1);
INSERT INTO oc_pizza_order_pizza (_order_id, _pizza_id, quantity) VALUES (1, 2, 1);
INSERT INTO oc_pizza_order_pizza (_order_id, _pizza_id, quantity) VALUES (2, 1, 2);
-- Pizza_Ingredient
INSERT INTO oc_pizza_pizza_ingredient (_ingredient_id, _pizza_id, quantity) VALUES (1, 1, 30.0);
INSERT INTO oc_pizza_pizza_ingredient (_ingredient_id, _pizza_id, quantity) VALUES (2, 1, 10.0);
INSERT INTO oc_pizza_pizza_ingredient (_ingredient_id, _pizza_id, quantity) VALUES (1, 2, 30.0);
INSERT INTO oc_pizza_pizza_ingredient (_ingredient_id, _pizza_id, quantity) VALUES (2, 2, 15.0);
INSERT INTO oc_pizza_pizza_ingredient (_ingredient_id, _pizza_id, quantity) VALUES (3, 2, 8.5);
-- Stock
INSERT INTO oc_pizza_stock (_ingredient_id, _pizzeria_id, quantity) VALUES (1, 1, 500.0);
INSERT INTO oc_pizza_stock (_ingredient_id, _pizzeria_id, quantity) VALUES (2, 1, 200.0);
INSERT INTO oc_pizza_stock (_ingredient_id, _pizzeria_id, quantity) VALUES (3, 1, 375.0);