/******************************************************************************/
/*            Generated by IBExpert 2010.01.06 25/05/2020 17:55:53            */
/******************************************************************************/

SET SQL DIALECT 3;

SET NAMES NONE;

CREATE DATABASE '127.0.0.1:C:\delphi\Siagri\data\BD.fdb'
USER 'SYSDBA' PASSWORD 'masterkey'
PAGE_SIZE 16384
DEFAULT CHARACTER SET NONE;



/******************************************************************************/
/*                                  Domains                                   */
/******************************************************************************/

CREATE DOMAIN DATA AS
DATE;

CREATE DOMAIN INTEIRO AS
INTEGER;

CREATE DOMAIN INTEIRONOTNULL AS
INTEGER
NOT NULL;

CREATE DOMAIN NUMERO2 AS
NUMERIC(15,2);

CREATE DOMAIN TEXTO1 AS
CHAR(1);

CREATE DOMAIN TEXTO18 AS
VARCHAR(18);

CREATE DOMAIN TEXTO50 AS
VARCHAR(50);



/******************************************************************************/
/*                                 Generators                                 */
/******************************************************************************/

CREATE GENERATOR GEN_DISTRIBUIDOR;
SET GENERATOR GEN_DISTRIBUIDOR TO 4;

CREATE GENERATOR GEN_NEGOCIACAO;
SET GENERATOR GEN_NEGOCIACAO TO 3;

CREATE GENERATOR GEN_NEGOCIACAOPRODUTO;
SET GENERATOR GEN_NEGOCIACAOPRODUTO TO 7;

CREATE GENERATOR GEN_PRODUTO;
SET GENERATOR GEN_PRODUTO TO 4;

CREATE GENERATOR GEN_PRODUTOR;
SET GENERATOR GEN_PRODUTOR TO 3;

CREATE GENERATOR GEN_PRODUTORDISTRIBUIDORLIMITE;
SET GENERATOR GEN_PRODUTORDISTRIBUIDORLIMITE TO 7;



/******************************************************************************/
/*                                   Tables                                   */
/******************************************************************************/



CREATE TABLE DISTRIBUIDOR (
    ID_DISTRIBUIDOR    INTEIRONOTNULL NOT NULL,
    NOMEDISTRIBUIDOR   TEXTO50,
    CNPJDISTRUIBUIDOR  TEXTO18
);

CREATE TABLE NEGOCIACAO (
    ID_NEGOCIACAO     INTEIRONOTNULL NOT NULL,
    ID_PRODUTOR       INTEIRONOTNULL,
    ID_DISTRIBUIDOR   INTEIRONOTNULL,
    STATUS            TEXTO1,
    DATACADASTRO      DATA,
    DATAAPROVACAO     DATA,
    DATACONCLUSAO     DATA,
    DATACANCELAMENTO  DATA,
    VALORTOTAL        NUMERO2,
    CODIGOCONTRATO    INTEIRO
);

CREATE TABLE NEGOCIACAOPRODUTO (
    ID_NEGOCIACAOPRODUTO  INTEIRONOTNULL NOT NULL,
    ID_NEGOCIACAO         INTEIRONOTNULL,
    ID_PRODUTO            INTEIRONOTNULL,
    VALORPRODUTO          NUMERO2,
    QUANTIDADE            NUMERO2,
    VALORTOTALPRODUTO     COMPUTED BY (CAST((VALORPRODUTO * QUANTIDADE) AS NUMERIC(15,2)))
);

CREATE TABLE PRODUTO (
    ID_PRODUTO   INTEIRONOTNULL NOT NULL,
    NOMEPRODUTO  TEXTO50,
    VALORVENDA   NUMERO2
);

CREATE TABLE PRODUTOR (
    ID_PRODUTOR      INTEIRONOTNULL NOT NULL,
    NOMEPRODUTOR     TEXTO50,
    CPFCNPJPRODUTOR  TEXTO18
);

CREATE TABLE PRODUTORDISTRIBUIDORLIMITE (
    ID_LIMITE        INTEIRONOTNULL NOT NULL,
    ID_PRODUTOR      INTEIRONOTNULL,
    ID_DISTRIBUIDOR  INTEIRONOTNULL,
    VALORLIMITE      NUMERO2
);



/******************************************************************************/
/*                                Primary Keys                                */
/******************************************************************************/

