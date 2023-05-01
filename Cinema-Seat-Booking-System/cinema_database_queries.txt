-- Simple queries
-- display the cinema details and order them based on their IDs
SELECT * FROM cinemas ORDER BY CINEMA_ID; 

-- display the theater details and order them based on their IDs
SELECT * FROM theaters ORDER BY THEATER_ID;
-- display the movie details and order them based on their IDs
SELECT * FROM movies ORDER BY MOVIE_ID;
-- display the screening details and order them based on their IDs
SELECT * FROM screenings ORDER BY SCREENING_ID;
-- display the customer details and order them based on their IDs
SELECT * FROM customers ORDER BY CUST_ID;
-- display the reservation details and order them based on their IDs
SELECT * FROM reservations ORDER BY RES_ID;
-- display cinemas located in NJ
SELECT CINEMA_PHONE FROM cinemas WHERE CINEMA_STATE = 'NJ' ORDER BY CINEMA_ID;
-- display theaters above 70 seating capacity, from highest to lowest capacity
SELECT THEATER_ID, CAPACITY FROM theaters WHERE CAPACITY > 70 ORDER BY CAPACITY;
-- displays movies excluding kid movies, in order of release
SELECT MOVIE_NAME, DESCRIPTION FROM movies WHERE RATING IN ('PG13', 'R') ORDER BY RELEASE_DATE;


-- Aggregate 

-- How many people can each cinema accommodate at once? (All theaters combined)
SELECT c.cinema_name AS "Cinema", SUM(t.capacity) AS "Total cinema capacity"
FROM theaters t, cinemas c
WHERE c.cinema_id = t.cinema_id
GROUP BY c.cinema_name;

-- How much has each customer spent on movie theater tickets? (All theaters combined)
SELECT c.cust_name AS "Customer Name", SUM(r.price) AS "Money Spent By Customer"
FROM customers c, reservations r
WHERE c.cust_id = r.cust_id
GROUP BY c.cust_name;

-- Grouping

-- How many reservations does each customer have?
SELECT c.cust_name AS "Customer", COUNT(r.res_id) AS "Number of reservations"
FROM reservations r, customers c
WHERE c.cust_id = r.cust_id 
GROUP BY c.cust_name;

-- How many screenings does each movie have across all theaters?
SELECT m.movie_name AS "Movie Title", COUNT(s.screening_id) AS "Number of screenings"   
FROM movies m, screenings s
WHERE s.movie_id = m.movie_id
GROUP BY m.movie_name;


-- Subqueries
-- All reservations for Jonathan Wicker. (Can be applied to any other customer, knowing their name)
SELECT r.res_id, m.movie_name, s.screening_date
FROM reservations r, movies m, screenings s
WHERE s.movie_id = m.movie_id AND
  	r.screening_id = s.screening_id AND
	r.cust_id = (SELECT cust_id
    			FROM customers
    			WHERE cust_name = 'Jonathan Wicker');

-- All movie screenings where length is greater than or equal to average movie length. For customers willing to watch longer movies.
SELECT c.cinema_name, m.movie_name, s.screening_date, s.start_time
FROM cinemas c, movies m, screenings s, theaters t
WHERE c.cinema_id = t.cinema_id AND
t.theater_id = s.theater_id AND 
m.movie_id = s.movie_id AND
m.length >= (SELECT AVG(length) 
			FROM movies);

-- Looking at capacity in theaters, for group size of 50 or greater.
SELECT c.cinema_id, t.theater_id
FROM cinemas c, theaters t
WHERE c.cinema_id = t.cinema_id AND
theater_id IN (
SELECT theater_id
FROM theaters
WHERE capacity >= 50);

-- Join queries

-- Simple join of cinemas by name and what theaters they have + their capacities. 
SELECT c.cinema_name, t.theater_id, t.capacity
FROM cinemas c, theaters t
WHERE c.cinema_id = t.cinema_id;

-- Join of customers and the reservations they have.
SELECT c.cust_name as "Customer Name", r.res_id AS "Reservation ID"
FROM customers c, reservations r
WHERE c.cust_id = r.cust_id;

-- Join of screenings and the movie they’re showing, displaying movie name.
SELECT s.screening_id AS "Screening ID", m.movie_name AS "Movie Title"
FROM screenings s, movies m
WHERE s.movie_id = m.movie_id;
