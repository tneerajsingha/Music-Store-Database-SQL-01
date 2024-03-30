--Q2: Let's invite the artists who have written the most rock music in our dataset. 
--	  Write a query that returns the Artist name and total track count of the top 10 rock bands

---SELECT * FROM artist
---SELECT * FROM track WHERE genre_id = '1'

SELECT artist.artist_id, artist.name, COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id=album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC
LIMIT 10;





