-- ============================================================
-- Fleet Management Database
-- SQL Queries
-- Oracle SQL
-- ============================================================


-- ------------------------------------------------------------
-- Queries Added After the First Project Review
-- ------------------------------------------------------------
-- The following queries were implemented in response to
-- questions raised by the course professor during the
-- first project review.


-- 1. Branch having the most number of vehicles

SELECT v.branch, COUNT(v.vregno) AS number_of_vehicles
FROM vehicle v
HAVING COUNT(v.vregno) IN (
    SELECT MAX(c)
    FROM (
        SELECT COUNT(v.vregno) AS c
        FROM vehicle v
        GROUP BY v.branch
    )
)
GROUP BY v.branch;


-- 2. Employee who has delivered most number of consignments

SELECT c.e_id, COUNT(v.consid)
FROM conveyance c, vehicle v
WHERE v.vregno = c.vregno
HAVING COUNT(v.consid) IN (
    SELECT MAX(c)
    FROM (
        SELECT COUNT(v.consid) AS c
        FROM vehicle v, conveyance c
        WHERE v.vregno = c.vregno
        GROUP BY c.e_id
    )
)
GROUP BY c.e_id;


-- 3. Number of consignments delivered in the month of June

SELECT COUNT(*)
FROM consignment cs
WHERE cs.deldate >= '1-June-2021'
  AND cs.deldate <= '30-June-2021';

/* OR */

SELECT cs.material
FROM consignment cs
WHERE cs.deldate >= '1-June-2021'
  AND cs.deldate <= '30-June-2021';


-- 4. Client who has ordered most number of times

SELECT c.cl_name, COUNT(c.c_id)
FROM client c
HAVING COUNT(c.c_id) = (
    SELECT MAX(c)
    FROM (
        SELECT cs.cl_name, COUNT(cs.c_id) AS c
        FROM client cs
        GROUP BY cs.cl_name
    )
)
GROUP BY c.cl_name;


-- 5. Number of employees driving each vehicle

SELECT tm.vregno, COUNT(t.e_id) AS "no. of emp"
FROM conveyance t, vehicle tm
WHERE t.vregno = tm.vregno
GROUP BY tm.vregno;


-- 6. Number of vehicles driven by each employee

SELECT t.e_id, COUNT(tm.vregno) AS "no. of vehicles"
FROM conveyance t, vehicle tm
WHERE t.vregno = tm.vregno
GROUP BY t.e_id;



-- ------------------------------------------------------------
-- Multiple Table Join Queries
-- ------------------------------------------------------------


-- 1. Find destination city name for deliveries made by
--    employee Aaron

SELECT t.dst
FROM consignment cs, conveyance t, vehicle tm, employee e
WHERE cs.cid = tm.consid
  AND t.vregno = tm.vregno
  AND e.e_id = t.e_id
  AND e.e_name = 'Aaron';


-- 2. List all the inflammable consignment item names with
--    client details having delivery date between
--    10-20 June 2021

SELECT c.cl_name, cs.material
FROM client c
INNER JOIN consignment cs
    ON c.c_id = cs.cid
WHERE cs.flammability = 'n'
  AND cs.deldate >= '10-June-2021'
  AND cs.deldate <= '20-June-2021';


-- 3. Display consignment and vehicle details of consignment
--    set to make a journey of greater than 1500 kms

SELECT ct.cid, ct.material, t.vregno,
       t.distance_km, e.e_id, e.e_name
FROM consignment ct, conveyance t, employee e, vehicle tm
WHERE ct.cid = tm.consid
  AND tm.vregno = t.vregno
  AND t.e_id = e.e_id
  AND t.distance_km > 1500;


-- 4. Details of the employees transporting goods
--    from Bangalore

SELECT e.e_id, e.e_name, b.b_id, b.b_name,
       t.vregno, c.material
FROM employee e, branch b, conveyance t,
     vehicle m, consignment c
