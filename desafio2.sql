SELECT 
    COUNT(DISTINCT (songs.id)) AS cancoes,
    COUNT(DISTINCT (albums.id)) AS albuns,
    COUNT(DISTINCT (artists.id)) AS artistas
FROM
    songs
        INNER JOIN
    albums ON songs.albums_id = albums.id
        INNER JOIN
    artists ON albums.artist_id = artists.id;