-- righe 14-48: Creazione Tabelle
-- righe 50-216: Popolamento Tabelle
-- righe 220-240: Esercizio 1
-- righe 244-257: Esercizio 2
-- righe 260-271: Esercizio 3
-- righe 273-286: Esercizio 4
-- righe 289-309: Esercizio 5
-- righe 311-323: Esercizio 6

CREATE DATABASE ToysGroup;

USE ToysGroup;

CREATE TABLE productcategory (
      CategoryID INT AUTO_INCREMENT PRIMARY KEY
      , CategoryName VARCHAR(50) NOT NULL
      );

CREATE TABLE product (
      ProductID INT AUTO_INCREMENT PRIMARY KEY
      , ProductName VARCHAR(100) NOT NULL
      , BrandName VARCHAR(50)
      , CategoryID INT
      , AgeTarget VARCHAR(10)
      , CONSTRAINT FOREIGN KEY (CategoryID) REFERENCES productcategory(CategoryID)
      );
      
CREATE TABLE region (
      RegionID INT PRIMARY KEY
      , Area VARCHAR(50)
      , Country VARCHAR(50)
      );
      
CREATE TABLE sales (
-- Condizione NOT NULL a tutte le colonne perchè ogni transazione é documentata con tutti i campi
      SaleID INT NOT NULL
      , SaleLineID INT NOT NULL
      , SaleDate DATE NOT NULL
      , RegionID INT NOT NULL
      , ProductID INT NOT NULL
      , SaleQuantity TINYINT NOT NULL
      , UnitPrice DECIMAL(10,2) NOT NULL
      , UnitCost DECIMAL(10,2) NOT NULL
      , SaleAmount DECIMAL(10,2) NOT NULL
      , PRIMARY KEY ( SaleID, SaleLineID)
      , CONSTRAINT FOREIGN KEY (ProductID) REFERENCES product(ProductID)
      , CONSTRAINT FOREIGN KEY (RegionID) REFERENCES region(RegionID)
      );
      
INSERT INTO productcategory(CategoryName) VALUES 
      ('Action Figures')
      , ('Board Games')
      , ('Card Games')
      , ('Dolls')
      , ('Sport Toys')
      , ('Plush toys')
      ;
 
INSERT INTO product (ProductName, BrandName, CategoryID, AgeTarget) VALUES
    ('Lego Star Wars Millennium Falcon', 'Lego', 2, '10+'),
    ('Barbie Dreamhouse', 'Mattel', 4, '3-8'),
    ('Hot Wheels Track Set', 'Mattel', 5, '6-12'),
    ('Monopoly Classic', 'Hasbro', 2, '8+'),
    ('Uno Card Game', 'Mattel', 3, '7+'),
    ('Nerf Elite 2.0 Shockwave', 'Hasbro', 5, '8-14'),
    ('FurReal Friends Cubby Bear', 'Hasbro', 6, '4-8'),
    ('Play-Doh Starter Set', 'Hasbro', 2, '3-7'),
    ('Rubik\'s Cube', 'Rubik\'s', 2, '8+'),
    ('Catan Board Game', 'Catan Studios', 2, '10+'),
    ('Magic: The Gathering Booster Pack', 'Wizards of the Coast', 3, '13+'),
    ('Funko Pop Spider-Man', 'Funko', 1, '8+'),
    ('Baby Shark Singing Plush', 'WowWee', 6, '2-5'),
    ('Fisher-Price Laugh & Learn Chair', 'Fisher-Price', 6, '1-3'),
    ('Transformers Optimus Prime', 'Hasbro', 1, '6-12'),
    ('Jenga Classic', 'Hasbro', 2, '6+'),
    ('LeapFrog Learning Tablet', 'LeapFrog', 2, '4-7'),
    ('Paw Patrol Ultimate Rescue Fire Truck', 'Spin Master', 5, '3-8'),
    ('Ravensburger 3D Puzzle Globe', 'Ravensburger', 2, '10+'),
    ('Beyblade Burst Turbo Set', 'Hasbro', 5, '8-12'),
    ('Disney Frozen Elsa Doll', 'Mattel', 4, '3-8'),
    ('Scooby-Doo Mystery Machine Playset', 'Playmobil', 2, '6-12'),
    ('Pokemon TCG Elite Trainer Box', 'The Pokemon Company', 3, '8+'),
    ('Crayola Ultimate Art Case', 'Crayola', 2, '5-10'),
    ('Thomas & Friends TrackMaster Train', 'Fisher-Price', 1, '3-7')
    ;
    
