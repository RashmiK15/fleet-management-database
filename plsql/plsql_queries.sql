-- ============================================================
-- Fleet Management Database
-- PL/SQL Queries
-- Oracle PL/SQL
-- ============================================================

SET SERVEROUTPUT ON;


-- ------------------------------------------------------------
-- Records
-- ------------------------------------------------------------

-- 1. Record details of 'Avenue Logistics Kolkata Branch'

DECLARE
    TYPE br IS RECORD (
        id INT,
        name VARCHAR2(40),
        location INT
    );
    b br;
BEGIN
    SELECT b_id, b_name, b_location_id
    INTO b
    FROM branch
    WHERE b_name = 'Avenue Logistics Kolkata Branch';

    DBMS_OUTPUT.PUT_LINE(
        'branch no=' || b.id ||
        ' dept name = ' || b.name ||
        ' Location id = ' || b.location
    );
END;
/


-- 2. Display one vehicle number of type 'Truck'

DECLARE
    TYPE vrec IS RECORD (
        vno VARCHAR(20),
        type VARCHAR(50)
    );
    v vrec;
BEGIN
    SELECT vregno, vtype
    INTO v
    FROM vehicle
    WHERE vtype = 'Truck';

    DBMS_OUTPUT.PUT_LINE(
        'Registration no.: ' || v.vno ||
        ' Type: ' || v.type
    );

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows');
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('no matching records found');
END;
/


-- 3. Display branch details of id 2

DECLARE
    TYPE branch IS RECORD (
        b_id INT,
        b_name VARCHAR2(40)
    );
    b branch;
BEGIN
    SELECT b_id, b_name
    INTO b
    FROM branch
    WHERE b_id = '2';

    DBMS_OUTPUT.PUT_LINE(
        'Branch id=' || b.b_id ||
        ' and Branch name=' || b.b_name
    );
END;
/


-- 4. Display warehouse details of id 102

DECLARE
    w warehouse%ROWTYPE;
BEGIN
    SELECT *
    INTO w
    FROM warehouse
    WHERE w_id = 102;

    DBMS_OUTPUT.PUT_LINE('Warehouse ID: ' || w.w_id);
    DBMS_OUTPUT.PUT_LINE('Warehouse Name: ' || w.w_name);

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('more than one row present');
END;
/


-- 5. Display a consignment which is flammable

DECLARE
    c consignment%ROWTYPE;
BEGIN
    SELECT *
    INTO c
    FROM consignment
    WHERE flammability = 'y';

    DBMS_OUTPUT.PUT_LINE(
        'cnum=' || c.cid ||
        ' name=' || c.material
    );

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('more than one row present');
END;
/


-- 6. Display vehicles having carrier capacity of 16 ton

DECLARE
    vh vehicle%ROWTYPE;
BEGIN
    SELECT *
    INTO vh
    FROM vehicle
    WHERE carrier_capacity = 16;

    DBMS_OUTPUT.PUT_LINE(
        'vregno=' || vh.vregno ||
        ' type=' || vh.vtype
    );

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('more than one row present');
END;
/



-- ------------------------------------------------------------
-- Cursors
-- ------------------------------------------------------------

-- 1. Retrieve registration numbers of vehicles of type 'Truck'

DECLARE
    v vehicle.vtype%TYPE;
    n vehicle.vregno%TYPE;

    CURSOR tcursor IS
        SELECT vregno, vtype
        FROM vehicle
        WHERE vtype = 'Truck';
BEGIN
    OPEN tcursor;

    FOR i IN 1..3 LOOP
        FETCH tcursor INTO n, v;
        DBMS_OUTPUT.PUT_LINE(n || ' ' || v);
    END LOOP;

    CLOSE tcursor;
END;
/


-- 2. Retrieve highest and lowest salary of employee with
--    names and difference between them

DECLARE
    name employee.e_name%TYPE;
    s employee.e_salary%TYPE;
    a employee.e_salary%TYPE;
    b employee.e_salary%TYPE;
    c NUMBER;

    CURSOR scursor IS
        SELECT e_name, e_salary
        FROM employee
        ORDER BY e_salary DESC;
BEGIN
    OPEN scursor;

    FOR i IN 1..20 LOOP
        FETCH scursor INTO name, s;

        IF i = 1 THEN
            a := s;
            DBMS_OUTPUT.PUT_LINE(name || ': ' || a);
        ELSIF i = 20 THEN
            b := s;
            DBMS_OUTPUT.PUT_LINE(name || ': ' || b);
            c := a - b;
        END IF;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Difference: ' || c);

    CLOSE scursor;
