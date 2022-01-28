use projeto1;

CREATE TABLE transacao(
	Id int UNIQUE NOT NULL AUTO_INCREMENT, #ID da transacao
    Tipo varchar(6) NOT NULL, #aceita apenas 'compra' ou 'venda' 
    Nome varchar(30), #nome da mercadoria, limitado a 30
    Valor DECIMAL(10, 2), #valor da mercadoria, com 10 posicoes e duas casas decimais
    Data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP, #inclui data e hora da transacao
    PRIMARY KEY (id)
);


INSERT INTO transacao(Tipo, Nome, Valor, data_cadastro)VALUES('venda', 'armário', '30.21', '2022-10-11 08:22:31'); #query que insere transacao


SELECT * FROM transacao ORDER BY data_cadastro ASC; #query retornando todas as transacoes por ordem crescente de data

SELECT SUM(Valor) AS Soma FROM transacao; #query retornando o saldo acumulado

DELETE from transacao; #Criar uma query que exclua todas as transações cadastradas. Para funcionar foi preciso desabilitar safemode

DELETE from transacao WHERE id <> 0; #contorna restricao de safemode. Uma alternativa seria desabilitar o safemode
