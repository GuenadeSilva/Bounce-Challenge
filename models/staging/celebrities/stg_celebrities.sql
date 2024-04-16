select 
	player_name,
	max(age) as age,
	max(season) as last_season_played
from all_seasons
group by player_name