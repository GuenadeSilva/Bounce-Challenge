with currency_rates as (
select
    *
FROM {{ref('stg_exchange_rates')}}
where true
	and date = (select max(date) from exchange_rate))
select
	'JPY' as currency,
	jpy_to_usd as rate
from currency_rates
union all
select
	'CAD' as currency,
	cad_to_usd as rate
from currency_rates
union all
select
	'EUR' as currency,
	eur_to_usd as rate
from currency_rates