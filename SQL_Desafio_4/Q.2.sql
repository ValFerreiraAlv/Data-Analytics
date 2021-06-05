/* 2 - Queremos dar um cupom de 10% do valor da última compra do cliente. Porém os clientes elegíveis a este 
cupom devem ter feito uma compra anterior a última (a partir da data de aprovação do pedido) que tenha sido 
maior ou igual o valor da última compra. Crie uma querie que retorne os valores dos cupons para cada um dos 
clientes elegíveis.
*/

SELECT
	customer,
	estado,
	cidade,
	valor,
	data_aprovacao
FROM
(
	SELECT
		cust.customer_id as customer,
		cust.customer_state as estado,
		cust.customer_city as cidade,
		pay.payment_value as valor,
		ord.order_approved_at as data_aprovacao,
		lag(pay.payment_value) over (partition by cust.customer_state, cust.customer_city order by pay.payment_value asc) as compra_anterior,
		rank() over (partition by cust.customer_state, cust.customer_city order by pay.payment_value asc) as rank_elegiveis
	from olist_order_payments_dataset as pay
	left join olist_orders_dataset as ord
		on pay.order_id = ord.order_id
	left join olist_customers_dataset as cust
		on ord.customer_id = cust.customer_id
)as tab
WHERE valor >= compra_anterior 