WHERE e.e_branch_id = b.b_id
  AND t.e_id = e.e_id
  AND t.vregno = m.vregno
  AND m.consid = c.cid
  AND t.src = 'Bangalore';


-- 5. Client whose consignment is in transit

SELECT x.vregno, c.cl_name
FROM vehicle x, consignment n, client c
WHERE x.consid = n.cid
  AND n.cid = c.c_id
  AND x.vstatus = 'in transit';


-- 6. Client whose due amount is less than 15 lakhs

SELECT c.cl_name
FROM vehicle x, consignment n, client c
WHERE x.consid = n.cid
  AND n.cid = c.c_id
  AND x.vstatus = 'in transit'
  AND amt_due < 15;


-- 7. Get list of all branches and warehouses in Karnataka

(
    SELECT w.w_id AS "id", w.w_name AS "name"
    FROM warehouse w, locations l
    WHERE w.w_lid = l.lid
      AND l.state = 'Karnataka'
)
UNION
(
    SELECT b.b_id, b.b_name
    FROM branch b, locations l
    WHERE b.b_location_id = l.lid
      AND l.state = 'Karnataka'
);


-- 8. Display branch id, manager, branch locations
--    of all warehouses

SELECT w.w_id, w.w_bid, b.b_location_id,
       e.e_id, e.e_name
FROM warehouse w, branch b, employee e
WHERE w.w_bid = b.b_id
  AND b.b_manager_id = e.e_id;


-- 9. Get details of clients of consignments in
--    each transport medium

SELECT c.cid, ct.client_id, ct.cl_name, t.vregno
FROM client ct, consignment c, vehicle t
WHERE ct.c_id = c.cid
  AND c.cid = t.consid;


-- 10. Retrieve employee id & name for each branch with
--     vehicle registration number used for delivery

SELECT e.e_id, e.e_name, b.b_id, b.b_name, t.vregno
FROM employee e, branch b, conveyance t
WHERE e.e_branch_id = b.b_id
  AND t.e_id = e.e_id;



-- ------------------------------------------------------------
-- Arithmetic and Logic Operators
-- ------------------------------------------------------------


-- 1. Increase the paid amount for sugar by 30%
--    of the total amount

UPDATE consignment c
SET c.amt_paid = c.amt_paid + c.amt_paid * 0.30
WHERE c.material LIKE 'Sugar';


-- 2. Delay delivery of consignments by 2 days
--    whose weight is greater than 50 ton

UPDATE consignment c
SET c.deldate = c.deldate + 2
WHERE c.weight > 50;


-- 3. Vehicles that are not delivering between
--    10 June 2021-20 June 2021

SELECT v.vregno
FROM vehicle v
MINUS
(
    SELECT v.vregno
    FROM vehicle v, conveyance c, consignment cs
    WHERE v.vregno = c.vregno
      AND cs.cid = v.consid
      AND cs.deldate BETWEEN '10-June-2021' AND '20-June-2021'
);


-- 4. Increase salary every employee who has greater than
--    2 years of working here, by 15% as part of yearly bonus

UPDATE employee e
SET e.e_salary = e.e_salary + (e.e_salary * 0.15)
WHERE e.e_experience > 2;


-- 5. Display all consignments that are flammable and
--    have weight greater than 15 tons

SELECT c.cid, c.material, c.weight
FROM consignment c
WHERE c.flammability = 'y'
  AND c.weight > 15;


-- 6. Display all vehicles registered under Karnataka
--    or Gujarat and their branch ids

SELECT v.vregno, v.branch, b.b_name
FROM vehicle v, branch b
WHERE (v.vregno LIKE 'KA%' OR v.vregno LIKE 'GJ%')
  AND v.branch = b.b_id
ORDER BY v.vregno;


-- 7. Select the consignment that weighs between 5 and 10 tons

