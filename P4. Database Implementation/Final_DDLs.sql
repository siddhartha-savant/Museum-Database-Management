--DDl
USE Museum_Management_DB;
--person
CREATE TABLE person(
person_ssn INT NOT NULL 
        CONSTRAINT ssn_chk CHECK 
             ((LEN(CAST(person_ssn as int))=9)),
person_last_name NVARCHAR(30),
person_first_name NVARCHAR(30),
person_street VARCHAR(30),
person_city VARCHAR(20),
person_state CHAR(2),
person_phone VARCHAR(10)
        CONSTRAINT phone_chk CHECK 
             (LEN(person_phone)=10),
person_email VARCHAR(50)
        CONSTRAINT email_chk check 
             (person_email LIKE '%@%'),
person_is_donor CHAR(1)
        CONSTRAINT personType_chk1 CHECK 
             ([person_is_donor] IN ('Y','N')),
person_is_visitor CHAR(1)
        CONSTRAINT personType_chk2 CHECK 
             ([person_is_visitor] IN ('Y','N')),
person_is_staff CHAR(1)
        CONSTRAINT personType_chk3 CHECK 
             ([person_is_staff] IN ('Y','N')),
CONSTRAINT person_PK PRIMARY KEY(person_ssn)
);

--donor
CREATE TABLE donor(
donor_ssn INT NOT NULL,
CONSTRAINT donor_PK PRIMARY KEY(donor_ssn),
CONSTRAINT donor_FK1 FOREIGN KEY (donor_ssn) REFERENCES person(person_ssn)
);

--visitor
CREATE TABLE visitor(
visitor_ssn INT NOT NULL,
CONSTRAINT visitor_PK PRIMARY KEY(visitor_ssn),
CONSTRAINT visitor_FK1 FOREIGN KEY (visitor_ssn) REFERENCES person(person_ssn)

);

--staff
CREATE TABLE staff(
staff_ssn INT NOT NULL,
CONSTRAINT staff_PK PRIMARY KEY(staff_ssn),
CONSTRAINT staff_FK1 FOREIGN KEY (staff_ssn) REFERENCES person(person_ssn)
);

--supplier
CREATE TABLE supplier(
   supplier_id INT NOT NULL,
   supplier_name NVARCHAR(30),
   supplier_street VARCHAR(30),
   supplier_city VARCHAR(20),
   supplier_state CHAR(2)
CONSTRAINT supplier_PK PRIMARY KEY (supplier_id)
);

--shipment
CREATE TABLE shipment(
   shipment_id INT NOT NULL,
   supplier_id INT NOT NULL,
   shipment_date DATE,
   shipment_weight_kg DECIMAL(7,3),
   shipment_cost DECIMAL(19,4),
CONSTRAINT shipment_PK PRIMARY KEY (shipment_id),
CONSTRAINT shipment_FK1 FOREIGN KEY (supplier_id) REFERENCES supplier(supplier_id)
);

--museum
CREATE TABLE museum(
    museum_id INT NOT NULL,
    museum_name NVARCHAR(30),
    museum_street VARCHAR(30),
    museum_city VARCHAR(20),
    museum_state CHAR(2),
    museum_ticket_unit_price DECIMAL(5,2)
CONSTRAINT museum_PK PRIMARY KEY (museum_id)
);

--exhibition
CREATE TABLE exhibition(
   exhibition_id INT NOT NULL,
   museum_id INT NOT NULL,
   exhibition_director NVARCHAR(30),
   exhibition_number_of_exhibits INT,
   exhibition_start_date DATE,
   exhibition_end_date DATE,
CONSTRAINT exhibition_PK PRIMARY KEY (exhibition_id),
CONSTRAINT exhibition_FK1 FOREIGN KEY (museum_id) REFERENCES museum(museum_id)
);
ALTER TABLE exhibition ADD CONSTRAINT exhibitiondate_chk CHECK (exhibition_end_date > exhibition_start_date);

