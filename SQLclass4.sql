USE sakila;

/* can order by multiple variables */
SELECT first_name, last_name
	FROM actor
	ORDER BY first_name, last_name;
/* ORDER BY doesn't change the nature of the table, WHERE does (filtering) */

DESC film;

/* how many ratings you have for each options */
/* group by */
SELECT rating, count(*)
	FROM film
    GROUP BY rating;
/* can't just do select rating group by, need a function too */

/* compute the average payment and the number of rental frequency
for each customer ordering by average payment */
DESC payment;
SELECT customer_id, count(*) AS nrentals,
	AVG(amount) AS avgpayments,
    SUM(amount) AS totrevenue
    FROM payment
    GROUP BY customer_id
    ORDER BY avgpayments;
    
/* HAVING: extra layer of filter to results */
/* only display cases where there are more than 200 movies */
/* so would only display NC-17, PG-13 */
SELECT rating, count(*) AS n_movies
	FROM film
    GROUP BY rating
    HAVING n_movies > 200;

/* only want people who rented less than 30 movies */
SELECT customer_id, count(*) AS nrentals,
	AVG(amount) AS avgpayments,
    SUM(amount) AS totrevenue
    FROM payment
    GROUP BY customer_id
    HAVING nrentals < 30
    ORDER BY avgpayments;
/* ORDER BY must go at end if including */
/* use HAVING instead of WHERE b/c nrentals variable only exists
after created it, WHERE works before GROUP BY but not after */

SELECT customer_id, count(*) AS nrentals,
	AVG(amount) AS avgpayments,
    SUM(amount) AS totrevenue
    FROM payment
    WHERE amount > 5 
    GROUP BY customer_id
    HAVING nrentals < 30
    ORDER BY avgpayments;
/* this is different than other query since we filtered before 
GROUP BY */

/* Joins */
DESC staff;
DESC payment;

/* create table that has each country and film category */
/* cartesian products: match a-c, a-d, b-c, b-d */
/* call t1.variable */
SELECT t1.country, t2.name AS category
	FROM country t1
    JOIN category t2;

/* do a cartesian product between language and category datasets */
DESC language;
DESC category;
SELECT t2.name AS language_name, t1.name AS category
	FROM category t1
    JOIN language t2;

/* inner join - selects only the middle - the overlap/match */
/* does not keep anything that is unmatched */
SELECT * FROM customer; /* has customer id */

SELECT * FROM payment; /* also has customer id */


/* create table that adds name of customer to table */
SELECT t1.customer_id, t1.payment_id, t1.amount, t2.first_name, t2.last_name
	FROM payment t1 
    JOIN customer t2
	ON t1.customer_id = t2.customer_id;

/* match the name of the employee that provided service for customer */
SELECT * FROM staff;
SELECT t1.staff_id, t1.payment_id, t1.amount, t2.first_name AS staff_fn,
 t2.last_name AS staff_ln
	FROM payment t1 
    JOIN staff t2
	ON t1.staff_id = t2.staff_id;
/* without the ON it just does cartesian join */

/* other way to do inner join - 'USING': */
SELECT t1.staff_id, t1.payment_id, t1.amount, t2.first_name AS staff_fn,
 t2.last_name AS staff_ln
	FROM payment t1 
    INNER JOIN staff t2
	USING(staff_id);

/* right join: all of intersection plus right table */
SELECT c.first_name, c.last_name, c.address_id, ad.address, ad.postal_code
	FROM customer c
    RIGHT JOIN address ad
    ON c.address_id = ad.address_id;
/* get null values b/c things don't match between right and left */
/* nulls happen when use right or left join */

/*note: from refers to table 1, join refers to table 2 */

/* left join */
SELECT c.first_name, c.last_name, c.address_id, ad.address, ad.postal_code
	FROM customer c
    LEFT JOIN address ad
    ON c.address_id = ad.address_id;










    




