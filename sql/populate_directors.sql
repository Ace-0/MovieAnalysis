CREATE TABLE director (
    name VARCHAR PRIMARY KEY,
    facebook_likes INT
);

INSERT INTO director(name, facebook_likes)
SELECT im.director_name, SUM(im.director_facebook_likes)
FROM imdb im
WHERE im.director_name IS NOT NULL
GROUP BY im.director_name;

--> 2398
