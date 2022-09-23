--person
INSERT INTO [dbo].[person]
(
 [person_ssn], [person_last_name], [person_first_name], [person_street], [person_city],
 [person_state], [person_phone], [person_email], [person_is_donor],[person_is_visitor],
 [person_is_staff]
)
VALUES
(
 212220123, 'White', 'John','Peter St.','Boston','MA',1234567898,'JoW@gmail.com','Y','Y','Y'
),
( 
 545573123, 'Smith', 'Sophia','Potter St.','Los Angeles','CA',1234567899,'SoS@gmail.com','Y','Y','Y'
),
(
 545573234, 'Johnson', 'Isabella','Berry St.','San Diego','CA',3344567898,'IsJ@gmail.com','Y','Y','Y'
),
(
 252260123, 'Williams', 'Olivia','Apple St.','Atlanta','GA',3343423898,'OlW@gmail.com','Y','Y','Y'
),
(
 500134123, 'Brown', 'Peter','Banana St.','New York','NY',1287645786,'PeB@gmail.com','Y','Y','Y'
),
(
 135158123, 'Black', 'Jackson','Tiger St.','Newark','NJ',3344568898,'JaB@gmail.com','Y','Y','Y'
),
(
 545573567, 'Su', 'Jieming','Orange St.','San Diego','CA',9087645326,'JiS@gmail.com','Y','Y','Y'
),
(
 212220908, 'Jones', 'Emily','Cabbage St.','Boston','MA',4563782645,'EmJ@gmail.com','Y','Y','Y'
),
(
 449467123, 'Garcia', 'Abigail','Cat St.','Houston','TX',6547826409,'AbG@gmail.com','Y','Y','Y'
),
(
 159211123, 'Wang', 'Shuai','Newday St.','Philadelphia','PA',1236754367,'ShW@gmail.com','Y','Y','Y'
),
(
 159211124, 'Wang', 'Mei','Newday St.','Philadelphia','PA',1236754368,'MeW@gmail.com','N','N','N'
);


--donor
INSERT INTO [dbo].[donor]
(
 [donor_ssn]
)
VALUES
(
 212220123
),
( 
 545573123
),
(
 545573234
),
(
 252260123
),
(
 500134123
),
(
 135158123
),
(
 545573567
),
(
 212220908
),
(
 449467123
),
(
 159211123
);

--visitor
INSERT INTO [dbo].[visitor]
(
 [visitor_ssn]
)
VALUES
(
 212220123
),
( 
 545573123
),
(
 545573234
),
(
 252260123
),
(
 500134123
),
(
 135158123
),
(
 545573567
),
(
 212220908
),
(
 449467123
),
(
 159211123
);

--staff
INSERT INTO [dbo].[staff]
(
 [staff_ssn]
)
VALUES
(
 212220123
),
( 
 545573123
),
(
 545573234
),
(
 252260123
),
(
 500134123
),
(
 135158123
),
(
 545573567
),
(
 212220908
),
(
 449467123
),
(
 159211123
);

--museum
INSERT INTO [dbo].[museum]
(
 [museum_id], [museum_name], [museum_street],
 [museum_city], [museum_state], [museum_ticket_unit_price]
)
VALUES
(
 2121, 'Apple Art Museum', 'Peter St.', 'Boston', 'MA', 10
),
(
 5451, 'Banana Art Museum', 'Potter St.', 'Los Angeles', 'CA', 15
),
(
 5452, 'Orange Art Museum', 'Berry St.', 'San Diego', 'CA', 14.5
),
(
 2521, 'Blue Art Museum', 'Apple St.', 'Atlanta', 'GA', 9.8
),
(
 5001, 'Sophia Art Museum', 'Orange St.', 'New York', 'NY', 21
),
(
 1351, 'Candy Art Museum', 'Jason St.', 'Newark', 'NJ', 13.3
),
(
 5453, 'Pear Art Museum', 'Harry St.', 'San Diego', 'CA',8.7
),
(
 2122, 'Berry Art Museum', 'Animal St.', 'Boston', 'MA', 10.5
),
(
 4491, 'Melon Art Museum', 'Happiness St.', 'Houston', 'TX', 10
),
(
 1591, 'Mango Art Museum', 'Peace St.', 'Philadelphia', 'PA', 8
);

--exhibition
INSERT INTO [dbo].[exhibition]
(
 [exhibition_id], [exhibition_director], [exhibition_number_of_exhibits],
 [exhibition_start_date], [exhibition_end_date], [museum_id]
)
VALUES
(
 21211,'Peter White', 2, '2021-03-23','2021-04-30',2121
),
(
 54511, 'David Peterson',10,'2021-02-01','2021-04-30',5451
),
(
 54521,'Geroge Jackson', 2, '2022-03-23','2022-04-30', 5452
),
(
 25211,'Peter White', 3, '2021-05-20','2021-06-30', 2521
),
(
 50011,'David Peterson', 5, '2022-02-23','2022-03-30', 5001
),
(
 13511,'Tom Ford', 2, '2022-01-01','2022-03-24', 1351
),
(
 54531,'Willson Black', 21, '2021-11-06','2021-12-30', 5453
),
(
 21221,'Yuan Juan', 4, '2022-02-23','2022-05-30', 2122
),
(
 44911,'Ammy Jian', 9, '2019-02-13','2022-12-30', 4491
),
(
 44912,'Potter Harry', 5, '2022-02-18','2022-02-27', 4491
);

