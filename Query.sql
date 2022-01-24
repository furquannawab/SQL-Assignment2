USE sakila;

SHOW FULL TABLES;

-- 1
SELECT COUNT(*) AS 'documentary_count' FROM film AS f, film_category AS fc, category AS c WHERE c.name='Documentary' 
AND (special_features LIKE '%Deleted Scenes%') AND f.film_id=fc.film_id AND fc.category_id=c.category_id;


-- 2
SELECT COUNT(*) AS 'sci-fi_count' FROM category AS c, film_category AS fc, inventory AS i, rental AS r, staff AS s
 WHERE s.first_name='JON' AND s.last_name='STEPHENS' AND c.name='Sci-Fi' AND c.category_id=fc.category_id AND 
 fc.film_id=i.film_id AND i.inventory_id=r.inventory_id AND s.store_id=i.store_id;
 
 
-- 3
SELECT * FROM sales_by_film_category WHERE category='Animation';


-- 4 
SELECT cat.name, COUNT(cat.name) AS category_count FROM customer AS cust, rental AS r, inventory AS i, film_category AS fc, category AS cat WHERE 
cust.first_name='PATRICIA' AND cust.last_name='JOHNSON' AND cust.customer_id=r.customer_id AND 
r.inventory_id=i.inventory_id AND i.film_id=fc.film_id AND fc.category_id=cat.category_id GROUP BY cat.name ORDER BY COUNT(cat.name) DESC 
LIMIT 3;


-- 5
SELECT COUNT(*) AS 'r_rated_count' FROM customer AS c, rental AS r, inventory AS i, film AS f WHERE
 c.first_name='SUSAN' AND c.last_name='WILSON' AND f.rating='R' AND c.customer_id=r.customer_id AND 
 r.inventory_id=i.inventory_id AND i.film_id=f.film_id;
