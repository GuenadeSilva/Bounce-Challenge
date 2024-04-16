SELECT 
	id,
	type,
	to_timestamp(time, 'YYYY-MM-DD HH24:MI:SS') as order_ts,
	bags,
	to_timestamp(order_checkout, 'YYYY-MM-DD HH24:MI:SS') as order_checkout_ts,
	amount,
	currency,
	cancelled,
	payment::json,
	customer_support::json
FROM orders