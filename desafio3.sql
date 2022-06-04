SELECT name AS usuario, COUNT(*) AS qtde_musicas_ouvidas, ROUND(SUM((duration) / 60), 2) AS total_minutos
FROM
    users
        INNER JOIN
    reproduction_history ON users.id = reproduction_history.users_id
        INNER JOIN 
    songs ON reproduction_history.song_id = songs.id
GROUP BY usuario
ORDER BY usuario ASC;