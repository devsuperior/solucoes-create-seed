CREATE TABLE tb_usuario (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(40) NOT NULL,
	email VARCHAR(20) UNIQUE NOT NULL,
	nascimento DATE,
	website VARCHAR(20),
	genero CHAR(1) NOT NULL,
	telefone VARCHAR(12),
	foto_de_perfil_id VARCHAR(60)
);

CREATE TABLE tb_seguidores (
	seguidor_id INT,
	seguido_id INT,
	PRIMARY KEY(seguidor_id, seguido_id),
	FOREIGN KEY(seguidor_id) REFERENCES tb_usuario(id),
	FOREIGN KEY(seguido_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_postagem (
	id SERIAL PRIMARY KEY,
	texto TEXT,
	instante TIMESTAMP NOT NULL,
	autor_id INT NOT NULL,
	FOREIGN KEY(autor_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_album (
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(40),
	instante_de_postagem TIMESTAMP NOT NULL,
	usuario_id INT NOT NULL,
	FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id)
);

CREATE TABLE tb_foto (
	uri	VARCHAR(60) PRIMARY KEY,
	instante_de_postagem TIMESTAMP NOT NULL,
	postagem_id INT,
	usuario_id INT NOT NULL,
	album_id INT,
	FOREIGN KEY(postagem_id) REFERENCES tb_postagem(id),
	FOREIGN KEY(usuario_id) REFERENCES tb_usuario(id),
	FOREIGN KEY(album_id) REFERENCES tb_album(id)
);

ALTER TABLE tb_usuario ADD FOREIGN KEY(foto_de_perfil_id) REFERENCES tb_foto(uri);



-- SEED

INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES ('João Silva', 'joao@gmail.com', '1991-10-15', null, 'M', null, null);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES ('Maria Alice', 'alice@gmail.com', '1999-04-15', 'youtube.com/alice', 'F', null, null);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES ('Carlos Alves', 'carlos@yahoo.com', null, null, 'M', '99777-8383', null);
INSERT INTO tb_usuario(nome, email, nascimento, website, genero, telefone, foto_de_perfil_id) VALUES ('Ana Clara', 'clara@gmail.com', '1997-01-23', 'blog.clara.com', 'F', '88181-2820', null);

INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES(1, 3);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES(1, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES(3, 4);
INSERT INTO tb_seguidores(seguidor_id, seguido_id) VALUES(2, 4);

INSERT INTO tb_postagem(texto, instante, autor_id) VALUES('#partiu festa!', TIMESTAMP WITH TIME ZONE '2017-08-09T19:34:00Z', 4);
INSERT INTO tb_postagem(texto, instante, autor_id) VALUES('Bom dia pessoal!', TIMESTAMP WITH TIME ZONE '2017-08-10T07:50:00Z', 4);

INSERT INTO tb_album(titulo, instante_de_postagem, usuario_id) VALUES('Férias de verão', TIMESTAMP WITH TIME ZONE '2017-01-13T13:50:13Z', 3);

INSERT INTO tb_foto(uri, instante_de_postagem, postagem_id, usuario_id, album_id) VALUES('http://dominio.com/praia1.jpg', TIMESTAMP WITH TIME ZONE '2017-01-10T10:30:14Z', null, 3, 1);
INSERT INTO tb_foto(uri, instante_de_postagem, postagem_id, usuario_id, album_id) VALUES('http://dominio.com/praia2.jpg', TIMESTAMP WITH TIME ZONE '2017-01-10T10:31:13Z', null, 3, 1);
