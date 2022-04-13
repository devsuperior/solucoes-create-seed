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
