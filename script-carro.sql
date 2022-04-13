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
