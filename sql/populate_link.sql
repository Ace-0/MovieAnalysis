CREATE TABLE link (
    linkid SERIAL PRIMARY KEY,
    imdbid INT,
    movielensid INT
);

INSERT INTO link(imdbid, movielensid)
SELECT im.id, ml.id
FROM imdb im, movielens ml
WHERE im.movie_title = ml.title;

--> 4711
