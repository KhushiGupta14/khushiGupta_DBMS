Create schema gl;
Use gl;
-- 1
CREATE TABLE supplier(
	SUPP_ID INT PRIMARY KEY,
	SUPP_NAME varchar(50) NOT NULL,
    SUPP_CITY varchar(50) NOT NULL,
    SUPP_PHONE varchar(50) NOT NULL
);

CREATE TABLE customer(
	CUS_ID INT PRIMARY KEY,
	CUS_NAME varchar(20) NOT NULL,
	CUS_PHONE varchar(30) NOT NULL,
    CUS_CITY varchar(30) NOT NULL,
    CUS_GENDER CHAR NOT NULL
);

CREATE TABLE category(
	CAT_ID INT PRIMARY KEY,
	CAT_NAME varchar(20) NOT NULL
);

CREATE TABLE product(
	PRO_ID INT PRIMARY KEY,
	PRO_NAME varchar(20) NOT NULL default "DUMMY",
    PRO_DESC varchar(60),
    CAT_ID INT,
    foreign key(CAT_ID) REFERENCES category(CAT_ID)
);

CREATE TABLE supplier_pricing(
	PRICING_ID INT PRIMARY KEY,
	PRO_ID INT,
    SUPP_ID INT,
    SUPP_PRICE INT default 0,
    foreign key(PRO_ID) REFERENCES product(PRO_ID),
    foreign key(SUPP_ID) REFERENCES supplier(SUPP_ID)
);

CREATE TABLE `order`(
	ORD_ID INT PRIMARY KEY,
	ORD_AMOUNT INT NOT NULL,
    ORD_DATE DATE NOT NULL,
    CUS_ID INT,
    PRICING_ID INT,
    foreign key(CUS_ID) REFERENCES customer(CUS_ID),
    foreign key(PRICING_ID) REFERENCES supplier_pricing(PRICING_ID)
);

CREATE TABLE rating(
	RAT_ID INT PRIMARY KEY,
    ORD_ID INT,
    RAT_RATSTARS INT NOT NULL,
    foreign key(ORD_ID) REFERENCES `order`(ORD_ID)
);
-- 2
INSERT INTO supplier(SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) 
VALUES(1,"Rajesh Retails","Delhi",1234567890),
(2,"Appario Ltd.","Mumbai", 2589631470),
(3,"Knome products","Banglore", 9785462315),
(4,"Bansal Retails","Kochi", 8975463285),
(5,"Mittal Ltd.","Lucknow", 7898456532);
	
INSERT INTO customer(CUS_ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) 
VALUES(1,"AAKASH",9999999999,"Delhi","M"),
(2,"AMAN",9785463215,"NOIDA", "M"),
(3,"NEHA",9999999999,"Mumbai","F"),
(4,"MEGHA",9994562399,"Kochi", "F"),
(5,"PULKIT",7898456532,"Lucknow","M");

INSERT INTO category(CAT_ID,CAT_NAME) 
VALUES(1,"BOOKS"),
(2,"GAMES"),
(3,"GROCERIES"),
(4,"ELECTRONICS"),
(5,"COLTHES");

INSERT INTO product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) 
VALUES(1,"GTA V","Windows 7 and above with i5 processor and 8GB RAM",2),
(2,"TSHIRT","SIZE-L with Black, Blue and White variations", 5),
(3,"ROG LAPTOP","Windows 10 with 15inch screen, i7 processor, 1TB SSD ",4),
(4,"OATS","Highly Nutritious from Nestle",3),
(5,"HARRY POTTER","Best Collection of all time by J.K Rowling",1),
(6,"MILK","1L Toned MIlk ",3),
(7,"BOAT EARPHONES","1.5Meter long Dolby Atmos",4),
(8,"JEANS","Stretchable Denim Jeans with various sizes and color ",5),
(9,"PROJECT IGI","compatible with windows 7 and above",2),
(10,"HOODIE","Black GUCCI for 13 yrs and above",5),
(11,"RICH DAD POOR DAD","Written by RObert Kiyosaki ",1),
(12,"TRAIN YOUR BRAIN","By Shireen Stephen",1);

INSERT INTO supplier_pricing(PRICING_ID,PRO_ID,SUPP_ID,SUPP_PRICE) 
VALUES(1,1,2,1500),
(2 ,3 ,5 ,30000),
(3,5, 1, 3000),
(4, 2, 3, 2500),
(5 ,4 ,1 ,1000),
(6 ,12, 2, 780),
(7 ,12 ,4 ,789),
(8 ,3, 1 ,31000),
(9 ,1, 5 ,1450),
(10 ,4, 2, 999),
(11, 7, 3, 549),
(12 ,7, 4, 529),
(13 ,6 ,2 ,105),
(14, 6, 1, 99),
(15 ,2 ,5 ,2999),
(16 ,5 ,2 ,2999);