--donation
INSERT INTO [dbo].[donation]
(
 [donation_permission_no], [donation_name], [donation_date],
 [museum_id], [donor_ssn]
)
VALUES
(
 10001,'Apple Painting', '2000-04-30', 2121, 212220123
),
(
 10002,'Banana Painting', '2000-04-30', 2122, 212220123
),
(
 10003,'Apple Sculpture', '2000-05-30', 5451, 545573123
),
(
 10004,'Banana Sculpture', '2001-04-30', 5452, 545573234
),
(
 10005,'Orange Sculpture', '1998-12-30', 2521, 252260123
),
(
 10006,'Orange Painting', '2000-06-30', 5001, 500134123
),
(
 10007,'David Self-portrait', '2000-04-30', 1351, 135158123
),
(
 10008,'Strawberry Painting', '2000-2-21', 5453, 545573567
),
(
 10009,'Strawberry Sculpture', '2002-08-30', 2122, 212220908
),
(
 10010,'Moon Ceram', '2000-04-20', 4491, 449467123
),
(
 10011,'Sun Ceram', '2000-04-30', 2122, 159211123
);

--reservation
INSERT INTO [dbo].[reservation]
(
 [reserve_id], [reserve_number_of_visitors], [reserve_date],
 [reserve_time], [reserve_payment_charged],
 [museum_id], [visitor_ssn]
)
VALUES
(
 202201, 50, '2022-01-03', '12:00:01', 500, 2121, 212220123
),
(
 202202, 25, '2022-02-03', '11:30:00', 375,  5451, 545573123
),
(
 202203, 100, '2021-05-30', '11:30:00', 1450, 5452, 545573123
),
(
 202204, 45, '2021-04-30', '11:30:00', 652.5, 5452, 545573234
),
(
 202205, 55, '2022-05-23', '11:30:00', 539, 2521, 252260123
),
(
 202206, 60, '2022-05-30', '10:30:00', 1260, 5001, 500134123
),
(
 202207, 25, '2021-12-30', '11:30:00', 332.5, 1351, 135158123
),
(
 202208, 30, '2021-05-30', '11:40:00', 261, 5453, 545573567
),
(
 202209, 90, '2022-04-27', '11:30:03', 945, 2122, 212220908
),
(
 202210, 85, '2022-03-24', '09:30:00', 850, 4491, 449467123
),
(
 202211, 65, '2022-05-30', '11:30:00', 682.5, 2122, 159211123
);

--exployment contract
INSERT INTO [dbo].[employment_contract]
(
 [employment_id], [employment_position], [employment_date_hired], 
 [employment_date_dismission], [employment_salary],
 [museum_id], [staff_ssn]
)
VALUES
(
 2121001, 'staff', '2022-01-03', '2023-01-03', 100000, 2121, 212220123
),
(
 5451001, 'staff', '2022-02-03', '2023-02-03', 120000,  5451, 545573123
),
(
 5451002, 'staff', '2021-05-30', '2022-04-30', 100000, 5451, 545573234
),
(
 5452001, 'manager', '2022-05-01', '2025-05-01', 200000, 5452, 545573234
),
(
 202205, 'staff', '2002-02-03', '2022-02-03', 100500, 2521, 252260123
),
(
 202206, 'manager', '2022-01-01', '2027-01-01', 220000, 5001, 500134123
),
(
 202207, 'staff', '2008-03-30', '2010-12-30', 90000, 1351, 135158123
),
(
 202208, 'staff', '2021-03-02', '2023-03-02', 100000, 5453, 545573567
),
(
 202209, 'staff', '2022-02-01', '2024-02-01', 130000, 2122, 212220908
),
(
 202210, 'staff', '2020-01-01', '2022-04-30', 110000, 4491, 449467123
),
(
 1591001, 'manager', '2010-03-01', '2015-03-01', 190000, 1591, 159211123
);

--merchandise
INSERT INTO [dbo].[merchandise]
(
 [merchandise_id], [merchandise_name], [merchandise_unit_price], 
 [merchandise_quantity_available], [museum_id]
)
VALUES
(
 2121001, 'Apple sticker', 5, 1000, 2121
),
(
 2121002, 'Apple postcard', 10, 2000, 2121
),
(
 5451001, 'Banana sticker', 2.5, 1000, 5451
),
(
 5452001, 'Orange sticker', 5, 1500, 5452
),
(
 2521001, 'Mango toy', 5, 1000, 2121
),
(
 5001001, 'Berry sticker', 5, 1000, 5001
),
(
 1351001, 'Pear sticker', 3, 500, 1351
),
(
 5453001, 'Landscape postcard', 15, 3000, 5453
),
(
 2122001, 'Mini painting', 20, 100, 2122
),
(
 4491001, 'Cat sticker', 5, 1000, 4491
),
(
 1591001, 'Bridge postcard', 2, 1000, 1591
);

