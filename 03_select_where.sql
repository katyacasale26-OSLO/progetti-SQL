selectwhere

USE ScuolaDb;
Go

-- Primo passo con select 
SELECT * FROM Studenti;

-- Secondo passo con 'SELECT'
/*
    Esempio: 
        select 
            colonna1, 
            colonna2, 
            ...
        from tabella 
*/

SELECT 
    Nome, 
    Cognome,
    CodiceFiscale
FROM Studenti

-- Concatenazione di due colonne (+) 
-- Aliass = AS per definire il nome di una colonna durante la select 

--Esempio1
SELECT 
    Nome + ' ' + Cognome AS NomeCompleto,
    CodiceFiscale 
FROM Studenti;

--Esempio2
SELECT 
    Nome + ' ' + Cognome AS 'Nome Completo',
    CodiceFiscale
FROM Studenti;

--Esempio3
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale AS [CF]
FROM Studenti;

select * from Studenti

-- where filtra a secondo le condizioni
-- esempio 1

SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale, 
    Data_Nascita
FROM Studenti;

-- is NULL / is not NULL con filtro where 
SELECT 
    Nome + ' ' + Cognome AS [Nome Completo],
    CodiceFiscale, 
    Data_Nascita
FROM Studenti
WHERE Data_Nascita IS NOT NULL;

/*
RESTITUIRE LA LISTA DEGLI STUDENTI CHE NON HANNO LA DATA DI NASCITA

Campi da visualizzare 
        Nome completo dello studente,
        email,
        data di nascita,
        codice fiscale,
*/

SELECT
  Nome + ' ' + Cognome AS [Nome Completo],
  email,
  CodiceFiscale, 
  Data_Nascita,
  CodiceFiscale 
FROM Studenti
WHERE Data_Nascita IS NULL;

-- ORDER ordina le colonne asce
SELECT
  Nome + ' ' + Cognome AS [Nome Completo],
  email,
  CodiceFiscale, 
  Data_Nascita
 
FROM Studenti
WHERE Data_Nascita IS NULL
order by [Nome Completo] asc;

-- ORDER ordina le colonne desc


SELECT
  Nome + ' ' + Cognome AS [Nome Completo],
  email,
  CodiceFiscale, 
  Data_Nascita
FROM Studenti
WHERE Data_Nascita IS NULL
order by [Nome Completo]desc;







