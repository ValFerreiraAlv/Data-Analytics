SELECT 
	payment_type
FROM 
	olist_order_payments_dataset
WHERE 
	payment_type IN ('voucher', 'boleto');