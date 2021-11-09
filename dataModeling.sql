CREATE TABLE users(
    user_id SERIAL PRIMARY KEY,
    user_email VARCHAR(30) NOT NULL UNIQUE,
    user_password VARCHAR(30) NOT NULL,
    user_name VARCHAR(30) NOT NULL,
);

CREATE TABLE recipes(
    recipe_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    recipe_name VARCHAR(30) NOT NULL,
    recipe_instructions TEXT NOT NULL,
    recipe_privacy BOOLEAN NOT NULL
);

CREATE TABLE reipe_ingredients(
    ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id)
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
);

CREATE TABLE ingredients(
    ingredient_id SERIAL PRIMARY KEY,
    ingredient_name VARCHAR(30) NOT NULL,
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
    ingredient_type VARCHAR (30) NOT NULL,
);

CREATE TABLE grocery_lists(
    grocery_list_id SERIAL PRIMARY KEY,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    grocery_list_name VARCHAR(30) NOT NULL,
);

CREATE TABLE grocery_list_ingredients(
    ingredient_id INTEGER NOT NULL REFERENCES ingredients(ingredient_id),
    grocery_list_id INTEGER NOT NULL REFERENCES grocery_lists(grocery_list_id),
);

CREATE TABLE occasions_recipes(
    occasion_id INTEGER NOT NULL REFERENCES occasions(occasion_id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id),
)


CREATE TABLE occasions (
    occasion_id SERIAL PRIMARY KEY,
    occasion_name VARCHAR(30) NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(user_id),
    recipe_id INTEGER NOT NULL REFERENCES recipes(recipe_id)
)


INSERT INTO users (user_email, user_password, user_name)
VALUES ('laurance.vinecnt@gmail.com', 'swordfish', 'LanceVincent');

INSERT INTO recipes(user_id, recipe_name, recipe_instructions, recipe_privacy)
VALUES (1, 'banana bread', 'put banana on bread', true);

INSERT INTO recipe_ingredients(ingredient_id, recipe_id)
VALUES (1, 2);

INSERT INTO ingredients(ingredient_name, ingredient_type)
VALUES ('banana', 'fruit')

INSERT INTO grocery_lists (grocery_list_id, user_name)
VALUES (1, 'LanceVincent');

INSERT INTO grocery_list_ingredients (ingredient_id, grocery_list_id)
VALUES (1, 2);

INSERT INTO occasions (occasion_name, user_id)
VALUES ('BananaRama', 1);

INSERT INTO occasions_recipes (occasion_id, recipe_id)
VALUES (1, 2)