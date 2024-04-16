select
	id,
	type,
	order_ts,
	bags,
	order_checkout_ts,
	local_amount,
	local_currency,
    usd_amount,
    payment->>'payment_method' as payment_method,
	payment->>'payment_billing' as payment_billing,
	cancelled,
    utm_source,
    utm_medium,
    utm_campaign
FROM {{ref('int_orders')}}