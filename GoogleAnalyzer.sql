---création & connexion : base de données

DROP DATABASE MeetCourseAnalyzer;

create database MeetCourseAnalyzer;
use MeetCourseAnalyzer;

--création : tables

create table Professeur(
    MatriculeProf int auto_increment,
    NomProf varchar(30) not null,
    PrenomProf varchar(30) not null,
    Email varchar(50) not null,
    CONSTRAINT pk_prof PRIMARY KEY (MatriculeProf),
);

create table Classe (
    CodeClasse varchar(250),
    NombreEtudiant int not null,
    constraint pk_Classe primary key(CodeClasse),
);

create table Etudiant (
    idEtudiant int auto_increment,
    NomEtudiant varchar(30) not null,
    PrenomEtudiant varchar(30) not null,
    Email varchar(50) not null,
    CodeClasse int not null,
    constraint pk_Etudiant PRIMARY KEY(idEtudiant),
    constraint fk_Etudiant foreign key(CodeClasse) REFERENCES Classe
);

create table Matiere (
    IdMatiere int auto_increment,
    NomMatiere varchar(50) not null,
    Coefficient int not null,
    constraint pk_Matiere primary key (IdMatiere),
);

create table Seance (
    idSeance int auto_increment,
    Prof int not null,
    DateDebut date default CURRENT_DATE,
    DateFin date default CURRENT_DATE,
    HeureDebut time DEFAULT current_time,
    HeureFin time,
    Duree time,
    IdMatiere int,
    classe varchar(250),
    constraint pk_Seance primary key(idSeance),
    constraint fk_Seance_Class foreign key(classe) REFERENCES Classe,
    constraint fk_Seance_Prof foreign key(Prof) REFERENCES Professeur,
    constraint fk_Seance_Mat foreign key(IdMatiere) REFERENCES Matiere
);

create table Evaluation (
    idEtudiant int foreign key REFERENCES Etudiant,
    idSeance int foreign key REFERENCES Seance,
    nbrEvaluation int primary key
);
create table Choix(
    Prof int foreign key references Professeur,
    nomProf varchar (255),
    Matiere int foreign key references Seance,
    intituleMatiere varchar(255),
    Seance int foreign key references Seance,
    classe varchar(250) foreign key references Classe
);

--attribution de privileges

drop USER Professeur@'localhost';
DROP USER Etudiant@'localhost';

grant all privilèges on MeetCourseAnalyzer.Seance to Professeur@'localhost' idenfied by "passer";
grant all privilèges on MeetCourseAnalyzer.Choix to Professeur@'localhost' idenfied by "passer";
grant SELECT on MeetCourseAnalyzer.* to Professeur@'localhost';

grant select on MeetCourseAnalyzer.* to Etudiant@'localhost' idenfied by "passer";