INSERT INTO `order`(ORD_ID,ORD_AMOUNT,ORD_DATE,CUS_ID,PRICING_ID) 
VALUES(101, 1500, "2021-10-06", 2, 1),
(102, 1000, "2021-10-12", 3, 5),
(103, 30000, "2021-09-16", 5, 2),
(104, 1500, "2021-10-05", 1, 1),
(105, 3000, "2021-08-16", 4, 3),
(106, 1450, "2021-08-18", 1, 9),
(107, 789, "2021-09-01", 3, 7),
(108, 780, "2021-09-07", 5, 6),
(109, 3000, "2021-01-10", 5, 3),
(110, 2500, "2021-09-10", 2, 4),
(111, 1000, "2021-09-15", 4, 5),
(112, 789, "2021-09-16", 4, 7),
(113, 31000 ,"2021-09-16", 1, 8),
(114, 1000,"2021-09-16", 3, 5),
(115, 3000, "2021-09-16", 5, 3),
(116, 99, "2021-09-17", 2, 14);

INSERT INTO rating(RAT_ID,ORD_ID,RAT_RATSTARS)
VALUES(1, 101, 4),
(2 ,102, 3),
(3, 103, 1),
(4, 104, 2),
(5, 105, 4),
(6, 106, 3),
(7, 107, 4),
(8, 108, 4),
(9, 109, 3),
(10, 110, 5),
(11, 111, 3),
(12, 112, 4),
(13, 113, 2),
(14, 114, 1),
(15, 115, 1),
(16, 116, 0);
-- 3
SELECT COUNT(`order`.CUS_ID) AS Total_Customers,CUS_GENDER
FROM customer
INNER JOIN `order` ON customer.CUS_ID = `order`.CUS_ID
WHERE ORD_AMOUNT >= 3000
GROUP BY CUS_GENDER;
-- 4
SELECT `order`.ORD_ID, `order`.ORD_AMOUNT, `order`.ORD_DATE, product.PRO_NAME
FROM `order`
INNER JOIN supplier_pricing ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE `order`.CUS_ID = 2 
ORDER BY `order`.ORD_DATE;
-- 5
SELECT * FROM supplier WHERE SUPP_ID 
IN (SELECT SUPP_ID FROM supplier_pricing GROUP BY SUPP_ID
    HAVING COUNT(DISTINCT PRO_ID) > 1);
-- 6
CREATE VIEW lowest_expensive_product AS
SELECT c.CAT_ID, c.CAT_NAME, p.PRO_NAME, sp.SUPP_PRICE
FROM category c
INNER JOIN product p ON c.CAT_ID = p.CAT_ID
INNER JOIN supplier_pricing sp ON p.PRO_ID = sp.PRO_ID
INNER JOIN (
    SELECT CAT_ID, MIN(SUPP_PRICE) AS min_price
    FROM product
    JOIN supplier_pricing ON product.PRO_ID = supplier_pricing.PRO_ID
    GROUP BY CAT_ID
) AS min_prices ON p.CAT_ID = min_prices.CAT_ID AND sp.SUPP_PRICE = min_prices.min_price;

SELECT * FROM lowest_expensive_product;
-- 7
SELECT product.PRO_ID,product.PRO_NAME
FROM `order`
INNER JOIN supplier_pricing ON `order`.PRICING_ID = supplier_pricing.PRICING_ID
INNER JOIN product ON supplier_pricing.PRO_ID = product.PRO_ID
WHERE `order`.ORD_DATE > "2021-10-05";
-- 8
SELECT CUS_NAME, CUS_GENDER
FROM customer
WHERE CUS_NAME LIKE 'A%' OR CUS_NAME LIKE '%A';
-- 9
DELIMITER //
CREATE PROCEDURE Type_of_Service()
BEGIN
    SELECT 
        s.SUPP_ID, 
        s.SUPP_NAME, 
        r.RAT_RATSTARS,
        CASE
            WHEN AVG(r.RAT_RATSTARS) = 5 THEN 'Excellent Service'
            WHEN AVG(r.RAT_RATSTARS) > 4 THEN 'Good Service'
            WHEN AVG(r.RAT_RATSTARS) > 2 THEN 'Average Service'
            ELSE 'Poor Service'
        END AS Type_of_Service
    FROM 
        supplier s
    JOIN 
        supplier_pricing sp ON s.SUPP_ID = sp.SUPP_ID
    JOIN 
        `order` o ON sp.PRICING_ID = o.PRICING_ID
    JOIN 
        rating r ON o.ORD_ID = r.ORD_ID
    GROUP BY 
        s.SUPP_ID, s.SUPP_NAME,r.RAT_RATSTARS;
END //
DELIMITER ;

CALL Type_of_Service();