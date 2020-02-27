--
-- ER/Studio 8.0 SQL Code Generation
-- Company :      MarijoaTejidos
-- Project :      Call_Center.DM1
-- Author :       Doglas
--
-- Date Created : Saturday, February 22, 2020 10:39:13
-- Target DBMS : MySQL 5.x
--

-- 
-- TABLE: art_propiedades 
--

CREATE TABLE art_propiedades(
    cod_prop     VARCHAR(30)     NOT NULL,
    descrip      VARCHAR(120)    NOT NULL,
    tipo         VARCHAR(20),
    valor_def    VARCHAR(60),
    estado       VARCHAR(30)     NOT NULL,
    PRIMARY KEY (cod_prop)
)ENGINE=INNODB
;



-- 
-- TABLE: art_x_uso 
--

CREATE TABLE art_x_uso(
    cod_uso    INT            NOT NULL,
    codigo     VARCHAR(30)    NOT NULL,
    PRIMARY KEY (cod_uso, codigo)
)ENGINE=INNODB
;



-- 
-- TABLE: articulos 
--

CREATE TABLE articulos(
    codigo              VARCHAR(30)       NOT NULL,
    clase               VARCHAR(16),
    descrip             VARCHAR(100)      NOT NULL,
    cod_sector          INT               NOT NULL,
    um                  VARCHAR(10)       NOT NULL,
    costo_prom          DECIMAL(16, 2),
    costo_cif           DECIMAL(16, 2),
    costo_fob           DECIMAL(16, 2),
    art_venta           VARCHAR(6),
    art_inv             VARCHAR(6),
    art_compra          VARCHAR(6),
    img                 VARCHAR(100),
    estado_venta        VARCHAR(30),
    composicion         VARCHAR(30),
    temporada           VARCHAR(30),
    ligamento           VARCHAR(30),
    combinacion         VARCHAR(30),
    especificaciones    VARCHAR(1024),
    acabado             VARCHAR(30),
    tipo                VARCHAR(30),
    estetica            VARCHAR(30),
    ancho               DECIMAL(16, 2),
    espesor             DECIMAL(16, 4),
    gramaje_prom        DECIMAL(16, 2),
    rendimiento         DECIMAL(16, 2),
    produc_ancho        DECIMAL(10, 2),
    produc_largo        DECIMAL(10, 2),
    produc_alto         DECIMAL(10, 2),
    produc_costo        DECIMAL(16, 2),
    mnj_x_lotes         VARCHAR(2),
    estado              VARCHAR(12),
    PRIMARY KEY (codigo)
)ENGINE=INNODB
;



-- 
-- TABLE: codigos_barras 
--

CREATE TABLE codigos_barras(
    codigo     VARCHAR(30)    NOT NULL,
    barcode    VARCHAR(60)    NOT NULL,
    PRIMARY KEY (codigo, barcode)
)ENGINE=INNODB
;



-- 
-- TABLE: comunicaciones 
--

CREATE TABLE comunicaciones(
    id_com         INT              AUTO_INCREMENT,
    cod_per        INT              NOT NULL,
    usuario        VARCHAR(30)      NOT NULL,
    fecha          DATETIME,
    obs_per        VARCHAR(2048),
    obs_usuario    VARCHAR(2048),
    nivel          VARCHAR(16),
    estado         VARCHAR(10),
    PRIMARY KEY (id_com)
)ENGINE=INNODB
;



-- 
-- TABLE: contactos 
--

CREATE TABLE contactos(
    id_contacto       VARCHAR(30)    NOT NULL,
    codigo_entidad    INT            NOT NULL,
    nombre            VARCHAR(60),
    doc               VARCHAR(30),
    tel               VARCHAR(30),
    PRIMARY KEY (id_contacto, codigo_entidad)
)ENGINE=INNODB
;



-- 
-- TABLE: cotizaciones 
--

CREATE TABLE cotizaciones(
    id_cotiz    INT              AUTO_INCREMENT,
    suc         VARCHAR(10)      NOT NULL,
    m_cod       VARCHAR(4)       NOT NULL,
    fecha       DATE             NOT NULL,
    hora        VARCHAR(10),
    compra      DECIMAL(8, 2),
    venta       DECIMAL(8, 2),
    ref         VARCHAR(4),
    PRIMARY KEY (id_cotiz, suc)
)ENGINE=INNODB
;



-- 
-- TABLE: departamentos 
--

