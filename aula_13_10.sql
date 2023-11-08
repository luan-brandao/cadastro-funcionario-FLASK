
-- Crie um banco de dados chamado 'aula_13_10'
CREATE DATABASE aula_13_10;

-- Use o banco de dados 'aula_13_10'
USE aula_13_10;

-- Crie a tabela 'setor'
CREATE TABLE setor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL
);

-- Insira os setores na tabela 'setor'
INSERT INTO setor (nome) VALUES ('TI');
INSERT INTO setor (nome) VALUES ('RH');
INSERT INTO setor (nome) VALUES ('Marketing');

-- Crie a tabela 'funcionarios'
CREATE TABLE funcionarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    primeiro_nome VARCHAR(50) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_admissao DATE NOT NULL,
    status_funcionario BOOL NOT NULL,
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES setor(id)
);

-- Crie a tabela 'cargos'
CREATE TABLE cargos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    id_setor INT,
    FOREIGN KEY (id_setor) REFERENCES setor(id)
);

-- Insira os cargos na tabela 'cargos'
INSERT INTO cargos (nome, id_setor) VALUES ('Dev', 1);
INSERT INTO cargos (nome, id_setor) VALUES ('Psicologa', 2);
INSERT INTO cargos (nome, id_setor) VALUES ('Analista de dados', 3);

-- Altere o nome da coluna 'nome' na tabela 'cargos' para NOT NULL
ALTER TABLE cargos MODIFY COLUMN nome VARCHAR(50) NOT NULL;

-- Adicione uma coluna 'id_cargo' à tabela 'funcionarios' com uma restrição de chave estrangeira
ALTER TABLE funcionarios ADD COLUMN id_cargo INT;
ALTER TABLE funcionarios ADD FOREIGN KEY (id_cargo) REFERENCES cargos(id);

-- Selecione os dados da tabela 'setor'
SELECT * FROM setor;

-- Selecione os dados da tabela 'cargos'
SELECT * FROM cargos;

INSERT INTO setor (nome) VALUES ('Vendas');
INSERT INTO setor (nome) VALUES ('Operações');
INSERT INTO setor (nome) VALUES ('Logística');
INSERT INTO setor (nome) VALUES ('Atendimento ao Cliente');

INSERT INTO cargos (nome, id_setor) VALUES ('Dev', 1);
INSERT INTO cargos (nome, id_setor) VALUES ('Psicologa', 2);
INSERT INTO cargos (nome, id_setor) VALUES ('Analista de dados', 3);
INSERT INTO cargos (nome, id_setor) VALUES ('Vendedor', 4);
INSERT INTO cargos (nome, id_setor) VALUES ('Gerente de Operações', 5);
INSERT INTO cargos (nome, id_setor) VALUES ('Especialista de Marketing Digital', 3);
INSERT INTO cargos (nome, id_setor) VALUES ('Analista de Logística', 6);
INSERT INTO cargos (nome, id_setor) VALUES ('Atendente de Suporte', 7);
INSERT INTO cargos (nome, id_setor) VALUES ('Analista de Qualidade', 8);
INSERT INTO cargos (nome, id_setor) VALUES ('Assistente de Vendas', 4);