ALTER TABLE DISTRIBUIDOR ADD CONSTRAINT PK_DISTRIBUIDOR PRIMARY KEY (ID_DISTRIBUIDOR);
ALTER TABLE NEGOCIACAO ADD CONSTRAINT PK_NEGOCIACAO PRIMARY KEY (ID_NEGOCIACAO);
ALTER TABLE NEGOCIACAOPRODUTO ADD CONSTRAINT PK_NEGOCIACAOPRODUTO PRIMARY KEY (ID_NEGOCIACAOPRODUTO);
ALTER TABLE PRODUTO ADD CONSTRAINT PK_PRODUTO PRIMARY KEY (ID_PRODUTO);
ALTER TABLE PRODUTOR ADD CONSTRAINT PK_PRODUTOR PRIMARY KEY (ID_PRODUTOR);
ALTER TABLE PRODUTORDISTRIBUIDORLIMITE ADD CONSTRAINT PK_PRODUTORDISTRIBUIDORLIMITE PRIMARY KEY (ID_LIMITE);


/******************************************************************************/
/*                                Foreign Keys                                */
/******************************************************************************/

ALTER TABLE NEGOCIACAO ADD CONSTRAINT FK_NEGOCIACAO_DISTRIBUIDOR FOREIGN KEY (ID_DISTRIBUIDOR) REFERENCES DISTRIBUIDOR (ID_DISTRIBUIDOR);
ALTER TABLE NEGOCIACAO ADD CONSTRAINT FK_NEGOCIACAO_PRODUTOR FOREIGN KEY (ID_PRODUTOR) REFERENCES PRODUTO (ID_PRODUTO);
ALTER TABLE PRODUTORDISTRIBUIDORLIMITE ADD CONSTRAINT FK_PRODUTORDISTRLIMITE_DISTR FOREIGN KEY (ID_DISTRIBUIDOR) REFERENCES DISTRIBUIDOR (ID_DISTRIBUIDOR);
ALTER TABLE PRODUTORDISTRIBUIDORLIMITE ADD CONSTRAINT FK_PRODUTORDISTRLIMITE_PROD FOREIGN KEY (ID_PRODUTOR) REFERENCES PRODUTOR (ID_PRODUTOR);


/******************************************************************************/
/*                                  Triggers                                  */
/******************************************************************************/


SET TERM ^ ;



/******************************************************************************/
/*                            Triggers for tables                             */
/******************************************************************************/



/* Trigger: DISTRIBUIDOR_BI */
CREATE TRIGGER DISTRIBUIDOR_BI FOR DISTRIBUIDOR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_distribuidor is null) then
    new.id_distribuidor = gen_id(gen_distribuidor,1);
end
^

/* Trigger: NEGOCIACAOPRODUTO_BI */
CREATE TRIGGER NEGOCIACAOPRODUTO_BI FOR NEGOCIACAOPRODUTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_negociacaoproduto is null) then
    new.id_negociacaoproduto = gen_id(gen_negociacaoproduto,1);
end
^

/* Trigger: NEGOCIACAO_BI */
CREATE TRIGGER NEGOCIACAO_BI FOR NEGOCIACAO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_negociacao is null) then
    new.id_negociacao = gen_id(gen_negociacao,1);
end
^

/* Trigger: PRODUTORDISTRIBUIDORLIMITE_BI */
CREATE TRIGGER PRODUTORDISTRIBUIDORLIMITE_BI FOR PRODUTORDISTRIBUIDORLIMITE
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_limite is null) then
    new.id_limite = gen_id(gen_produtordistribuidorlimite,1);
end
^

/* Trigger: PRODUTOR_BI */
CREATE TRIGGER PRODUTOR_BI FOR PRODUTOR
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_produtor is null) then
    new.id_produtor = gen_id(gen_produtor,1);
end
^

/* Trigger: PRODUTO_BI */
CREATE TRIGGER PRODUTO_BI FOR PRODUTO
ACTIVE BEFORE INSERT POSITION 0
as
begin
  if (new.id_produto is null) then
    new.id_produto = gen_id(gen_produto,1);
end
^

SET TERM ; ^



/******************************************************************************/
/*                            Fields descriptions                             */
/******************************************************************************/

DESCRIBE FIELD STATUS TABLE NEGOCIACAO
'P=PENDENTE; A=APROVADO, C=CANCELADO, U=CONCLUIDO';

