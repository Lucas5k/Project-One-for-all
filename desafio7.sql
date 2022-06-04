SELECT artist AS artista, album, COUNT(followers_of_an_artist.artist_id) AS seguidores FROM artists
INNER JOIN albums ON albums.artist_id = artists.id
INNER JOIN followers_of_an_artist ON followers_of_an_artist.artist_id = artists.id
GROUP BY albums.id
ORDER BY COUNT(followers_of_an_artist.artist_id) DESC, artist ASC, album ASC;