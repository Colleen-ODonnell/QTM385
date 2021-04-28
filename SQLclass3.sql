USE sakila;
/* select all columns in table country */
SELECT * FROM country;

/* can right click on code after highlighting to save as diff file type */


/* filtering queries: select + where */
/* select columns from data where is to filter */
SELECT title, rating, rental_duration 
	FROM film 
    WHERE rating = 'G'AND
    rental_duration >= 7;

/* conditional queries*/
SELECT title, rating, rental_duration
	FROM film
    WHERE (rating = 'G' AND
    rental_duration >= 7) OR
    (rating = 'PG-13' AND 
    rental_duration < 4);

SELECT title, rating
	FROM film
    WHERE rental_duration <5 AND
    rating = 'R';

/* if you need description of names in table: DESC table; */

/*can filter on dates */
SELECT first_name, last_name, create_date
	FROM customer
    WHERE (first_name = 'Steven' OR
    last_name = 'Young') AND
    create_date > '2006-01-01';

/* an "and" is more restrictive than an "or" */

/* table rental */
DESC rental;

SELECT customer_id, rental_date
	FROM rental
    WHERE rental_date < '2005-05-25';

SELECT customer_id, rental_date
	FROM rental
    WHERE rental_date <= '2005-06-16' AND
    rental_date >= '2005-06-14';

/* other way to do this is between operator */
/* don't have to keep repeating variable name */
SELECT customer_id, rental_date
	FROM rental
    WHERE rental_date BETWEEN '2005-06-14' AND
    '2005-06-16';

/* between operater is when have two conditions */
/* find amounts between 5 and 10 */ 
SELECT customer_id, payment_date, amount
	FROM payment
    WHERE amount BETWEEN 
    5 AND 10;

/* can use between for strings too */
/* match all last names that start w/ Fa through Fr */
SELECT last_name, first_name
	FROM customer
    WHERE last_name 
    BETWEEN 'Fa' and 'Fr';

SELECT title, rating
	FROM film
    WHERE rating = 'G' OR rating = 'PG';

/* but if have five conditions, use "in" operator */
SELECT title, rating
	FROM film 
    WHERE rating IN ('G', 'PG');
/* means rating = G OR rating = PG */

/* can include more than 2 */
/* means film w/ G or PG or R */
SELECT title, rating
	FROM film 
    WHERE rating IN ('G', 'PG', 'R');

/* select all PG-13 and R rated movies */
/* have to think about whether this is OR or AND */
SELECT title, rating
	FROM film
    WHERE rating IN ('PG-13', 'R');

/* the symbol <> means not equal to */
SELECT title, rating, rental_duration
	FROM film
    WHERE rating <> 'G' AND 
    rental_duration > 1;

/* Can use NOT w/ IN or other operators*/
SELECT title, rating
	FROM film
	WHERE rating NOT IN ('G', 'PG');
/* NOT inverts values of sentence */

/* select all but PG-13 and R rated movies */
SELECT title, rating
	FROM film
    WHERE rating NOT IN ('PG-13', 'R');

/* to match something that is close to someone else - fuzzy matching */
/* use key word LIKE */
SELECT title, rating
	FROM film
    WHERE title LIKE 'AM%';
/*finds movies that start w/ AM and rest doesn't matter */

/* match all movies ending w/ "t" */
SELECT title, rating
	FROM film
    WHERE title LIKE '%t';

/* all movies but not those that end w/ t */
SELECT title, rating
	FROM film
    WHERE title NOT LIKE '%t';

/* _ means match any character */
SELECT title, rating
	FROM film
    WHERE TITLE LIKE 'S_E%';
/* returns s, whatever, then E and then anything else */
/* use when can't match word exactly */

/* how to match something inside the string/text, in middle */
/* find words w/ 'ASY' in them*/
SELECT title, rating
	FROM film
    WHERE TITLE LIKE '%ASY%';
    
/* works for aly, aby, any etc. */
SELECT title, rating
	FROM film
    WHERE TITLE LIKE '%A_Y%';

/*the command "limit" is to limit amount of data displaying on screen */
/* to see first 10 observations: */
SELECT title, rating
	FROM film
    WHERE rating IN ('PG', 'G')
    LIMIT 10;

SELECT title, rating
	FROM film
    WHERE rating IN ('PG-13', 'R')
    LIMIT 20;

/* to count one particular value that might have null, would be counted w/ star */
/* to avoid this, put in variable */
/* count number of ratings: */
SELECT COUNT(rating)
	FROM film;

/* to only count distinct ratings: */
SELECT COUNT(DISTINCT rating)
	FROM film;

/* functions count, min, max etc. */
/*functions go before the FROM and WHERE is after */
SELECT COUNT(amount),
	AVG(amount),
    MIN(amount),
    MAX(amount),
    SUM(amount)
    FROM payment;

/* ORDER BY - order results in whatever way we want */
SELECT first_name, last_name
	FROM actor
    ORDER BY last_name DESC;

/* ascending order: */
SELECT first_name, last_name
	FROM actor
    ORDER BY last_name;

/* count all movies by ratings */
SELECT rating, count(*)
	FROM film
    group by rating;








    















