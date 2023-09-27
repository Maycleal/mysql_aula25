CREATE database db_generation_game_online;
USE db_generation_game_online;

  CREATE TABLE tb_classes(
 id bigint auto_increment,
    tipo varchar(255) not null,
    nivel int,
  PRIMARY KEY (id)
  );
  
  INSERT INTO tb_classes(tipo,nivel) values ("Arqueiro",50);
  INSERT INTO tb_classes(tipo,nivel) values ("Guerreiro",80);
  INSERT INTO tb_classes(tipo,nivel) values ("Feiticeiro",30);
  INSERT INTO tb_classes(tipo,nivel) values ("Elfo",20);
  INSERT INTO tb_classes(tipo,nivel) values ("Druida",90);
  
  SELECT * FROM tb_classes;
  
  CREATE TABLE tb_personagens(
 id bigint auto_increment,
    nome varchar(255) not null,
    id_classe int,
    poder_ataque int,
    poder_defesa int,
	PRIMARY KEY (id)
  );
   
  ALTER TABLE tb_personagens ADD classes_id bigint;
  
  ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes 
  FOREIGN KEY (classes_id) REFERENCES tb_classes (id);
  
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Mirna",3,1500,3000);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Klaus",2,5000,2500);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Yennifer",4,2500,1500);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Kratus",5,4500,3000);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Louis",1,2500,1800);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Rickon",5,1600,4000);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Elena",1,5000,1500);
  INSERT INTO tb_personagens(nome,id_classe,poder_ataque,poder_defesa) values ("Druid",4,3500,1000);
  
   SELECT * FROM tb_personagens;
   
  SELECT * FROM tb_personagens WHERE poder_ataque > 2000;
  SELECT * FROM tb_personagens WHERE poder_defesa > 1000 AND poder_defesa < 2000;
  SELECT * FROM tb_personagens WHERE nome LIKE '%C%';
  
  SELECT nome,poder_ataque,poder_defesa FROM tb_personagens
  INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classes_id;
  
  SELECT nome,poder_ataque,poder_defesa FROM tb_personagens 
INNER JOIN tb_classes ON tb_classes.id = tb_personagens.classes_id
WHERE tipo = 'Arqueiro';