-- Get the top [top_k] directors with highest score in [input_genre_name] movies
-- They must have at least [input_min_count] movies.
CREATE OR REPLACE FUNCTION
    getTopDirectorsOfGenre(input_genre_name VARCHAR, input_min_count INTEGER, top_k INTEGER)
    RETURNS TABLE (
        -- Columns returned by the function
        director_name VARCHAR,
        avg_score DOUBLE PRECISION
    ) AS
$$
DECLARE
    getTopDirectorsQuery TEXT;

BEGIN

    getTopDirectorsQuery = '
        SELECT director_name, avg_score
        FROM DirectorGenreAvgScore
        WHERE genre_name = ' || QUOTE_LITERAL(input_genre_name)
        || ' AND movie_count >= ' || input_min_count
        || ' ORDER BY avg_score DESC
        LIMIT ' || top_k;

    RETURN QUERY EXECUTE getTopDirectorsQuery;

END;
$$
LANGUAGE plpgsql;