END;
/


-- 3. Display client name for client id 12

DECLARE
    CURSOR cur IS
        SELECT client_id, cl_name
        FROM client
        WHERE client_id = '12';

    n client.client_id%TYPE;
    l client.cl_name%TYPE;
BEGIN
    OPEN cur;

    LOOP
        FETCH cur INTO n, l;
        EXIT WHEN cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Client id=' || n ||
            ' Client name=' || l
        );
    END LOOP;

    CLOSE cur;
END;
/


-- 4. Display all delivery sources and destinations
--    having employee id 2

DECLARE
    CURSOR cur IS
        SELECT src, dst
        FROM conveyance
        WHERE e_id = '2';

    n conveyance.src%TYPE;
    l conveyance.dst%TYPE;
BEGIN
    OPEN cur;

    LOOP
        FETCH cur INTO n, l;
        EXIT WHEN cur%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'Source=' || n ||
            ' Destination=' || l
        );
    END LOOP;

    CLOSE cur;
END;
/


-- 5. Display salary of first 3 employees after
--    arranging in ascending order

DECLARE
    s employee.e_salary%TYPE;

    CURSOR sal_cur IS
        SELECT e_salary
        FROM employee
        ORDER BY e_salary;
BEGIN
    OPEN sal_cur;

    FOR i IN 1..3 LOOP
        FETCH sal_cur INTO s;
        DBMS_OUTPUT.PUT_LINE(s);
    END LOOP;

    CLOSE sal_cur;
END;
/


-- 6. Select consignment details having weight
--    greater than 10 ton

DECLARE
    CURSOR c2 IS
        SELECT cid, weight, material
        FROM consignment
        WHERE weight > 10;

    var_c c2%ROWTYPE;
BEGIN
    OPEN c2;

    LOOP
        FETCH c2 INTO var_c;
        EXIT WHEN c2%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            var_c.cid || ' ' ||
            var_c.weight || ' ' ||
            var_c.material
        );
    END LOOP;

    CLOSE c2;
END;
/



-- ------------------------------------------------------------
-- Stored Procedures
-- ------------------------------------------------------------

-- 1. Return any delivery source and destination
--    for inputted vehicle number

CREATE OR REPLACE PROCEDURE deliver(x IN VARCHAR)
AS
    sr VARCHAR(40);
    de VARCHAR(40);
BEGIN
    SELECT src, dst
    INTO sr, de
    FROM conveyance
    WHERE vregno = x;

    DBMS_OUTPUT.PUT_LINE(
        'Source: ' || sr ||
        '. Destination: ' || de
    );

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows');
END;
/

-- Original execution example:
-- EXECUTE deliver('WB-25 A 1023');


-- 2. Return client name for inputted client id

CREATE OR REPLACE PROCEDURE d(x IN NUMBER)
AS
    clid NUMBER;
    clname VARCHAR(40);
BEGIN
    SELECT client_id, cl_name
    INTO clid, clname
    FROM client
    WHERE client_id = x;

    DBMS_OUTPUT.PUT_LINE(
        'Client ID: ' || clid ||
        '. Client Name: ' || clname
    );

EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('Too many rows');
END;
/


-- 3. Raise employee salary of employees of inputted
--    branch id, by inputted amount

CREATE OR REPLACE PROCEDURE esal(
    bno NUMBER,
    sraise NUMBER
)
IS
BEGIN
    UPDATE employee
    SET e_salary = e_salary + e_salary * sraise
    WHERE e_branch_id = bno;
END;
/


-- 4. Procedure to find 3rd highest salary

CREATE OR REPLACE PROCEDURE hi_sal(sal NUMBER := 3)
IS
    sal12 NUMBER;
BEGIN
    SELECT DISTINCT e_salary
    INTO sal12
    FROM employee e1
    WHERE 3 = (
        SELECT COUNT(DISTINCT e_salary)
        FROM employee e2
        WHERE e1.e_salary <= e2.e_salary
    );

    DBMS_OUTPUT.PUT_LINE(sal12);
END;
/



-- ------------------------------------------------------------
-- Functions
-- ------------------------------------------------------------

-- 1. Return total amount for consignment for a
--    specified consignment id