SELECT cid, material
FROM consignment
WHERE weight < 10
  AND weight >= 5;


-- 8. Select client from state Karnataka and city Bangalore

SELECT c.client_id, c.cl_name
FROM client c, locations l
WHERE c.cl_lid = l.lid
  AND l.city = 'Bangalore'
  AND l.state = 'Karnataka';


-- 9. Select client from state Karnataka but not
--    from Bangalore city

SELECT c.client_id, c.cl_name
FROM client c, locations l
WHERE c.cl_lid = l.lid
  AND l.city <> 'Bangalore'
  AND l.state = 'Karnataka';


-- 10. Display employee details whose salary is
--     less than 30000

SELECT *
FROM employee
WHERE e_salary < ANY (
    SELECT e_salary
    FROM employee
    WHERE e_salary < 30000
);



-- ------------------------------------------------------------
-- Clauses and Functions
-- ------------------------------------------------------------


-- 1. Find the average distance covered between 5-20 June 2021
--    by vehicle of branch 2 which is not registered in Karnataka

SELECT AVG(c.distance_km)
FROM vehicle v, conveyance c, consignment cs
WHERE v.vregno = c.vregno
  AND v.consid = cs.cid
  AND v.branch = 2
  AND v.vregno NOT LIKE 'KA%'
  AND cs.deldate BETWEEN '10-June-2021' AND '20-June-2021';


-- 2. Find the name and work experience of employee of branch 2
--    whose salary is more than the average salary of all the
--    employees of branch 2, in alphabetical order

SELECT e.e_name, e.e_experience
FROM employee e
WHERE e.e_salary > (
    SELECT AVG(e.e_salary)
    FROM employee e
    WHERE e.e_branch_id = 2
)
AND e.e_branch_id = 2
ORDER BY e.e_name ASC;


-- 3. Retrieve number of employees who deliver flammable items.
--    Display maximum and minimum salary

SELECT COUNT(*), MAX(e.e_salary), MIN(e.e_salary)
FROM employee e, consignment cs, conveyance c, vehicle v
WHERE e.e_id = c.e_id
  AND v.consid = cs.cid
  AND v.vregno = c.vregno
  AND cs.flammability = 'y';


-- 4. Display highest salary of employee in each branch

SELECT e.e_branch_id, MAX(e.e_salary)
FROM branch b, employee e
WHERE e.e_branch_id = b.b_id
GROUP BY e.e_branch_id;


-- 5. Find details of vehicle and consignment it's carrying,
--    that has the max distance to cover

SELECT MAX(co.distance_km)
FROM vehicle v, consignment c, conveyance co
WHERE v.consid = c.cid
  AND v.vregno = co.vregno;


-- 6. Get list of all non-insured vehicles and their
--    consignment, branch details

SELECT v.vregno, v.consid, c.material,
       v.branch, b.b_name
FROM vehicle v, consignment c, branch b
WHERE v.consid = c.cid
  AND v.branch = b.b_id
  AND v.vinsurance = 'no'
ORDER BY v.branch;


-- 7. Get number of employees who are delivering to Bangalore

SELECT COUNT(*)
FROM employee e, consignment co, conveyance c, vehicle v
WHERE e.e_id = c.e_id
  AND v.consid = co.cid
  AND v.vregno = c.vregno
  AND c.dst = 'Bangalore';


-- 8. Display names of all branch managers in a sorted way

SELECT b.b_id, b.b_name, b.b_manager_id,
       e.e_name, e.e_contact_no
FROM branch b, employee e
WHERE b.b_manager_id = e.e_id
ORDER BY e.e_name;


-- 9. Select branches that have only state permit vehicles

SELECT v.vehicle_permit, v.branch, COUNT(*)
FROM vehicle v, branch b
WHERE v.branch = b.b_id
  AND v.vehicle_permit <> 'all india permit'
  AND v.vehicle_permit <> 'all india'
