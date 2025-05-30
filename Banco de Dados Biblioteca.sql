CREATE DATABASE IF NOT EXISTS biblios;
USE biblios;


CREATE TABLE Generos (
    GENEROID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(50) UNIQUE NOT NULL,
    DESCRICAO VARCHAR(255)
);


CREATE TABLE Livros (
    LIVROID INT AUTO_INCREMENT PRIMARY KEY,
    TITULO VARCHAR(255) NOT NULL,
    AUTOR VARCHAR(255),
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    ANOPUBLIC INT,
    QUANTDISPO INT NOT NULL DEFAULT 0,
    GENEROID INT,
    FOREIGN KEY (GENEROID) REFERENCES Generos(GENEROID)
);


CREATE TABLE Membros (
    MEMBROID INT AUTO_INCREMENT PRIMARY KEY,
    NOME VARCHAR(255) NOT NULL,
    MATRICULA VARCHAR(50) UNIQUE NOT NULL,
    ENDERECO VARCHAR(255)
);


CREATE TABLE Emprestimos (
    EMPRESTIMOID INT AUTO_INCREMENT PRIMARY KEY,
    LIVRO_ID INT NOT NULL,
    MEMBRO_ID INT NOT NULL,
    DATAEMPRESTIMO DATE NOT NULL,
    DATADEVOLUCAOESPERADA DATE NOT NULL,
    DATADEVOLUCAOREAL DATE,
    STATUS VARCHAR(20) DEFAULT 'ATIVO', 
    FOREIGN KEY (LIVRO_ID) REFERENCES Livros(LIVROID),
    FOREIGN KEY (MEMBRO_ID) REFERENCES Membros(MEMBROID)
);
