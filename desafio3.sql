SELECT name AS usuario, COUNT(*) AS qtde_musicas_ouvidas
FROM
    users
        INNER JOIN
    reproduction_history ON users.id = reproduction_history.users_id
GROUP BY usuario;