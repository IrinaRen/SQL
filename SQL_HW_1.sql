-- SQL_HW_1
-- Создать .sql файл в котором под каждой командой напишите sql запрос который выполнит команду.

-- .sql файл выгружайте на гит и скидывайте ссылки на проверку.

--  1. Вывести все поля и все строки.
SELECT * FROM university;

--  2. Вывести всех студентов в таблице
SELECT students FROM university;

--  3. Вывести только Id пользователей
SELECT user_id FROM university;

--  4. Вывести только имя пользователей
SELECT user_name FROM universiry;

--  5. Вывести только email пользователей
SELECT email FROM university;

--  6. Вывести имя и email пользователей
SELECT user_name, email FROM university;

--  7. Вывести id, имя, email и дату создания пользователей
SELECT user_id, user_name, email FROM university;

--  8. Вывести пользователей где password 12333
SELECT * FROM university
WHERE password=12333;

--  9. Вывести пользователей которые были созданы 2021-03-26 00:00:00
SELECT * FROM university
WHERE created_on='2021-03-26 00:00:00';

--  10. Вывести пользователей где в имени есть слово Анна
SELECT * FROM university
WHERE user_name LIKE '%Anna%';

--  11. Вывести пользователей где в имени в конце есть 8
SELECT * FROM university
WHERE user_name LIKE '%8';

--  12. Вывести пользователей где в имени в есть буква а
SELECT * FROM university
WHERE user_name LIKE '%a%' 
    OR user_name LIKE 'a%'
        OR user_name LIKE '%a';

--  13. Вывести пользователей которые были созданы 2021-07-12 00:00:00
SELECT * FROM university
WHERE created_on='2021-07-12 00:00:00';

--  14. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и имеют пароль 1m313
SELECT * FROM university
WHERE created_on='2021-07-12 00:00:00'
AND password='1m313';

--  15. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть слово Andrey
SELECT * FROM university
WHERE created_on='2021-07-12 00:00:00'
AND user_name LIKE '%Andrey%';

--  16. Вывести пользователей которые были созданы 2021-07-12 00:00:00 и у которых в имени есть цифра 8
SELECT * FROM university
WHERE created_on='2021-07-12 00:00:00'
AND user_name LIKE '%8%';

--  17. Вывести пользователя у которых id равен 110
SELECT * FROM university
WHERE user_id=110;

--  18. Вывести пользователя у которых id равен 153
SELECT * FROM university
WHERE user_id = 153;

--  19. Вывести пользователя у которых id больше 140
SELECT * FROM university
WHERE user_id > 140;

--  20. Вывести пользователя у которых id меньше 130
SELECT * FROM university
WHERE user_id < 130;

--  21. Вывести пользователя у которых id меньше 127 или больше 188
SELECT * FROM university
WHERE user_id < 127 OR user_id > 188;

--  22. Вывести пользователя у которых id меньше либо равно 137
SELECT * FROM university
WHERE user_id <= 137;

--  23. Вывести пользователя у которых id больше либо равно 137
SELECT * FROM university
WHERE user_id >= 137;

--  24. Вывести пользователя у которых id больше 180 но меньше 190
SELECT * FROM university
WHERE user_id >= 180 AND user_id < 190;

--  25. Вывести пользователя у которых id между 180 и 190
SELECT * FROM university
WHERE user_id BETWEEN 180 and 190;

--  26. Вывести пользователей где password равен 12333, 1m313, 123313
SELECT * FROM university
WHERE password IN ('12333', '1m313', '123313');

--  27. Вывести пользователей где created_on равен 2020-10-03 00:00:00, 2021-05-19 00:00:00, 2021-03-26 00:00:00
SELECT * FROM university
WHERE created_on IN ('2020-10-03 00:00:00', '2021-05-19 00:00:00', '2021-03-26 00:00:00');

--  28. Вывести минимальный id 
SELECT MIN(user_id) FROM university;

--  29. Вывести максимальный.
SELECT MAX(user_id) FROM university;

--  30. Вывести количество пользователей
SELECT COUNT(*) FROM university;

--  31. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку возрастания даты добавления пользоватлеля.
SELECT user_id, user_name, created_on FROM university
ORDER BY created_on;

--  32. Вывести id пользователя, имя, дату создания пользователя. Отсортировать по порядку убывания даты добавления пользоватлеля.
SELECT user_id, user_name, created_on FROM university
ORDER BY created_on DESC;
