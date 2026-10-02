/*

 ALTER TABLE - Cos'è e perchè si usa sql server ?
 Alter table serve per modificare una tabella già esistente 
 senza doverla ricreare.
 Con ALTER TABLE
	puoi aggiungere colonne
	moficare le colonne 
	eliminare colonne
	aggiungere vincoli (primary key, foreing key,unic, check
	eliminare vincoli
	rinominare colonne
	cambiare i tipi di dati 
	modificare una colonna in default 
 */

 -- Aggiunge una nuova colonna in Studenti 
 ALTER TABLE Studenti
 ADD Indirizzo NVARCHAR(150) NULL;

 SELECT * FROM Studenti

 -- ADD aggiunge un nuova colonna 
 -- NULL significa che è opzionale 

 -- Modifica il tipo di dato in una colonna 
 -- Obbiettivo 
 -- cambiare il tipo di dato della colonna Telefono da (NVARCHAR(50) A VARCHAR (20))  

 ALTER TABLE Studenti
 ALTER COLUMN Telefono VARCHAR(100)NOT NULL;

 -- Rimuovere una colonna
	EXEC sp_rename 'Studenti.Data_Nascita', 'DataNascita'

-- ELIMINARE UNA COLONNA 
ALTER TABLE Studenti
DROP COLUMN Indirizzo;

-- Aggiungere una FOREIGN KEY
-- aggiungere una FK nella tabella Voti
ALTER TABLE Voti 
ADD CONSTRAINT FK_Voti_Studenti 
FOREIGN KEY (StudenteId) REFERENCES Studenti(StudenteId)
-- ELIMINARE FOREIGN KEY
ALTER TABLE Voti 
DROP CONSTRAINT FK_Voti_Studenti 
-- AGGIUNGERE UN VINCOLO UNIQUE 
ALTER TABLE Studenti 
ADD CONSTRAINT UNIQUE_Studenti_Telefono UNIQUE(Telefono) 
-- AGGIUNGERE UN VALORE DI DEFAULT
-- impostare Superato=1  nei voti 
ALTER TABLE Voti
ADD CONSTRAINT DF_Voti_Superato DEFAULT 1 FOR Superato; 






