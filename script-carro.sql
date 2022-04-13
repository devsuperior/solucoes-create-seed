CREATE TABLE tb_categoria(
	id SERIAL PRIMARY KEY,
	descricao VARCHAR(20) NOT NULL,
	preco_diario FLOAT
);

CREATE TABLE tb_sede(
	codigo SERIAL PRIMARY KEY,
	localidade_s FLOAT NOT NULL,
	localidade_w FLOAT NOT NULL
);

CREATE TABLE tb_carro(
	id SERIAL PRIMARY KEY,
	modelo VARCHAR(20) NOT NULL,
	placa VARCHAR(12) NOT NULL,
	cor SMALLINT,
	ano SMALLINT,
	data_aquisicao DATE,
	categoria_id INT NOT NULL,
	sede_id INT NOT NULL,
	FOREIGN KEY(categoria_id) REFERENCES tb_categoria(id),
	FOREIGN KEY(sede_id) REFERENCES tb_sede(codigo)
);

CREATE TABLE tb_estado (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL
);

CREATE TABLE tb_cidade (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(30) NOT NULL,
	estado_id INT NOT NULL,
	FOREIGN KEY(estado_id) REFERENCES tb_estado(id)
);

CREATE TABLE tb_endereco(
	id SERIAL PRIMARY KEY, 
	logradouro VARCHAR(60) NOT NULL, 
	numero INT NOT NULL, 
	complemento VARCHAR(30), 
	bairro VARCHAR(20) NOT NULL, 
	cep VARCHAR(12) NOT NULL, 
	cidade_id INT NOT NULL,
	FOREIGN KEY(cidade_id) REFERENCES tb_cidade(id)
);

CREATE TABLE tb_cliente(
	cpf VARCHAR(12) PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	email VARCHAR(20) UNIQUE NOT NULL
);

CREATE TABLE tb_telefone(
	cpf VARCHAR(12),
	telefone VARCHAR(12),
	PRIMARY KEY(cpf, telefone),
	FOREIGN KEY(cpf) REFERENCES tb_cliente(cpf)
);

CREATE TABLE tb_locacao(
	id SERIAL PRIMARY KEY,
	instante_locacao TIMESTAMP NOT NULL,
	instante_devolucao TIMESTAMP NOT NULL,
	cliente_id VARCHAR(12) NOT NULL,
	carro_id INT NOT NULL,
	local_de_retirada_id INT NOT NULL,
	FOREIGN KEY(cliente_id) REFERENCES tb_cliente(cpf),
	FOREIGN KEY(carro_id) REFERENCES tb_carro(id),
	FOREIGN KEY(local_de_retirada_id) REFERENCES tb_sede(codigo)
);

CREATE TABLE tb_locacao_diaria(
	id SERIAL PRIMARY KEY,
	dias_previstos INT NOT NULL,
	FOREIGN KEY(id) REFERENCES tb_locacao(id)
);

CREATE TABLE tb_locacao_longo_periodo(
	id SERIAL PRIMARY KEY,
	porcentagem_desconto FLOAT,
	FOREIGN KEY(id) REFERENCES tb_locacao(id)
);



-- SEED

INSERT INTO tb_categoria(descricao, preco_diario) VALUES('Básico', 60.0);
INSERT INTO tb_categoria(descricao, preco_diario) VALUES('Luxo', 150.0);

INSERT INTO tb_sede(localidade_s, localidade_w) VALUES(18.28272, 23.38474);

INSERT INTO tb_carro(modelo, placa, cor, ano, data_aquisicao, categoria_id, sede_id) VALUES('Polo', 'HDD9383', 0, 2015, '2015-07-21', 1, 1);
INSERT INTO tb_carro(modelo, placa, cor, ano, data_aquisicao, categoria_id, sede_id) VALUES('Fusion', 'PEH3837', 1, 2016, '2016-12-25', 2, 1);

INSERT INTO tb_estado(nome) VALUES('São Paulo');

INSERT INTO tb_cidade(nome, estado_id) VALUES('São Paulo', 1);

INSERT INTO tb_endereco(logradouro, numero, complemento, bairro, cep, cidade_id) VALUES('Rua Flores', 205, 'Bloco C', 'Jardim', '38400282', 1);

INSERT INTO tb_cliente(cpf, nome, email) VALUES('93838673610', 'Maria Silva', 'maria@gmail.com');
INSERT INTO tb_cliente(cpf, nome, email) VALUES('58236392715', 'Joaquim Jorge', 'joaquim@gmail.com');

INSERT INTO tb_telefone(cpf, numero) VALUES('93838673610', '37635393');
INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '37636364');
INSERT INTO tb_telefone(cpf, numero) VALUES('58236392715', '89988464');

INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-09-30T13:34:00Z', TIMESTAMP WITH TIME ZONE '2017-10-04T14:34:00Z', '93838673610', 1, 1);
INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-11-11T12:00:00Z', TIMESTAMP WITH TIME ZONE '2017-11-15T13:00:00Z', '93838673610', 2, 1);
INSERT INTO tb_locacao(instante_locacao, instante_devolucao, cliente_id, carro_id, local_de_retirada_id) VALUES(TIMESTAMP WITH TIME ZONE '2017-12-25T03:00:00Z', TIMESTAMP WITH TIME ZONE '2018-07-31T03:00:00Z', '58236392715', 2, 1);

INSERT INTO tb_locacao_diaria(id, dias_previstos) VALUES(1, 4);
INSERT INTO tb_locacao_diaria(id, dias_previstos) VALUES(2, 4);

INSERT INTO tb_locacao_longo_periodo(id, porcentagem_desconto) VALUES(3, 50.0);
