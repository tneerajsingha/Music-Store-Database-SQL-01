--Q3: Write a query that determines the customer that has spent the most on music for each country. 
--	  Write a query that returns the country along with the top customer and how much they spent. 
--	  For countries where the top amount spent is shared, provide all customers who spent this amount

WITH cc AS(
	SELECT c.customer_id, c.first_name, last_name, billing_country, SUM(total) AS total_spent,
	ROW_NUMBER() OVER(PARTITION BY billing_country ORDER BY SUM(total) DESC) AS rowno
	FROM invoice AS i
	JOIN customer AS c  ON c.customer_id = i.customer_id
	GROUP BY 1,2,3,4
	ORDER BY 4 ASC, 5 DESC
)

SELECT * FROM cc WHERE rowno = 1