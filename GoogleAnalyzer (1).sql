---création & connexion : base de données

DROP DATABASE MeetCourseAnalyzer;

create database MeetCourseAnalyzer;
use MeetCourseAnalyzer;

--création : tables

create table Professeur(
    MatriculeProf int auto_increment PRIMARY KEY,
    NomProf varchar(30) not null,
    PrenomProf varchar(30) not null,
    Email varchar(50) not null,
    MotDePass text
);

create table Classe (
    CodeClasse varchar(250) primary key,
    NombreEtudiant int not null
);

create table Etudiant (
    idEtudiant int auto_increment PRIMARY KEY,
    NomEtudiant varchar(30) not null,
    PrenomEtudiant varchar(30) not null,
    Email varchar(50) not null,
    CodeClasse int,
    constraint fk_et foreign key(CodeClasse) REFERENCES Classe (CodeClasse)
);

create table Matiere (
    IdMatiere int auto_increment primary key,
    NomMatiere varchar(50) not null,
    Coefficient int not null
);

create table Seance (
    idSeance int auto_increment primary key,
    Prof int not null,
    constraint fk_seance_prof foreign key(Prof) REFERENCES Professeur(MatriculeProf),
    DateDebut date default CURRENT_DATE,
    DateFin date default CURRENT_DATE,
    HeureDebut time DEFAULT current_time,
    HeureFin time,
    Duree time,
    IdMatiere int,
    constraint fk_seance_matiere foreign key(IdMatiere) REFERENCES Matiere(IdMatiere),
    classe varchar(250),
    constraint fk_seance_classe foreign key(classe) REFERENCES Classe(CodeClasse)
);

create table Evaluation (
    IDEvaluation int primary key,
    noteEvaluation int,
    idSeance int,
    constraint fk_evaluation foreign key(idSeance) REFERENCES Seance(idSeance)
);
create table Choix(
    Prof int,
    constraint fk_choix_prof foreign key(Prof) references Professeur(MatriculeProf),
    nomProf varchar (255),
    Matiere int,
    constraint fk_choix_matiere foreign key(Matiere) references Matiere(IdMatiere),
    intituleMatiere varchar(255),
    Seance int,
    constraint fk_choix_Seance foreign key(Seance) references Seance(idSeance),
    classe varchar(250),
    constraint fk_choix_classe foreign key(classe) references Classe(CodeClasse)
);

--attribution de privileges

drop USER Professeur@'localhost';
DROP USER Meet_Course_Analyzer@'localhost';

grant all privileges on MeetCourseAnalyzer.Choix to Professeur@'localhost' identified by "passer";
grant SELECT on MeetCourseAnalyzer.* to Professeur@'localhost';

grant all privileges on MeetCourseAnalyzer.* to Meet_Course_Analyzer@'localhost'  identified by "passer";


--code du trigger...
