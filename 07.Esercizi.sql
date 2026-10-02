-- Restituire il -- ESERCIZIO 1
/*  Restituire il voto medio degli studenti
	campi da visualizzare:
		nome completo 
		cf 
		voto 
*/

 SELECT 
	st.Nome + ' ' + st.Cognome AS Stundente,
	st.CodiceFiscale AS CF,
	AVG(vt.voto) AS [voto medio]
 FROM Studenti st
	JOIN Voti vt
	ON st.StudenteId = vt.StudenteId
 GROUP BY st.Nome,st.Cognome,st.CodiceFiscale;

 ----------------------------------------------

 /*  Concat() concatena due stringhe di testo 
	
		nome completo 
		cf 
		voto 
*/
SELECT 
	CONCAT(st.Nome , ' ' , st.Cognome) AS Stundente,
	st.CodiceFiscale AS CF,
	CAST(AVG(vt.voto) AS INT) AS [voto medio] -- CAST(INT) per convertire da decimale ad intero 
 FROM Studenti st
	JOIN Voti vt
	ON st.StudenteId = vt.StudenteId
 GROUP BY st.Nome,st.Cognome,st.CodiceFiscale;


Select * from Studenti;
Select * from Iscrizioni; 
Select * from Corsi;
Select * from DocentiCorso;
Select * from Docenti;
Select * from Lezioni;
Select * from Aule;

/*

Docenti, Corsi, Aule Lezioni
Lezioni <-> Aule <-Corsi
Iscrizioni <-> Studenti <- Corsi
DocentiCorsi <- Docenti

	Restituire la lista degli studenti iscritti ad un corso SENZA la data di nascita, 
	mostrando:
		Nome completo
		Data di nascita (rinominata)
		Codice Fiscale
		Corso
		Voto
		Docente
		Aula
*/
SELECT 
    CONCAT(s.Nome, ' ', s.Cognome) AS NomeCompleto,
    ISNULL(CONVERT(VARCHAR(10), s.Data_Nascita, 120), 'Non registrata') AS Data_di_Nascita,
    s.CodiceFiscale AS CF,
    c.NomeCorso AS Corso,
    CAST(AVG(v.Voto) AS INT) AS Voto,
    CONCAT(d.Nome, ' ', d.Cognome) AS Docente,
    a.NomeAula AS Aula
FROM Studenti s
JOIN Iscrizioni i 
    ON s.StudenteId = i.StudenteId
JOIN Corsi c 
    ON i.CorsoId = c.CorsoId
JOIN Voti v 
    ON s.StudenteId = v.StudenteId 
    AND c.CorsoId = v.CorsoId
JOIN DocentiCorso dc 
    ON c.CorsoId = dc.CorsoId
JOIN Docenti d 
    ON dc.DocenteId = d.DocenteId
JOIN Lezioni l 
    ON c.CorsoId = l.CorsoId
JOIN Aule a 
    ON l.AulaId = a.AulaId
WHERE s.Data_Nascita IS NULL
GROUP BY s.Nome, s.Cognome, s.Data_Nascita, s.CodiceFiscale, c.NomeCorso, d.Nome, d.Cognome, a.NomeAula;


-- Obiettivo 1
-- Mostrare gli studenti che hanno preso un voto maggiore o uguale a 28 in qualsiasi corso.

SELECT DISTINCT
	s.nome, s.cognome
FROM Studenti s
	JOIN Voti v ON s.StudenteId = v.StudenteId
WHERE v.voto >= 28;

-- Obiettivo 2
-- Mostrare gli studenti che non sono iscritti a nessun corso.

SELECT 
	s.Nome + ' ' + s.Cognome AS Stundente
FROM Studenti s
	LEFT JOIN Iscrizioni i ON s.StudenteId = i.StudenteId
	LEFT JOIN Corsi c ON i.CorsoId = c.CorsoID
WHERE i.StudenteId IS NULL
ORDER BY [Stundente] ASC;
--	
SELECT 
  s.Nome + ' ' + s.Cognome AS 'nome completo',
  c.NomeCorso,
  i.DataIscrizione
FROM Studenti s
	LEFT JOIN Iscrizioni i
		ON i.StudenteId = i.IscrizioneId
	LEFT JOIN Corsi c
		ON i.CorsoId = c.CorsoID
WHERE i.DataIscrizione IS NULL; 

 -- Obiettivo 3  con Full JOIN 
-- Mostrare studenti e voti, anche se non corrispondono.

SELECT
	S.Nome,
	s.Cognome,
 ISNULL(v.Voto, 0) AS Voto
FROM Studenti AS s
FULL OUTER JOIN Voti AS v
ON s.StudenteId = v.StudenteId
  

SELECT
	S.Nome,
	s.Cognome,
 CAST(ISNULL(v.Voto, 0) AS INT) AS Voto
FROM Studenti AS s
FULL OUTER JOIN Voti AS v
	ON s.StudenteId = v.StudenteId
ORDER by Nome asc;
--
/* Esercizi 3
Mostrare i corsi che non hanno studenti iscritti.*/
SELECT
    CONCAT(s.Nome, ' ', s.Cognome) AS Nome,
   ISNULL(c.CorsoId, 0) AS ID,
  ISNULL(c.NomeCorso, 'Non definita') AS Corso,
   ISNULL(c.Crediti, 0) AS Crediti,
    ISNULL(c.Durata,0) As Durata
FROM Studenti AS s
LEFT JOIN Iscrizioni AS i
    ON s.StudenteId = i.StudenteId
LEFT JOIN Corsi AS c
    ON c.CorsoId= i.CorsoId
WHERE i.CorsoId IS NULL;






