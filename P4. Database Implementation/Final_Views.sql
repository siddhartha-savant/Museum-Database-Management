use Museum_Management_DB;
GO

CREATE OR ALTER VIEW [Person Spending above Average]
AS
SELECT DISTINCT p.person_first_name, p.person_last_name,o.order_payment_charged
FROM 
person p INNER JOIN [order] o ON
p.person_ssn = o.person_ssn

GROUP BY
p.person_first_name,o.order_payment_charged,p.person_last_name
HAVING o.order_payment_charged >= (SELECT AVG(order_payment_charged) FROM [order]);
GO

SELECT * FROM [Person Spending above Average];
GO
--------------------------
CREATE OR ALTER VIEW [Museums having sales above average]
AS
SELECT DISTINCT m.museum_id,mr.merchandise_name
FROM 
museum m INNER JOIN merchandise mr ON
m.museum_id = mr.museum_id 
INNER JOIN order_line ol ON
ol.merchandise_id = mr.merchandise_id
INNER JOIN [order] o ON
ol.order_id = o.order_id
GROUP BY
m.museum_id,o.order_payment_charged,mr.merchandise_name
HAVING o.order_payment_charged >= (SELECT AVG(order_payment_charged) FROM [order]);
GO
SELECT * FROM [Museums having sales above average];
GO
-------------------------------------

CREATE OR ALTER VIEW[Donors Who Have Donated]
AS
    SELECT person.person_first_name, person.person_last_name, 
    donation.donation_name
FROM 
person, donation 
WHERE person.person_ssn = donation.donor_ssn;
GO

SELECT * FROM [Donors Who Have Donated];
GO
--------------------------------------
CREATE OR ALTER VIEW [Exhibitions in the year 2021]
AS
SELECT * FROM exhibition e
WHERE
e.exhibition_start_date >= '2021-01-01' AND
e.exhibition_end_date <= '2021-12-31';
GO

SELECT * FROM [Exhibitions in the year 2021];
GO

-------------------------------------------------
CREATE OR ALTER VIEW [Number of visitors visiting Particular Museum] AS
SELECT DISTINCT m.museum_name,sum(r.reserve_number_of_visitors) as "Total No Of Visitors",
year(r.reserve_date) as "YearOfVisit"
FROM 
reservation r join museum m on (r.museum_id = m.museum_id)
GROUP BY m.museum_name,year(r.reserve_date);
GO

SELECT * FROM [Number of visitors visiting Particular Museum];
GO

----------------------------------
CREATE OR ALTER VIEW ItemSoldCount AS(
SELECT m.merchandise_name AS "Merchandise Name",
count(o.order_id) AS "Items Sold"
FROM merchandise m JOIN order_line o
ON (m.merchandise_id = o.merchandise_id)
GROUP BY
m.merchandise_name);
GO

SELECT * FROM [ItemSoldCount];
GO

-----------------------------------