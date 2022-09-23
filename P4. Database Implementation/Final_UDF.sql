/*
1st
input: museum id
return: the status of donations in that museum
*/
GO
CREATE OR ALTER FUNCTION GetMuseumDonationStatus (@museum_id INT)
RETURNS VARCHAR(100)
AS
BEGIN

  IF EXISTS (SELECT @museum_id FROM museum
             WHERE museum_id = @museum_id)
    BEGIN
        DECLARE @message VARCHAR(100)
        SELECT @message = [status] FROM(
        SELECT museum_id, 'No Donation' AS [status]
        FROM museum
        WHERE museum_id not in (select museum_id from donation)
        UNION
        SELECT museum_id, 'One donation' AS [status]
        FROM museum
        WHERE museum_id in (select museum_id from donation group by museum_id having COUNT(*) = 1)
        UNION
        SELECT museum_id, 'More than one donation' AS [status]
        FROM museum
        WHERE museum_id in (select museum_id from donation group by museum_id having COUNT(*) > 1)) utable
        WHERE utable.museum_id = @museum_id
    END
  ELSE
    RETURN NULL
  RETURN @message

END;
GO

--museum with no donation
DECLARE @museum_id INT
SET @museum_id = 1591
SELECT dbo.GetMuseumDonationStatus(@museum_id) AS donation_status;

--museum with one donation
DECLARE @museum_id2 INT
SET @museum_id2 = 1351
SELECT dbo.GetMuseumDonationStatus(@museum_id2) AS donation_status;

--museum with more than one donation
DECLARE @museum_id3 INT
SET @museum_id3 = 2122
SELECT dbo.GetMuseumDonationStatus(@museum_id3) AS donation_status;


/*
2nd
input: merchandise id
output: after several orders, the new quantity available for that merchandise
*/
GO
CREATE OR ALTER FUNCTION GetNumberOfMerchandiseAvailable (@merchandise_id INT)
RETURNS INT
AS
BEGIN

  IF EXISTS (SELECT @merchandise_id FROM merchandise
             WHERE merchandise_id = @merchandise_id)
    BEGIN
        DECLARE @number INT
        SELECT @number = m.merchandise_quantity_available - T.number_sold
        FROM
        (SELECT merchandise_id, 0 AS number_sold
        FROM merchandise
        WHERE merchandise_id NOT IN (select merchandise_id from order_line)
        UNION
        SELECT m.merchandise_id, SUM(ol_quantity) AS number_sold
        FROM merchandise m LEFT JOIN order_line ol ON m.merchandise_id = ol.merchandise_id
        GROUP BY m.merchandise_id
        HAVING SUM(ol_quantity) IS NOT NULL) T JOIN merchandise m ON T.merchandise_id = m.merchandise_id
        WHERE m.merchandise_id = @merchandise_id
    END
  ELSE
    RETURN NULL
  RETURN @number

END;
GO


DECLARE @merchandise_id INT
SET @merchandise_id = 1351001
SELECT merchandise_quantity_available AS previous_quantity_available,
       dbo.GetNumberOfMerchandiseAvailable(@merchandise_id) AS new_quantity_available
FROM merchandise
WHERE merchandise_id = @merchandise_id;








