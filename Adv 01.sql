--Q1: Find how much amount spent by each customer on artists? 
--    Write a query to return customer name, artist name and total spent


WITH best_selling_artist AS(
	SELECT artist.artist_id AS artist_id, artist.name AS artist_name,
	SUM(invoice_line.unit_price*invoice_line.quantity) AS total_sales
	FROM invoice_line
	JOIN track ON track.track_id = invoice_line.track_id
	JOIN album ON track.album_id = album.album_id
	JOIN artist ON artist.artist_id = album.artist_id
	--GROUP BY artist.artist_id
	--Order BY total_sales DESC
	GROUP BY 1
	Order BY 3 DESC	
	LIMIT 1
)

SELECT c.customer_id, c.first_name, c.last_name , bsa.artist_name,
SUM(il.unit_price*il.quantity) AS total_amount
FROM invoice AS i
JOIN customer AS c ON c.customer_id = i.customer_id
JOIN invoice_line AS il ON i.invoice_id = il.invoice_id
JOIN track AS t ON t.track_id = il.track_id
JOIN album AS alb ON t.album_id = alb.album_id
JOIN best_selling_artist AS bsa ON bsa.artist_id = alb.artist_id
GROUP BY 1,2,3,4
ORDER BY 5 DESC


	