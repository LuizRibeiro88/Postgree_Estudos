-- Criando e excluindo banco de dados
CREATE DATABASE teste; -- Criando banco de dados
DROP DATABASE teste; -- Excluir banco de dados, precisa desconectar antes

CREATE DATABASE hashtag;

-- Criando tabelas
CREATE TABLE tabela (coluna1 TIPO1, coluna2 TIPO2);

-- Exemplos de tipos de dados
-- INT: Número inteiro
-- NUMERIC(M,D): Número decimal com M dígitos e D casas decimais
-- VARCHAR(N): String de até N caracteres
-- DATE: Data no formato YYYY-MM-DD
-- TIMESTAMP: Data e hora no formato YYYY-MM-DD HH:MM:SS

CREATE TABLE alunos(
    -- exemplo: id INT, nome VARCHAR(100)
);

-- Seleções básicas
SELECT * FROM customers;
SELECT * FROM employees;
SELECT first_name FROM employees;
SELECT product_name FROM products;
SELECT product_id, product_name, unit_price FROM products;

SELECT
    product_id,
    product_name,
    unit_price
FROM products;

-- Selecionando categorias
SELECT * FROM categories;

-- Renomeando colunas e tabelas com AS
SELECT
    product_id AS "ID_Produto",
    product_name AS "Nome_Produto",
    unit_price AS "Preco_Unitario"
FROM products AS p;

-- Limitando resultados
SELECT * FROM orders LIMIT 10;

-- Selecionando toda a tabela
SELECT * FROM orders;

-- Selecionando valores distintos
SELECT DISTINCT contact_title FROM customers;

-- Selecionando todos os valores (sem DISTINCT)
SELECT contact_title FROM customers;
