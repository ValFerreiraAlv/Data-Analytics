SELECT
	 olist_sellers_dataset.seller_id,
	 olist_products_dataset.product_category_name AS Categoria, 
	 SUM(olist_order_items_dataset.price) AS Valor_Venda
FROM	
	 olist_order_items_dataset
JOIN 
	olist_sellers_dataset
ON
	olist_sellers_dataset.seller_id = olist_order_items_dataset.seller_id
JOIN
	olist_products_dataset
ON
	olist_order_items_dataset.product_id = olist_products_dataset.product_id
GROUP BY
	olist_sellers_dataset.seller_id,
	olist_products_dataset.product_category_name
ORDER BY	
	Valor_Venda DESC 
LIMIT 5 
	 
	 
	 

