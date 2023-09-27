CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_categorias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    descricao VARCHAR(255)
);

INSERT INTO tb_categorias (nome, descricao) VALUES ("Salgadas", "PIZZAS SALGADAS");
INSERT INTO tb_categorias (nome, descricao) VALUES ("Doces", "PIZZAS DOCES");
INSERT INTO tb_categorias (nome, descricao) VALUES ("Vegetarianas/Veganas", "PIZZAS SEM NENHUM TIPO DE CARNE");
INSERT INTO tb_categorias (nome, descricao) VALUES ("Especiais", "PIZZAS COM INGREDIENTES SELECIONADOS");

CREATE TABLE tb_pizzas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    ingredientes VARCHAR(255),
    preco DECIMAL(10, 2) NOT NULL,
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES tb_categorias(id)
);

INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Margherita", "Molho de tomate, mussarela, tomate, manjericão", 46.90, 1);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Calabresa", "Molho de tomate, mussarela, calabresa, cebola", 35.90, 1);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Brigadeiro", "Chocolate, leite condensado, granulado", 37.90, 2);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Quatro Queijos", "Molho de tomate, queijo gorgonzola, minas, prato e parmesão", 49.90, 1);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Vegetariana", "Molho de tomate, mussarela, tomate, abobrinha, cogumelos", 49.90, 3);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Frango com Catupiry", "Molho de tomate, mussarela, frango desfiado, catupiry", 46.90, 1);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Portuguesa", "Molho de tomate, mussarela, pimentão, tomate, presunto, ovo, azeitonas", 48.90, 1);
INSERT INTO tb_pizzas (nome, ingredientes, preco, id_categoria) 
VALUES("Chocolate com Confetti", "Chocolate, leite condensado, confetti", 38.90, 2);

SELECT * FROM tb_pizzas;

SELECT * FROM tb_pizzas WHERE preco > 45.00;

SELECT * FROM tb_pizzas WHERE preco BETWEEN 50.00 AND 100.00;

SELECT * FROM tb_pizzas WHERE nome LIKE '%M%';


SELECT p.*, c.nome AS categoria FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id;

SELECT p.*, c.nome AS categoria FROM tb_pizzas p
INNER JOIN tb_categorias c ON p.id_categoria = c.id
WHERE c.nome = 'Doces';
