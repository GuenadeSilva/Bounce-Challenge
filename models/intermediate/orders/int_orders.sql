select
	o.id,
	type,
	order_ts,
	bags,
	order_checkout_ts,
	round(amount::numeric, 2) as local_amount,
	o.currency as local_currency,
    CASE WHEN o.currency = 'USD' THEN round(amount::numeric, 2) ELSE round((amount / rate)::numeric, 2) END as usd_amount,
	cancelled,
	payment::json,
	customer_support::json,
    e.utm_source,
    e.utm_medium,
    e.utm_campaign
FROM {{ref('stg_orders')}} o
LEFT JOIN {{ref('stg_events')}} e ON o.id = e.order_id
LEFT JOIN {{ref('int_exchange_rates')}} c ON o.currency = c.currency