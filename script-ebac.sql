-- Selecione todos os registros da tabela de artistas, ordenando pelo nome em ordem alfabética.
SELECT * FROM Artist 
ORDER BY Name ASC;

-- Liste todas as músicas com duração maior que 5 minutos.
SELECT * FROM Track 
WHERE Milliseconds > 300000;

--Selecione todas as músicas do gênero Rock.
SELECT * FROM Genre
WHERE Name like 'Rock%'
-- GenreId Rock = 1

SELECT * FROM Track
WHERE GenreId = 1;

--Liste os álbuns junto com o nome do artista correspondente.
SELECT 
	Album.Title as 'Título do Album',
	Artist.Name as 'Nome do Artista'
FROM Album 
INNER JOIN Artist 
ON Album.ArtistId = Artist.ArtistId;

--Selecione todas as músicas que pertencem ao álbum “Let There Be Rock”.
SELECT * FROM Album
WHERE Title = 'Let There Be Rock'
-- AlbumId = 4

SELECT * FROM Track

SELECT
	Album.AlbumId as 'Id do Album',
	Track.Name as 'Nome da Musica'
FROM Album 
INNER JOIN Track
ON Album.AlbumId = Track.AlbumId
WHERE Album.AlbumId = 4;

-- Liste os clientes que moram no Brasil.
SELECT * FROM Customer 
WHERE Country = 'Brazil';

-- Exiba o total de músicas por gênero, ordenando do maior para o menor.
SELECT * FROM Genre

SELECT * FROM Track

SELECT 
	Genre.Name as 'Nome do Genero Musical',
	COUNT(Track.TrackId) as 'Quantidade de Musicas'
	FROM Genre
	INNER JOIN Track
	ON Genre.GenreId = Track.GenreId
	GROUP BY Genre.GenreId, Genre.Name
	ORDER BY COUNT (Genre.GenreId) DESC;

-- Selecione todas as músicas que possuem a palavra “Love” no nome. 
SELECT * FROM Track 
WHERE Name like '%love%';
	
	
	





