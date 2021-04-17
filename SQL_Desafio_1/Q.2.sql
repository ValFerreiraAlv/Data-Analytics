SELECT 
	(product_length_cm * product_height_cm 
		* product_width_cm) AS volume_cm3
,'product_length_cm'
,'product_weight_g'
,'product_width_cm'
,*
FROM 
	olist_products_dataset
