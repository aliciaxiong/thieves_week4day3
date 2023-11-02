-- 1. List all customers who live in Texas (use JOINs) 
SELECT*
FROM customer
INNER JOIN address
ON customer.address_id=address.address_id

-- 2. Get all payments above $6.99 with the Customer's Full Name.
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
        SELECT customer_id
        FROM payment 
        WHERE amount > 6.99
);

-- 3. Show all customers names who have made payments over $175. (use subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
        SELECT customer_id
        FROM payment 
        GROUP BY customer_id
        HAVING SUM(amount) > 175
);

-- 4. List all customers that live in Nepal (use the city table)
SELECT customer_id, first_name, last_name, address_id
FROM customer
GROUP BY customer_id;
-- Kevin Schuler 

SELECT address_id, city_id
FROM address
GROUP BY address_id;
-- address id 326

SELECT city_id, country_id
FROM city
GROUP BY city_id;
-- City ID 81 

SELECT country_id, country, COUNT(country)
FROM country
GROUP BY country_id;
-- Nepal ID 66

-- 5. Which staff member had the most transactions?
SELECT staff_id, COUNT(payment_id) 
FROM payment
GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC;

-- 6. How many movies of each rating are there?
SELECT COUNT(rating), film_id
FROM film
GROUP BY film_id;

-- 7.Show all customers who have made a single payment above $6.99. (Use Subqueries)
SELECT customer_id, first_name, last_name
FROM customer
WHERE customer_id IN (
        SELECT customer_id
        FROM payment 
        WHERE amount >= 6.99 
);

-- 8. How many free rentals did our stores give away?
SELECT payment_id, COUNT(amount)
FROM payment
GROUP BY payment_id
ORDER BY COUNT(amount) < 0;