GROUP BY v.vehicle_permit, v.branch;


-- 10. Find status of close body trucks having carrier
--     capacity greater than 10 that are in transit
--     and their branches

SELECT v.branch, COUNT(*)
FROM vehicle v, branch b
WHERE b.b_id = v.branch
  AND v.vtype = 'Closed Body Truck'
  AND v.carrier_capacity > 10
GROUP BY v.branch;


-- 11. Select number of employees delivering non-flammable
--     items and having salary > 35000

SELECT COUNT(*)
FROM employee e, consignment cs, conveyance c, vehicle v
WHERE e.e_id = c.e_id
  AND v.consid = cs.cid
  AND v.vregno = c.vregno
  AND cs.flammability = 'n'
  AND e.e_salary > 35000;


-- 12. Display the lowest salary of an employee

SELECT MIN(e_salary)
FROM employee;


-- 13. Display the highest distance km in conveyance

SELECT MAX(distance_km)
FROM conveyance;


-- 14. Display the number of vehicles which have state permit

SELECT COUNT(vehicle_permit)
FROM vehicle
WHERE vehicle_permit = 'state permit';



-- ------------------------------------------------------------
-- Sub-Queries
-- ------------------------------------------------------------


-- 1. Retrieve the number of vehicles branch-wise for the
--    client who has ordered more than once

SELECT v.branch, COUNT(*)
FROM consignment c, vehicle v
WHERE c.cid = v.consid
  AND consigner IN (
      SELECT consigner
      FROM consignment
      HAVING COUNT(consigner) > 1
      GROUP BY consigner
  )
GROUP BY v.branch;


-- 2. Increase the salary of branch 2's employee by 10%
--    who stays near branch 2's warehouse

UPDATE employee e
SET e.e_salary = e.e_salary + e.e_salary * 0.1
WHERE e.address IN (
    SELECT w.w_lid
    FROM warehouse w
    WHERE w.w_bid = 2
);


-- 3. Retrieve second highest total amount paid by clients
--    wherein the same material is ordered twice

SELECT MAX(t)
FROM (
    SELECT cs1.cid AS i,
           (cs1.amt_paid + cs1.amt_due) AS t
    FROM consignment cs1
    WHERE cs1.material IN (
        SELECT cs.material
        FROM consignment cs
        HAVING COUNT(cs.material) > 1
        GROUP BY cs.material
    )
)
WHERE t != (
    SELECT MAX(t)
    FROM (
        SELECT cs1.cid AS i,
               (cs1.amt_paid + cs1.amt_due) AS t
        FROM consignment cs1
        WHERE cs1.material IN (
            SELECT cs.material
            FROM consignment cs
            HAVING COUNT(cs.material) > 1
            GROUP BY cs.material
        )
    )
);


-- 4. Display employee that has 3rd highest experience

SELECT e_name, e_id, e_experience
FROM employee e1
WHERE 2 = (
    SELECT COUNT(DISTINCT e_experience)
    FROM employee e2
    WHERE e2.e_experience > e1.e_experience
);


-- 5. Branch manager with higher salary than average
--    salary of branch managers

SELECT b.b_id, b.b_manager_id, e.e_name, e.e_salary
FROM branch b, employee e
WHERE b.b_manager_id = e.e_id
  AND e.e_salary > (
      SELECT AVG(ee.e_salary)
      FROM branch bb, employee ee
      WHERE bb.b_manager_id = ee.e_id
  );


-- 6. Increase salary of oldest employee by 5%

UPDATE employee e
SET e.e_salary = e.e_salary + 0.05 * e.e_salary
WHERE e.e_dob = (
    SELECT MIN(e.e_dob)
    FROM employee e
);


-- 7. Client whose consignment is delivered last
--    (out of this list)

SELECT cl.client_id, cl.cl_name, cl.c_id,
       c.material, c.deldate
