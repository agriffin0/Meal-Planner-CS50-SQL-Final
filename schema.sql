-- Ingredients table stores all possible ingredients, descriptors about them, if they are in stock, and their price per serving
CREATE TABLE IF NOT EXISTS "ingredients"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "ingredient" TEXT NOT NULL,
    "category" TEXT NOT NULL,
    "section" TEXT NOT NULL,
    "in_stock" TEXT NOT NULL,
    "price" NUMERIC
);

-- Recipes includes the names and other important information about your recipes
CREATE TABLE IF NOT EXISTS "recipes" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "dish" TEXT NOT NULL,
    "cook_time" INTEGER NOT NULL,
    "meal" TEXT NOT NULL,
    "type" TEXT NOT NULL
);

-- Connections stores relationships between ingredient & recipe ID numbers
CREATE TABLE IF NOT EXISTS "connections"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "ingredient_id" INTEGER,
    "recipe_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id"),
    FOREIGN KEY("recipe_id") REFERENCES "recipes"("id")
);

-- Logs stores the recipes you'll be shopping for on a given date
CREATE TABLE IF NOT EXISTS "logs"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "date" DATE,
    "recipe_id" INTEGER,
    FOREIGN KEY("recipe_id") REFERENCES "recipes"("id")
);

-- The List view contains all out-of-stock ingredients and their grocery store location for meals that you've decided to cook this week, sorted by section
CREATE VIEW "list" AS
    SELECT "ingredient", "section" FROM "ingredients"
    JOIN "connections" ON "connections"."ingredient_id" = "ingredients"."id"
    JOIN "logs" ON "logs"."recipe_id" = "connections"."recipe_id"
    WHERE "in_stock" = 'no'
    AND "logs"."date" = (SELECT DATE('now'))
    ORDER BY "section";
