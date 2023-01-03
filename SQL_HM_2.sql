--Таблица employees
--
--1)Создать таблицу employees
--id. serial,  primary key,
--employee_name. Varchar(50), not null
create table employees(
id serial primary key, employee_name varchar (50) unique not null);

--@)Наполнить таблицу employee 70 строками.
insert into employees (employee_name)
values ('Irina_1'), ('Irina_2'), ('Irina_3'), ('Irina_4'), ('Irina_5'),
('Irina_6'), ('Irina_7'), ('Irina_8'), ('Irina_9'),
('Irina_10'),
('Irina_11'),
('Irina_12'),
('Irina_13'),
('Irina_14'),
('Irina_15'),
('Irina_16'),
('Irina_17'),
('Irina_18'),
('Irina_19'),
('Irina_20'),
('Irina_21'),
('Irina_22'),
('Irina_23'),
('Irina_24'),
('Irina_25'),
('Irina_26'),
('Irina_27'),
('Irina_28'),
('Irina_29'),
('Irina_30'),
('Irina_31'),
('Irina_32'),
('Irina_33'),
('Irina_34'),
('Irina_35'),
('Irina_36'),
('Irina_37'),
('Irina_38'),
('Irina_39'),
('Irina_40'),
('Irina_41'),
('Irina_42'),
('Irina_43'),
('Irina_44'),
('Irina_45'),
('Irina_46'),
('Irina_47'),
('Irina_48'),
('Irina_49'),
('Irina_50'),
('Irina_51'),
('Irina_52'),
('Irina_53'),
('Irina_54'),
('Irina_55'),
('Irina_56'),
('Irina_57'),
('Irina_58'),
('Irina_59'),
('Irina_60'),
('Irina_61'),
('Irina_62'),
('Irina_63'),
('Irina_64'),
('Irina_65'),
('Irina_66'),
('Irina_67'),
('Irina_68'),
('Irina_69'),
('Irina_70');

--Таблица salary
--3)Создать таблицу salary
-- id. Serial  primary key,
-- monthly_salary. Int, not null

create table salary(
id serial primary key,
monthly_salary int not null);

--4)Наполнить таблицу salary 15 строками:
-- 1000
-- 1100
-- 1200
-- 1300
-- 1400
-- 1500
-- 1600
-- 1700
-- 1800
-- 1900
-- 2000
-- 2100
-- 2200
-- 2300
-- 2400
-- 2500
insert into salary(monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600), 
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

select * from salary;

--Таблица employee_salary

--5)Создать таблицу employee_salary
-- id. Serial  primary key,
-- employee_id. Int, not null, unique
-- salary_id. Int, not null
create table employee_salary(
id serial primary key,
employee_id int unique not null,
salary_id int not null);

select * from employee_salary;

--DROP TABLE employee_salary;

--6)Наполнить таблицу employee_salary 40 строками:
--в 10 строк из 40 вставить несуществующие employee_id
insert into employee_salary(employee_id, salary_id)
values (10, 40),
(9, 39),
(8, 38),
(7, 37),
(6, 36),
(5, 35),
(4, 34), 
(3, 33),
(2, 32),
(1, 31),
(40, 30),
(39, 29),
(38, 28),
(37, 27),
(36, 26),
(35, 25),
(34, 24), 
(33, 23),
(32, 22),
(31, 21),
(20, 20),
(29, 19),
(28, 18),
(27, 17),
(26, 16),
(25, 15),
(24, 14), 
(23, 13),
(22, 12),
(21, 11),
(20, 10),
(19, 9),
(18, 8),
(17, 7),
(16, 6),
(15, 5),
(14, 4), 
(13, 3),
(12, 2),
(11, 1);

DELETE from employee_salary;

--Таблица roles

--7)Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
create table roles(
id serial primary key,
role_name int unique not null);

--8)Поменять тип столба role_name с int на varchar(30)
alter table roles alter column role_name type Varchar(30);


--9)Наполнить таблицу roles 20 строками:
insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'), 
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'), 
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--Таблица roles_employee

--10)Создать таблицу roles_employee
-- id. Serial  primary key,
-- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
-- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
create table roles_employee(
id serial primary key,
employee_id int unique not null,
role_id int not null,
foreign key(employee_id)
references employees(id),
foreign key(role_id)
references roles(id)
);

--11)Наполнить таблицу roles_employee 40 строками:
insert into roles_employee(employee_id, role_id)
values (142, 1),
(143, 2),
(144, 3),
(145, 4),
(146, 5),
(147, 6),
(148, 7), 
(149, 8),
(150, 9),
(151, 10),
(152, 11),
(153, 12),
(154, 13),
(155, 14),
(156, 15),
(157, 16), 
(158, 17),
(159, 18),
(160, 19),
(161, 20),
(162, 1),
(163, 2),
(164, 3),
(165, 4),
(166, 5),
(167, 6), 
(168, 7),
(169, 8),
(170, 9),
(171, 10),
(172, 11),
(173, 12),
(174, 13),
(175, 14),
(176, 15),
(177, 16), 
(178, 17),
(179, 18),
(180, 19),
(181, 20);

select * from roles_employee;
select * from employees;
select * from roles;
