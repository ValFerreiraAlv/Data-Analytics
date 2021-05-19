/* 2- Crie uma query SQL que me retorne todos os pagamentos do cliente, com suas datas de aprovação, valor da 
compra e o valor total que o cliente já gastou em todas as suas compras, me mostrando somente os clientes onde 
o valor da compra é diferente do valor total já gasto.
*/

SELECT *
FROM (

SELECT
	cliente,
	data_aprovacao,
	valor_compra,
	sum(valor_compra) over (PARTITION BY cliente ORDER BY valor_compra ASC) as valor_total
FROM (
SELECT
	cust.customer_id as cliente, 
	ord.order_approved_at as data_aprovacao,
	payment_value as valor_compra
FROM olist_order_payments_dataset as pay
LEFT JOIN olist_orders_dataset as ord 
ON pay.order_id = ord.order_id
LEFT JOIN olist_customers_dataset as cust 
ON ord.customer_id = cust.customer_id
)	as tab
)
WHERE valor_total <> valor_compra 
