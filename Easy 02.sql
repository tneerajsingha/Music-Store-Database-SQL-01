--Q2. Which contries have the most Invoices?

---SELECT * FROM invoice
SELECT billing_country,
COUNT(billing_country) FROM invoice
GROUP BY billing_country
ORDER BY count DESC
LIMIT 1
