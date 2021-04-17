SELECT 
	*
FROM 
	olist_customers_dataset
WHERE 
	customer_state = 'SP'
AND	customer_city NOT IN ('sao paulo')
