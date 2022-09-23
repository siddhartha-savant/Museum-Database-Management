CREATE OR ALTER PROCEDURE updateEmploymentContract @lastname NVARCHAR(30), @firstname NVARCHAR(30), @position VARCHAR(15), @ErrorMsg VARCHAR(1000) OUTPUT
AS
    BEGIN
        BEGIN TRANSACTION 
            UPDATE employment_contract
                SET employment_position = @position
            WHERE staff_ssn IN (SELECT person_ssn 
                                FROM person 
                                WHERE person_last_name = @lastname AND person_first_name = @firstname)

        IF @@ERROR <> 0 
            BEGIN
                SET @ErrorMsg = 'Aborted updation. There is an error'
                ROLLBACK
            END 
        ELSE
            COMMIT;
    END;

DECLARE @lstname NVARCHAR(30), @frstname NVARCHAR(30), @pstion VARCHAR(15), @TxtMsg VARCHAR(1000)
SET @lstname = 'Williams'
SET @frstname = 'Olivia'
SET @pstion = 'staff'
EXEC updateEmploymentContract @lstname, @frstname, @pstion, @TxtMsg OUTPUT
PRINT @TxtMsg