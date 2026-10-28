/*
 * This problem is the same as 07.sql,
 * but instead of using the NOT IN operator, you are to use a LEFT JOIN.
 */

SELECT DISTINCT f.title
FROM film f
JOIN inventory i USING (film_id)
JOIN rental    r USING (inventory_id)
LEFT JOIN (
    SELECT DISTINCT i2.film_id
    FROM inventory i2
    JOIN rental   r2 USING (inventory_id)
    JOIN customer c2 USING (customer_id)
    JOIN address  a2 USING (address_id)
    JOIN city    ci2 USING (city_id)
    JOIN country co2 USING (country_id)
    WHERE co2.country = 'United States'
) us ON us.film_id = f.film_id
WHERE us.film_id IS NULL
ORDER BY f.title;
