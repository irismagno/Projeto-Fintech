-- Gerado por Oracle SQL Developer Data Modeler 21.4.1.349.1605
--   em:        2022-05-21 22:55:41 BRT
--   site:      Oracle Database 11g
--   tipo:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE t_categorias (
    cd_categoria NUMBER(5) NOT NULL,
    ds_categoria VARCHAR2(10) NOT NULL
);

ALTER TABLE t_categorias ADD CONSTRAINT t_categorias_pk PRIMARY KEY ( cd_categoria );

CREATE TABLE t_gastos (
    cd_gast                   NUMBER(10) NOT NULL,
    t_usuario_cd_usuario      NUMBER(5) NOT NULL,
    t_categorias_cd_categoria NUMBER(5) NOT NULL,
    vl_valor                  FLOAT(6) NOT NULL,
    dt_dt_e_hr                DATE NOT NULL,
    ds_descricao              VARCHAR2(15)
);

ALTER TABLE t_gastos ADD CONSTRAINT t_gastos_pk PRIMARY KEY ( t_usuario_cd_usuario,
                                                              cd_gast );

CREATE TABLE t_genero (
    cd_genero NUMBER(1) NOT NULL,
    ds_genero VARCHAR2(9) NOT NULL
);

ALTER TABLE t_genero ADD CONSTRAINT t_genero_pk PRIMARY KEY ( cd_genero );

CREATE TABLE t_inst__fin (
    cd_inst NUMBER(5) NOT NULL,
    nm_inst VARCHAR2(10) NOT NULL
);

ALTER TABLE t_inst__fin ADD CONSTRAINT t_inst__fin_pk PRIMARY KEY ( cd_inst );

CREATE TABLE t_invest (
    cd_invst                   NUMBER(10) NOT NULL,
    t_usuario_cd_usuario       NUMBER(5) NOT NULL,
    t_tipo_invest_cd_tp_invest NUMBER(5) NOT NULL,
    t_inst__fin_cd_inst        NUMBER(5) NOT NULL,
    nm_aplicacao               VARCHAR2(10) NOT NULL,
    vl_valor                   FLOAT(9) NOT NULL,
    dt_inicio                  DATE NOT NULL,
    dt_venc                    DATE
);

ALTER TABLE t_invest ADD CONSTRAINT t_invest_pk PRIMARY KEY ( t_usuario_cd_usuario,
                                                              cd_invst );

CREATE TABLE t_objetivos (
    cd_obj               NUMBER(5) NOT NULL,
    t_usuario_cd_usuario NUMBER(5) NOT NULL,
    nm_objetivo          VARCHAR2(20) NOT NULL,
    vl_valor             FLOAT NOT NULL,
    ds_descricao         VARCHAR2(30),
    dt_realizacao        DATE
);

ALTER TABLE t_objetivos ADD CONSTRAINT t_objetivos_pk PRIMARY KEY ( cd_obj,
                                                                    t_usuario_cd_usuario );

CREATE TABLE t_recebimentos (
    cd_rec               NUMBER(10) NOT NULL,
    t_usuario_cd_usuario NUMBER(5) NOT NULL,
    vl_valor             FLOAT(6) NOT NULL,
    dt_data              DATE NOT NULL,
    ds_descricao         VARCHAR2(15)
);

ALTER TABLE t_recebimentos ADD CONSTRAINT t_recebimentos_pk PRIMARY KEY ( cd_rec,
                                                                          t_usuario_cd_usuario );

CREATE TABLE t_tipo_invest (
    cd_tp_invest NUMBER(5) NOT NULL,
    ds_tp_invest VARCHAR2(15) NOT NULL
);

ALTER TABLE t_tipo_invest ADD CONSTRAINT t_tipo_invest_pk PRIMARY KEY ( cd_tp_invest );

CREATE TABLE t_usuario (
    cd_usuario         NUMBER(5) NOT NULL,
    t_genero_cd_genero NUMBER(1),
    nm_nome            VARCHAR2(15) NOT NULL,
    nm_sobrenome       VARCHAR2(10) NOT NULL,
    ds_email           VARCHAR2(15) NOT NULL,
    cd_senha           VARCHAR2(8) NOT NULL,
    dt_data_nasc       DATE
);

ALTER TABLE t_usuario ADD CONSTRAINT t_usuario_pk PRIMARY KEY ( cd_usuario );

ALTER TABLE t_gastos
    ADD CONSTRAINT t_gastos_t_categorias_fk FOREIGN KEY ( t_categorias_cd_categoria )
        REFERENCES t_categorias ( cd_categoria );

ALTER TABLE t_gastos
    ADD CONSTRAINT t_gastos_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_invest
    ADD CONSTRAINT t_invest_t_inst__fin_fk FOREIGN KEY ( t_inst__fin_cd_inst )
        REFERENCES t_inst__fin ( cd_inst );

ALTER TABLE t_invest
    ADD CONSTRAINT t_invest_t_tipo_invest_fk FOREIGN KEY ( t_tipo_invest_cd_tp_invest )
        REFERENCES t_tipo_invest ( cd_tp_invest );

ALTER TABLE t_invest
    ADD CONSTRAINT t_invest_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_objetivos
    ADD CONSTRAINT t_objetivos_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_recebimentos
    ADD CONSTRAINT t_recebimentos_t_usuario_fk FOREIGN KEY ( t_usuario_cd_usuario )
        REFERENCES t_usuario ( cd_usuario );

ALTER TABLE t_usuario
    ADD CONSTRAINT t_usuario_t_genero_fk FOREIGN KEY ( t_genero_cd_genero )
        REFERENCES t_genero ( cd_genero );



-- Relatório do Resumo do Oracle SQL Developer Data Modeler: 
-- 
-- CREATE TABLE                             9
-- CREATE INDEX                             0
-- ALTER TABLE                             17
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
