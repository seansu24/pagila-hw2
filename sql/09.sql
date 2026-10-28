/*
 * Count the number of movies that contain each type of special feature.
 * Order the results alphabetically be the special_feature.
 */

SELECT feature as special_features, count(feature) 
FROM (
    SELECT unnest(special_features) as feature
    FROM film
) as f
GROUP BY feature
ORDER BY special_features;
