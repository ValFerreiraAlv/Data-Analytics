/*3 - Queremos saber sobre as categorias validas, suas somas totais dos valores de vendas, um ranqueamento de 
maior valor para menor valor junto com o somatório acumulado dos valores pela mesma regra do ranqueamento.
*/

SELECT	
	categoria,
	valor,
	sum(valor) over (order by valor desc) as soma_acumulada,
	rank() over (order by valor desc) as ranqueamento
FROM
(
(
SELECT
	prod.product_category_name as categoria,
	sum(pay.payment_value) as valor
FROM olist_products_dataset as prod
LEFT JOIN olist_order_items_dataset as ordit 
ON ordit.product_id = prod.product_id
LEFT JOIN olist_order_payments_dataset as pay
ON pay.order_id = ordit.order_id
GROUP BY categoria
) 
)WHERE categoria is not NULL