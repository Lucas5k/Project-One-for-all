SELECT 
	songs.song AS nome, COUNT(*) AS reproducoes
FROM
    songs
        INNER JOIN
    reproduction_history ON songs.id = reproduction_history.song_id
        INNER JOIN
    users ON users.id = reproduction_history.users_id
WHERE users.plans_id IN (1,4)
GROUP BY nome
ORDER BY nome ASC;