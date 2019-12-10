-- create view for 3 columns
CREATE VIEW ActorGenreAvgScore1 AS
SELECT im.actor_1_name, ge.genre, AVG(im.imdb_score), COUNT(*)
FROM imdb im, genre ge
WHERE im.id = ge.imdbid
    AND im.actor_1_name IS NOT NULL
    AND ge.genre IS NOT NULL
GROUP BY im.actor_1_name, ge.genre;

CREATE VIEW ActorGenreAvgScore2 AS
SELECT im.actor_2_name, ge.genre, AVG(im.imdb_score), COUNT(*)
FROM imdb im, genre ge
WHERE im.id = ge.imdbid
    AND im.actor_2_name IS NOT NULL
    AND ge.genre IS NOT NULL
GROUP BY im.actor_2_name, ge.genre;

CREATE VIEW ActorGenreAvgScore3 AS
SELECT im.actor_3_name, ge.genre, AVG(im.imdb_score), COUNT(*)
FROM imdb im, genre ge
WHERE im.id = ge.imdbid
    AND im.actor_3_name IS NOT NULL
    AND ge.genre IS NOT NULL
GROUP BY im.actor_3_name, ge.genre;

-- create table ActorGenreAvgScore
CREATE TABLE ActorGenreAvgScore (
    id SERIAL PRIMARY KEY,
    actor_name VARCHAR,
    genre_name VARCHAR,
    avg_score DOUBLE PRECISION,
    movie_count int
);

-- aggregate 3 views
INSERT INTO ActorGenreAvgScore(actor_name, genre_name, avg_score, movie_count)
SELECT agas1.actor_1_name, agas1.genre, (agas1.avg + agas1.avg + agas1.avg) / 3, (agas1.count + agas1.count + agas1.count)
FROM ActorGenreAvgScore1 agas1, ActorGenreAvgScore2 agas2, ActorGenreAvgScore3 agas3
WHERE agas1.actor_1_name = agas2.actor_2_name
    AND agas2.actor_2_name = agas3.actor_3_name
    AND agas1.genre = agas2.genre
    AND agas2.genre = agas3.genre;


-- CREATE TABLE ActorGenreTotalScore (
--     id SERIAL PRIMARY KEY,
--     actor_name VARCHAR,
--     genre_name VARCHAR,
--     total_score DOUBLE PRECISION,
--     movie_count int
-- );

-- INSERT INTO ActorGenreTotalScore(actor_name, genre_name, avg_score, movie_count)
-- SELECT im.actor_1_name, ge.genre, AVG(im.imdb_score), COUNT(*)
-- FROM imdb im, genre ge
-- WHERE im.id = ge.imdbid
--     AND im.actor_1_name IS NOT NULL
--     AND ge.genre IS NOT NULL
-- GROUP BY im.actor_1_name, ge.genre;

-- INSERT INTO ActorGenreTotalScore(actor_name, genre_name, total_score, movie_count)
-- SELECT im.actor_1_name AS an, ge.genre AS gn, SUM(im.imdb_score) AS ts, COUNT(*) AS mc
-- FROM imdb im, genre ge
-- WHERE im.id = ge.imdbid
--     AND im.actor_1_name IS NOT NULL
--     AND ge.genre IS NOT NULL
-- GROUP BY im.actor_1_name, ge.genre
-- ON CONFLICT (actor_name, genre_name) DO UPDATE 
--     SET ActorGenreTotalScore.total_score = ActorGenreTotalScore.total_score + ts,
--         ActorGenreTotalScore.movie_count = ActorGenreTotalScore.movie_count + mc;
