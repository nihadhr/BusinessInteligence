GO
CREATE DATABASE StudentskaSluzbaDW

GO
USE StudentskaSluzbaDW

GO
CREATE TABLE DimLokacija
(
	LokacijaKey INT NOT NULL CONSTRAINT [PK_Lokacija] PRIMARY KEY IDENTITY(1,1),
	LokacijaAltKey INT NOT NULL,
	Grad NVARCHAR(50),
	Regija NVARCHAR(50),
	Drzava NVARCHAR(50),
	
)

GO
CREATE TABLE DimStudij
(
	StudijKey INT NOT NULL CONSTRAINT [PK_Studij] PRIMARY KEY IDENTITY(1,1),
	StudijAltKey INT NOT NULL,
	Smjer NVARCHAR(50),
	StudijskiProgram NVARCHAR(50),
	Fakultet NVARCHAR(50),
	
)

GO
CREATE TABLE DimAkademskaGodina
(
	AkademskaGodinaKey NVARCHAR(9) NOT NULL,
	CONSTRAINT [PK_AkademskaGodina] PRIMARY KEY CLUSTERED (AkademskaGodinaKey ASC)
)

GO
CREATE TABLE DimSemestar
(
	SemestarKey INT NOT NULL CONSTRAINT [PK_Semestar] PRIMARY KEY,
	Semestar NVARCHAR(20)
	
)
drop table DimSemestar
go

GO
CREATE TABLE DimNacinStudiranja
(
	NacinStudiranjaKey INT NOT NULL CONSTRAINT [PK_NacinStudiranjaKey] PRIMARY KEY identity(1,1),
	NacinStudiranja NVARCHAR(20) NOT NULL,
	
)

GO
CREATE TABLE DimSpol
(
	SpolKey NVARCHAR(6) NOT NULL CONSTRAINT [PK_Spol] PRIMARY KEY,
)


GO
CREATE TABLE FactUpisStudenata
(
	UpisStudenataKey INT NOT NULL IDENTITY(1,1),
	LokacijaKey INT,
	StudijKey INT,
	AkademskaGodinaKey NVARCHAR(9),
	NastavniPlanKey NVARCHAR(9),
	SemestarKey INT,
	NacinStudiranjaKey INT,
	SpolKey NVARCHAR(6),
	BrojUpisa INT,
	UkupnoUpisano INT NOT NULL,
	CONSTRAINT [PK_UpisStudenata] PRIMARY KEY CLUSTERED (UpisStudenataKey ASC),
	CONSTRAINT [FK_UpisStudenata_Lokacija] FOREIGN KEY (LokacijaKey) REFERENCES DimLokacija (LokacijaKey),
	CONSTRAINT [FK_UpisStudenata_Studij] FOREIGN KEY (StudijKey) REFERENCES DimStudij (StudijKey),
	CONSTRAINT [FK_UpisStudenata_AkademskaGodina] FOREIGN KEY (AkademskaGodinaKey) REFERENCES DimAkademskaGodina (AkademskaGodinaKey),
	CONSTRAINT [FK_UpisStudenata_NastavniPlan] FOREIGN KEY (NastavniPlanKey) REFERENCES DimAkademskaGodina (AkademskaGodinaKey),
	CONSTRAINT [FK_UpisStudenata_Semestar] FOREIGN KEY (SemestarKey) REFERENCES DimSemestar (SemestarKey),
	CONSTRAINT [FK_UpisStudenata_NacinStudiranja] FOREIGN KEY (NacinStudiranjaKey) REFERENCES DimNacinStudiranja (NacinStudiranjaKey),
	CONSTRAINT [FK_UpisStudenata_Spol] FOREIGN KEY (SpolKey) REFERENCES DimSpol (SpolKey)
)
select  *
from FactUpisStudenata
use StudentskaSluzbaDW


GO
DROP TABLE FactUpisStudenata

