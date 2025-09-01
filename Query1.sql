CREATE DATABASE teste; -- Criando banco de dados
DROP DATABASE teste; -- excluir banco de dados, precisa desconectar antes, clicar com o botao direito e desconectar

CREATE DATABASE hashtag;
CREATE TABLE tabela (coluna1 TIPO1, coluna2 TIPO2);
-- Tipos de dados no postgres
-- criando tabela  CREATE TABELA tabela (coluna1 TIPO1, coluna2 TIPO2);
-- Precisamos especificar quais são as colunas que a tabela deve conter.
-- Cada coluna armazena um tipo de dados especificos
-- os principais são: INT: Numero inteiro, NUMERIC(M,D): M total de digitos e D casas decimais permitidas, 
-- VARCHAR (N): Uma string de comprimento variaveis, contendo letras, numeros e caracteres especiais, o N é a quantidade de caracteres
-- DATE: Uma data no formato YYYY-MM-DD
-- TIMESTAMP: Uma combinação de data e hora. Formato: YYYY-MM-DD e HH:MM:SS

CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100),
	Email VARCHAR(100)
);

CREATE TABLE cursos(
	ID_Cursos INT,
	Nome_Curso VARCHAR(100),
	Preco_Curso NUMERIC(10, 2)
);

CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT,
	ID_Cursos INT,
	Data_cadastro DATE
);

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

DROP TABLE alunos; -- excluir tabelas
DROP TABLE cursos;
DROP TABLE matriculas;

-- CONSTRAINTS Restrições
-- São regras aplicadas nas colunasde uma tabela
-- Ex COluna não pode ter valores nulos NULL
-- Ou especificar que uma coluna deverar ser uma chave primaria ou estrangeira
-- São usadas para limitar os tipos de dados que são inseridos

-- Principais:
-- 1 NOT NULL;
-- A CONSTRAINT NOT NULL faz com que a coluna nao aceite valores NULL
-- A CONSTRAINT NOT NULL obriga um campo sempre possuir valor, dessa forma a coluna com  restricao nao aceita valores vazios
		-- Nome_Cliente VARCHAR(100) NOT NULL
-- 2 PRIMARY KEY
-- A PRIMARY KEY identifica de forma unica cada registro de uma tabela de banco de dados.
-- chave primarias deve conter valores NULL
-- Cada tabela deve conter 1 e apenas 1 chave primaria.

-- 3 FOREIGN KEY - Estrangeira
-- uma chave estrangeira em uma tabela é um campo que aponta para uma chave primaria em outra tabela.

-- CREATE TABLE

CREATE TABLE alunos(
	ID_Aluno INT,
	Nome_Aluno VARCHAR(100) NOT NULL,
	Email VARCHAR(100) NOT NULL,
	PRIMARY KEY(ID_Aluno)
);

CREATE TABLE cursos(
	ID_Cursos INT,
	Nome_Curso VARCHAR(100) NOT NULL,
	Preco_Curso NUMERIC(10, 2) NOT NULL,
	PRIMARY KEY(ID_Cursos)
);

CREATE TABLE matriculas(
	ID_Matricula INT,
	ID_Aluno INT NOT NULL,
	ID_Cursos INT NOT NULL,
	Data_cadastro DATE NOT NULL,
	PRIMARY KEY(ID_Matricula),
	FOREIGN KEY(ID_Aluno) REFERENCES alunos(ID_Aluno),
	FOREIGN KEY(ID_Cursos) REFERENCES cursos(ID_Cursos)
);

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

-- INSERT INTO
-- Inserir dados nas tabelas

INSERT INTO alunos(ID_Aluno, Nome_Aluno, Email)
VALUES
	(1, 'Ana' , 'ana123@gmail.com'),
	(2, 'Bruno',  'bruno@gmail.com'),
	(3, 'Carla', 'carla@gmail.com'),
	(4, 'Diego', 'diego@gmail.com');

SELECT * FROM alunos;

INSERT INTO cursos(ID_Cursos, Nome_Curso, Preco_Curso)
VALUES
	(1, 'Excel' , '100'),
	(2, 'VBA',  '200'),
	(3, 'Power BI', '150'),
	(4, 'SQL', '100');

SELECT * FROM cursos;

INSERT INTO matriculas(ID_Matricula, ID_Aluno, ID_Cursos, Data_cadastro)
VALUES
	(1, '1', '1', '2022/03/01'),
	(2, '1', '3', '2022/03/01'),
	(3, '2', '2', '2022/02/01'),
	(4, '2', '4', '2022/02/01'),
	(5, '3', '1', '2022/04/01'),
	(6, '3', '2', '2022/05/01'),
	(7, '4', '3', '2022/05/01');

SELECT * FROM matriculas;

-- Atualizar a tabela

SELECT * FROM alunos;
SELECT * FROM cursos;
SELECT * FROM matriculas;

UPDATE cursos
SET Preco_Curso = 300
WHERE ID_Cursos = 1; -- WHERE aonde!!

DELETE FROM matriculas
WHERE ID_Matricula = 6;

-- TRUNCATE TABLE
-- Deletando todos os registros da tabela de uma vez, mas a tabela continua existindo

SELECT * FROM matriculas;

TRUNCATE TABLE matriculas;

-- DROP TABLE
-- Deletando tabelas com restriçoes de chave primaria, dai se utiliza o CASCADE OU EXCLUIR A QUE UTILIZA ELA EX A MATRICULA

DROP TABLE alunos CASCADE;
DROP TABLE cursos;
DROP TABLE matriculas;