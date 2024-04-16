select
	customer_support->>'ticket_id' as ticket_id,
	to_timestamp(concat(concat(customer_support->>'date',' '),customer_support->>'time'),'YYYY-MM-DD HH24:MI:SS') as create_ts,
	customer_support->>'resolution_status' as resolution_status,
	customer_support->>'agent_name' as agent_name,
	id as order_id,
	usd_amount,
	order_ts,
	customer_support->>'customer_name' as customer_name,
	CASE WHEN c.player_name IS NOT NULL THEN TRUE ELSE FALSE END AS celebrity_flg,
	customer_support->>'issue_description' as issue_description
FROM	{{ref('int_orders')}} o
LEFT JOIN {{ref('stg_celebrities')}} c ON o.customer_support->>'customer_name' = c.player_name
where customer_support->>'ticket_id' is not null