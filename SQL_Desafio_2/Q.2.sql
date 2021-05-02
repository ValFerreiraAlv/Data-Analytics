SELECT * FROM
(SELECT
	SUM(olist_order_items_dataset.price) AS Total_Compras,
	COUNT(olist_orders_dataset.order_id) AS Qtde_Compras,
	AVG(olist_order_items_dataset.price) AS Media_Compras,
	olist_customers_dataset.Customer_id
FROM
	olist_orders_dataset
JOIN
	olist_customers_dataset
ON
	olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
JOIN
	olist_order_items_dataset
ON	
	olist_orders_dataset.order_id = olist_order_items_dataset.order_id
WHERE
	olist_orders_dataset.order_status NOT IN ('canceled', 'unavailable', 'invoiced')
GROUP BY	
	olist_customers_dataset.customer_id
ORDER BY	
	Total_Compras DESC
	LIMIT 5) A
ORDER BY	 
	A.Media_Compras DESC
	
	