--[order]
INSERT INTO [dbo].[order]
(
 [order_id], [order_date], [order_time], 
 [order_payment_charged], [person_ssn]
)
VALUES
(
 11101, '2021-01-30', '12:00:00', 20, 159211124
),
(
 11102, '2021-01-30', '14:00:00', 5, 159211124
),
(
 11103, '2021-03-03', '12:00:00', 5, 159211124
),
(
 11104, '2021-03-30', '10:00:00', 10, 159211124
),
(
 11105, '2022-04-01', '12:00:00', 9, 159211124
),
(
 11106, '2021-04-20', '12:00:00', 10, 212220123
),
(
 11107, '2022-03-30', '12:00:00', 5, 212220123
),
(
 11108, '2021-03-30', '12:00:00', 15, 545573123
),
(
 11109, '2021-12-30', '12:00:00', 5, 545573123
),
(
 11110, '2022-03-30', '12:00:00', 15, 545573234
);

--order line
INSERT INTO [dbo].[order_line]
(
 [ol_id], [ol_quantity], [ol_payment_charged], [order_id], [merchandise_id]
)
VALUES
(
 1110101, 2, 10, 11101, 2121001
),
(
 1110102, 4, 10, 11101, 5451001
),
(
 1110201, 1, 5, 11102, 5452001
),
(
 1110301, 1, 5, 11103, 2521001
),
(
 1110401, 2, 10, 11104, 5001001
),
(
 1110501, 3, 9, 11105, 1351001
),
(
 1110601, 2, 10, 11106, 2121001
),
(
 1110701, 2, 5, 11107, 5451001
),
(
 1110801, 3, 15, 11108, 5001001
),
(
 1110901, 1, 5, 11109, 4491001
),
(
 1111001, 3, 15, 11110, 2121001
);

--supplier
INSERT INTO [dbo].[supplier]
(
 [supplier_id], [supplier_name], [supplier_street], 
 [supplier_city], [supplier_state]
)
VALUES
(
 101, 'WH Co.', 'Peter St.','Boston','MA'
),
( 
 102, 'SM Co.', 'Potter St.','Los Angeles','CA'
),
(
 103, 'JO Co.', 'Berry St.','San Diego','CA'
),
(
 104, 'WI Co.', 'Apple St.','Atlanta','GA'
),
(
 105, 'BR', 'Banana St.','New York','NY'
),
(
 106, 'BL Co.', 'Tiger St.','Newark','NJ'
),
(
 107, 'SU Co.', 'Orange St.','San Diego','CA'
),
(
 108, 'JH Co.', 'Cabbage St.','Boston','MA'
),
(
 109, 'GA Co.', 'Cat St.','Houston','TX'
),
(
 110, 'WANG Co.', 'Newday St.','Philadelphia','PA'
);

--shipment
INSERT INTO [dbo].[shipment]
(
 [shipment_id], [supplier_id], [shipment_date], 
 [shipment_weight_kg], [shipment_cost]
)
VALUES
(
 22201, 101, '2021-02-01', 200, 1000
),
(
 22202, 101, '2021-03-01', 100, 500
),
(
 22203, 101, '2021-04-01', 100, 500
),
(
 22204, 101, '2021-05-01', 100, 500
),
(
 22205, 102, '2021-02-01', 100, 1000
),
(
 22206, 102, '2021-03-01', 100, 1000
),
(
 22207, 102, '2021-04-01', 100, 1000
),
(
 22208, 103, '2021-02-01', 100, 700
),
(
 22209, 103, '2021-03-01', 100, 700
),
(
 22210, 103, '2021-04-01', 100, 700
);

--shipment line
INSERT INTO [dbo].[shipment_line]
(
 [sl_id], [sl_weight_kg], [sl_unit_price], 
 [merchandise_id], [shipment_id]
)
VALUES
(
 2220101, 100, 5,  2121001, 22201
),
(
 2220102, 100, 5,  2121002, 22201
),
(
 2220201, 100, 5, 5451001, 22202
),
(
 2220301, 100, 5, 2521001, 22203
),
(
 2220401, 100, 5, 5452001, 22204
),
(
 2220501, 100, 10, 5451001, 22205
),
(
 2220601, 100, 10, 5001001, 22206
),
(
 2220701, 100, 10, 1351001, 22207
),
(
 2220801, 100, 7, 5453001, 22208
),
(
 2220901, 100, 7, 2122001, 22209
),
(
 2221001, 100, 7, 4491001, 22210
);


