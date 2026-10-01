-- creazione database.sql
-- create database sql
-- create database SculaDb;

-- uso database sempre per query
use ScuolaDb;
go

-- I TIPI DI DATI IN SQL SERVER

/*
    I TIPI DI DATI DI SQL
        INT      = INTERO
        CHAR     = CARATTERE (A)
        VARCHAR  = TESTO (STRINGA) 
        NVARCHAR = TESTO (STRINGA) 
        FLOAT    = DECIMALI (10, 2)
        DATE     = DATA 
*/

-- CREAZIONE TABELLE 
CREATE TABLE Studenti(

    -- ID univoco dello studente
    -- INT = numero intero
    -- PRIMARY KEY = chiave primaria (identifica ogni riga)
    -- IDENTITY(1,1) = auto incremento (parte da 1 e aumenta di 1)
    StudentiID INT NOT NULL PRIMARY KEY IDENTITY(1,1),

    -- Nome dello studente
    -- NVARCHAR(50) = testo Unicode (supporta caratteri speciali)
    -- NOT NULL = campo obbligatorio
    Nome NVARCHAR(50) NOT NULL,

    -- Cognome dello studente
    Cognome NVARCHAR(50) NOT NULL,

    -- Data di nascita
    -- DATE = formato YYYY-MM-DD
    -- NULL = opzionale
    DataNascita DATE NULL,

    -- Email
    -- UNIQUE = non possono esistere duplicati
    -- NOT NULL = obbligatorio
    Email NVARCHAR(150) UNIQUE NOT NULL,

    -- Numero di telefono
    -- VARCHAR = testo normale (no Unicode)
    Telefono VARCHAR(50) UNIQUE NOT NULL,

    -- Codice Fiscale
    -- CHAR(16) = lunghezza fissa di 16 caratteri
    CodiceFiscale CHAR(16) UNIQUE NOT NULL
);


-- restiture tutte le righe della tabella studenti
-- select * from <studenti>
-- * = all (tutte le righe)

select * from Studenti;


--creazione tabella corsi
CREATE TABLE Corsi(
    CorsoId -- inetero chiave primaria
    NomeCorso -- testo(100)
    Descrizione -- testo(255) non è nullabile
    Crediti -- intero
    Durata -- intero
   );

   
   CREATE TABLE Corsi(
      CorsoID INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
      NomeCorso NVARCHAR (100) NOT NULL,
      Descrizione NVARCHAR (255) NULL,
      Crediti INT NULL,
      Durata INT NULL,
    );

    -- Creazione della tabella Docenti

CREATE TABLE Docenti(
    DocenteId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL,
    Cognome NVARCHAR(50) NOT NULL,
    Email NVARCHAR(150) UNIQUE NULL,
    Specializzazione NVARCHAR(50) NOT NULL
);

-- Creazione della tabella Aule
CREATE TABLE Aule(
    AulaId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    NomeAula NVARCHAR(150) NOT NULL,
    Capacita INT NOT NULL
);
   
   EXEC sp_rename 'Studenti.StudentiID', 'StudenteId';
   
   SELECT * FROM Studenti;
   select *from Corsi


   create table Voti(
      VotoId int not null primary key identity(1,1),

      -- Colonne foreing key 
          StudenteId INT NOT NULL,
          CorsoId INT NOT NULL,

          Voto DECIMAL(4,2) NOT NULL,
          dataVoto DATE NOT NULL,
          Note NVARCHAR(255) NULL,
          -- bit = TIPO BOOLAN VERO O FALSO
          Superato BIT NOT NULL DEFAULT 1,

          FOREIGN KEY (StudenteId) REFERENCES Studenti (StudenteId),
          FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId)
      );
      --SELECT GETDATE();RESTITUISCE DATA DEL GIORNO
      /*
    CREAZIONE TABELLA ISCRIZIONI
    RELAZIONEALE
    STIDENTE N, CORSO N
    1 STUDENTE PUò FRAQUENTARE DIVERSI CORSI 
    1 CORSO PUO' AVERE + STUDENTI
    */



      CREATE TABLE Iscrizioni(
     IscrizioneId INT NOT NULL PRIMARY KEY IDENTITY(1,1),

     StudenteId INT NOT NULL,
     CorsoId int NOT NULL,
     DataIscrizione DATE DEFAULT GETDATE() NOT NULL,
     Stato NVARCHAR(30) NOT NULL DEFAULT 'Attiva',
     
     FOREIGN KEY (StudenteId) REFERENCES Studenti (StudenteId),
     FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),

     CONSTRAINT UQ_Iscrizione_Studente_Corso
        UNIQUE(StudenteId,CorsoId)
);


CREATE TABLE DocenteCorsi(
    DocenteCorso INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
    DocenteId INT NOT NULL,
    CorsoId INT NOT NULL,
    DataRegistrazione DATE NULL,
    DataAssegnazione DATE NULL,
    Ruolo NVARCHAR(50) NULL,


    FOREIGN KEY (DocenteId) REFERENCES Docenti(DocenteId),
    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),
     
    CONSTRAINT UQ_Docente_Corso
        UNIQUE(DocenteId,CorsoId)
);

EXEC sp_rename 'DocenteCorsi', 'DocentiCorso';


CREATE TABLE Lezioni(
    LezioniId INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    CorsoId INT NOT NULL,
    AulaId INT NOT NULL,
    Titolo NVARCHAR(100) NOT NULL,
    Descrizione NVARCHAR(MAX) NULL,
    DataLezione DATE NOT NULL,
    OraInizio TIME NOT NULL,
    OraFine TIME NOT NULL,
    Durata INT NULL,

    FOREIGN KEY (CorsoId) REFERENCES Corsi(CorsoId),
    FOREIGN KEY (AulaId) REFERENCES Aule(AulaId),
    );






