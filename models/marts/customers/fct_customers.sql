select
	username,
	email,
	name,
	gender,
	password,
	phone_number,
	id,
    CASE WHEN celeb.player_name IS NOT NULL THEN TRUE ELSE FALSE END AS celebrity_flg
FROM customers c
LEFT JOIN {{ref('stg_celebrities')}} celeb ON c.name = celeb.player_name