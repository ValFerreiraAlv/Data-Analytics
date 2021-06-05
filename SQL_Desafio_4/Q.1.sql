/* 1 - Crie uma view (SELLER_STATS) para mostrar por fornecedor, a quantidade de itens enviados, o tempo médio de 
postagem após a aprovação da compra, a quantidade total de pedidos de cada Fornecedor, note que trabalharemos na 
mesma query com 2 granularidades diferentes.
*/

CREATE VIEW SELLER_STATS as
SELECT
	ordit.seller_id as fornecedor,
	count(ordit.order_item_id) as qtde_itens,
	count(DISTINCT ord.order_id) as total_pedidos,
	AVG(julianday(ord.order_delivered_carrier_date) - julianday(ord.order_approved_at)) as tempo_postagem
FROM olist_order_items_dataset as ordit
LEFT JOIN olist_orders_dataset as ord ON ord.order_id = ordit.order_id
LEFT JOIN olist_sellers_dataset as sel ON ordit.seller_id = sel.seller_id
GROUP BY fornecedor

SELECT *
FROM "SELLER_STATS"