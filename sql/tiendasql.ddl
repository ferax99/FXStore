
/*
    Modelo de la base de datos
*/
CREATE TABLE categoria (
    categoriaid NUMBER NOT NULL,
    nombre      VARCHAR2(90)
);

ALTER TABLE categoria ADD CONSTRAINT categoria_pk PRIMARY KEY ( categoriaid );

CREATE TABLE categoriaproducto (
    categoriaproductoid   NUMBER NOT NULL,
    producto_productoid   NUMBER NOT NULL,
    categoria_categoriaid NUMBER NOT NULL
);

ALTER TABLE categoriaproducto ADD CONSTRAINT categoriaproducto_pk PRIMARY KEY ( categoriaproductoid,
                                                                                categoria_categoriaid );

CREATE TABLE producto (
    productoid NUMBER NOT NULL,
    nombre     VARCHAR2(45),
    cantidad   NUMBER,
    imagen     VARCHAR2(255),
    precio     NUMBER
);

ALTER TABLE producto ADD CONSTRAINT producto_pk PRIMARY KEY ( productoid );



  private Long id;
    private String username;
    private String password;
    private String role;


CREATE TABLE customer (
    id NUMBER NOT NULL,
    username    VARCHAR2(90) NOT NULL,
    password     VARCHAR2(255) NOT NULL,
    role VARCHAR(90) 
);

ALTER TABLE customer ADD CONSTRAINT usuario_pk PRIMARY KEY ( id );

ALTER TABLE categoriaproducto
    ADD CONSTRAINT categoriaproducto_categoria_fk FOREIGN KEY ( categoria_categoriaid )
        REFERENCES categoria ( categoriaid );

ALTER TABLE categoriaproducto
    ADD CONSTRAINT categoriaproducto_producto_fk FOREIGN KEY ( producto_productoid )
        REFERENCES producto ( productoid );



/*
    Auto Incremento de llaves primarias
*/

CREATE SEQUENCE usuario_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE; 

CREATE OR REPLACE TRIGGER usuario_trigger
BEFORE INSERT ON usuario
FOR EACH ROW
BEGIN
    SELECT usuario_seq.NEXTVAL
    INTO :NEW.usuarioid
    FROM DUAL;
END;


CREATE SEQUENCE producto_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE TRIGGER producto_trigger
BEFORE INSERT ON Producto
FOR EACH ROW
BEGIN
    SELECT producto_seq.NEXTVAL
    INTO :NEW.productoid
    FROM DUAL;
END;


CREATE SEQUENCE categoria_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;

CREATE OR REPLACE TRIGGER categoria_trigger
BEFORE INSERT ON Categoria
FOR EACH ROW
BEGIN
    SELECT categoria_seq.NEXTVAL
    INTO :NEW.categoriaid
    FROM DUAL;
END;

CREATE OR REPLACE TRIGGER categoriaproducto_trigger
BEFORE INSERT ON categoriaproducto
FOR EACH ROW
BEGIN
    SELECT categoriaproducto_seq.NEXTVAL
    INTO :NEW.categoriaproductoid
    FROM DUAL;
END;

/*
    inser de datos dummy
*/

INSERT INTO producto (nombre, cantidad, imagen, precio) VALUES ('camisa', 10, 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg', 19.99);
INSERT INTO producto (nombre, cantidad, imagen, precio) VALUES ('pantalon', 20, 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg', 29.99);
INSERT INTO producto (nombre, cantidad, imagen, precio) VALUES ('pc', 15, 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg', 4539.99);


INSERT INTO Categoria (nombre) VALUES ('Electronicos');
INSERT INTO Categoria (nombre) VALUES ('Ropa');
INSERT INTO Categoria (nombre) VALUES ('Hogar');

INSERT INTO categoriaproducto (producto_productoid, categoria_categoriaid)
VALUES (1, 2);


/*
    funciones y procedimientos almacenados 
*/

CREATE OR REPLACE FUNCTION ValidarUsuario(
    p_usuario IN VARCHAR2,
    p_clave IN VARCHAR2
)
RETURN VARCHAR2
IS
    v_clave_bd VARCHAR2(255); 
BEGIN
    -- Obtener la clave almacenada en la base de datos para el usuario proporcionado
    SELECT clave
    INTO v_clave_bd
    FROM usuario
    WHERE nombre = p_usuario;

    -- Validar la clave
    IF p_clave = v_clave_bd THEN
        RETURN 'YES';
    ELSE
        RETURN 'NO';
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 'NO';
END ValidarUsuario;

