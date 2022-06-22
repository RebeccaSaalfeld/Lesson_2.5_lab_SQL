USE sakila; 

# Searching for Actresses called Scarlett:
SELECT * FROM sakila.actor
WHERE first_name='Scarlett';

#Number of movies that are available for rent: (Assumption: All movies in the database are available for rent)
SELECT * FROM sakila.film;
SELECT COUNT(DISTINCT title) FROM sakila.film;

#films that has been rented: (Here I assume that you want the number of rentals, some movies have more
#than one copy 
SELECT COUNT(rental_id)
FROM sakila.rental;

#shortest movie duration:
SELECT MIN(length)
AS min_duration
FROM sakila.film;

#longest movie duration
SELECT MAX(length)
AS max_duration
FROM sakila.film;


#Average duration of movies
SELECT sec_to_time(AVG(length)*60)
AS average_duration
FROM sakila.film;

#How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name) 
FROM sakila.actor;

#Show rental info with additional columns month and weekday. Get 20 results.
SELECT *, date_format(rental_date, '%M') AS 'month of rental', 
			date_format(rental_date, '%W') AS 'weekday of rental',
            date_format(return_date, '%M') AS 'month of return',
            date_format(return_date, '%W') AS 'weekday of return'
FROM sakila.rental
LIMIT 20;

# Add an additional column day_type with values 'weekend' and 'workday' depending on the 
# rental day of the week.
SELECT *, date_format(rental_date, '%M') AS 'month of rental', 
			date_format(rental_date, '%W') AS 'weekday of rental',
            date_format(return_date, '%M') AS 'month of return',
            date_format(return_date, '%W') AS 'weekday of return',
            CASE 
            WHEN (date_format(rental_date, '%W') = 'Saturday') or (date_format(rental_date, '%W') = 'Sunday')
			THEN 'weekend'
			ELSE 'weekday'
            END AS day_type
FROM sakila.rental;

# Get release years.
SELECT DISTINCT (release_year) FROM sakila.film; 

#Get all films with ARMAGEDDON in the title.
SELECT title FROM sakila.film
WHERE instr(title, 'ARMAGEDDON') > 0;

#Get all films which title ends with APOLLO
SELECT title FROM sakila.film
WHERE right(title,6) =  'APOLLO';

#Get the 10 longest films.
SELECT title, length FROM sakila.film
ORDER BY length DESC
LIMIT 10;

#How many films include Behind the Scenes content?
SELECT COUNT(title) FROM sakila.film
WHERE instr(special_features, 'Behind the Scenes') > 0;

SELECT * FROM sakila.film;