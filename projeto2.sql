CREATE DATABASE projeto2;

USE projeto2;

CREATE TABLE usuario(
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Nome varchar(100),
    Imagem LONGBLOB,
    Nome_usuario varchar(30),
    Data_cadastro datetime
    
);

CREATE TABLE cartao(
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Numero varchar(16) NOT NULL,
    Cvv varchar(3) NOT NULL,
    Valido boolean,
    Data_cadastro datetime
    
);

CREATE TABLE transacao(
	Id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    Id_usuario INT,
    Id_cartao INT,
    Valor DECIMAL(10, 2),
    Data_cadastro datetime,
    FOREIGN KEY (Id_usuario) REFERENCES usuario(Id),
    FOREIGN KEY (Id_cartao) REFERENCES cartao(Id)
);

insert into usuario(Nome, Imagem, Nome_usuario, Data_cadastro)Values('Joao', 'capa.jpg', 'joao_net', '2021-03-03'); #inserido usuario com campos nome, imagem, nome de usuario e data de cadastro

select * from usuario order by Nome ASC; #nao estava especificado se ascendente ou descendente

insert into cartao (Numero, Cvv, Valido, Data_cadastro) VALUES ('4232112304041211', '001', true, '2021-03-12'); #inclusao de entrada contendo numero, Cvv, validade e Data de cadastro

select * from cartao WHERE(
	valido = 1
) ORDER BY Data_cadastro ASC;#Criar uma query que retorne apenas os cartões válidos em ordem crescente da data de cadastro.

INSERT INTO transacao (Id_usuario, Id_cartao, Valor, Data_cadastro) VALUES ('1', '1', 3201.12, '2022-01-01'); #Criar uma query que insira uma transação com os campos id_usuario, id_cartao, valor e data de cadastro.

#Criar uma query que retorne todas as transações cadastradas em ordem decrescente da data de cadastro, contendo os dados do usuário e cartão, não apenas seus IDs.

SELECT 
	*,
    (SELECT Nome FROM usuario U WHERE U.Id = T.Id_usuario) AS info_usuario,
    (SELECT Numero FROM cartao C WHERE C.Id = T.Id_cartao) AS info_cartao
    
FROM transacao T ORDER BY Data_cadastro DESC;