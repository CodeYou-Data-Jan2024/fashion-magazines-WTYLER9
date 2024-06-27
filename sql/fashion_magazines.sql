WITH previous_query AS (
    SELECT * 
    FROM customers
    JOIN orders
        ON customers.customer_id = orders.customer_id
    WHERE orders.order_status = 'unpaid' 
        AND subscription_id >= 4 
        AND subscription_id <= 6
)

SELECT customer_name AS "Customer", 
    printf("$%.2f",SUM(price_per_month*subscription_length)) as "Amount Due"
FROM previous_query
JOIN subscriptions
    ON subscriptions.subscription_id = previous_query.subscription_id
GROUP BY Customer
;