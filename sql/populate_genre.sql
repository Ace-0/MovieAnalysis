CREATE TABLE genre (
    imdbid int, 
    genre VARCHAR
);

INSERT INTO genre(imdbid, genre)
SELECT im.id, s.genre
FROM imdb im, unnest(string_to_array(im.genres, '|')) s(genre);
