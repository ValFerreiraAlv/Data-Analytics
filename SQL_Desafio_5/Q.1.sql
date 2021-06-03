/* 1 - Crie os índices apropriadaos para as tabelas do nosso modelo de dados com o intuito de melhorar a 
performance. */

--Índice

CREATE INDEX idx_order_id
	on olist_order_items_dataset (order_id)
CREATE INDEX idx_customer_id
	on olist_customers_dataset(customer_id)
CREATE INDEX idx_product_id
	on olist_order_items_dataset (product_id)
CREATE INDEX idx_sellers_id
	on olist_order_items_dataset (seller_id)



