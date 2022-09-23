--Stored procedure to show the number of staff records date of joining for a given start date and end date

CREATE OR ALTER PROCEDURE StaffRecord @startDate DATE, @endDate DATE, @ErrorMsg VARCHAR(1000) OUTPUT
AS
    BEGIN
        IF NOT EXISTS(
            SELECT * FROM employment_contract
            WHERE (employment_date_hired between @startDate AND @endDate) AND (employment_position = 'staff')
            )SET @ErrorMsg = 'No staff members joined between these dates'

        ELSE
            SELECT p.person_ssn, p.person_last_name, p.person_first_name, p.person_phone, ec.employment_date_hired, 
            ec.museum_id, ec.employment_salary
            FROM person p JOIN employment_contract ec
            ON p.person_ssn = ec.staff_ssn
            WHERE (employment_date_hired between @startDate AND @endDate) AND (employment_position = 'staff')
END;
 
DECLARE @startDt DATE, @endDt DATE, @TxtMsg VARCHAR(1000)
SET @startDt = '2001-09-17'
SET @endDt = '2022-07-17'
EXEC StaffRecord @startDt, @endDt, @TxtMsg OUTPUT
PRINT @TxtMsg