INSERT INTO region (RegionID, Area, Country) VALUES
-- Primary Key 'parlante': il primo numero identifica il continente (1=Asia, 2=Europe ecc) ed il secondo (01, 02 ecc) il paese
    (101, 'Asia', 'China'),
    (102, 'Asia', 'Japan'),
    (103, 'Asia', 'Thailand'),
    (104, 'Asia', 'India'),
    (105, 'Asia', 'South Korea'),
    (106, 'Asia', 'Vietnam'),
    (201, 'Europe', 'Italy'),
    (202, 'Europe', 'Germany'),
    (203, 'Europe', 'France'),
    (204, 'Europe', 'Spain'),
    (205, 'Europe', 'UK'),
	(206, 'Europe', 'Poland'),
    (207, 'Europe', 'Netherlands'),
    (301, 'North America', 'Canada'),
    (302, 'North America', 'USA'),
    (303, 'North America', 'Mexico'),
    (304, 'North America', 'Cuba'),
    (305, 'North America', 'Jamaica')
    ;
    
INSERT INTO sales (SaleID, SaleLineID, SaleDate, RegionID, ProductID, SaleQuantity, UnitPrice, UnitCost, SaleAmount) VALUES
-- SaleID si riferisce alla vendita, SaleLineID consente di distinguerne le singole righe
-- SaleID 1
(1, 1, '2023-01-10', 105, 13, 5, 15.00, 10.00, 75.00),
(1, 2, '2023-01-10', 105, 5, 5, 25.00, 18.00, 125.00), 
-- SaleID 2
(2, 1, '2023-01-15', 201, 19, 3, 20.00, 12.00, 60.00),
(2, 2, '2023-01-15', 201, 3, 3, 25.00, 18.00, 75.00), 
-- SaleID 3
(3, 1, '2023-02-05', 103, 5, 4, 25.00, 18.00, 100.00),
-- SaleID 4
(4, 1, '2023-02-07', 301, 2, 6, 10.00, 7.00, 60.00),
-- SaleID 5
(5, 1, '2023-03-12', 102, 8, 1, 30.00, 20.00, 30.00),
-- SaleID 6
(6, 1, '2023-03-20', 203, 3, 10, 40.00, 25.00, 400.00),
(6, 2, '2023-03-20', 203, 15, 10, 40.00, 25.00, 400.00), 
-- SaleID 7
(7, 1, '2023-04-01', 301, 14, 5, 22.00, 14.00, 110.00),
(7, 2, '2023-04-01', 301, 9, 5, 12.00, 9.00, 60.00),
-- SaleID 8
(8, 1, '2023-04-04', 204, 15, 3, 18.00, 12.00, 54.00),
-- SaleID 9
(9, 1, '2023-05-15', 105, 9, 8, 12.00, 9.00, 96.00),
(9, 2, '2023-05-15', 105, 3, 8, 12.00, 9.00, 96.00), 
(9, 3, '2023-05-15', 205, 25, 1, 18.00, 11.00, 18.00),
-- SaleID 10
(10, 1, '2023-05-22', 203, 7, 6, 28.00, 18.00, 168.00),
-- SaleID 11
(11, 1, '2023-06-01', 202, 4, 7, 35.00, 22.00, 245.00),
(11, 2, '2023-06-01', 104, 8, 3, 24.00, 15.00, 72.00),
-- SaleID 12
(12, 1, '2023-06-10', 301, 18, 4, 19.00, 13.00, 76.00),
-- SaleID 13
(13, 1, '2023-06-15', 102, 12, 3, 27.00, 18.00, 81.00),
-- SaleID 14
(14, 1, '2023-07-05', 104, 18, 2, 19.00, 13.00, 38.00),
(14, 2, '2023-07-05', 104, 19, 2, 21.00, 15.00, 42.00),
-- SaleID 15
(15, 1, '2023-07-08', 201, 16, 4, 24.00, 16.00, 96.00),
(15, 2, '2023-07-08', 201, 6, 4, 24.00, 16.00, 96.00), 
-- SaleID 16
(16, 1, '2023-08-02', 205, 25, 1, 18.00, 11.00, 18.00),
-- SaleID 17
(17, 1, '2023-08-05', 301, 6, 5, 33.00, 22.00, 165.00),
-- SaleID 18
(18, 1, '2023-08-14', 202, 17, 2, 15.00, 10.00, 30.00),
-- SaleID 19
(19, 1, '2023-09-10', 103, 22, 3, 14.00, 9.00, 42.00),
(19, 2, '2023-09-10', 103, 3, 3, 14.00, 9.00, 42.00), 
-- SaleID 20
(20, 1, '2023-09-12', 203, 20, 8, 45.00, 30.00, 360.00),
-- SaleID 21
(21, 1, '2023-09-15', 205, 23, 5, 19.00, 13.00, 95.00),
(21, 2, '2023-09-15', 205, 8, 5, 25.00, 17.00, 125.00), 
(21, 3, '2023-09-15', 104, 19, 2, 21.00, 15.00, 42.00),
-- SaleID 22
(22, 1, '2023-09-20', 102, 23, 4, 19.00, 13.00, 76.00),
-- SaleID 23
(23, 1, '2023-10-01', 203, 24, 2, 15.00, 10.00, 30.00),
-- SaleID 24
(24, 1, '2023-10-10', 104, 8, 3, 24.00, 15.00, 72.00),
-- SaleID 25
(25, 1, '2023-10-15', 205, 1, 4, 26.00, 17.00, 104.00),
-- SaleID 26
(26, 1, '2023-10-20', 301, 3, 7, 15.00, 10.00, 105.00),
-- SaleID 27
(27, 1, '2023-11-01', 102, 5, 3, 20.00, 12.00, 60.00),
(27, 2, '2023-11-01', 301, 3, 7, 15.00, 10.00, 105.00),
-- SaleID 28
(28, 1, '2023-11-05', 202, 19, 5, 25.00, 18.00, 125.00),
-- SaleID 29
(29, 1, '2023-11-10', 104, 9, 6, 20.00, 12.00, 120.00),
-- SaleID 30
(30, 1, '2023-11-12', 301, 13, 2, 30.00, 20.00, 60.00),
-- SaleID 31
(31, 1, '2023-11-18', 203, 25, 3, 22.00, 14.00, 66.00),
-- SaleID 32
(32, 1, '2023-12-05', 301, 7, 4, 28.00, 20.00, 112.00),
-- SaleID 33
(33, 1, '2023-12-10', 102, 18, 7, 30.00, 22.00, 210.00),
-- SaleID 34
(34, 1, '2023-12-12', 105, 9, 5, 18.00, 12.00, 90.00),
(34, 2, '2023-12-12', 105, 18, 5, 18.00, 12.00, 90.00),
-- SaleID 35
(35, 1, '2024-01-15', 205, 3, 6, 19.99, 10.00, 119.94), 
(35, 2, '2024-01-15', 205, 5, 8, 15.49, 8.00, 123.92), 
-- SaleID 36 
(36, 1, '2024-02-20', 104, 7, 4, 25.99, 12.50, 99.96),  
-- SaleID 37    
(37, 1, '2024-03-05', 102, 9, 12, 29.99, 14.50, 359.88), 
-- SaleID 38
(38, 1, '2024-04-10', 201, 2, 3, 39.99, 18.00, 119.97),
(38, 2, '2024-04-10', 201, 24, 5, 45.00, 30.00, 225.00),
(38, 3, '2024-04-10', 201, 6, 4, 40.00, 27.00, 160.00),
(38, 4, '2024-04-10', 201, 5, 5, 30.00, 20.00, 150.00),
-- SaleID 39       
(39, 1, '2024-05-15', 303, 4, 15, 9.99, 5.00, 149.85),   
-- SaleID 40
(40, 1, '2024-06-25', 105, 1, 7, 5.99, 3.50, 41.93),     
-- SaleID 41
(41, 1, '2024-07-10', 302, 10, 2, 49.99, 30.00, 99.98),   
-- SaleID 42    
(42, 1, '2024-08-22', 204, 6, 9, 14.99, 7.50, 134.91), 
(42, 2, '2024-08-22', 204, 24, 7, 20.00, 12.00, 140.00),
-- SaleID 43   
(43, 1, '2024-09-15', 301, 8, 11, 25.00, 15.00, 275.00)
;



