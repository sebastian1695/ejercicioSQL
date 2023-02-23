DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoría INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisión FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY PEDIDO_FK1 (id_cliente)  REFERENCES cliente(id),
  FOREIGN KEY PEDIDO_FK2 (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Medellín', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Barranquilla', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Ipiales', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Cali', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Medellín', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Bogotá', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Buenaventura', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Bucaramanga', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Cartagena', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Cartagena', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);
Devuelve un listado con todos los pedidos que se han realizado.  ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.

SELECT*FROM PEDIDO
ORDER BY fecha DESC;

Devuelve todos los datos de los dos pedidos de mayor valor.

SELECT *from PEDIDO WHERE id_cliente in ('1', '8')
ORDER BY TOTAL DESC;
SELECT *FROM PEDIDO WHERE id in ('9','16') 
ORDER BY TOTAL DESC;

Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos. 
SELECT distinct(id_cliente) from PEDIDO;

Devuelve un listado de todos los pedidos que se realizaron durante el año 2017, cuya cantidad total sea superior a 500€.

select*from pedido

where fecha between '2017-01-01' and '2017-12-31'

HAVING TOTAL>500;

Devuelve un listado con el nombre y los apellidos de los comerciales que tienen una comisión entre 0.05 y 0.11.

SELECT* FROM COMERCIAL
WHERE COMISIÓN BETWEEN '0.05' and '0.11';


Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
SELECT * FROM PEDIDO
ORDER BY fecha DESC;

SELECT MAX(TOTAL) FROM PEDIDO
wHERE FECHA BETWEEN '2019-01-01' AND '2019-12-31';

SELECT MAX(TOTAL) FROM PEDIDO
wHERE FECHA BETWEEN '2018-01-01' AND '2018-12-31';

SELECT MAX(TOTAL) FROM PEDIDO
wHERE FECHA BETWEEN '2017-01-01' AND '2017-12-31';

SELECT MAX(TOTAL) FROM PEDIDO
wHERE FECHA BETWEEN '2016-01-01' AND '2016-12-31';

SELECT MAX(TOTAL) FROM PEDIDO
wHERE FECHA BETWEEN '2015-01-01' AND '2015-12-31';


Devuelve el número total de pedidos que se han realizado cada año.
select*from pedido;

select count(id) from pedido
wHERE FECHA BETWEEN '2015-01-01' AND '2015-12-31';

select count(id) from pedido
wHERE FECHA BETWEEN '2016-01-01' AND '2016-12-31';

select count(id) from pedido
wHERE FECHA BETWEEN '2017-01-01' AND '2017-12-31';

select count(id) from pedido
wHERE FECHA BETWEEN '2018-01-01' AND '2018-12-31';

select count(id) from pedido
wHERE FECHA BETWEEN '2019-01-01' AND '2019-12-31';

Devuelve el valor de la comisión de mayor valor que existe en la tabla comercial.
select * from comercial;
select max(comisión) from comercial;

Devuelve un listado con el identificador, nombre y los apellidos de todos los clientes que han realizado algún pedido. Ordenado alfabéticamente y eliminando los elementos repetidos.
select*from cliente;
ORDER BY nombre asC

alter table cliente drop categoría;
select*from cliente;


Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.

select*from pedido;
select*from cliente;

select P.*, C.* From cliente C, pedido P
where C.ID = P.ID_CLIENTE
ORDER BY nombre asc;

Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz. (Sin utilizar INNER JOIN).
select*from cliente;
select*from pedido;

select P.*, C.* From cliente C, pedido P
where nombre = 'Adela';

Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
select P.*, C.* From cliente C, pedido P
where nombre= 'Daniel';

select count(id) from pedido;

Devuelve los datos del cliente que realizó el pedido más caro en el año 2019. (Sin utilizar INNER JOIN)
select P.*, C.* From cliente C, pedido P
wHERE FECHA BETWEEN '2019-01-01' AND '2019-12-31'
order by total desc;

select P.*, C.* From cliente C, pedido P
 where total in ('2389.23');

Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select P.*, C.* From cliente C, pedido P
where total in ('0');

Devuelve un listado de los comerciales que no han realizado ningún pedido. (Utilizando IN o NOT IN).
select P.*, D.* From comercial D, pedido P
where total in('0');
