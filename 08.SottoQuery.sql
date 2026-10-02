SOTTOCARTELLE 

--1. SOTTOQUERY nel WHERE
-- Obbiettivo
-- Trovavare gli studenti che hanno preso il voto massimo in tutti i corsi.

-- passo 1 trovare il voto massimo
SELECT MAX(Voto) [Voto Massimo] FROM Voti;

SELECT CAST(MAX(Voto) AS INT) [Voto Massimo] FROM Voti; 

-- passo finale sottoquery
SELECT
	s. Nome,
	s. Cognome,
	v. Voto
FROM Studenti s
JOIN Voti v
	ON s.StudenteId = v.StudenteId
WHERE v.Voto = 30;

SELECT
	s. Nome,
	s. Cognome,
	v. Voto
FROM Studenti s
JOIN Voti v
	ON s.StudenteId = v.StudenteId
WHERE v.Voto = (
SELECT 
	MAX(Voto) AS [Voto Massimo] 
FROM Voti); 


--2. SOTTOQUERY nel SELCT
-- Obbittivo
-- Mostrare ogni studente con la media dei suoi voti (senza GroupBY
 -- Passo 1 visualizza tutti gli studenti

 SELECT *
 FROM Studenti;
	
-- passo 2 medie dei voti

SELECT 
 AVG(voto) [Media Voti] -25.90000000000
FROM Voti;

-- passo 2 medie dei voti

/*--SELECT
	s. Nome,
	s. Cognome,
	S. CodiceFiscale,
	v. Voto
FROM Studenti s
JOIN Voti v
	ON s.StudenteId = v.StudenteId
WHERE v.Voto = (
SELECT 
	AVG(Voto) AS [Voti Medio] 
--FROM Voti);*/

SELECT
	Nome,
	Cognome,
	CodiceFiscale,
	(
		SELECT 
			AVG(voto) [Media Voto] 
		FROM Voti
    )
 FROM Studenti;

 SELECT * FROM Voti 
WHERE Voto = 25.900000

-- Passo 1 Restituire gli studenti 
SELECT
	Nome,
	Cognome
FROM Studenti;
-- passo 2 restituire i voti >= 28
SELECT 
	Voto
From Voti
WHERE voto >= 28;
-- dobbiamo unire i due passi  usando il filtro da in 
SELECT
	Nome,
	Cognome
FROM Studenti
WHERE StudenteId IN (
					SELECT 
						StudenteId
					FROM Voti
					WHERE voto >= 28 
						);
-- SOTTOQUERY con EXIST
-- obbiettivo 4 
-- MAostra gli studenti con almeno un voto
  --- passo 1 elenco studenti 
SELECT
	Nome,
	Cognome
FROM Studenti

-- passo 2 EXIST:1 
SELECT 1
FROM Voti
WHERE StudenteId = 2
--Passo 3
SELECT
	Nome,
	Cognome
FROM Studenti s
WHERE EXISTS (
	SELECT 1
	FROM Voti v
	WHERE s.StudenteId = v.StudenteId
	);

-- if exist one student 
-- Obbittivo 5 gli studenti che hanno perso un voto superiore alla media  

-- Passo 1 media dei voti

SELECT 
	AVG(voto) [Media Voto] -->25.900000
FROM Voti
	
-- Passo 2 query completa

SELECT
	Nome,
	Cognome
FROM Studenti s
INNER JOIN Voti v
	ON s. StudenteId = v.StudenteId
WHERE v.Voto > (-- calcola la media 
				SELECT 
					AVG(voto) 
				FROM Voti
);

--6. SOTTOQUERY con JOIN (super avanzata)
-- Obiettivo
-- Mostrare i corsi che hanno una media voti superiore alla media di tutti i corsi.


--7. SOTTOQUERY per trovare studenti senza data di nascita
-- Obiettivo
--Mostrare studenti iscritti a corsi senza data di nascita, usando sottoquery invece dei JOIN.




