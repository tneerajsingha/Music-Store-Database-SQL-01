--Q5: Who is the best customer? 
--    The customer who has spent the most money will be declared the best customer. 
--	  Write a query that returns the person who has spent the most money.

SELECT c.customer_id,c.first_name,c.last_name,c.city,SUM(i.total) AS total_in
FROM customer AS c
JOIN invoice AS i
ON c.customer_id=i.customer_id
GROUP BY c.customer_id
ORDER BY total_in DESC
LIMIT 1
	


