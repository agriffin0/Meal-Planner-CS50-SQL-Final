-- In this SQL file, write (and comment!) the typical SQL queries users will run on your database

-- Add new recipe to database
INSERT INTO "recipes" ("dish", "cook_time", "meal", "type")
VALUES ("omelet", "15", "breakfast", "n/a");

-- Add new ingredient to database
INSERT INTO "ingredients" ("ingredient", "category", "section", "in_stock", "price")
VALUES ('eggs', 'dairy', 'dairy', 'yes', '.25');

-- Add new ingredient to a recipe
INSERT INTO "connections" ("ingredient_id", "recipe_id")
VALUES ('12', '5');

-- Add new meal to weekly meal plan
INSERT INTO "logs" ("date", "recipe_id")
VALUES (date(), '3');

-- Select all ingredients in a sushi bowl
SELECT "ingredient" FROM "ingredients"
JOIN "connections" ON "connections"."ingredient_id" = "ingredients"."id"
JOIN "recipes" ON "connections"."recipe_id" = "recipes"."id"
WHERE "recipes"."dish" = 'sushi bowl';

-- Choose random dinner idea
SELECT "dish" FROM "recipes"
WHERE "meal" = 'dinner'
ORDER BY RANDOM()
LIMIT 1;

-- List all Japanese dishes in database
SELECT "dish" FROM "recipes"
WHERE "type" = 'japanese';

-- Populate a grocery list with only the items needed
SELECT * FROM "list";

-- Obtain total price per serving to make sushi bowl
SELECT SUM("price") FROM "ingredients"
JOIN "connections" ON "connections"."ingredient_id" = "ingredients"."id"
JOIN "recipes" ON "connections"."recipe_id" = "recipes"."id"
WHERE "recipes"."dish" = 'sushi bowl'
GROUP BY "dish";

------------------

-- Populate Tables (for quick start and/or testing)
INSERT INTO "ingredients" ("ingredient", "category", "section", "in_stock", "price")
VALUES
('chicken', 'meat', 'meat', 'yes', '1'),
('rice', 'grain', 'dry goods', 'yes', '.05'),
('lettuce', 'vegetable', 'produce', 'no', '.25'),
('imitation crab', 'seafood', 'meat', 'yes', '1'),
('edamame', 'vegetable', 'frozen', 'yes', '.50'),
('SPAM', 'meat', 'canned goods', 'yes', '.75'),
('milk', 'dairy', 'dairy', 'yes', '.25'),
('parmesan', 'cheese', 'dairy', 'yes', '.50'),
('pasta', 'pasta', 'international', 'yes', '.5'),
('cucumbers', 'vegetable', 'produce', 'yes', '.50'),
('potato rolls', 'baked goods', 'baked goods', 'no', '.50');

INSERT INTO "recipes" ("dish", "cook_time", "meal", "type")
VALUES
('chicken & rice guys', '60', 'dinner', 'mediterranean'),
('sushi bowl', '15', 'lunch', 'japanese'),
('SPAM kebabs', '15', 'dinner', 'hawaiian'),
('spaghetti', '20', 'dinner', 'italian');

INSERT INTO "connections" ("ingredient_id", "recipe_id")
VALUES
('1', '1'),
('2', '1'),
('3', '1'),
('2', '2'),
('4', '2'),
('5', '2'),
('6', '3'),
('11', '3'),
('8', '4'),
('9', '4');

INSERT INTO "logs" ("date", "recipe_id")
VALUES
('2024-04-05', '1'),
('2024-04-05', '2');
