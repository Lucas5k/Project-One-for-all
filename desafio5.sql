SELECT song AS cancao, COUNT(*) AS reproducoes FROM songs
INNER JOIN reproduction_history ON reproduction_history.song_id = songs.id
GROUP BY song
ORDER BY reproducoes DESC, song ASC LIMIT 2;