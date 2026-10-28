/*
 * List the name of all actors who have appeared in a movie that has the 'Behind the Scenes' special_feature
 */

SELECT DISTINCT actor.first_name || ' ' ||  actor.last_name AS "Actor Name"
FROM film_actor
JOIN actor USING (actor_id) 
LEFT JOIN (
    SELECT film_actor.actor_id, unnest(special_features) AS feature
    FROM film
    JOIN film_actor USING (film_id)
) f ON (actor.actor_id = f.actor_id AND feature = 'Behind the Scenes')
WHERE feature IS NOT NULL
ORDER BY "Actor Name";

