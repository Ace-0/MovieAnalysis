-- Get the top [top_k] actors with highest score in [input_genre_name] movies
-- They must have at least [input_min_count] movies.
CREATE OR REPLACE FUNCTION
    getTopActorsOfGenre(input_genre_name VARCHAR, input_min_count INTEGER, top_k INTEGER)
    RETURNS TABLE (
        -- Columns returned by the function
        actor_name VARCHAR,
        avg_score DOUBLE PRECISION
    ) AS
$$
DECLARE
    getTopActorsQuery TEXT;

BEGIN

    getTopActorsQuery = '
        SELECT actor_name, avg_score
        FROM ActorGenreAvgScore
        WHERE genre_name = ' || QUOTE_LITERAL(input_genre_name)
        || ' AND movie_count >= ' || input_min_count
        || ' ORDER BY avg_score DESC
        LIMIT ' || top_k;

    RETURN QUERY EXECUTE getTopActorsQuery;

END;
$$
LANGUAGE plpgsql;
