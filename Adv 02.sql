--Q2: We want to find out the most popular music Genre for each country.
--    We determine the most popular genre as the genre with the highest amount of purchases. 
--    Write a query that returns each country along with the top Genre. 
--    For countries where the maximum number of purebeses is shared return all Genres.

WITH popular_genre AS (
	SELECT COUNT(invoice_line.quantity) AS purchases, customer.country, genre.name , genre.genre_id,
	ROW_NUMBER() OVER(PARTITION BY customer.country ORDER BY COUNT(invoice_line.quantity) DESC) AS rowno
	FROM invoice_line 
	JOIN invoice ON invoice.invoice_id = invoice_line.invoice_id
	JOIN customer ON customer.customer_id = invoice.customer_id
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN genre ON genre.genre_id = track.genre_id
	GROUP BY 2,3,4
	ORDER BY 2 ASC, 1 DESC
)

SELECT * FROM popular_genre WHERE rowno <=1