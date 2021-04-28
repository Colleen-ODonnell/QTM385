/* use the database sakila */
USE sakila;

/* select tells computer which columns you want */

/* to select all columns from a table */
SELECT * FROM actor;

SELECT * FROM category;

SELECT * FROM language;

/* to select specific variables - selecting 2 vars */
SELECT name, last_update FROM category;

SELECT name FROM category;

/* can select in a different order than listed in the table */

/* this is different from the star  */
SELECT category_id, name, last_update FROM category;
/* if you add a new column, * would catch it but list wouldn't */

/* change name/alias of column */
SELECT category_id AS id, 
    name AS cat_name, 
	last_update FROM category;

SELECT language_id,
    'COMMON' AS language_usage,
     language_id * 3.14 AS lang_times_number,
     upper(name) AS language_name
     FROM language;
/* assigning the word common to all rows in language_usage column */
/* multiplped language_id column by 3.14 */
/* AS refers to assigning to column name */
/* upper is a function, upper case */

SELECT actor_id, film_id FROM film_actor ORDER BY actor_id;

/* DISTINCT removes duplicates */
SELECT DISTINCT actor_id FROM film_actor ORDER BY actor_id;
/* for each credit card, some statistic instead of 
all of the transactions- use this */

/* how many types of movie rating do we have? */
SELECT DISTINCT rating FROM film;

SELECT DISTINCT rating FROM film ORDER BY rating;
/* orders alphabetically */

/* select + where  - where is filtering*/
/* selecting 3 vars from table films, just movies w/ ratings = G */
SELECT film_id, title, release_year 
    FROM film
    WHERE rating = 'G' AND rental_duration >= 7
    ORDER BY film_id; 
/* AND means both have to be true, OR means only one has to be true */
/* so using OR clause means matches should increase or stay same */

/* select the titles and ratings for all R rated movies: */
SELECT title, rating 
    FROM film
    WHERE rating = 'R';

SELECT title, rating 
    FROM film
    WHERE rating = 'R' OR rating = 'PG-13';

/* doesn't work b/c ratings are mutually exclusive - can't have R and PG-13 */
SELECT title, rating 
    FROM film
    WHERE rating = 'R' AND rating = 'PG-13';
/* no error message b/c query syntax is correct */


/* filters on rows that meet either first or second condition */
SELECT film_id, title, rating, rental_duration
    FROM film
	WHERE (rating = 'G' AND rental_duration >= 7) OR 
    (rating = 'PG-13'AND rental_duration < 4);
    
/* select title and rating for all R w/ rental duration less than 5 */
SELECT title, rating
    FROM film
    WHERE rating = 'R' AND rental_duration < 5;
    
/* to count the number of G rated movies/observations in dataset */
SELECT count(*)
    FROM film
    WHERE rating = 'G';

/* to return total number of films */
SELECT count(*)
    FROM film;

/* count number of R rated movies */
SELECT count(*)
    FROM film
    WHERE rating = 'R';

/* can filter on a date, greater than/equal to etc. */
/* uses isodates, year-month-date */
SELECT first_name, last_name
    FROM customer
    WHERE (first_name = 'STEVEN' OR last_name = 'YOUNG') 
    AND create_date >= '2006-01-01';














