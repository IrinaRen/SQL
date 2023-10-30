--SQL HomeWork 2. Joins
--
--На основании сделанной таблицы в SQL_HW_2 сделать следующие запросы:
--
--
-- 1. Вывести всех работников чьи зарплаты есть в базе, вместе с зарплатами.
select employees.employee_name, salary.monthly_salary, employees_salary.salary_id
from employees_salary
join employees
on employees_salary.employee_id = employees.id
join salary
on employees_salary.salary_id=salary.id;

-- 2. Вывести всех работников у которых ЗП меньше 2000.
select employees.employee_name, salary.monthly_salary, employees_salary.salary_id
from employees_salary
join employees
on employees_salary.employee_id = employees.id
join salary
on employees_salary.salary_id=salary.id
where monthly_salary < 2000
order by monthly_salary;

-- 3. Вывести все зарплатные позиции, но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary
from salary
where salary.id not in(select salary_id
from employees_salary);

-- 4. Вывести все зарплатные позиции меньше 2000 но работник по ним не назначен. (ЗП есть, но не понятно кто её получает.)
select monthly_salary
from salary
where salary.id not in(select salary_id
from employees_salary) and monthly_salary < 2000;

-- 5. Найти всех работников кому не начислена ЗП.
select *
from employees
where employees.id not in(select employee_id
from employees_salary);

-- 6. Вывести всех работников с названиями их должности.
select roles_employee.employee_id, employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id;

-- 7. Вывести имена и должность только Java разработчиков.
select roles_employee.employee_id, employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Java\_%';

-- 8. Вывести имена и должность только Python разработчиков.
select roles_employee.employee_id, employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
left join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Python%';

-- 9. Вывести имена и должность всех QA инженеров.
select roles_employee.employee_id, employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%QA%'
order by role_id;

-- 10. Вывести имена и должность ручных QA инженеров.
select roles_employee.employee_id, employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Manual%QA%'
order by role_id;

-- 11. Вывести имена и должность автоматизаторов QA
select employees.employee_name, roles.role_name, roles_employee.role_id
from roles_employee
join employees
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Automati%QA%'
order by role_id;

-- 12. Вывести имена и зарплаты Junior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like 'Junior%'
order by role_id;

-- 13. Вывести имена и зарплаты Middle специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like 'Middle%'
order by role_id;

-- 14. Вывести имена и зарплаты Senior специалистов
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like 'Senior%'
order by role_id;

-- 15. Вывести зарплаты Java разработчиков
select distinct salary.monthly_salary, roles.role_name
from salary
join employees_salary
on employees_salary.salary_id=salary.id
join employees
on employees_salary.employee_id = employees.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Java\_%';

-- 16. Вывести зарплаты Python разработчиков
select distinct salary.monthly_salary, roles.role_name
from salary
join employees_salary
on employees_salary.salary_id=salary.id
join employees
on employees_salary.employee_id = employees.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like '%Python%';

-- 17. Вывести имена и зарплаты Junior Python разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees
join employees_salary
on employees_salary.employee_id = employees.id
join salary
on employees_salary.salary_id=salary.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like'Junior%Python%';

-- 18. Вывести имена и зарплаты Middle JS разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like'Middle%J%S%';

-- 19. Вывести имена и зарплаты Senior Java разработчиков
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like'Senior%Java%';

-- 20. Вывести зарплаты Junior QA инженеров
select employees.employee_name, roles.role_name, salary.monthly_salary
from employees 
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like'Junior%QA%';

-- 21. Вывести среднюю зарплату всех Junior специалистов
select AVG(salary.monthly_salary) as AVG_Junior_salary
from employees 
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like'Junior%';


-- 22. Вывести сумму зарплат JS разработчиков
select sum(salary.monthly_salary) as SUM_JS_salary
from salary
join employees_salary
on employees_salary.salary_id=salary.id
join employees
on employees_salary.employee_id = employees.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like'%J%S%';

-- 23. Вывести минимальную ЗП QA инженеров
select MIN(salary.monthly_salary) as MIN_QA_salary
from salary
join employees_salary
on employees_salary.salary_id=salary.id
join employees
on employees_salary.employee_id = employees.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like'%QA%';

-- 24. Вывести максимальную ЗП QA инженеров
select max(salary.monthly_salary) as MIN_QA_salary
from salary
join employees_salary
on employees_salary.salary_id=salary.id
join employees
on employees_salary.employee_id = employees.id
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
where role_name like'%QA%';

-- 25. Вывести количество QA инженеров
select count(*)
from employees
left join roles_employee
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like '%QA%';

-- 26. Вывести количество Middle специалистов.
select count(*)
from roles_employee
left join employees
on roles_employee.employee_id = employees.id
left join roles
on roles_employee.role_id=roles.id
where role_name like 'Middle%';

-- 27. Вывести количество разработчиков
select count(*)
from roles_employee
right join employees
on roles_employee.employee_id = employees.id
right join roles
on roles_employee.role_id=roles.id
where role_name like '%developer';

-- 28. Вывести фонд (сумму) зарплаты разработчиков.
select sum(salary.monthly_salary) as SUM_developer_salary
from employees_salary
right join employees
on employees_salary.employee_id = employees.id
right join salary
on employees_salary.salary_id=salary.id
right join roles_employee
on roles_employee.employee_id = employees.id
right join roles
on roles_employee.role_id=roles.id
where role_name like'%developer';

-- 29. Вывести имена, должности и ЗП всех специалистов по возрастанию
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
order by monthly_salary;

-- 30. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП от 1700 до 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
where monthly_salary between 1700 and 2300
order by monthly_salary;

-- 31. Вывести имена, должности и ЗП всех специалистов по возрастанию у специалистов у которых ЗП меньше 2300
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
where monthly_salary < 2300
order by monthly_salary;

-- 32. Вывести имена, должности и ЗП всех специалистов по возрастанию
--у специалистов у которых ЗП равна 1100, 1500, 2000
select employees.employee_name, roles.role_name, salary.monthly_salary 
from employees 
join roles_employee
on roles_employee.employee_id = employees.id
join roles
on roles_employee.role_id=roles.id
left join employees_salary
on employees_salary.employee_id = employees.id
left join salary
on employees_salary.salary_id=salary.id
where monthly_salary in(1100, 1500, 2000)
order by monthly_salary;
