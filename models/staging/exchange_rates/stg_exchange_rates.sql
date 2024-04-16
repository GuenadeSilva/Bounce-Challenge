SELECT 
	date,
	case when aud_to_usd = 'ND' then null ELSE cast(aud_to_usd as float) END as aud_to_usd,
	case when eur_to_usd = 'ND' then null ELSE cast(eur_to_usd as float) END as eur_to_usd,
	case when nzd_to_usd = 'ND' then null ELSE cast(nzd_to_usd as float) END as nzd_to_usd,
	case when gbp_to_usd = 'ND' then null ELSE cast(gbp_to_usd as float) END as gbp_to_usd,
	case when brl_to_usd = 'ND' then null ELSE cast(brl_to_usd as float) END as brl_to_usd,
	case when cad_to_usd = 'ND' then null ELSE cast(cad_to_usd as float) END as cad_to_usd,
	case when jpy_to_usd = 'ND' then null ELSE cast(jpy_to_usd as float) END as jpy_to_usd,
	case when kro_to_usd = 'ND' then null ELSE cast(kro_to_usd as float) END as kro_to_usd,
	case when chf_to_usd = 'ND' then null ELSE cast(chf_to_usd as float) END as chf_to_usd
FROM exchange_rate
where aud_to_usd != 'ND'