--merchandise
CREATE TABLE merchandise(
    merchandise_id INT NOT NULL,
    merchandise_name NVARCHAR(30),
    merchandise_unit_price DECIMAL(5,2),
    merchandise_quantity_available INT,
    museum_id INT NOT NULL
    CONSTRAINT merchandise_PK PRIMARY KEY(merchandise_id),
    CONSTRAINT merchandise_FK1 FOREIGN KEY (museum_id) REFERENCES museum(museum_id)
);

--shipment line
CREATE TABLE shipment_line(
   sl_id INT NOT NULL,
   sl_weight_kg DECIMAL(7,3),
   sl_unit_price DECIMAL(5,2),
   shipment_id INT NOT NULL,
   merchandise_id INT NOT NULL,

CONSTRAINT shipmentline_PK PRIMARY KEY (sl_id),
CONSTRAINT shipmentline_FK1 FOREIGN KEY(shipment_id) REFERENCES shipment(shipment_id),
CONSTRAINT shipmentline_FK2 FOREIGN KEY(merchandise_id) REFERENCES merchandise(merchandise_id)
);

--order
CREATE TABLE [order](
    order_id INT NOT NULL,
    order_date DATE,
    order_time TIME,
    order_payment_charged DECIMAL(5,2),
    person_ssn INT NOT NULL
    CONSTRAINT order_PK PRIMARY KEY(order_id),
    CONSTRAINT order_FK1 FOREIGN KEY(person_ssn) REFERENCES person(person_ssn)
);

--order line
CREATE TABLE order_line(
    ol_id INT NOT NULL,
    ol_quantity INT,
    ol_payment_charged DECIMAL(10,3),
    order_id INT NOT NULL,
    merchandise_id INT NOT NULL,
    CONSTRAINT orderline_PK PRIMARY KEY(ol_id),
    CONSTRAINT orderline_FK1 FOREIGN KEY(order_id) REFERENCES [order](order_id),
    CONSTRAINT orderline_FK2 FOREIGN KEY(merchandise_id) REFERENCES merchandise(merchandise_id)
);

--donation
CREATE TABLE donation(
   donation_permission_no INT NOT NULL,
   donation_name VARCHAR(30) NOT NULL,
   donation_date DATE,
   museum_id INT NOT NULL,
   donor_ssn INT NOT NULL,
  
CONSTRAINT donation_PK PRIMARY KEY (donation_permission_no),
CONSTRAINT donation_FK1 FOREIGN KEY (museum_id) REFERENCES museum(museum_id),
CONSTRAINT donation_FK2 FOREIGN KEY (donor_ssn) REFERENCES donor(donor_ssn)
);

--reservation
CREATE TABLE reservation(
   reserve_id INT NOT NULL,
   reserve_number_of_visitors INT,
   reserve_date DATE,
   reserve_time TIME,
   reserve_payment_charged DECIMAL(10,3),
   museum_id INT NOT NULL,
   visitor_ssn INT NOT NULL,
  
CONSTRAINT reservation_PK PRIMARY KEY (reserve_id),
CONSTRAINT reservation_FK1 FOREIGN KEY (museum_id) REFERENCES museum(museum_id),
CONSTRAINT reservation_FK2 FOREIGN KEY (visitor_ssn) REFERENCES visitor(visitor_ssn)
);

--employment contract
CREATE TABLE employment_contract(
   employment_id INT NOT NULL,
   employment_position VARCHAR(15) NOT NULL
            CONSTRAINT position_chk CHECK
             (employment_position IN ('staff','manager')),
   employment_salary DECIMAL(15,3) NOT NULL,
   employment_date_hired DATE,
   employment_date_dismission DATE,
   museum_id INT NOT NULL,
   staff_ssn INT NOT NULL,
  
CONSTRAINT employment_PK PRIMARY KEY (employment_id),
CONSTRAINT employment_FK1 FOREIGN KEY (museum_id) REFERENCES museum(museum_id),
CONSTRAINT employment_FK2 FOREIGN KEY (staff_ssn) REFERENCES staff(staff_ssn)
);
ALTER TABLE employment_contract ADD CONSTRAINT employmentdate_chk CHECK (employment_date_dismission > employment_date_hired);

