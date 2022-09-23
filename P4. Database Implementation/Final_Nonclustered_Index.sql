CREATE NONCLUSTERED INDEX index_donation
ON donation(donation_permission_no ASC, donation_name ASC)

CREATE NONCLUSTERED INDEX index_supplier
ON supplier(supplier_id ASC, supplier_name ASC)

CREATE NONCLUSTERED INDEX index_merchandise
ON merchandise(merchandise_id ASC, merchandise_name ASC)

CREATE NONCLUSTERED INDEX index_person
ON person(person_ssn ASC, person_first_name ASC, person_last_name ASC)

CREATE NONCLUSTERED INDEX index_museum
ON museum(museum_id ASC, museum_name ASC)