SELECT name AS usuario,
	CASE 
		WHEN SUM(IF (reproduction_date LIKE '2021%', 1, 0)) IN (1,2,3) THEN 'Usuário ativo'
        WHEN SUM(IF (reproduction_date LIKE '2021%', 1, 0)) = 0 THEN 'Usuário inativo'
	END AS condicao_usuario
FROM reproduction_history
INNER JOIN users ON reproduction_history.users_id = users.id
GROUP BY name
ORDER BY name ASC;