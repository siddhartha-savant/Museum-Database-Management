--Stored Procedure giving the total expenditure done on merchandise by a particular person   

CREATE OR ALTER PROCEDURE TotalPaymentByPerson @lastname NVARCHAR(30), @firstname NVARCHAR(30), @ErrorMsg VARCHAR(1000) OUTPUT
AS
    BEGIN
        IF NOT EXISTS(
            SELECT * FROM person
            WHERE (person_last_name = @lastname) AND (person_first_name = @firstname)
            )SET @ErrorMsg = 'Person details are incorrect. Person does not exist'

        ELSE
            SELECT p.person_last_name, p.person_first_name, SUM(o.order_payment_charged) AS 'Total Expenditure'
            FROM person p JOIN [order] o ON p.person_ssn = o.person_ssn
            WHERE (p.person_last_name = @lastname) AND (p.person_first_name = @firstname)
            GROUP BY p.person_last_name, p.person_first_name

            SELECT m.merchandise_name, mu.museum_name
            FROM merchandise m JOIN museum mu ON m.museum_id = mu.museum_id 
            JOIN order_line ol ON ol.merchandise_id = m.merchandise_id
            JOIN [order] o ON ol.order_id = o.order_id
            JOIN person p ON p.person_ssn = o.person_ssn
            WHERE (p.person_last_name = @lastname) AND (p.person_first_name = @firstname)
    END;

DECLARE @lstname NVARCHAR(30), @frstname NVARCHAR(30), @TxtMsg VARCHAR(1000)
SET @lstname = 'Wang'
SET @frstname = 'Mei'
EXEC TotalPaymentByPerson @lstname, @frstname, @TxtMsg OUTPUT
PRINT @TxtMsg