FROM client cl, consignment c
WHERE cl.c_id = c.cid
  AND c.deldate = (
      SELECT MAX(c.deldate)
      FROM consignment c
  );


-- 8. Client details who have the highest amount due

SELECT c.cid, c.material, c.amt_due,
       cl.client_id, cl.cl_name
FROM consignment c, client cl
WHERE c.cid = cl.c_id
  AND c.amt_due = (
      SELECT MAX(co.amt_due)
      FROM consignment co
  );


-- 9. Display employee that has 4th highest salary

SELECT e_name, e_id, e_salary
FROM employee e1
WHERE 3 = (
    SELECT COUNT(DISTINCT e_salary)
    FROM employee e2
    WHERE e2.e_salary > e1.e_salary
);


-- 10. Check the name of the trucks registered
--     in branch 3 or branch 1

SELECT b.b_name, v.vtype
FROM branch b, vehicle v
WHERE b.b_id = v.branch
  AND b.b_id IN (
      SELECT v.branch
      FROM vehicle v, branch b
      WHERE v.branch = 3
         OR v.branch = 1
  );


-- 11. Display the name of employee whose salary is greater
--     than maximum salary of department 4

SELECT e.e_name
FROM employee e
WHERE e.e_salary > (
    SELECT MAX(e.e_salary)
    FROM employee e
    WHERE e.e_branch_id = 4
);


-- 12. Display branch name that has employee greater than 5

INSERT INTO employee VALUES
(21, 'Loki', '09-june-1970', 43100, 20, 8562163143,
 '23-april-2001', 4, 11);

SELECT b.b_id, b.b_name
FROM branch b
WHERE b.b_id IN (
    SELECT e.e_branch_id
    FROM employee e
    GROUP BY e.e_branch_id
    HAVING COUNT(*) > 5
);


-- 13. Display employee driving the vehicles from branch 2

SELECT e.e_name
FROM employee e
WHERE e.e_branch_id IN (
    SELECT v.branch
    FROM vehicle v
    WHERE v.branch = 2
);


-- 14. Average salary of branch managers of branch 4

SELECT e.e_name
FROM employee e
WHERE e.e_salary = (
    SELECT AVG(e.e_salary)
    FROM employee e, branch b
    WHERE e.e_id = b.b_manager_id
      AND b.b_id = 4
);


-- 15. Retrieve 2nd highest amount paid by a client
--     and material details

SELECT cs.material, cs.amt_paid
FROM consignment cs
WHERE 1 = (
    SELECT COUNT(c2.amt_paid)
    FROM consignment c2
    WHERE c2.amt_paid > cs.amt_paid
);


-- 16. Display vehicle details which have highest
--     carrier capacity

SELECT *
FROM vehicle
WHERE carrier_capacity = (
    SELECT MAX(carrier_capacity)
    FROM vehicle
);


-- 17. Deduct the salary of the youngest employee by 10%

UPDATE employee e
SET e.e_salary = e.e_salary - e.e_salary * 0.1
WHERE e.e_dob = (
    SELECT MAX(e.e_dob)
    FROM employee e
);


-- 18. Client details who have paid the highest amount

SELECT c.cid, c.material, c.amt_paid,
       cl.client_id, cl.cl_name
FROM consignment c, client cl
WHERE c.cid = cl.c_id
  AND c.amt_paid = (
      SELECT MAX(co.amt_paid)
      FROM consignment co
  );


-- 19. Display employee name who is associated with a branch

SELECT e_name, e_branch_id
FROM employee
WHERE EXISTS (
    SELECT b_id
    FROM branch
    WHERE branch.b_id = employee.e_branch_id
);


-- 20. 5th highest amount paid (in lakhs) by client

SELECT cs.material, cs.amt_paid
FROM consignment cs
WHERE 4 = (
    SELECT COUNT(c2.amt_paid)
    FROM consignment c2
    WHERE c2.amt_paid > cs.amt_paid
);