-- 1. Verificare che i campi definiti come PK siano univoci. 
-- Le soluzioni proposte non restituiscono risultati se si avvera la tesi che stiamo analizzando PK. 

SELECT ProductID 
FROM product
GROUP BY ProductID
HAVING COUNT(*) > 1;

SELECT CategoryID 
FROM productcategory
GROUP BY CategoryID
HAVING COUNT(*) > 1;

SELECT RegionID
FROM region
GROUP BY RegionID
HAVING COUNT(*) > 1;

SELECT CONCAT(SaleID, SaleLineID) AS SalePK
FROM sales
GROUP BY SalePK
HAVING COUNT(*) > 1;


-- 2. Esporre l’elenco dei soli prodotti venduti e per ognuno di questi il fatturato totale per anno.

CREATE VIEW Esercizio2 AS
SELECT s.ProductID
       , p.ProductName 
       , SUM(CASE WHEN YEAR(SaleDate) = 2023 THEN SaleAmount END) AS Sales2023
       , SUM(CASE WHEN YEAR(SaleDate) = 2024 THEN SaleAmount END) AS Sales2024
FROM sales AS s
JOIN product AS p
    ON p.ProductID=s.ProductID
GROUP BY s.ProductID
ORDER BY s.ProductID
;
-- Non ho aggiunto clausole specifiche per i soli prodotti venduti perchè quelli invenduti non vengono indicati in automatico


