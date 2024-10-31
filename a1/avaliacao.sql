---criacao da tabela---
CREATE TABLE AVALIACAO (
    id_avaliacao NUMBER NOT NULL,
    cod_cliente NUMBER NOT NULL,
    cod_produto NUMBER NOT NULL,
    nota NUMBER(1) CHECK (nota BETWEEN 1 AND 5) NOT NULL,
    comentario VARCHAR2(100),
    PRIMARY KEY (id_avaliacao),
    FOREIGN KEY (cod_cliente) REFERENCES CLIENTE (cod_cliente),
    FOREIGN KEY (cod_produto) REFERENCES PRODUTO (cod_produto)
);

--inserts--
INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (1, 150, 548, 5, 'adorei, achei a poesia perfeita.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (2, 255, 167, 4, 'gostei do produto, mas acho que poderiam ter aprofundado melhor sobre a crise atual.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (3, 54, 443, 2, 'achei uma bosta, nao entendi nada.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (4, 165, 74, 1, 'as paginas vieram em branco, decepcionante.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (5, 116, 201, 5, 'e um otimo diario, recomendo muito, ja vou comprar o segundo volume.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (6, 273, 106, 3, 'achei meio fraco, mas o disquete compensa.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (7, 143, 442, 4, 'um otimo livro para estudar, mas o preco e meio salagado.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (8, 22, 381, 4, 'me interesso bastante por economia e o livro nao decepcionou.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (9, 100, 399, 2, 'discordo bastante da necessidade deste novo curso mesmo apos ler sobre os motivos no livro.');

INSERT INTO AVALIACAO (id_avaliacao, cod_cliente, cod_produto, nota, comentario)
VALUES (10, 107, 388, 5, 'gostei muito, um dos meus favoritos.');


--consulta---
SELECT 
    AVALIACAO.nota,
    AVALIACAO.comentario,
    PRODUTO.nome AS produto,
    CLIENTE.nome AS cliente
FROM 
    AVALIACAO
JOIN 
    PRODUTO ON AVALIACAO.cod_produto = PRODUTO.cod_produto
JOIN 
    CLIENTE ON AVALIACAO.cod_cliente = CLIENTE.cod_cliente;