CREATE TABLE actor (
    name VARCHAR PRIMARY KEY,
    facebook_likes INT
);

INSERT INTO actor(name, facebook_likes)
SELECT allactors.name, 0
FROM (
    SELECT actor_1_name AS name FROM imdb WHERE imdb.actor_1_name IS NOT NULL
    UNION
    SELECT actor_2_name AS name FROM imdb WHERE imdb.actor_2_name IS NOT NULL
    UNION
    SELECT actor_3_name AS name FROM imdb WHERE imdb.actor_3_name IS NOT NULL
) AS allactors;

UPDATE actor
SET facebook_likes = facebook_likes + im.actor_1_facebook_likes
FROM imdb im
WHERE name = im.actor_1_name;

UPDATE actor
SET facebook_likes = facebook_likes + im.actor_2_facebook_likes
FROM imdb im
WHERE name = im.actor_2_name;

UPDATE actor
SET facebook_likes = facebook_likes + im.actor_3_facebook_likes
FROM imdb im
WHERE name = im.actor_3_name;

--> 6255