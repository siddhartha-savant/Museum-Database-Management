/** create a new audit table to record changes in donation **/
CREATE TABLE donation_audit(
	donation_audit_id INT identity(1,1) PRIMARY KEY, 
	audit_data NVARCHAR(1000),
);

/** 1st trigger: insertion **/
GO
CREATE OR ALTER TRIGGER tr_tbldonation_ForInsert
ON [dbo].[donation]
FOR INSERT
AS 
BEGIN 
		Declare @Id int
		Select @Id = donation_permission_no from inserted
		insert into donation_audit
		values ('New Donation with Donation No. = ' + Cast(@Id as nvarchar(5)) + ' is added ' + cast(Getdate() as nvarchar(20)))

END
GO

/** 2nd trigger: deletion **/
GO
CREATE OR ALTER TRIGGER tr_tbldonation_ForDelete
ON [dbo].[donation]
FOR DELETE
AS
BEGIN 
		Declare @Id int
		Select @Id = donation_permission_no from deleted

		insert into donation_audit
		values ('An existing Donation with Donation No. = ' + Cast(@Id as nvarchar(5)) + ' is deleted ' + cast(Getdate() as nvarchar(20)))

END
GO

/** 3rd trigger: update **/
GO
CREATE OR ALTER trigger tr_tbldonation_ForUpdate
on [dbo].[donation]
for Update
as
Begin
      
      Declare @Id int
      Declare @Olddonation_name nvarchar(20), @Newdonation_name nvarchar(20)
	  Declare @Olddonation_date nvarchar(20), @Newdonation_date nvarchar(20)
	  Declare @Oldmuseum_id int, @Newmuseum_id int
      Declare @Olddonor_ssn int, @Newdonor_ssn int
      
      Declare @AuditString nvarchar(1000)
     
      Select *
      into #TempTable
      from inserted
     
     
      While(Exists(Select donation_permission_no from #TempTable))
      Begin
            
            Set @AuditString = ''      
            Select Top 1 @Id = donation_permission_no, 
            @Newdonation_name = donation_name, @Newdonation_date = donation_date,
            @Newmuseum_id = museum_id,  @Newdonor_ssn = donor_ssn
            from #TempTable
           
           
            Select @Olddonation_name = donation_name, @Olddonation_date = donation_date,
            @Oldmuseum_id = museum_id, @Olddonor_ssn = donor_ssn
            from deleted where donation_permission_no = @Id
               
            Set @AuditString = 'Donation with Id = ' + Cast(@Id as nvarchar(5)) + ' changed'
            if(@Olddonation_name <> @Newdonation_name)
                  Set @AuditString = @AuditString + ' Donation Name from ' + @Olddonation_name + ' to ' + @Newdonation_name
            
			if(@Olddonation_date <> @Newdonation_date)
				  Set @AuditString = @AuditString + ' Donation Date from ' + Cast(@Olddonation_date as nvarchar(10))+ ' to ' + Cast(@Newdonation_date as nvarchar(10))
            if(@Oldmuseum_id <> @Newmuseum_id)
                  Set @AuditString = @AuditString + ' Museum ID from ' + Cast(@Oldmuseum_id as nvarchar(10))+ ' to ' + Cast(@Newmuseum_id as nvarchar(10))
                  
			if(@Olddonor_ssn <> @Newdonor_ssn)
                  Set @AuditString = @AuditString + ' Donor SSN from ' + Cast(@Olddonor_ssn as nvarchar(10))+ ' to ' + Cast(@Newdonor_ssn as nvarchar(10))
           
            insert into donation_audit values(@AuditString)
           
            Delete from #TempTable where donation_permission_no = @Id
      End
End
GO

--implement
--inset
INSERT INTO [dbo].[person]
(
 [person_ssn], [person_last_name], [person_first_name], [person_street], [person_city],
 [person_state], [person_phone], [person_email], [person_is_donor],[person_is_visitor],
 [person_is_staff]
)
VALUES 
(212221189, 'Justin', 'Jose', 'Newburry St.', 'Boston', 'MA', 2345678901, 'Juj@gmail.com', 'Y','Y','Y'
);

INSERT INTO [dbo].[person]
(
 [person_ssn], [person_last_name], [person_first_name], [person_street], [person_city],
 [person_state], [person_phone], [person_email], [person_is_donor],[person_is_visitor],
 [person_is_staff]
)
VALUES 
(212221199, 'Jobin', 'Jose', 'Newburry St.', 'Boston', 'MA', 2345678902, 'Joj@gmail.com', 'Y','Y','Y'
);
------------------------------------------------------------
INSERT INTO [dbo].[donor]
(
 [donor_ssn]
)
VALUES
(
212221189
);

INSERT INTO [dbo].[donor]
(
 [donor_ssn]
)
VALUES
(
212221199
);
------------------------------------------------------------
INSERT INTO [dbo].[museum]
(
 [museum_id], [museum_name], [museum_street],
 [museum_city], [museum_state], [museum_ticket_unit_price]
)
VALUES
(2221, 'Pineapple Art Museum', 'Beacon st.', 'San Jose', 'CA', 5);


INSERT INTO [dbo].[museum]
(
 [museum_id], [museum_name], [museum_street],
 [museum_city], [museum_state], [museum_ticket_unit_price]
)
VALUES
(2223, 'Custardapple Art Museum', 'Newburry st.', 'San Jose', 'CA', 8);
------------------------------------------------------------
INSERT INTO [dbo].[donation]
(
 [donation_permission_no], [donation_name], [donation_date],
 [museum_id], [donor_ssn]
)
VALUES
(
 10012,'Pineapple Painting', '2000-04-30', 2221, 212221189
);

INSERT INTO [dbo].[donation]
(
 [donation_permission_no], [donation_name], [donation_date],
 [museum_id], [donor_ssn]
)
VALUES
(
 10013,'Custardapple Painting', '2000-04-30', 2223, 212221199
);
------------------------------------------------------------
--delete
Delete from donation where donation_permission_no = 10013
------------------------------------------------------------
--update
Update donation set donation_name = 'Iceapple Painting' where donation_permission_no = 10012
------------------------------------------------------------

--results
SELECT * FROM donation_audit;
