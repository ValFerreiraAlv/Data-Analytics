SELECT 
	*
FROM 
	"olist_order_reviews_dataset"
WHERE 
	review_comment_message is null
ORDER BY 
	review_comment_message nulls last
