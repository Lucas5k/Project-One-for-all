SELECT song AS nome_musica,
	CASE
		WHEN song = 'Dance With Her Own' THEN REPLACE(song, 'Dance With Her Own', 'Dance With Trybe')
        WHEN song = "Let's Be Silly" THEN REPLACE(song, "Let's Be Silly", "Let's Be Nice")
        WHEN song = 'Magic Circus' THEN REPLACE(song, 'Magic Circus', 'Magic Pull Request')
        WHEN song = 'Troubles Of My Inner Fire' THEN REPLACE(song, 'Troubles Of My Inner Fire', 'Troubles Of My Project')
        WHEN song = 'Without My Streets' THEN REPLACE(song, 'Without My Streets', 'Without My Code Review')
	END AS novo_nome
FROM songs
ORDER BY novo_nome ASC LIMIT 5 OFFSET 35;