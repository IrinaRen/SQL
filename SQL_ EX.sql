-- Найдите номер модели, скорость и размер жесткого диска для всех ПК стоимостью менее 500 дол. 
-- Вывести: model, speed и hd
SELECT model, speed, hd
FROM PC
WHERE price < 500
 ;

-- Найдите производителей принтеров. Вывести: maker
SELECT DISTINCT maker
FROM Product
WHERE type='Printer'
;

-- Найдите номер модели, объем памяти и размеры экранов ПК-блокнотов,
-- цена которых превышает 1000 дол.
SELECT model, ram, screen
FROM Laptop
WHERE price>1000
;

-- Найдите все записи таблицы Printer для цветных принтеров.
SELECT *
FROM Printer
WHERE color='y'
;

-- Найдите номер модели, скорость и размер жесткого диска ПК, 
-- имеющих 12x или 24x CD и цену менее 600 дол.
SELECT DISTINCT model, speed, hd
FROM PC
WHERE cd IN ('12x','24x') AND price<600
;

-- Для каждого производителя, выпускающего ПК-блокноты
-- c объёмом жесткого диска не менее 10 Гбайт, 
-- найти скорости таких ПК-блокнотов. Вывод: производитель, скорость.
SELECT DISTINCT maker, speed FROM laptop
JOIN Product
ON product.model=laptop.model
WHERE hd>=10
;

-- Найдите номера моделей и цены всех имеющихся в продаже продуктов (любого типа) 
-- производителя B (латинская буква).
SELECT product.model, price FROM PC
JOIN product
ON product.model=PC.model
WHERE maker='B'
 
UNION
 
SELECT product.model, price FROM laptop
JOIN product
ON product.model=laptop.model
WHERE maker='B'
 
UNION
 
SELECT product.model, price FROM printer
JOIN product
ON product.model=printer.model
WHERE maker='B'
;

-- Найдите производителя, выпускающего ПК, но не ПК-блокноты.
SELECT maker FROM Product
WHERE type='PC'
 
EXCEPT
 
SELECT maker FROM Product
WHERE type='Laptop'
;

-- Найдите производителей ПК с процессором не менее 450 Мгц. Вывести: Maker
SELECT DISTINCT maker FROM Product
JOIN pc
ON PC.model=product.model
WHERE speed>='450'
;

-- Найдите модели принтеров, имеющих самую высокую цену. Вывести: model, price
SELECT model, price
FROM Printer
WHERE price=(SELECT MAX(price)
FROM Printer);
;

-- Найдите среднюю скорость ПК.
SELECT AVG(speed) AS Avg_speed
FROM PC
;

-- Найдите среднюю скорость ПК-блокнотов, цена которых превышает 1000 дол.
SELECT AVG(speed) AS Avg_speed
FROM laptop
WHERE price>1000
;

-- Найдите среднюю скорость ПК, выпущенных производителем A.
SELECT AVG(speed) AS Avg_speed
FROM PC
WHERE model IN(SELECT model
 FROM Product
 WHERE maker = 'A'
 );

-- Найдите класс, имя и страну для кораблей из таблицы Ships, имеющих не менее 10 орудий.
SELECT ships.class, ships.name, country
FROM ships JOIN 
classes ON classes.class = ships.class
WHERE numGuns>=10
;

-- Найдите размеры жестких дисков, совпадающих у двух и более PC.
-- Вывести: HD
SELECT hd FROM PC 
GROUP BY hd
HAVING COUNT(*)>=2
;

-- Найдите пары моделей PC, имеющих одинаковые скорость и RAM. 
-- В результате каждая пара указывается только один раз, т.е. (i,j), но не (j,i), 
-- Порядок вывода: модель с большим номером,модель с меньшим номером, скорость и RAM.
SELECT DISTINCT pc_1.model, pc_2.model, pc_1.speed, pc_1.ram
FROM PC pc_1, PC pc_2
WHERE pc_1.speed =pc_2.speed AND pc_1.ram=pc_2.ram AND 
pc_1.model > pc_2.model
;

-- Найдите модели ПК-блокнотов, скорость которых меньше скорости каждого из ПК.
-- Вывести: type, model, speed
SELECT DISTINCT type, Laptop.model, Laptop.speed
FROM Product, Laptop
WHERE type='Laptop' AND speed < ALL (SELECT speed 
FROM PC)
 ;

-- Найдите производителей самых дешевых цветных принтеров. 
-- Вывести: maker, price
SELECT maker, price
FROM Product 
JOIN Printer
ON Printer.model=Product.model
WHERE price = (SELECT MIN(price) FROM Printer WHERE color='y') AND color='y'
GROUP BY maker, price
;

-- Найдите производителей, выпускающих по меньшей мере три различных модели ПК.
-- Вывести: Maker, число моделей ПК.
SELECT DISTINCT maker, COUNT(model) AS COUNT_model
FROM Product
WHERE type= 'pc'
GROUP BY maker
HAVING COUNT(*)>=3
;

-- Найдите максимальную цену ПК, выпускаемых каждым производителем,
--  у которого есть модели в таблице PC.
-- Вывести: maker, максимальная цена.
SELECT maker, MAX(price)
FROM Product 
JOIN PC
ON pc.model=product.model
GROUP BY maker
;

-- Для каждого значения скорости ПК, превышающего 600 МГц, 
-- определите среднюю цену ПК с такой же скоростью. 
-- Вывести: speed, средняя цена.
SELECT speed, AVG(price)
FROM PC
WHERE speed>600
GROUP BY speed
;

-- Найдите производителей, которые производили бы как ПК
-- со скоростью не менее 750 МГц, так и ПК-блокноты со скоростью не менее 750 МГц.
-- Вывести: Maker
SELECT maker
FROM Product 
JOIN PC
ON PC.model= Product.model
WHERE speed>=750 AND maker IN (SELECT maker
FROM product JOIN Laptop
ON Laptop.model = Product.model
WHERE speed>=750)
GROUP BY maker
 
-- Или такое решение:
SELECT maker
FROM Product
JOIN PC
ON Product.model=PC.model
WHERE speed>=750

INTERSECT

SELECT maker
FROM Product
JOIN Laptop
ON Product.model=Laptop.model
WHERE speed>=750
;
