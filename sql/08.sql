/*
 * Select the title of all 'G' rated movies that have the 'Trailers' special feature.
 * Order the results alphabetically.
 *
 * HINT:
 * Use `unnest(special_features)` in a subquery.
 */

SELECT title
FROM (
    SELECT title, rating, unnest(special_features) as feature
    FROM film
) as f
WHERE rating = 'G' AND feature = 'Trailers'
ORDER BY title;
