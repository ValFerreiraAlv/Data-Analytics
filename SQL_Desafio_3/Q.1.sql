/* 1 - Crie uma tabela analítica de todos os itens que foram vendidos, somente mostrando pedidos interestaduais. 
Queremos saber quantos dias os fornecedores demoram para postar o produto, se o produto chegou ou não dentro do
prazo.
*/

SELECT
	estado,
	cidade,
	dias_entrega,
	limite_dias_entrega,
	CASE
	WHEN limite_dias_entrega < dias_entrega THEN 'Fora do Prazo'
	ELSE 'Dentro do Prazo'
	END as prazo
FROM
	( 
	SELECT
		cust.customer_state as estado,
		cust.customer_city as cidade,
		ordit.order_item_id as item_vendido,
		ord.order_status as status_pedido,
		julianday(ord.order_approved_at) - julianday(ord.order_delivered_carrier_date) as dias_entrega,
		julianday(ord.order_delivered_customer_date) - julianday(ordit.shipping_limit_date) as limite_dias_entrega
	FROM olist_orders_dataset as ord
	LEFT JOIN olist_order_items_dataset as ordit on ord.order_id = ordit.order_id
	LEFT JOIN olist_customers_dataset as cust on ord.customer_id = cust.customer_id
)
as tab 
ORDER BY estado ASC, cidade ASC
		
