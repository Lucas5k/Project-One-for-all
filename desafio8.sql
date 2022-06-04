SELECT artists.artist AS artista, album FROM albums
INNER JOIN artists ON albums.artist_id = artists.id
WHERE artist = 'Walter Phoenix';