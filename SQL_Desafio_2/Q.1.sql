SELECT	
	COUNT(order_item_id) as Itens_vendidos,
	product_category_name as Categoria, 
	customer_state as Estado	
FROM
	olist_order_items_dataset 
INNER JOIN
	olist_products_dataset
ON	
	olist_order_items_dataset.product_id = olist_products_dataset.product_id
INNER JOIN
	olist_orders_dataset
ON 
	olist_order_items_dataset.order_id = olist_orders_dataset.order_id
INNER JOIN
	olist_customers_dataset
ON
	olist_orders_dataset.customer_id = olist_customers_dataset.customer_id
GROUP BY
	product_category_name, 
	customer_state
HAVING
	(olist_products_dataset.product_category_name) > 1000
ORDER BY 
	Itens_vendidos


