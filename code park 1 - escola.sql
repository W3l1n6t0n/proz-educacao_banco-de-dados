/* 
	De acordo com os comandos aprendidos, programe códigos SQL para criar
    um banco de dados chamado ESCOLA e deixe-o pronto para o uso. Depois,
    pesquise qual é o comando utilizado para inserir uma tabela no banco 
    de dados e siga as instruções:

1. crie uma tabela chamada ALUNO;  
2. defina os atributos da tabela;
3. adicione a chave primária de nome ID (identificador);
4. adicione um atributo nome do tipo varchar;
5. adicione um atributo e-mail do tipo varchar;
6. adicione um atributo endereço do tipo varchar.

Trabalhe esse código em seu IDE, suba ele para sua conta no GitHub e compartilhe
o link desse projeto no campo ao lado para que outros desenvolvedores possam analisá-lo. 
*/

create database escola;
use escola;

/* Atividade que se pede o mínimo */
CREATE TABLE aluno (
	id_aluno int auto_increment not null PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
	email VARCHAR(50) UNIQUE,
	endereco VARCHAR(50)
);

/* Etapa que desafia um pouco mais */
ALTER TABLE aluno
ADD COLUMN matricula INT UNIQUE NOT NULL,
ADD COLUMN telefone VARCHAR(14) UNIQUE;

CREATE TABLE emprestimo (
  codigo int auto_increment not null PRIMARY KEY,
  data_hora TIMESTAMP NOT NULL,
  matric_aluno INT NOT NULL,
  data_devolucao DATE NOT NULL,
  CONSTRAINT fk_matricula FOREIGN KEY (matric_aluno) REFERENCES aluno (matricula)
  ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO aluno (nome, matricula, email, endereco, telefone)
VALUES
('Luiz Carlos', 1234, 'luiz_carlos@gmail.com', 'Rua eucalipto', '(11)97104-4469'),
('Luan Furlan', 6584, 'luan.furlan@gmail.com', 'Rua das mangabeiras', '(11)98945-8659'),
('Pedro Henrique', 3427, 'pedro_henr@gmail.com', 'Rua da liberdade', '(11)99355-4401');

SELECT * FROM aluno;

INSERT INTO emprestimo (data_hora, matric_aluno, data_devolucao)
VALUES
('2022-01-20 15:25', 1234, '2022-03-15'),
('2022-02-12 14:32', 3456, '2022-03-18'),
('2022-03-28 03:51', 2345, '2022-04-23');

SELECT * FROM emprestimo;

CREATE TABLE sessao (
  codigo int auto_increment not null PRIMARY KEY,
  descricao VARCHAR(10) UNIQUE NOT NULL,
  localizacao VARCHAR(15) NOT NULL
);

CREATE TABLE livro (
  cod_livro int auto_increment not null PRIMARY KEY,
  titulo VARCHAR(100) UNIQUE NOT NULL,
  autor VARCHAR(50) NOT NULL,
  cod_sessao INT NOT NULL,
  CONSTRAINT fk_sessao FOREIGN KEY (cod_sessao) REFERENCES sessao (codigo)
  ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO sessao (descricao, localizacao)
VALUES
('Sessão1', 'Partilheira1'),
('Sessão2', 'Partilheira2'),
('Sessão3', 'Partilheira3');

SELECT * FROM sessao;

INSERT INTO livro (titulo, autor, cod_sessao)
VALUES
('Código Limpo', 'Robert Cecil Martin', 3),
('Python sem Mistérios', 'Joel Saade', 1),
('Java Como Programar', 'Paul Deitel', 2);

SELECT * FROM livro;

CREATE TABLE livro_emprestimo (
  cod_livro INT NOT NULL,
  cod_emprestimo INT UNIQUE NOT NULL,
  CONSTRAINT fk_livro FOREIGN KEY (cod_livro) REFERENCES livro (cod_livro)
  ON UPDATE CASCADE ON DELETE SET NULL,
  CONSTRAINT fk_emprestimo FOREIGN KEY (cod_emprestimo) REFERENCES emprestimo (codigo)
  ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO livro_emprestimo (cod_livro, cod_emprestimo)
VALUES (3, 1), (1, 3), (2, 2);

SELECT * FROM livro_emprestimo;