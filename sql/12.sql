/*
 * List the title of all movies that have both the 'Behind the Scenes' and the 'Trailers' special_feature
 *
 * HINT:
 * Create a select statement that lists the titles of all tables with the 'Behind the Scenes' special_feature.
 * Create a select statement that lists the titles of all tables with the 'Trailers' special_feature.
 * Inner join the queries above.
 */

SELECT DISTINCT t.title
FROM (
    SELECT film.film_id, title
    FROM film
    LEFT JOIN (
        SELECT film.film_id, unnest(special_features) AS feature
        FROM film
    ) f ON (film.film_id = f.film_id AND feature = 'Behind the Scenes')
    WHERE feature IS NOT NULL
) t JOIN (
    SELECT film.film_id, title
    FROM film
    LEFT JOIN (
        SELECT film.film_id, unnest(special_features) AS feature
        FROM film
    ) v ON (film.film_id = v.film_id AND feature = 'Trailers')
    WHERE feature IS NOT NULL
) x USING (film_id)
ORDER BY title;
