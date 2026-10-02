/*
    
    JOIN / INNER JOIN
    LEFT JOIN parte da sx 
    RIGHT JOIN parte da dx 
    FULL JOIN 

    -----------------------------------
    
    JOIN — PERCHÉ SERVE?

    Fino a questo punto abbiamo lavorato principalmente con una tabella.

    Ma un database relazionale è composto da più tabelle collegate tra loro.

    Nel nostro database "ScuolaDb" abbiamo, per esempio:

    Studenti
       |
       ↓
    Iscrizioni
       |
       ↓
    Corsi

    Uno studente può essere iscritto a un corso.

    Per ottenere informazioni provenienti da più tabelle utilizziamo i JOIN.
    ----------------------------------------------------
    Sintassi base della JOIN/InnerJOIN
    unisce 2 tabelle che hanno qualcosa in comune
        SELECT
        tl.colonna1
        tl.colonna2
        tl.colonna3
        tl.colonna4
        ....

    From tabella1 AS t1
    Inner join tabella2 AS t2
        ON condizione (t1.Id =t2.Id )
*/

-- restituire la lista degli studenti scritti 


SELECT * 
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId;
-- nome completo 
-- data nascita
-- Codice fiscale
-- data iscrizione 


SELECT  
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.Data_nascita as [Data_nascita],
    s.CodiceFiscale as [CodiceFiscale],
    i.DataIscrizione as [DataIscrizione]
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId;



SELECT  
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.Data_nascita as [Data_nascita],
    s.CodiceFiscale as [CodiceFiscale],
    i.DataIscrizione as [DataIscrizione],
    c.NomeCorso + ' - ' + c.Descrizione as [Corso],
    c.Durata 
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
    ON i.CorsoId = c.CorsoId;

-- Esempio 3
-- restituisce la lista degli studenti iscritti ad un corso con la data nascita null

SELECT  
    s.Nome + ' ' + s.Cognome as [Nome Completo],
    s.Data_nascita as [Data_nascita],
    s.CodiceFiscale as [CodiceFiscale],
    i.DataIscrizione as [DataIscrizione],
    c.NomeCorso + ' - ' + c.Descrizione as [Corso],
    c.Durata  
FROM Studenti AS s
INNER JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
INNER JOIN Corsi AS c
    ON i.CorsoId = c.CorsoId
    WHERE s.Data_Nascita IS NULL;

--ESERCIZIO 4

/* 
    Docenti, Corsi, Aule Lezioni
    lezioni <--> Aule <--  Corsi 
    Iscrizioni <--> Studenti <-- Corsi
    Descrizioni <-- Docenti 



    Restituire
        il nome dello studente,
        il Corso,
        l'aula,
        il Docente,
        Le lezione 


*/

SELECT * from Studenti
SELECT * from Iscrizioni; -- c /s
SELECT * from Corsi
SELECT * from DocentiCorso
SELECT * from Docenti
SELECT * from Lezioni
SELECT * from Aule

	 
SELECT *  
from Studenti s
JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
JOIN Corsi as c
    ON c. CorsoID = i.CorsoId
JOIN DocentiCorso as dc
    ON dc. CorsoId = c.CorsoID  
JOIN Docenti as D
    ON d. DocenteId = dc.DocenteId
Join Lezioni as l
    ON c.CorsoId = l.CorsoId
JOIN Aule as n
    ON n.AulaId = l.AulaId;

--------------------------------



Select DISTINCT
    s.Nome + ' ' + s.Cognome as [Nome Studente],
    s.Data_nascita as [Data di nascita],
    s.CodiceFiscale as [CF],
    i.DataIscrizione as [Data Iscrizione],
    c.NomeCorso + ' - ' + c.Descrizione as [Corso],
    c.Durata,  
    d.Nome + '' + d.Cognome as [Nome Docente],
    d.Specializzazione,
    a.NomeAula as [Nome Aula],
    a.Capacita as [Capacità]
    from Studenti s
JOIN Iscrizioni i
    ON s.StudenteId = i.StudenteId
JOIN Corsi as c
    ON c. CorsoID = i.CorsoId
JOIN DocentiCorso as dc
    ON dc. CorsoId = c.CorsoID  
JOIN Docenti as D
    ON d. DocenteId = dc.DocenteId
Join Lezioni as l
    ON c.CorsoId = l.CorsoId
JOIN Aule as a
    ON a.AulaId = l.AulaId;

-------------------------------------------------------------------------------------------------------------------

SELECT 
Nome + ' ' + Cognome [Nome Completo]
from Studenti

--------------------------------------------------------------------------------------------------------------------

SELECT 
    s.Nome + ' ' + s.Cognome [Nome Completo],
    c.NomeCorso,
    c.Descrizione
from Studenti s
JOIN Iscrizioni i
    ON i.StudenteId = s.StudenteId
