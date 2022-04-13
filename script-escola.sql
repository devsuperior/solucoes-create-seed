CREATE TABLE tb_curso (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(20) NOT NULL,
	carga_horaria INT,
	valor FLOAT,
	nota_prevista FLOAT,
	nota_minima FLOAT
);

CREATE TABLE tb_turma (
	id SERIAL PRIMARY KEY,
	numero INT,
	inicio DATE,
	vagas INT,
	curso_id INT NOT NULL,
	FOREIGN KEY(curso_id) REFERENCES tb_curso(id)
);

CREATE TABLE tb_aluno (
	cpf VARCHAR(12) PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	nascimento DATE
);

CREATE TABLE tb_matricula (
	turma_id INT, 
	aluno_id VARCHAR(12), 
	data DATE, 
	prestacoes INT,
	PRIMARY KEY(turma_id, aluno_id),
	FOREIGN KEY(turma_id) REFERENCES tb_turma(id),
	FOREIGN KEY(aluno_id) REFERENCES tb_aluno(cpf)
);

CREATE TABLE tb_avaliacao(
	id SERIAL PRIMARY KEY,
	nota FLOAT,
	data DATE,
	turma_id INT NOT NULL,
	FOREIGN KEY(turma_id) REFERENCES tb_turma(id)
);

CREATE TABLE tb_resultado (
	aluno_id VARCHAR(12),
	avaliacao_id INT,
	nota_obtida FLOAT,
	PRIMARY KEY(aluno_id, avaliacao_id),
	FOREIGN KEY(aluno_id) REFERENCES tb_aluno(cpf),
	FOREIGN KEY(avaliacao_id) REFERENCES tb_avaliacao(id)
);



-- SEED

INSERT INTO tb_curso(nome, carga_horaria, valor, nota_prevista, nota_minima) VALUES('HTML Básico', 10, 80.0, 100.0, 70.0);

INSERT INTO tb_turma(numero, inicio, vagas, curso_id) VALUES(1, '2017-09-10', 30, 1);

INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('736376983-19', 'Carlos Silva', '1990-07-21');
INSERT INTO tb_aluno(cpf, nome, nascimento) VALUES('353847901-22', 'Maria Clara', '1991-09-03');

INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '736376983-19', '2017-09-05', 6);
INSERT INTO tb_matricula(turma_id, aluno_id, data, prestacoes) VALUES(1, '353847901-22', '2017-09-06', 12);

INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(1, 40.0, '2017-10-20', 1);
INSERT INTO tb_avaliacao(nota, data, turma_id) VALUES(2, 60.0, '2017-11-30', 1);

INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 1, 35.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 1, 36.5);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('736376983-19', 2, 47.0);
INSERT INTO tb_resultado(aluno_id, avalicao_id, nota_obtida) VALUES('353847901-22', 2, 52.4);