CREATE OR REPLACE FUNCTION adder(c IN NUMBER)
RETURN DECIMAL
IS
    n1 DECIMAL(10, 2) := 0;
    n2 DECIMAL(10, 2) := 0;
    n3 DECIMAL(10, 2) := 0;
BEGIN
    SELECT amt_paid, amt_due
    INTO n1, n2
    FROM consignment
    WHERE cid = c;

    n3 := n1 + n2;

    RETURN n3;
END;
/


-- 2. Return branch name for inputted branch id

CREATE OR REPLACE FUNCTION bnum(bno IN NUMBER)
RETURN STRING
AS
    name STRING(40);
BEGIN
    SELECT b_name
    INTO name
    FROM branch
    WHERE b_id = bno;

    RETURN name;
END;
/


-- 3. Return annual salary for inputted employee salary

CREATE OR REPLACE FUNCTION annsal(p_salary NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN (p_salary * 12);
END;
/


-- 4. Calculate 5% bonus for inputted employee salary

CREATE OR REPLACE FUNCTION bonus(b_amt NUMBER)
RETURN NUMBER
IS
BEGIN
    RETURN (b_amt * 5 / 100);
END;
/



-- ------------------------------------------------------------
-- Triggers
-- ------------------------------------------------------------

-- 1. Update employee data on new year

DROP TABLE emp_exp;

CREATE TABLE emp_exp (
    e_id INT,
    e_name VARCHAR(20),
    e_experience INT
);

CREATE OR REPLACE TRIGGER exp_increase
AFTER UPDATE OF e_experience ON employee
FOR EACH ROW
BEGIN
    INSERT INTO emp_exp
    VALUES (
        :NEW.e_id,
        :NEW.e_name,
        :NEW.e_experience
    );
END;
/


-- 2. Apply 5% GST on flammable consignments

DROP TABLE flam;

CREATE TABLE flam (
    cons NUMBER,
    item VARCHAR(30),
    flammable CHAR(1),
    paid DECIMAL(10, 2),
    due DECIMAL(10, 2)
);

CREATE OR REPLACE TRIGGER increase_payment
AFTER UPDATE OF flammability ON consignment
FOR EACH ROW
BEGIN
    INSERT INTO flam
    VALUES (
        :NEW.cid,
        :NEW.material,
        :NEW.flammability,
        :NEW.amt_paid,
        :NEW.amt_due
    );
END;
/

-- Original update example:
-- UPDATE consignment
-- SET amt_due = amt_due * 0.05 + amt_due
-- WHERE flammability = 'y';



-- ------------------------------------------------------------
-- PL/SQL Queries Added After the First Project Review
-- ------------------------------------------------------------
-- The following PL/SQL exercises were implemented in response
-- to questions raised by the course professor during the
-- project review.


-- 1. Given an input, delivery made in a particular period
--    using cursor input as month name

DECLARE
    CURSOR dc IS
        SELECT cid, material, deldate
        FROM consignment
        WHERE deldate >= '1-June-2021'
          AND deldate <= '30-June-2021';

    id consignment.cid%TYPE;
    item consignment.material%TYPE;
    delivery consignment.deldate%TYPE;
BEGIN
    OPEN dc;

    LOOP
        FETCH dc INTO id, item, delivery;
        EXIT WHEN dc%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            'ID: ' || id ||
            ' Material:' || item ||
            ' Delivery date:' || delivery
        );
    END LOOP;

    CLOSE dc;
END;
/


-- 2. Function to return branch number by inputting
--    vehicle registration number

CREATE OR REPLACE FUNCTION vre(vrno IN VARCHAR)
RETURN NUMBER
AS
    bno NUMBER;
BEGIN
    SELECT branch
    INTO bno
    FROM vehicle
    WHERE vregno = vrno;

    RETURN bno;
END;
/


-- 3. If a new employee joins the company, display his
--    information separately with the help of trigger

DROP TABLE new_emp;

CREATE TABLE new_emp (
    id INT,
    name VARCHAR(20),
    sal INT
);

DROP TABLE emp_added;

CREATE OR REPLACE TRIGGER emp_added
AFTER INSERT ON employee
FOR EACH ROW
BEGIN
    INSERT INTO new_emp
    VALUES (
        :NEW.e_id,
        :NEW.e_name,
        :NEW.e_salary
    );
END;
/

-- Original examples from the submission:
-- UPDATE employee SET (23, 'Raj', 18000);
-- INSERT INTO new_emp(23, 'Raj', 18000);
