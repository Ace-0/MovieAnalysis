CREATE TABLE movielens (
    ADULT boolean,
    BUDGET bigint,
    ID integer PRIMARY KEY,
    IMDB_ID varchar,
    ORIGINAL_LANGUAGE varchar,
    ORIGINAL_TITLE varchar,
    POPULARITY double precision,
    RELEASE_DATE varchar,
    REVENUE bigint,
    RUNTIME integer,
    STATUSs varchar,
    TITLE varchar,
    VOTE_AVERAGE double precision,
    VOTE_COUNT integer
);

\COPY movielens FROM 'movielens_cleaned.csv' DELIMITERS ',' CSV HEADER;

--> COPY 31965