ALTER TABLE staff ADD [staff_password] varbinary(400);

--create a master key for the database
CREATE MASTER KEY
ENCRYPTION BY PASSWORD = 'Damg6210@2022';

SELECT name KeyName, 
       symmetric_key_id KeyID,
       key_length KeyLength,
       algorithm_desc KeyAlgorithm
FROM sys.symmetric_keys;

CREATE CERTIFICATE staff_pass
       WITH SUBJECT = 'Staff Sample Password';

CREATE SYMMETRIC KEY staff_pass_sm
       WITH ALGORITHM = AES_256
       ENCRYPTION BY CERTIFICATE staff_pass;

OPEN SYMMETRIC KEY staff_pass_sm  
     DECRYPTION BY CERTIFICATE staff_pass; 

UPDATE staff
SET [staff_password] = ENCRYPTBYKEY(KEY_GUID('staff_pass_sm'), 
                       CONVERT(varbinary, staff_ssn))

SELECT *, 
    CONVERT(int, DecryptByKey([staff_password])) AS 'staff_decrypted_password'  
    FROM staff;