-- Stored Procedure to insert, select, update, delete a person entry.

CREATE OR ALTER PROCEDURE MasterSelInUpDel @ssn INT, @lastname NVARCHAR(30), @firstname NVARCHAR(30), @street VARCHAR(30),
@city VARCHAR(20), @state CHAR(2), @phone VARCHAR(10), @email VARCHAR(50), @isdonor CHAR(1), @isvisitor CHAR(1), @isstaff CHAR(1),
@statement VARCHAR(20), @ErrorMsg VARCHAR(1000) OUTPUT
AS
    BEGIN
        IF @statement = 'Insert'
            BEGIN
                INSERT INTO person(person_ssn, person_last_name, person_first_name, person_street, person_city, person_state, 
                person_phone, person_email, person_is_donor, person_is_visitor, person_is_staff)
                VALUES(@ssn, @lastname, @firstname, @street, @city, @state, @phone, @email, @isdonor, @isvisitor, @isstaff)
            END

        ELSE IF @statement = 'Select'
            BEGIN
                SELECT *
                FROM person
            END
        
        ELSE IF @statement = 'Update'
            BEGIN
                UPDATE person
                SET person_last_name = @lastname, person_first_name = @firstname, person_street = @street, person_city = @city, 
                person_state = @state, person_phone = @phone, person_email = @email
                WHERE person_ssn = @ssn
            END

        ELSE IF @statement = 'Delete'
        BEGIN
            DELETE FROM person
            WHERE person_ssn = @ssn
        END

        ELSE
            BEGIN
                SET @ErrorMsg = 'Statement provided is incorrect. Check Statement again'
            END
    END;

DECLARE @ssnno INT, @lname NVARCHAR(30), @fname NVARCHAR(30), @strtname VARCHAR(30), @cityname VARCHAR(20), @statename CHAR(2), 
@phoneno VARCHAR(10), @emailname VARCHAR(50), @donor CHAR(1), @visitor CHAR(1), @staff CHAR(1),
@statementtype VARCHAR(20), @txtMsg VARCHAR(1000)
SET @ssnno = '999158123'
SET @lname = 'Blackie'
SET @fname = 'Jackny'
SET @strtname = 'Lions St.'
SET @cityname = 'New York'
SET @statename = 'NY'
SET @phoneno = '9944568899'
SET @emailname = 'blacky.jackson@gmail.com'
SET @donor = 'Y'
SET @visitor = 'N'
SET @staff = 'Y'
SET @statementtype = 'Update'
EXEC MasterSelInUpDel @ssnno, @lname, @fname, @strtname, @cityname, @statename, @phoneno, @emailname, @donor, @visitor, 
@staff, @statementtype, @txtMsg OUTPUT
PRINT @txtMsg