JOIN Corsi c
    ON c.CorsoID = i.CorsoID
    
-------------------------------------------
-----------------------------------------

SELECT TOP 10 *
FROM Studenti AS s
INNER JOIN Iscrizioni i
    ON i.StudenteId =s.StudenteId
WHERE Data_Nascita IS NOT NULL
    AND Data_Nascita <> '2000'
ORDER BY Data_Nascita ASC
----------------------------------------------------
---LEFT JOIN mostra i record della tabella sx
--- anche se non esiste corrispondenza nella tabelle di dx 
-------------------------------------------------

SELECT TOP 10 *
FROM Studenti AS s
JOIN Iscrizioni i
    ON i.StudenteId =s.StudenteId
    LEFT JOIN Corsi c
    ON i.CorsoId = c.CorsoID
    AND Data_Nascita <> '2000'
ORDER BY Data_Nascita ASC;

-----------------------------------------------------------------
-- Restituisci la lista degli studenti non iscritti 
SELECT 
  s.Nome,
  s.Cognome, 
  s.CodiceFiscale,
  s.email,
  s.Data_Nascita,
  s.Telefono,
  c.NomeCorso,
  c.Descrizione, 
  c.Crediti, 
  C.Durata, 
  i.DataIscrizione
FROM Studenti s
LEFT JOIN Iscrizioni i
    ON i.StudenteId = i.IscrizioneId
LEFT JOIN Corsi c
    ON i.CorsoId = c.CorsoID

-----------------------------------------------------------------
--ISNULL() restituisce valori specificato se l'espressioneè NULL
-- convert() converte i dati di tipo NULL a come lo desideri 

SELECT 
  Nome, 
  Cognome,
  ISNULL(CONVERT(VARCHAR, Data_Nascita, 104), 'PIPPO / NON ESISTE') AS Data_Nascita 
FROM Studenti
WHERE Data_Nascita IS NULL;


SELECT 
  Nome, 
  Cognome
FROM Studenti
WHERE Data_Nascita IS NULL;


SELECT 
  ISNULL(s.Nome, 'N/D') AS [Nome],
  ISNULL(s.Cognome, 'Non Definito') AS [Cognome],
  ISNULL(s.CodiceFiscale, 'Non Specificato') AS [CodiceFiscale],
  ISNULL(s.email, 'Non Presente') AS [email],
  ISNULL(CONVERT(VARCHAR, s.Data_Nascita, 104),'N/D' ) AS [Data_Nascita],
  ISNULL(s.Telefono, '00000') AS [Telefono],
  ISNULL(c.NomeCorso, 'Non Ancora definito') AS [NomeCorso],
  ISNULL (CONVERT(VARCHAR, c.Crediti), 'non ancora assegnati') AS [Crediti],
  ISNULL(c.Durata, 0) AS [Durata],
  ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 109), 'N/D') AS [DataIscrizione]
FROM Studenti s
LEFT JOIN Iscrizioni i
    ON i.StudenteId = i.IscrizioneId
LEFT JOIN Corsi c
    ON i.CorsoId = c.CorsoID


SELECT 
  Nome, 
  Cognome,
  ISNULL(CONVERT(VARCHAR, Data_Nascita, 105), 'PIPPO / NON ESISTE') AS Data_Nascita 
FROM Studenti
WHERE Data_Nascita IS NULL;
-----------------------------------------------
-- min----

SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'N7D') AS Ora
FROM Lezioni

-- ore ----

SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'N7D') AS Ora,
    DATEPART(MINUTE, OraInizio) AS Minuti
FROM Lezioni

SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'N7D') AS Ora,
    DATEPART(MINUTE, OraInizio) AS Minuti,
    DATEPART(HOUR, OraInizio) AS Ora
FROM Lezioni

-----------------------------------------
--vari modi per ottenre lo stesso risultato--

SELECT 
    Titolo + ' ' + Descrizione AS [Materia],
    'La lezione inizia alle ' +
ISNULL(LEFT(CONVERT(VARCHAR,OraInizio, 108), 2), 'N7D') AS Orario
FROM Lezioni

SELECT
    Titolo + ' ' + Descrizione AS [Materia],
   
    DATEPART(MINUTE, OraInizio) AS Minuti,
    DATEPART(HOUR, OraInizio) AS Ora,
    DATEPART(second, OraInizio) AS SECONDI
 FROM Lezioni
--------------------------------------------------------
/* 
   RIGHT JOIN 
   fa il contario della "LEFT JOIN"

*/

SELECT 
st.Nome + ' ' + st.Cognome AS Stundente,
st.CodiceFiscale AS CF,
ISNULL(CONVERT(VARCHAR, i.DataIscrizione, 105), 'data non definita') AS [Data Iscrizione]
FROM Studenti st
RIGHT JOIN Iscrizioni i
    ON i.StudenteId = st.StudenteId

-------------------------------------------------

SELECT 
  












   













