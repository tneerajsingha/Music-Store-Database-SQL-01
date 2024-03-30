--Q3: Write a query that determines the customer that has spent the most on music for each country. 
--	  Write a query that returns the country along with the top customer and how much they spent. 
--	  For countries where the top amount spent is shared, provide all customers who spent this amount

WITH RECURSIVE
	ct AS (
	SELECT customer.customer_id,first_name,last_name,billing_country, SUM(total) AS spent
	FROM invoice 
	JOIN customer  ON customer.customer_id = invoice.customer_id
	GROUP BY 1,2,3,4
	Order by 1,5 DESC
	),

cm AS(
	SELECT billing_country, MAX(spent) AS max_spent
	FROM ct 
	GROUP BY billing_country
	)

SELECT ct.billing_country, ct.spent , ct.first_name, ct.last_name , ct.customer_id
FROM ct
JOIN cm ON ct.billing_country = cm.billing_country
WHERE ct.spent= cm.max_spent
ORDER BY 1
