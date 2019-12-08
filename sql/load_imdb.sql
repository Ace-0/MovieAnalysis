CREATE TABLE imdb (
    DIRECTOR_NAME varchar,
    NUM_CRITIC_FOR_REVIEWS integer,
    DURATION integer,
    DIRECTOR_FACEBOOK_LIKES integer,
    ACTOR_3_FACEBOOK_LIKES integer,
    ACTOR_2_NAME varchar,
    ACTOR_1_FACEBOOK_LIKES integer,
    GROSS double precision,
    GENRES varchar,
    ACTOR_1_NAME varchar,
    MOVIE_TITLE varchar,
    NUM_VOTED_USERS integer,
    CAST_TOTAL_FACEBOOK_LIKES integer,
    ACTOR_3_NAME varchar,
    FACENUMBER_IN_POSTER integer,
    PLOT_KEYWORDS varchar,
    NUM_USER_FOR_REVIEWS integer,
    LANGUAGE varchar, COUNTRY varchar,
    CONTENT_RATING varchar,
    BUDGET bigint,
    TITLE_YEAR integer,
    ACTOR_2_FACEBOOK_LIKES integer,
    IMDB_SCORE double precision,
    ASPECT_RATIO double precision,
    MOVIE_FACEBOOK_LIKES integer
);

\COPY imdb FROM 'imdb.csv' DELIMITERS ',' CSV HEADER;

--> COPY 5043

ALTER TABLE imdb ADD COLUMN id SERIAL PRIMARY KEY;
