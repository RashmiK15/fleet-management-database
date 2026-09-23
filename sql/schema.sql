-- ============================================================
-- Fleet Management Database
-- Database Schema
-- Oracle SQL
-- ============================================================

-- Stores location information used by branches, employees,
-- warehouses, and clients.
CREATE TABLE locations (
    lid INT CONSTRAINT plid PRIMARY KEY,
    pin CHAR(6),
    area VARCHAR(70),
    city VARCHAR(20),
    state VARCHAR(20)
);


-- Stores fleet management branch information.
CREATE TABLE branch (
    b_id INT,
    b_name VARCHAR(40),
    b_location_id INT,
    b_manager_id INT,

    PRIMARY KEY (b_id),
    FOREIGN KEY (b_location_id) REFERENCES locations(lid)
);


-- Stores employee information and the branch/location
-- associated with each employee.
CREATE TABLE employee (
    e_id INT,
    e_name VARCHAR(20),
    e_dob DATE,
    e_salary INT,
    e_experience INT,
    e_contact_no INT,
    e_doj DATE,
    e_branch_id INT,
    address INT CONSTRAINT fa REFERENCES locations(lid),

    PRIMARY KEY (e_id),
    FOREIGN KEY (e_branch_id) REFERENCES branch(b_id)
);


-- Stores warehouses and their associated branches and locations.
CREATE TABLE warehouse (
    w_id INT,
    w_name VARCHAR(20),
    w_lid INT,
    w_bid INT,

    PRIMARY KEY (w_id),
    FOREIGN KEY (w_bid) REFERENCES branch(b_id),
    FOREIGN KEY (w_lid) REFERENCES locations(lid)
);


-- Stores information about consignments handled by the system.
CREATE TABLE consignment (
    cid NUMBER,
    material VARCHAR(30),
    consigner VARCHAR(40),
    consignee VARCHAR(40),
    deldate DATE,
    amt_paid DECIMAL(10, 2),  -- Amount in lakhs
    amt_due DECIMAL(10, 2),
    weight DECIMAL(10, 2),    -- Weight in tons
    flammability CHAR(1),
    c_wid NUMBER,

    PRIMARY KEY (cid),
    FOREIGN KEY (c_wid) REFERENCES warehouse(w_id)
);


-- Stores client information and the consignments booked by clients.
CREATE TABLE client (
    client_id INT,
    cl_name VARCHAR(50),
    cl_lid INT,
    c_id INT,

    PRIMARY KEY (client_id),
    FOREIGN KEY (cl_lid) REFERENCES locations(lid),
    FOREIGN KEY (c_id) REFERENCES consignment(cid)
);


-- Stores vehicles used for transporting consignments.
CREATE TABLE vehicle (
    vregno VARCHAR(20),
    vinsurance VARCHAR(30),
    vtype VARCHAR(50),
    vstatus VARCHAR(20),
    carrier_capacity DECIMAL(10, 2),
    vehicle_permit VARCHAR(20),
    consid NUMBER CONSTRAINT fc REFERENCES consignment(cid),
    branch INT CONSTRAINT fbid REFERENCES branch(b_id),

    PRIMARY KEY (vregno)
);


-- Stores journeys performed by employees using fleet vehicles.
CREATE TABLE conveyance (
    src VARCHAR(50),
    dst VARCHAR(50),
    distance_km DECIMAL(10, 2),
    e_id INT CONSTRAINT feid REFERENCES employee(e_id),
    vregno VARCHAR(20) CONSTRAINT fno REFERENCES vehicle(vregno),

    PRIMARY KEY (e_id, vregno)
);