-- ------------------------------------------------------------
-- Views
-- ------------------------------------------------------------


-- 1. Create a view and display employees who have
--    done deliveries more than once

CREATE VIEW sa AS
SELECT e.e_id, e.e_salary
FROM employee e, conveyance c
WHERE e.e_id = c.e_id
HAVING COUNT(c.e_id) > 1
GROUP BY e.e_id, e.e_salary;

SELECT *
FROM sa;


-- 2. Create a view from consignment to display only names
--    of the consigner and consignee where amount due
--    is less than 10

CREATE VIEW consignmentt AS
SELECT cid, consigner, consignee
FROM consignment
WHERE amt_due < 10;

SELECT *
FROM consignmentt;


-- 3. Create a view from employee to display the name
--    and contact number of employees who belong to branch 3

CREATE VIEW employeee AS
SELECT e_id, e_name, e_contact_no
FROM employee
WHERE e_branch_id = 3;

SELECT *
FROM employeee;


-- 4. Create a view from vehicle to display vehicle details
--    which have all India vehicle permit

CREATE VIEW vehicle1 AS
SELECT *
FROM vehicle
WHERE vehicle_permit = 'all india';

SELECT *
FROM vehicle1;


-- 5. Create a view from conveyance to display conveyance
--    details whose destination is Bangalore

CREATE VIEW conveyancee AS
SELECT *
FROM conveyance
WHERE dst = 'Bangalore';

SELECT *
FROM conveyancee;


-- 6. Create view of employees working in branch 4

CREATE VIEW emp_br4 AS
SELECT e_name, e_salary, e_dob, e_experience
FROM employee
WHERE e_branch_id = 4;

SELECT *
FROM emp_br4;

-- Employee having salary greater than 40000

SELECT e.e_name
FROM emp_br4 e
WHERE e.e_salary IN (
    SELECT e.e_salary
    FROM emp_br4
    HAVING e.e_salary >= 40000
);

-- Employee having experience greater than
-- the average experience

SELECT e.e_name
FROM emp_br4 e
WHERE e.e_experience > (
    SELECT AVG(e.e_experience)
    FROM emp_br4 e
);


-- 7. Create view having vehicle details

CREATE VIEW v2 AS
SELECT vregno, vtype, carrier_capacity
FROM vehicle;

SELECT *
FROM v2;

-- Order carrier capacity in ascending order

SELECT vregno, carrier_capacity
FROM v2
ORDER BY carrier_capacity ASC;

-- Display vehicle having the second highest carrier capacity

SELECT vregno, vtype
FROM v2
WHERE carrier_capacity = (
    SELECT MAX(carrier_capacity)
    FROM v2
    WHERE carrier_capacity <> (
        SELECT MAX(carrier_capacity)
        FROM v2
    )
);


-- 8. Create a view consisting of consignments for
--    non-flammable elements with material, delivery date,
--    weight and consigner

CREATE VIEW c2 AS
SELECT cid, material, consigner, deldate, weight
FROM consignment
WHERE flammability = 'n';

SELECT *
FROM c2;

SELECT material, weight
FROM c2
ORDER BY weight DESC;

SELECT material, weight
FROM c2
WHERE weight = (
    SELECT MAX(weight)
    FROM c2
);

SELECT *
FROM c2;


-- 9. Create a view from vehicle to display vehicle details
--    which have vehicle status as docked

CREATE VIEW vehicle2 AS
SELECT *
FROM vehicle
WHERE vstatus = 'docked'
   OR vstatus = 'docked for repair'
   OR vstatus = 'docked in warehouse';

SELECT *
FROM vehicle2;


-- 10. Create a view from employee to display employees
--     who joined before 2010

CREATE VIEW employeeee AS
SELECT e_id, e_name, e_contact_no
FROM employee
WHERE e_doj <= '01-Jan-2010';

SELECT *
FROM employeeee;
