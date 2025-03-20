
create database consultas_multitablas;
use consultas_multitablas;


create table cargo (
    id_cargo int primary key,
    nombre_cargo varchar(50) not null,
    rango_cargo varchar(20) not null,
    descripcion_cargo varchar(100) not null
);


create table  departamento (
    id_departamento int primary key,
    nombre_departamento varchar(50) not null
);



create table  empleados (
    id_empleado int primary key,
    nombre varchar(50) not null,
    apellido varchar(50) not null,
    fecha_contratacion date not null,
    id_departamento int not null,
    id_cargo int not null,
    salario decimal(10) not null,
    foreign key (id_departamento) references departamento(id_departamento),
    foreign key (id_cargo) references cargo(id_cargo)
);


select * 
from cargo;

select*
from departamento;

select* 
from empleados;

insert into cargo (id_cargo, nombre_cargo, rango_cargo, descripcion_cargo) values
(1, 'gerente', 'alto', 'supervisa operaciones'),
(2, 'analista', 'medio', 'analiza datos y procesos'),
(3, 'desarrollador', 'medio', 'desarrolla software'),
(4, 'soporte técnico', 'bajo', 'asiste con problemas técnicos'),
(5, 'contador', 'medio', 'administra finanzas');


insert into departamento (id_departamento, nombre_departamento) values
(1, 'recursos humanos'),
(2, 'tecnologia'),
(3, 'finanzas'),
(4, 'ventas'),
(5, 'logistica');

insert into empleados (id_empleado, nombre, apellido, fecha_contratacion, id_departamento, id_cargo, salario) values
(1, 'juan', 'perez', '2018-05-10', 1, 1, 5000000),
(2, 'maria', 'gomez', '2019-08-15', 2, 3, 4000000),
(3, 'carlos', 'rodriguez', '2020-01-20', 3, 2, 4200000),
(4, 'laura', 'fernandez', '2017-11-05', 4, 5, 3800000),
(5, 'pedro', 'martinez', '2021-06-30', 5, 4, 3500000);







select id_empleado, e.nombre, e.apellido, c.nombre_cargo
from empleados e
left join cargo c on e.id_cargo = c.id_cargo
where c.nombre_cargo = 'nombredelcargo';

select e.id_empleado, e.nombre, e.apellido, 
timestampdiff(year, e.fecha_contratacion, curdate()) as años_antiguedad, d.nombre_departamento, c.nombre_cargo, e.salario
from empleados e
right join departamento d on e.id_departamento = d.id_departamento
right join cargo c on e.id_cargo = c.id_cargo
where timestampdiff(year, e.fecha_contratacion, curdate()) > 3;

select e.id_empleado, e.nombre, e.apellido, e.fecha_contratacion, d.nombre_departamento, 
timestampdiff(year, e.fecha_contratacion, curdate()) as años_antiguedad, c.nombre_cargo
from empleados e
left join cargo c on e.id_cargo = c.id_cargo
left join departamento d on e.id_departamento = d.id_departamento;

select e.id_empleado, e.nombre, e.apellido, e.fecha_contratacion, d.nombre_departamento,c.rango,
timestampdiff(year, e.fecha_contratacion, curdate()) as años_antiguedad, c.nombre_cargo
from empleados e
left join cargo c on e.id_cargo = c.id_cargo
left join departamento d on e.id_departamento = d.id_departamento;

select e.id_empleado, e.nombre, e.apellido, e.fecha_contratacion, d.nombre_departamento, c.rango_cargo,
timestampdiff(year, e.fecha_contratacion, curdate()) as años_antiguedad, c.nombre_cargo
from empleados e
left join cargo c on e.id_cargo = c.id_cargo
left join departamento d on e.id_departamento = d.id_departamento;


select d.id_departamento, d.nombre_departamento
from departamento d
left join empleados e on d.id_departamento = e.id_departamento
where e.id_empleado is null;


select c.id_cargo, c.nombre_cargo
from cargo c
left join empleados e on c.id_cargo = e.id_cargo
where e.id_empleado is null;




