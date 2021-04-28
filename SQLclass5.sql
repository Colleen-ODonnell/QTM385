USE sakila;
DESC film;

SELECT title, description, rating
FROM film
LIMIT 30;

/* CASE WHEN is like IF statement */
/* END finishes the clause */
SELECT rating, 
CASE WHEN rating IN ('R', 'NC-17') THEN 'Young Adults Only'
ELSE 'General Audience' END AS rating2 
FROM film;
/* created new variable rating2 */
/* once you use CASE WHEN once, just use when after */

SELECT title, description, rating, 
CASE WHEN rating = 'R' THEN 'R-rated movie'
WHEN rating = 'NC-17' THEN 'Not for 17 yo or younger'
WHEN rating = 'PG' THEN 'Parental Guidance'
WHEN rating = 'PG-13' THEN 'Parental Guidance 13'
ELSE 'General' END AS rating2,
CASE WHEN rating IN ('R', 'NC-17') THEN 'Young Adults Only'
ELSE 'General Audience' END AS rating3
FROM film;

/* check payment table, amount CASE WHEN when amount > 9, 
put large, otherwise put small */
DESC payment;
SELECT customer_id, amount,
CASE WHEN amount > 9 THEN 'large'
ELSE 'small' END AS payment_large
FROM payment;

/* table counting number of large and small payments */
SELECT CASE WHEN amount > 9 THEN 'Large'
ELSE 'Small' END AS payment_large, count(*) AS num_payments
FROM payment
GROUP BY payment_large;

SELECT rating, CASE WHEN rating IN
('R', 'NC-17') THEN 'Restricted Audience'
WHEN rating = 'PG-13' THEN '13 years or older'
ELSE 'General Audience' END AS rating2
FROM film;

SELECT CASE WHEN amount > 9 THEN 'Large'
WHEN amount < 3 THEN 'Small'
ELSE 'Medium' END AS payment_code, 
count(*) AS num_payments
FROM payment
GROUP BY payment_code;

/* to put toegther 2 variables: CONCAT */
/* say you wanted to combine first and last name */
SELECT actor_id, 
concat(first_name, ' ', last_name) AS actor_full_name
FROM actor
ORDER BY last_name;

SELECT customer_id,
concat(first_name, ' ', last_name) AS customer_full_name
FROM customer
ORDER BY last_name;

/* functions in SQL that convert characters to all upper 
or all lower case */
SELECT customer_id, lower(email),upper(first_name),
concat(first_name, ' ', last_name) AS customer_full_name
FROM customer
ORDER BY last_name;

/* incorporating joins */
SELECT s.first_name, s.last_name,
a.address, a.district, a.postal_code,
a.city_id
FROM staff AS s /*left dataset*/
LEFT JOIN address AS a /*right dataset */
ON s.address_id = a.address_id;

/* don't have to include aliases a and s if the column names are
unique */
SELECT first_name, last_name, address, district, postal_code, city_id
FROM staff AS s
LEFT JOIN address AS a
ON s.address_id = a.address_id;

/* can just write USING address_id if address_id column name is the
same in both tables*/
SELECT first_name, last_name, address, district, postal_code, city_id
FROM staff AS s
LEFT JOIN address AS a
USING(address_id);

/* can join as many tables as you want */
/* after left join write column you want to add on */
SELECT first_name, last_name, a.address, postal_code, ct.city, co.country
FROM customer AS c
LEFT JOIN address AS a
USING(address_id)
LEFT JOIN city as ct
ON a.city_id = ct.city_id
LEFT JOIN country as co
ON ct.country_id = co.country_id;






