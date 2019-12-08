CREATE TABLE ratings (
    USERID integer,
    MOVIEID integer,
    RATING double precision,
    TIMESTAMP bigint)
;

\COPY ratings FROM 'ratings.csv' DELIMITERS ',' CSV HEADER;

-->COPY 100004

ALTER TABLE ratings ADD COLUMN id SERIAL PRIMARY KEY;
