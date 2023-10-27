--SQL_DDL
--Первая часть.
--
--Таблица employees
--
--Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null
--
create table employees(
id serial primary key,
employee_name varchar(50) not null);

--Наполнить таблицу employees 70 строками.
--
insert into employees(employee_name)
values('Irina_1'),
('Irina_2'),
('Irina_3'),
('Irina_4'),
('Irina_5'),
('Irina_6'),
('Irina_7'),
('Irina_8'),
('Irina_9'),
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
--
----Создать таблицу salary
----- id. Serial  primary key,
----- monthly_salary. Int, not null
--
create table salary(
id serial primary key,
monthly_salary int not null);

----Наполнить таблицу salary 16 строками:
----- 1000
----- 1100
----- 1200
----- 1300
----- 1400
----- 1500
----- 1600
----- 1700
----- 1800
----- 1900
----- 2000
----- 2100
----- 2200
----- 2300
----- 2400
----- 2500
--
insert into salary(monthly_salary)
values(1000),
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

--Таблица employee_salary
--
--Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null
--
create table employees_salary(
id serial primary key,
employee_id int not null unique,
salary_id int not null);

--Наполнить таблицу employees_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id
--
insert into employees_salary(employee_id, salary_id)
values (71, 1),
(72, 2),
(73, 3),
(74, 4),
(75, 5),
(76, 6),
(77, 7),
(78, 8),
(79, 9),
(80, 10),
(1, 11),
(2, 12),
(3, 13),
(4, 14),
(5, 15),
(6, 16),
(7, 1),
(8, 2),
(9, 3),
(10, 4),
(11, 5),
(12, 6),
(13, 7),
(14, 8),
(15, 9),
(16, 10),
(17, 11),
(18, 12),
(19, 13),
(20, 14),
(21, 15),
(22, 16),
(23, 1),
(24, 2),
(25, 3),
(26, 4),
(27, 5),
(28, 6),
(29, 7),
(30, 8);


--Таблица roles
--
--Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique
--
create table roles(
id serial primary key,
role_name int not null unique);

--Поменять тип столба role_name с int на varchar(30)
--Наполнить таблицу roles 20 строками:
--
alter table roles
alter column role_name type varchar(30);

--Наполнить таблицу roles 20 строками:
--
insert into roles(role_name)
values ('Junior_Python_developer'),
('Middle_Python_developer'),
('Senior_Python_developer'),
('Junior_Java_developer'),
('Middle_Java_developer'),
('Senior_Java_developer'),
('Junior_JavaScript_developer'), 
('Middle_JavaScript_developer'),
('Senior_JavaScript_developer'),
('Junior_Manual_QA_engineer'),
('Middle_Manual_QA_engineer'),
('Senior_Manual_QA_engineer'),
('Project_Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales_manager'), 
('Junior_Automation_QA_engineer'),
('Middle_Automation_QA_engineer'),
('Senior_Automation_QA_engineer');

--Таблица roles_employee
--
--Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)
--
create table roles_employee(
id serial primary key,
employee_id int not null unique,
foreign key (employee_id) references employees(id),
role_id int not null,
foreign key(role_id) references roles(id)
);


--Наполнить таблицу roles_employee 40 строками:
--
insert into roles_employee(employee_id, role_id)
values(1, 5),
(2, 12),
(3, 20),
(4, 3),
(5, 9),
(6, 6),
(7, 15),
(8, 10),
(9, 17),
(10, 1),
(11, 7),
(12, 4),
(13, 11),
(14, 19),
(15, 2),
(16, 8),
(17, 5),
(18, 12),
(19, 13),
(20, 3),
(21, 9),
(22, 6),
(23, 16),
(24, 10),
(25, 18),
(26, 14),
(27, 13),
(28, 4),
(29, 11),
(30, 20),
(31, 19),
(32, 18),
(33, 17),
(34, 16),
(35, 15),
(36, 14),
(37, 13),
(38, 12),
(39, 11),
(40, 10);
