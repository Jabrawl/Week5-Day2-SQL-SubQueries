-- Question 1: Jennifer Davis, Kim Cruz, Richard Mccrary, Bryan Hardison, Ian Still
SELECT customer.first_name, customer.last_name, address.district
FROM customer
FULL JOIN address
ON customer.address_id = address.address_id 
WHERE district LIKE 'Texas';

-- Question 2: 1406 payments
SELECT customer.first_name, customer.last_name, amount
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
WHERE amount > 6.99;

-- Question 3: 6 Customers
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
	SELECT customer_id
	FROM payment
	GROUP BY customer_id
	HAVING SUM(amount) > 175
	ORDER BY SUM(amount) DESC
)
GROUP BY store_id, first_name, last_name;

-- Question 4: 1 Customer Kevin Schuler
SELECT first_name, last_name
FROM customer
WHERE address_id IN (
	SELECT address_id
	FROM address
	WHERE city_id IN (
		SELECT city_id
		FROM city
		WHERE country_id IN (
			SELECT country_id
			FROM country 
			WHERE country LIKE 'Nepal'
		)
	)
);

-- Question 5: Jon Stephens with 7304
SELECT first_name, last_name, COUNT(payment.rental_id) AS rented
FROM staff
JOIN payment 
ON staff.staff_id = payment.staff_id
GROUP BY staff.staff_id
ORDER BY rented DESC;

-- Question 6: G 178,  PG 194,  PG-13 223,  R 195,  NC-17 210
SELECT rating, COUNT(DISTINCT film_id) as film_count
FROM film
GROUP BY rating;
-- ORDER BY film_count;

-- Question 7: 130
SELECT first_name, last_name
FROM customer
WHERE customer_id IN (
    SELECT customer_id
    FROM payment
    WHERE amount > 6.99
    GROUP BY customer_id
    HAVING COUNT(payment_id) = 1
);

-- Question 8: 24
SELECT COUNT(amount)
FROM payment
WHERE amount = 0.00;