CREATE TABLE departamentos(
    codigo_pais     VARCHAR(30)     NOT NULL,
    cod_depart      INT             NOT NULL,
    nombre_depar    VARCHAR(254),
    PRIMARY KEY (codigo_pais, cod_depart)
)ENGINE=INNODB
;



-- 
-- TABLE: distritos 
--

CREATE TABLE distritos(
    dist_num       INT             NOT NULL,
    codigo_pais    VARCHAR(30)     NOT NULL,
    cod_depart     INT             NOT NULL,
    nombre         VARCHAR(254),
    PRIMARY KEY (dist_num, codigo_pais, cod_depart)
)ENGINE=INNODB
;



-- 
-- TABLE: entidades 
--

CREATE TABLE entidades(
    cod_ent        INT            AUTO_INCREMENT,
    suc            VARCHAR(10)    NOT NULL,
    tipo_doc       VARCHAR(30),
    ci_ruc         VARCHAR(30),
    nombre         VARCHAR(60),
    tel            VARCHAR(30),
    email          VARCHAR(40),
    fecha_nac      DATE,
    codigo_pais    VARCHAR(30)    NOT NULL,
    cod_depart     INT            NOT NULL,
    dist_num       INT            NOT NULL,
    ciudad         VARCHAR(30),
    dir            VARCHAR(60),
    tipo           VARCHAR(16),
    usuario        VARCHAR(30)    NOT NULL,
    fecha_reg      DATE,
    estado         VARCHAR(10),
    PRIMARY KEY (cod_ent)
)ENGINE=INNODB
;



-- 
-- TABLE: grupos 
--

CREATE TABLE grupos(
    id_grupo    INT              AUTO_INCREMENT,
    nombre      VARCHAR(30),
    descrip     VARCHAR(1024),
    modulo      VARCHAR(30),
    PRIMARY KEY (id_grupo)
)ENGINE=INNODB
;



-- 
-- TABLE: lista_prec_x_art 
--

CREATE TABLE lista_prec_x_art(
    codigo     VARCHAR(30)       NOT NULL,
    precio     DECIMAL(16, 2),
    usuario    VARCHAR(30)       NOT NULL,
    fecha      DATETIME,
    PRIMARY KEY (codigo)
)ENGINE=INNODB
;



-- 
-- TABLE: lista_precios 
--

CREATE TABLE lista_precios(
    num               INT              NOT NULL,
    moneda            VARCHAR(4)       NOT NULL,
    um                VARCHAR(10)      NOT NULL,
    descrip           VARCHAR(30),
    ref_num           INT              NOT NULL,
    ref_moneda        VARCHAR(4)       NOT NULL,
    ref_um            VARCHAR(10)      NOT NULL,
    factor            DECIMAL(4, 3),
    regla_redondeo    VARCHAR(30),
    PRIMARY KEY (num, moneda, um)
)ENGINE=INNODB
;



-- 
-- TABLE: logs 
--

CREATE TABLE logs(
    id_log     INT              AUTO_INCREMENT,
    usuario    VARCHAR(30)      NOT NULL,
    ip         VARCHAR(30),
    fecha      DATE,
    hora       VARCHAR(12),
    accion     VARCHAR(30),
    tipo       VARCHAR(20),
    doc_num    VARCHAR(16),
    data       VARCHAR(1000),
    PRIMARY KEY (id_log)
)ENGINE=INNODB
;



-- 
-- TABLE: metas 
--

