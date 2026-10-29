SELECT * FROM Customer;

-- Selecionar dados da tabela customer com limite
SELECT FirstName, LastName, City 
FROM Customer
LIMIT 10;

-- Selecionar artistas por ordem alfabetica Ascendente
SELECT *
FROM Artist 
ORDER BY Name ASC
LIMIT 10;

-- Selecionar artistas por ordem alfabetica Decrescente
SELECT *
FROM Artist 
ORDER BY Name DESC
LIMIT 10;

-- Selecionar track por ordem alfabetica Decrescente
SELECT *
FROM track
ORDER BY Composer ASC
LIMIT 10;

-- Selecionar clientes de uma cidade especifica 
SELECT *
FROM Customer 
WHERE City = 'São Paulo';

-- Selecionar clientes de um pais especifico
SELECT FirstName, LastName, Country
FROM Customer 
WHERE Country = 'Brazil';

-- Selecionar Faturas com operador lógico de comparacao
SELECT *
FROM Invoice 
WHERE Total <= 2;

-- Selecionar Faturas com filtro de pais e estado 
SELECT *
FROM Invoice 
WHERE BillingCountry = 'Brazil'
AND BillingState = 'SP'
AND Total >= 5;

-- Selecionar faturas do estado de SP ou RJ
SELECT *
FROM Invoice 
WHERE BillingState = 'SP'
OR BillingState = 'RJ'
ORDER BY BillingState ASC;

-- Selecionar clientes de cidades que comecam com são
SELECT *
FROM Customer 
WHERE City like 'são%';

-- Selecionar clientes de Sao Paulo usando like 
SELECT *
FROM Customer 
WHERE City like 'são paulo';

-- Selecionar todos os emails que tenham a palavra yahoo
SELECT *
FROM Customer 
WHERE Email like '%yahoo%';

-- Selecionar todos os clientes do Brasil 
SELECT *
FROM Customer 
WHERE Country like 'Bra_il';

-- Selecionar track por ordem alfabetica crescente que o compositor nao seja vazio
SELECT *
FROM track
WHERE Composer IS NOT NULL
ORDER BY Composer ASC;

-- Selecionar track por ordem alfabetica crescente que o compositor seja vazio
SELECT *
FROM track
WHERE Composer IS NULL
ORDER BY Name ASC;

-- Selecionar tracks que estejam no valor entre 2 e 5
SELECT *
FROM track 
WHERE Milliseconds BETWEEN 100000 AND 300000

-- Selecionar todos os clientes que estao no Brasil ou USA 
SELECT *
FROM Customer 
WHERE Country IN ('Brazil', 'USA')

-- Selecionar todos os clientes que nao estao no Brasil ou USA 
SELECT *
FROM Customer 
WHERE Country NOT IN ('Brazil', 'USA')

-- MANIPULACAO DE DADOS 

-- INSERT 
SELECT *
FROM Genre 
WHERE Name like 'MPB';

-- Inserir o genero MPB na tabela 
INSERT INTO Genre (GenreId, Name)
VALUES (NULL, 'MPB')
-- Genero Id: 26 MPB 


SELECT *
FROM Artist 
WHERE Name like 'Toquinho'

-- Inserir o artista Toquinho 
INSERT INTO Artist (Name)
VALUES ('Toquinho')
-- ArtistId 276 Toquinho 

SELECT *
FROM Track 
WHERE GenreId = 26

SELECT *
FROM MediaType 

-- Inserir musicas do Toquinho 
INSERT INTO Track 
VALUES 
(NULL, 'Aquarela', NULL, 1, 26, 'Toquinho', 200000, 3990994, 0.99),
(NULL, 'Onde anda você', NULL, 1, 26, 'Toquinho e Vinicius de Morais', 300000, 3990994, 1.99),
(NULL, 'Regra três', NULL, 1, 26, 'Toquinho', 200000, 3990994, 0.99)

SELECT* 
FROM Track 
--WHERE GenreId = 26
WHERE Composer like 'Toquinho%'

-- Inserir album do Toquinho 
SELECT *
FROM Album 
WHERE Title like '%Toquinho'
-- AlbumId = 348

-- Inserir album
INSERT INTO Album 
VALUES (NULL, 'As melhores de Toquinho', 276)

-- UPDATE 
--Atualizar o album Id para as musicas do Toquinho 

UPDATE Track 
SET Albumid = 348 
WHERE AlbumId IS NULL
AND Composer like 'Toquinho%'

SELECT *
FROM Track 
WHERE Composer like 'Toquinho'

-- Atualizar o tempo, tamanho e preco da musica Regra tres
UPDATE Track 
SET Milliseconds = 450000,
	Bytes = 8000000,
	UnitPrice = 2.99
	WHERE TrackId = 3506
	
	
SELECT *
FROM Track 
WHERE TrackId = 3506

-- DELETE ou Exclusao de dados 
SELECT * 
FROM Invoice 
WHERE Total >= 20
AND BIllingState IS NOT NULL

-- Excluir faturas que sao maiores ou iguais a 20 e o estado de faturamento nao seja vazio 
DELETE 
FROM Invoice 
WHERE Total >= 20
AND BIllingState IS NOT NULL

-- Excluir unica fatura pelo Id
DELETE
FROM Invoice 
WHERE InvoiceId = 404


SELECT *
FROM Invoice 
WHERE BillingPostalCode IS NULL

-- Excluir todas as faturas que o postal code de cobranca é vazio 
DELETE
FROM Invoice 
WHERE BillingPostalCode IS NULL

-- JOIN -- JUNCAO DE TABELAS

SELECT COUNT (*)
FROM Album

SELECT COUNT (*)
FROM Artist

--Forma ERRADA de juntar as tabelas
SELECT COUNT (*)
FROM Artist, Album

-- Selecionar o titulo do album relacionado com o nome do artista 
SELECT 
	Album.Title, 
	Artist.Name
FROM Album 
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId
WHERE Name like 'Iron Maiden'

-- Selecionar o titulo do album relacionado com o nome do artista e as musicas do album
SELECT 
	Album.Title as 'Titulo do album', 
	Artist.Name as 'Nome do artista',
	Track.Name as 'nome da musica',
	Track.Composer as 'Compositor'
FROM Album 
INNER JOIN Artist
	ON Album.ArtistId = Artist.ArtistId
INNER JOIN Track 
	ON Album.AlbumId = Track.AlbumId 
	
-- CRIAR UMA TABELA 

-- Criar uma tabela de Artista Favorito
CREATE TABLE ArtistaFavorito (
	FavoritoId INTEGER PRIMARY KEY AUTOINCREMENT,
	ArtistId INTEGER NOT NULL,
	Usuario VARCHAR (50),
	FOREIGN KEY (ArtistId) REFERENCES Artist(ArtistId)
	);

SELECT *
FROM ArtistaFavorito

SELECT *
FROM Artist 
WHERE ArtistId = 1


-- Popular tabela artista favorito 
INSERT INTO ArtistaFavorito (ArtistId, Usuario)
VALUES (3, 'Cassiana'),
	   (5, 'Emily'),
	   (50, 'Sheldon'),
	   (29, 'Sally'),
	   (200, 'Maria')
	   
-- Consultar nome do artista favorito de cada usuario

SELECT 
ArtistaFavorito.Usuario as 'Nome do Usuario',
Artist.Name as 'Nome do artista favorito'
FROM ArtistaFavorito 
INNER JOIN Artist
ON ArtistaFavorito.ArtistId = Artist.ArtistId

-- DELETAR TABELA DO BANCO DE DADOS

DROP TABLE ArtistaFavorito

		
	
	

































