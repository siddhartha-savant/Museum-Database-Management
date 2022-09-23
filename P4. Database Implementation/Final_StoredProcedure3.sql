-- Stored procedure for most donations to a particular museum by a donor.

CREATE OR ALTER PROCEDURE DonationsToMuseum @museumname NVARCHAR(30) , @ErrorMsg VARCHAR(1000) OUTPUT
AS
    BEGIN
        IF NOT EXISTS(
            SELECT * FROM museum
            WHERE museum_name = @museumname
            )SET @ErrorMsg = 'No museum present as per records'

        ELSE
            SELECT p.person_last_name, p.person_first_name, d.donation_name
            FROM museum m JOIN donation d ON m.museum_id = d.museum_id JOIN person p ON d.donor_ssn = p.person_ssn
            WHERE m.museum_name = @museumname

            SELECT m.museum_id, m.museum_name, m.museum_street, m.museum_city, m.museum_state, COUNT(d.museum_id) AS 'Total Donations'
            FROM museum m JOIN donation d ON m.museum_id = d.museum_id
            WHERE m.museum_name = @museumname
            GROUP BY m.museum_id, m.museum_name, m.museum_street, m.museum_city, m.museum_state
    END;
 
DECLARE @mname NVARCHAR(30), @TxtMsg VARCHAR(1000)
SET @mname = 'Berry Art Museum'
EXEC DonationsToMuseum @mname, @TxtMsg OUTPUT
PRINT @TxtMsg