CREATE TABLE metas(
    id_meta        SMALLINT          NOT NULL,
    usuario        VARCHAR(30)       NOT NULL,
    meta_minima    DECIMAL(16, 0),
    meta_base      DECIMAL(16, 0),
    sueldo_base    DECIMAL(16, 0),
    ponderacion    DECIMAL(3, 0),
    PRIMARY KEY (id_meta, usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: monedas 
--

CREATE TABLE monedas(
    m_cod       VARCHAR(4)     NOT NULL,
    m_descri    VARCHAR(30),
    m_ref       VARCHAR(4),
    PRIMARY KEY (m_cod)
)ENGINE=INNODB
;



-- 
-- TABLE: paises 
--

CREATE TABLE paises(
    codigo_pais    VARCHAR(30)    NOT NULL,
    nombre         VARCHAR(30),
    hits           INT,
    PRIMARY KEY (codigo_pais)
)ENGINE=INNODB
;



-- 
-- TABLE: parametros 
--

CREATE TABLE parametros(
    clave      VARCHAR(40)    NOT NULL,
    usuario    VARCHAR(30)    NOT NULL,
    valor      VARCHAR(60),
    descrip    VARCHAR(60),
    PRIMARY KEY (clave, usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: pdvs 
--

CREATE TABLE pdvs(
    pdv_cod     VARCHAR(30)    NOT NULL,
    suc         VARCHAR(10)    NOT NULL,
    pdv_ubic    VARCHAR(30)    NOT NULL,
    tipo        VARCHAR(30)    NOT NULL,
    moneda      VARCHAR(4)     NOT NULL,
    sub_tipo    VARCHAR(30),
    PRIMARY KEY (pdv_cod, suc, pdv_ubic, tipo, moneda)
)ENGINE=INNODB
;



-- 
-- TABLE: permisos 
--

CREATE TABLE permisos(
    id_permiso     VARCHAR(10)     NOT NULL,
    descripcion    VARCHAR(100),
    PRIMARY KEY (id_permiso)
)ENGINE=INNODB
;



-- 
-- TABLE: permisos_x_grupo 
--

CREATE TABLE permisos_x_grupo(
    id_permiso    VARCHAR(10)    NOT NULL,
    id_grupo      INT            NOT NULL,
    trustee       VARCHAR(10),
    PRIMARY KEY (id_permiso, id_grupo)
)ENGINE=INNODB
;



-- 
-- TABLE: personas 
--

CREATE TABLE personas(
    cod_per      INT             AUTO_INCREMENT,
    cod_ent      INT             NOT NULL,
    tipo_doc     VARCHAR(30),
    ci_ruc       VARCHAR(30),
    nombre       VARCHAR(60),
    tel          VARCHAR(30),
    email        VARCHAR(40),
    fecha_nac    DATE,
    estado       VARCHAR(30),
    ciudad       VARCHAR(30),
    dir          VARCHAR(60),
    geoloc       VARCHAR(120),
    ocupacion    VARCHAR(30),
    tipo         VARCHAR(16),
    usuario      VARCHAR(30),
    fecha_reg    VARCHAR(20),
    PRIMARY KEY (cod_per)
)ENGINE=INNODB
;



-- 
-- TABLE: prop_x_art 
--

CREATE TABLE prop_x_art(
    codigo      VARCHAR(30)    NOT NULL,
    cod_prop    VARCHAR(30)    NOT NULL,
    valor       VARCHAR(30),
    PRIMARY KEY (codigo, cod_prop)
)ENGINE=INNODB
;



-- 
-- TABLE: sectores 
--

CREATE TABLE sectores(
    cod_sector    INT            NOT NULL,
    descrip       VARCHAR(60),
    prefijo       VARCHAR(4),
    longitud      INT,
    serie         INT,
    PRIMARY KEY (cod_sector)
)ENGINE=INNODB
;



-- 
-- TABLE: sesiones 
--

CREATE TABLE sesiones(
    id_sesion        INT             AUTO_INCREMENT,
    usuario          VARCHAR(30)     NOT NULL,
    fecha            VARCHAR(30),
    hora             VARCHAR(30),
    ip               VARCHAR(30),
    serial           VARCHAR(100),
    limite_sesion    INT,
    expira           VARCHAR(30),
    estado           VARCHAR(16),
    PRIMARY KEY (id_sesion, usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: sucursales 
--

CREATE TABLE sucursales(
    suc             VARCHAR(10)     NOT NULL,
    ruc             VARCHAR(20),
    nombre          VARCHAR(30),
    direccion       VARCHAR(200),
    tel             VARCHAR(30),
    mail            VARCHAR(30),
    web             VARCHAR(100),
    ciudad          VARCHAR(30),
    departamento    VARCHAR(30),
    pais            VARCHAR(30),
    tipo            VARCHAR(30),
    estab_cont      VARCHAR(6),
    estado          VARCHAR(10),
    PRIMARY KEY (suc)
)ENGINE=INNODB
;



-- 
-- TABLE: tipo_vendedor 
--

CREATE TABLE tipo_vendedor(
    id_tipo           VARCHAR(30)    NOT NULL,
    descrip           VARCHAR(30),
    nombre_grupo      VARCHAR(30),
    meta_base_coef    INT,
    PRIMARY KEY (id_tipo)
)ENGINE=INNODB
;



-- 
-- TABLE: unidades_medida 
--

CREATE TABLE unidades_medida(
    um_cod       VARCHAR(10)       NOT NULL,
    um_prior     INT,
    um_descri    VARCHAR(30),
    um_ref       VARCHAR(4),
    um_mult      DECIMAL(16, 3),
    PRIMARY KEY (um_cod)
)ENGINE=INNODB
;



-- 
-- TABLE: usos 
--

CREATE TABLE usos(
    cod_uso    INT            AUTO_INCREMENT,
    descrip    VARCHAR(60),
    PRIMARY KEY (cod_uso)
)ENGINE=INNODB
;



-- 
-- TABLE: usuarios 
--

CREATE TABLE usuarios(
    usuario            VARCHAR(30)      NOT NULL,
    passw              VARCHAR(80)      NOT NULL,
    hash               VARCHAR(30),
    doc                VARCHAR(30),
    nombre             VARCHAR(30),
    apellido           VARCHAR(30),
    tel                VARCHAR(30),
    email              VARCHAR(60),
    pais               VARCHAR(60),
    dir                VARCHAR(120),
    fecha_nac          DATE,
    fecha_cont         DATE,
    limite_sesion      INT,
    imagen             VARCHAR(100),
    suc                VARCHAR(10),
    profesion          VARCHAR(60),
    cargo              VARCHAR(60),
    hora_entrada       VARCHAR(6),
    hora_salida        VARCHAR(6),
    id_tipo            VARCHAR(30),
    sueldo_fijo        DOUBLE(18, 0),
    sueldo_contable    DOUBLE(18, 0),
    estado             VARCHAR(20),
    PRIMARY KEY (usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: usuarios_x_grupo 
--

CREATE TABLE usuarios_x_grupo(
    usuario     VARCHAR(30)    NOT NULL,
    id_grupo    INT            NOT NULL,
    PRIMARY KEY (usuario, id_grupo)
)ENGINE=INNODB
;



-- 
-- TABLE: usuarios_x_suc 
--

CREATE TABLE usuarios_x_suc(
    suc        VARCHAR(10)    NOT NULL,
    usuario    VARCHAR(30)    NOT NULL,
    PRIMARY KEY (suc, usuario)
)ENGINE=INNODB
;



-- 
-- TABLE: art_x_uso 
--

ALTER TABLE art_x_uso ADD CONSTRAINT Refusos22 
    FOREIGN KEY (cod_uso)
    REFERENCES usos(cod_uso)
;

ALTER TABLE art_x_uso ADD CONSTRAINT Refarticulos23 
    FOREIGN KEY (codigo)
    REFERENCES articulos(codigo)
;


-- 
-- TABLE: articulos 
--

ALTER TABLE articulos ADD CONSTRAINT Refsectores21 
    FOREIGN KEY (cod_sector)
    REFERENCES sectores(cod_sector)
;

ALTER TABLE articulos ADD CONSTRAINT Refunidades_medida26 
    FOREIGN KEY (um)
    REFERENCES unidades_medida(um_cod)
;


-- 
-- TABLE: codigos_barras 
--

ALTER TABLE codigos_barras ADD CONSTRAINT Refarticulos104 
    FOREIGN KEY (codigo)
    REFERENCES articulos(codigo)
;


-- 
-- TABLE: comunicaciones 
--

ALTER TABLE comunicaciones ADD CONSTRAINT Refpersonas247 
    FOREIGN KEY (cod_per)
    REFERENCES personas(cod_per)
;

ALTER TABLE comunicaciones ADD CONSTRAINT Refusuarios248 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: contactos 
--

ALTER TABLE contactos ADD CONSTRAINT Refentidades128 
    FOREIGN KEY (codigo_entidad)
    REFERENCES entidades(cod_ent)
;

ALTER TABLE contactos ADD CONSTRAINT Refpersonas130 
    FOREIGN KEY (codigo_entidad)
    REFERENCES personas(cod_per)
;


-- 
-- TABLE: cotizaciones 
--

ALTER TABLE cotizaciones ADD CONSTRAINT Refsucursales133 
    FOREIGN KEY (suc)
    REFERENCES sucursales(suc)
;

ALTER TABLE cotizaciones ADD CONSTRAINT Refmonedas135 
    FOREIGN KEY (m_cod)
    REFERENCES monedas(m_cod)
;


-- 
-- TABLE: departamentos 
--

ALTER TABLE departamentos ADD CONSTRAINT Refpaises242 
    FOREIGN KEY (codigo_pais)
    REFERENCES paises(codigo_pais)
;


-- 
-- TABLE: distritos 
--

ALTER TABLE distritos ADD CONSTRAINT Refdepartamentos243 
    FOREIGN KEY (codigo_pais, cod_depart)
    REFERENCES departamentos(codigo_pais, cod_depart)
;


-- 
-- TABLE: entidades 
--

ALTER TABLE entidades ADD CONSTRAINT Refusuarios56 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;

ALTER TABLE entidades ADD CONSTRAINT Refdistritos244 
    FOREIGN KEY (codigo_pais, cod_depart, dist_num)
    REFERENCES distritos(dist_num, codigo_pais, cod_depart)
;

ALTER TABLE entidades ADD CONSTRAINT Refsucursales246 
    FOREIGN KEY (suc)
    REFERENCES sucursales(suc)
;


-- 
-- TABLE: lista_prec_x_art 
--

ALTER TABLE lista_prec_x_art ADD CONSTRAINT Refarticulos78 
    FOREIGN KEY (codigo)
    REFERENCES articulos(codigo)
;

ALTER TABLE lista_prec_x_art ADD CONSTRAINT Refusuarios79 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: lista_precios 
--

ALTER TABLE lista_precios ADD CONSTRAINT Refmonedas73 
    FOREIGN KEY (moneda)
    REFERENCES monedas(m_cod)
;

ALTER TABLE lista_precios ADD CONSTRAINT Refunidades_medida74 
    FOREIGN KEY (um)
    REFERENCES unidades_medida(um_cod)
;

ALTER TABLE lista_precios ADD CONSTRAINT Reflista_precios76 
    FOREIGN KEY (ref_num, ref_moneda, ref_um)
    REFERENCES lista_precios(num, moneda, um)
;


-- 
-- TABLE: logs 
--

ALTER TABLE logs ADD CONSTRAINT Refusuarios148 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: metas 
--

ALTER TABLE metas ADD CONSTRAINT Refusuarios226 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: parametros 
--

ALTER TABLE parametros ADD CONSTRAINT Refusuarios82 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: pdvs 
--

ALTER TABLE pdvs ADD CONSTRAINT Refsucursales122 
    FOREIGN KEY (suc)
    REFERENCES sucursales(suc)
;

ALTER TABLE pdvs ADD CONSTRAINT Refmonedas224 
    FOREIGN KEY (moneda)
    REFERENCES monedas(m_cod)
;


-- 
-- TABLE: permisos_x_grupo 
--

ALTER TABLE permisos_x_grupo ADD CONSTRAINT Refpermisos101 
    FOREIGN KEY (id_permiso)
    REFERENCES permisos(id_permiso)
;

ALTER TABLE permisos_x_grupo ADD CONSTRAINT Refgrupos103 
    FOREIGN KEY (id_grupo)
    REFERENCES grupos(id_grupo)
;


-- 
-- TABLE: personas 
--

ALTER TABLE personas ADD CONSTRAINT Refentidades245 
    FOREIGN KEY (cod_ent)
    REFERENCES entidades(cod_ent)
;


-- 
-- TABLE: prop_x_art 
--

ALTER TABLE prop_x_art ADD CONSTRAINT Refarticulos27 
    FOREIGN KEY (codigo)
    REFERENCES articulos(codigo)
;

ALTER TABLE prop_x_art ADD CONSTRAINT Refart_propiedades28 
    FOREIGN KEY (cod_prop)
    REFERENCES art_propiedades(cod_prop)
;


-- 
-- TABLE: sesiones 
--

ALTER TABLE sesiones ADD CONSTRAINT Refusuarios106 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


-- 
-- TABLE: usuarios 
--

ALTER TABLE usuarios ADD CONSTRAINT Reftipo_vendedor225 
    FOREIGN KEY (id_tipo)
    REFERENCES tipo_vendedor(id_tipo)
;


-- 
-- TABLE: usuarios_x_grupo 
--

ALTER TABLE usuarios_x_grupo ADD CONSTRAINT Refusuarios98 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;

ALTER TABLE usuarios_x_grupo ADD CONSTRAINT Refgrupos100 
    FOREIGN KEY (id_grupo)
    REFERENCES grupos(id_grupo)
;


-- 
-- TABLE: usuarios_x_suc 
--

ALTER TABLE usuarios_x_suc ADD CONSTRAINT Refsucursales113 
    FOREIGN KEY (suc)
    REFERENCES sucursales(suc)
;

ALTER TABLE usuarios_x_suc ADD CONSTRAINT Refusuarios114 
    FOREIGN KEY (usuario)
    REFERENCES usuarios(usuario)
;


