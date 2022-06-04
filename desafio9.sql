SELECT COUNT(*) AS quantidade_musicas_no_historico FROM reproduction_history
INNER JOIN users ON reproduction_history.users_id = users.id
WHERE users.name = 'Bill';