-- 3. Esporre il fatturato totale per stato per anno. Ordina il risultato per data e per fatturato decrescente. 

CREATE VIEW Esercizio3 AS
SELECT r.Country
	, YEAR(s.SaleDate) AS Year
    , SUM(SaleAmount) AS TotalSales
FROM sales AS s
JOIN region AS r
    ON r.RegionID=s.RegionID
GROUP BY YEAR(s.SaleDate), r.Country
ORDER BY Year, TotalSales DESC
;

-- 4. Rispondere alla seguente domanda: qual è la categoria di articoli maggiormente richiesta dal mercato? 

CREATE VIEW Esercizio4 AS
SELECT c.CategoryName
       , SUM(s.SaleQuantity) AS TotalQuantity
FROM sales AS s
JOIN product AS p
    ON p.ProductID=s.ProductID
JOIN productcategory AS c
    ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryID
ORDER BY TotalQuantity DESC
LIMIT 1
;


-- 5. Rispondere alla seguente domanda: quali sono, se ci sono, i prodotti invenduti? Proponi due approcci risolutivi differenti.

CREATE VIEW Esercizio5A AS
SELECT p.ProductID
       , p.ProductName
FROM product AS p
LEFT JOIN sales AS s
    ON p.ProductID=s.ProductID
WHERE p.ProductID NOT IN 
                       (SELECT DISTINCT s.ProductID
                       FROM sales AS s)
;

CREATE VIEW Esercizio5B AS
SELECT p.ProductID
       , p.ProductName
FROM product AS p
LEFT JOIN sales AS s
    ON p.ProductID=s.ProductID
WHERE s.ProductID IS NULL
;

-- 6. Esporre l’elenco dei prodotti con la rispettiva ultima data di vendita (la data di vendita più recente)

CREATE VIEW Esercizio6 AS
SELECT p.ProductID
	   , p.ProductName
       , MAX(s.SaleDate) AS LatestSale
FROM product AS p
LEFT JOIN sales AS s
    ON p.ProductID=s.ProductID
GROUP BY p.ProductID
ORDER BY LatestSale DESC
;
-- Ho fatto una LEFT JOIN per includere anche i prodotti invenduti