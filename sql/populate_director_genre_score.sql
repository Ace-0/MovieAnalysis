CREATE TABLE DirectorGenreAvgScore (
    id SERIAL PRIMARY KEY,
    director_name VARCHAR,
    genre_name VARCHAR,
    avg_score DOUBLE PRECISION,
    movie_count int
);

INSERT INTO DirectorGenreAvgScore(director_name, genre_name, avg_score, movie_count)
SELECT im.director_name, ge.genre, AVG(im.imdb_score), COUNT(*)
FROM imdb im, genre ge
WHERE im.id = ge.imdbid
    AND im.director_name IS NOT NULL
    AND ge.genre IS NOT NULL
GROUP BY im.director_name, ge.genre;