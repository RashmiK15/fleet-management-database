-- ============================================================
-- Fleet Management Database
-- Sample Data
-- Oracle SQL
-- ============================================================

-- ------------------------------------------------------------
-- Locations
-- ------------------------------------------------------------

INSERT INTO locations VALUES
(1, 831001, 'Bistupur Main Rd, South Park, Bistupur', 'Jamshedpur', 'Jharkhand');

INSERT INTO locations VALUES
(2, 700156, 'Coal Bhawan Premise No-04 MAR, Plot No-AF-III,Action Area-1A, Rajarhat', 'Kolkata', 'West Bengal');

INSERT INTO locations VALUES
(3, 575030, 'Kuthethoor, Via Katipalla', 'Mangalore', 'Karnataka');

INSERT INTO locations VALUES
(4, 560032, 'R T NAGAR MAIN ROAD DESHPANDE HOUSE', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(5, 560011, '24, Tilaknagar Main Road, 30th Cross Road, 4th Block, Jayanagar', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(6, 560011, 'NO:44,5TH FLOOR, T, T Mariappa Rd, 2nd Block, Jayanagar', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(7, 583123, 'Sandur Taluk, Bellary District', 'Toranagallu', 'Karnataka');

INSERT INTO locations VALUES
(8, 751013, 'Nalco Bhavan, P/1, Nayapalli', 'Bhuvaneshvar', 'Orissa');

INSERT INTO locations VALUES
(9, 560040, 'BCC Layout, Deepanjali Nagar', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(10, 560032, 'R T NAGAR MAIN ROAD DESHPANDE HOUSE', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(11, 581325, 'Bangur Nagar', 'Dandeli', 'Karnataka');

INSERT INTO locations VALUES
(12, 440009, 'Ganesh Nagar', 'Nagpur', 'Maharashtra');

INSERT INTO locations VALUES
(13, 590001, '105, Havelock Rd', 'Belgaum', 'Karnataka');

INSERT INTO locations VALUES
(14, 590001, '105, Havelock Rd', 'Belgaum', 'Karnataka');

INSERT INTO locations VALUES
(15, 560013, 'Outer Ring Road', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(16, 403001, '20 EDC Complex, Patto', 'Panaji', 'Goa');

INSERT INTO locations VALUES
(17, 560001, '3rd flr Mittal Tower, 6, Mahatma Gandhi Rd', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(18, 500034, '4th Floor, Sri Durga Towers', 'Hyderabad', 'Telangana');

INSERT INTO locations VALUES
(19, 388001, 'Amul Dairy Rd, Popati Nagar', 'Anand', 'Gujarat');

INSERT INTO locations VALUES
(20, 388001, 'Amul Dairy Rd, Popati Nagar', 'Anand', 'Gujarat');

INSERT INTO locations VALUES
(21, 581343, 'Jaffman House, Koppalkarwadi', 'Kumta', 'Karnataka');

INSERT INTO locations VALUES
(22, 560024, '185 6th Main Brigade Road', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(23, 560034, '23 17th Main Koramangala', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(24, 560079, '145 8th Main Rajarajeshwari Nagar', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(25, 575003, '3rd Main Sturrock road', 'Mangalore', 'Karnataka');

INSERT INTO locations VALUES
(26, 380054, 'C/703, Titanium Square Thaltej Cross Road', 'Ahmedabad', 'Gujarat');

INSERT INTO locations VALUES
(27, 700046, '23 Abinash Chaowdhury lane', 'Kolkata', 'West Bengal');

INSERT INTO locations VALUES
(28, 440010, '50 Abhyankar Nagar', 'Nagpur', 'Maharashtra');

INSERT INTO locations VALUES
(29, 110070, 'sector B, Pocket 1, Aruna Asaf Ali Marg, Vasant Vihar', 'New Delhi', 'Delhi');

INSERT INTO locations VALUES
(30, 400037, '48 Agripada Villaparle', 'Mumbai', 'Maharashtra');

INSERT INTO locations VALUES
(31, 400097, '67 Daftary Rd, Bandra(E)', 'Mumbai', 'Maharashtra');

INSERT INTO locations VALUES
(32, 380009, 'Panchavati Society, Gulbai Tekra', 'Ahmedabad', 'Gujarat');

INSERT INTO locations VALUES
(33, 560001, 'Infantry Rd, opp. Commissioner Office, Shivaji Nagar', 'Bangalore', 'Karnataka');

INSERT INTO locations VALUES
(34, 110021, 'Benito Juarez Marg, South Campus, South Moti Bagh', 'New Delhi', 'Delhi');

INSERT INTO locations VALUES
(35, 700001, 'ICC Towers, 4th Floor, 4, India Exchange Pl Rd', 'Kolkata', 'West Bengal');


-- ------------------------------------------------------------
-- Branches
-- ------------------------------------------------------------

INSERT INTO branch VALUES
(1, 'Avenue Logistics Ahmedabad Branch', 32, 1);

INSERT INTO branch VALUES
(2, 'Avenue Logistics Bangalore Branch', 33, 6);

INSERT INTO branch VALUES
(3, 'Avenue Logistics Delhi Branch', 34, 11);

INSERT INTO branch VALUES
(4, 'Avenue Logistics Kolkata Branch', 35, 16);


-- ------------------------------------------------------------
-- Employees
-- ------------------------------------------------------------

INSERT INTO employee VALUES
(1, 'Dan', '16-september-1975', 40000, 21, 9654312674, '20-october-2000', 1, 3);

INSERT INTO employee VALUES
(2, 'Ben', '19-july-1980', 35000, 10, 9876900807, '23-july-2011', 1, 6);

INSERT INTO employee VALUES
(3, 'Cate', '23-april-1990', 22000, 2, 9675412034, '14-june-2019', 1, 2);

INSERT INTO employee VALUES
(4, 'Aaron', '1-january-1984', 25000, 5, 9897541234, '1-may-2016', 1, 8);

INSERT INTO employee VALUES
(5, 'Eve', '31-december-1981', 35000, 14, 9594937676, '14-october-2007', 1, 10);

INSERT INTO employee VALUES
(6, 'Ian', '16-august-1980', 30000, 20, 9654286190, '1-january-2001', 2, 19);

INSERT INTO employee VALUES
(7, 'Gini', '4-november-1995', 2000, 1, 9493456123, '14-july-2020', 2, 20);

INSERT INTO employee VALUES
(8, 'Henry', '23-april-1998', 15000, 1, 9876915432, '23-april-2020', 2, 25);

INSERT INTO employee VALUES
(9, 'Frank', '24-june-1985', 24000, 11, 9543526566, '7-november-2010', 2, 21);

INSERT INTO employee VALUES
(10, 'Kate', '12-september-1990', 26000, 5, 9876519586, '12-september-2016', 2, 16);

INSERT INTO employee VALUES
(11, 'Jack', '17-july-1975', 50000, 20, 9453649223, '23-april-2001', 3, 6);

INSERT INTO employee VALUES
(12, 'Peter', '26-november-1980', 40000, 15, 9364143536, '18-september-2006', 3, 12);

INSERT INTO employee VALUES
(13, 'Matt', '3-march-1977', 39000, 20, 9872435521, '1-september-2001', 3, 19);

INSERT INTO employee VALUES
(14, 'Nina', '4-july-1991', 27000, 5, 8664312653, '1-august-2016', 3, 23);

INSERT INTO employee VALUES
(15, 'Omar', '23-april-1980', 30000, 15, 9342531674, '29-december-2006', 3, 14);

INSERT INTO employee VALUES
(16, 'Lana', '29-july-1971', 45000, 20, 8759463223, '16-september-2001', 4, 7);

INSERT INTO employee VALUES
(17, 'Rachel', '26-august-1991', 24000, 5, 9265718362, '4-september-2016', 4, 4);

INSERT INTO employee VALUES
(18, 'Tom', '24-july-1990', 23000, 6, 9253154353, '8-september-2015', 4, 20);

INSERT INTO employee VALUES
(19, 'Sam', '15-april-1987', 36000, 8, 9652910765, '7-february-2013', 4, 26);

INSERT INTO employee VALUES
(20, 'Chris', '27-february-1988', 34000, 9, 8562163546, '12-december-2012', 4, 11);


-- ------------------------------------------------------------
-- Warehouses
-- ------------------------------------------------------------

INSERT INTO warehouse VALUES
(101, 'Avenuelogistic.ltd', 32, 1);

INSERT INTO warehouse VALUES
(102, 'Avenuelogistic.ltd', 19, 1);

INSERT INTO warehouse VALUES
(103, 'Avenuelogistic.ltd', 17, 2);

INSERT INTO warehouse VALUES
(104, 'Avenuelogistic.ltd', 16, 2);

INSERT INTO warehouse VALUES
(105, 'Avenuelogistic.ltd', 34, 3);

INSERT INTO warehouse VALUES
(106, 'Avenuelogistic.ltd', 29, 3);

INSERT INTO warehouse VALUES
(107, 'Avenuelogistic.ltd', 27, 4);

INSERT INTO warehouse VALUES
(108, 'Avenuelogistic.ltd', 1, 4);


-- ------------------------------------------------------------
-- Consignments
-- ------------------------------------------------------------

SET DEFINE OFF;

INSERT INTO consignment VALUES
(201, 'Bikes', 'Hero MotoCorp', 'Bellad & Company', '15-June-2021', 30, 30, 50, 'n', NULL);

INSERT INTO consignment VALUES
(202, 'Coal', 'Coal India Ltd', 'NTPC Thermal Power Project Bijapur', '10-June-2021', 20, 9, 13, 'n', 107);

INSERT INTO consignment VALUES
(203, 'Petrol', 'Mangalore Refinery & Petrochemicals Ltd', 'Pepfuels', '11-June-2021', 26, 10, 60, 'y', NULL);

INSERT INTO consignment VALUES
(204, 'Diesel', 'Deshpande Industries', 'SKF Boilers And Driers Private Ltd', '12-June-2021', 27, 10, 60, 'y', NULL);

INSERT INTO consignment VALUES
(205, 'Liquid Oxygen', 'Inox Air Products', 'Steel Authority of India Limited', '15-June-2021', 10, 5, 50, 'y', NULL);

INSERT INTO consignment VALUES
(206, 'SS Sheet 4mm', 'Tata Steel', 'Bajaj Industries', '10-June-2021', 14, 7, 5, 'n', NULL);

INSERT INTO consignment VALUES
(207, 'TMT Bar 6mm', 'JSW Steel & Engg Co.', 'Layon Industries', '12-June-2021', 23, 4, 6, 'n', NULL);

INSERT INTO consignment VALUES
(208, 'Aluminium Sheet 10mm', 'NALCO Bhuvaneshwar Orissa', 'Federal Mogal Blr', '13-June-2021', 12, 7, 30, 'n', NULL);

INSERT INTO consignment VALUES
(209, 'Industrial Cable 3 Core', 'Finolex Cable', 'BHEL Blr', '16-June-2021', 10, 5, 20, 'y', NULL);

INSERT INTO consignment VALUES
(210, 'Diesel', 'Indian Oil Corporation', 'Pepfuels', '15-June-2021', 10, 2, 20, 'y', NULL);

INSERT INTO consignment VALUES
(211, '52 gsm Paper', 'West Coast Papers Ltd', 'Times Of India', '17-July-2021', 31, 10, 300, 'n', NULL);

INSERT INTO consignment VALUES
(212, 'Cement', 'Ambuja Cement Ltd.', 'RG Cement', '20-June-2021', 28, 28, 50, 'n', NULL);

INSERT INTO consignment VALUES
(213, 'Sugar', 'Shree Renuka Sugars Ltd', 'Chetan Sugar General Merchants', '12-June-2021', 29, 38, 50, 'n', NULL);

INSERT INTO consignment VALUES
(214, 'Sugar', 'Shree Renuka Sugars Ltd', 'Sri Chamundeshwari Sugars Ltd', '10-June-2021', 30, 40, 10, 'n', NULL);

INSERT INTO consignment VALUES
(215, 'Magnetron', 'BEL', 'DRDO Blr', '18-June-2021', 10, 10, 2.5, 'n', NULL);

INSERT INTO consignment VALUES
(216, 'Iron Ore', 'Sesa Goa', 'JSW Mill', '14-June-2021', 18, 14, 3.2, 'n', NULL);

INSERT INTO consignment VALUES
(217, 'Potash Salt', 'Indian Potash Ltd', 'Trillium Flow Technologies India Pvt Ltd', '11-June-2021', 12, 13, 4.2, 'n', NULL);

INSERT INTO consignment VALUES
(218, 'Sand', 'C Robo Silicon Pvt Ltd', 'S. S. Shivalli & Co.', '9-June-2021', 24, 21, 3.1, 'n', 103);

INSERT INTO consignment VALUES
(219, 'Ice Cream', 'Amul Dairy', 'Amul Ice Cream Parlour', '7-June-2021', 14, 12, 8, 'n', NULL);

INSERT INTO consignment VALUES
(220, 'Milk & Curd Packs', 'Amul Dairy', 'Jain Dairy Products Pvt. Ltd.', '24-June-2021', 13.2, 11, 6, 'n', NULL);

INSERT INTO consignment VALUES
(221, 'Remdesivir', 'Jaffman Pharmaceuticals', 'Ravindra Pharma Distributors', '29-July-2021', 26, 5, 0.49, 'n', NULL);


-- ------------------------------------------------------------
-- Clients
-- ------------------------------------------------------------

INSERT INTO client VALUES
(1, 'Hero MotoCorp', 1, 201);

INSERT INTO client VALUES
(2, 'Coal India Ltd ', 2, 202);

INSERT INTO client VALUES
(3, 'Mangalore Refinery & Petrochemicals Ltd', 3, 203);

INSERT INTO client VALUES
(4, 'Deshpande Industries', 4, 204);

INSERT INTO client VALUES
(5, 'Inox Air Products', 5, 205);

INSERT INTO client VALUES
(6, 'Tata Steel', 6, 206);

INSERT INTO client VALUES
(7, 'JSW Steel & Engg Co.', 7, 207);

INSERT INTO client VALUES
(8, 'NALCO Bhuvaneshwar Orissa', 8, 208);

INSERT INTO client VALUES
(9, 'Finolex Cable', 9, 209);

INSERT INTO client VALUES
(10, 'Indian Oil Corporation', 10, 210);

INSERT INTO client VALUES
(11, 'West Coast Papers Ltd', 11, 211);

INSERT INTO client VALUES
(12, 'Ambuja Cement Ltd.', 12, 212);

INSERT INTO client VALUES
(13, 'Shree Renuka Sugars Ltd', 13, 213);

INSERT INTO client VALUES
(14, 'Shree Renuka Sugars Ltd', 14, 214);

INSERT INTO client VALUES
(15, 'BEL', 15, 215);

INSERT INTO client VALUES
(16, 'Sesa Goa', 16, 216);

INSERT INTO client VALUES
(17, 'Indian Potash Ltd', 17, 217);

INSERT INTO client VALUES
(18, 'C Robo Silicon Pvt Ltd', 18, 218);

INSERT INTO client VALUES
(19, 'Amul Dairy', 19, 219);

INSERT INTO client VALUES
(20, 'Amul Dairy', 20, 220);

INSERT INTO client VALUES
(21, 'Jaffman Pharmaceuticals', 21, 221);


-- ------------------------------------------------------------
-- Vehicles
-- ------------------------------------------------------------

INSERT INTO vehicle VALUES
('WB-25 A 1023', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india', 206, 4);

INSERT INTO vehicle VALUES
('KA-30 GB 2376', 'yes', 'light open body Truck', 'docked', 5, 'all india', 216, 2);

INSERT INTO vehicle VALUES
('KA-22 ZS 1834', 'yes', 'light open body Truck', 'in transit', 0.85, 'all india', 217, 2);

INSERT INTO vehicle VALUES
('KA-25 BC 5678', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india', 212, 1);

INSERT INTO vehicle VALUES
('WB-23 KK 6723', 'yes', 'Heavy open Body Truck', 'docked in warehouse', 32, 'all india', 202, 4);

INSERT INTO vehicle VALUES
('MH-24 AK 2003', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india', 213, 2);

INSERT INTO vehicle VALUES
('KA-63 AM 5000', 'no', 'light open Body Truck', 'docked for repair', 16, 'state permit', NULL, 1);

INSERT INTO vehicle VALUES
('KA-01 NG 5388', 'yes', 'Truck', 'in transit', 0.85, 'state permit', 215, 2);

INSERT INTO vehicle VALUES
('KA-25 UY 9845', 'no', 'Truck', 'docked', 32, 'all india permit', 218, 2);

INSERT INTO vehicle VALUES
('WB-05 HY 2389', 'yes', 'Truck', 'in transit', 32, 'all india permit', 208, 4);

INSERT INTO vehicle VALUES
('GJ-23 BG 1259', 'yes', 'Reefer Truck', 'in transit', 3, 'state permit', 219, 1);

INSERT INTO vehicle VALUES
('GJ-23 DE 5698', 'yes', 'Reefer Truck', 'in transit', 3, 'state permit', 220, 1);

INSERT INTO vehicle VALUES
('KA-22 YF 7869', 'yes', 'Reefer Truck', 'in transit ', 1.5, 'all india permit', 205, 2);

INSERT INTO vehicle VALUES
('KA-19 BG 1259', 'yes', 'Reefer Truck', 'in transit', 3, 'all india permit', 221, 2);

INSERT INTO vehicle VALUES
('KA-22 YF 2093', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india permit', 201, 2);

INSERT INTO vehicle VALUES
('DL-24 JK 2090', 'yes', 'Closed Body Truck', 'in transit', 32, 'all india permit', 207, 3);

INSERT INTO vehicle VALUES
('KA-22 LK 2493', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india permit', 211, 2);

INSERT INTO vehicle VALUES
('GJ-22 OP 5993', 'yes', 'Closed Body Truck', 'in transit', 16, 'all india permit', 214, 1);

INSERT INTO vehicle VALUES
('KA-12 CR 9993', 'yes', 'Closed Body Truck', 'in transit', 16, 'state permit', 209, 2);

INSERT INTO vehicle VALUES
('KA-26 N 0993', 'yes', 'Tanker', 'in transit', 43.5, 'all india permit', 203, 3);


-- ------------------------------------------------------------
-- Conveyance
-- ------------------------------------------------------------

INSERT INTO conveyance VALUES
('Jamshedpur', 'Ahmedabad', 1727.5, 2, 'WB-25 A 1023');

INSERT INTO conveyance VALUES
('Kolkata', 'Bijapur', 1889.5, 2, 'WB-23 KK 6723');

INSERT INTO conveyance VALUES
('Mangalore', 'Delhi', 2175.9, 3, 'KA-26 N 0993');

INSERT INTO conveyance VALUES
('Bangalore', 'Rourkela', 1823, 4, 'KA-22 YF 7869');

INSERT INTO conveyance VALUES
('Bangalore', 'Hubli', 410, 5, 'KA-22 YF 2093');

INSERT INTO conveyance VALUES
('Bhuvaneshvar', 'Bangalore', 1221, 7, 'WB-05 HY 2389');

INSERT INTO conveyance VALUES
('Bangalore', 'Bangalore', 23, 8, 'KA-12 CR 9993');

INSERT INTO conveyance VALUES
('Dandeli', 'Hubli', 73.3, 9, 'KA-22 LK 2493');

INSERT INTO conveyance VALUES
('Nagpur', 'Bangalore', 1092, 2, 'KA-25 BC 5678');

INSERT INTO conveyance VALUES
('Belgaum', 'Hubli', 97, 12, 'MH-24 AK 2003');

INSERT INTO conveyance VALUES
('Banglore', 'Bangalore', 15, 13, 'KA-01 NG 5388');

INSERT INTO conveyance VALUES
('Goa', 'Torangallu', 364, 14, 'KA-30 GB 2376');

INSERT INTO conveyance VALUES
('Banglore', 'Hubli', 97, 15, 'KA-22 ZS 1834');

INSERT INTO conveyance VALUES
('Hyderabad', 'Dharwad', 527.6, 20, 'KA-25 UY 9845');

INSERT INTO conveyance VALUES
('Anand', 'Ahmedabad', 75.6, 17, 'GJ-23 BG 1259');

INSERT INTO conveyance VALUES
('Anand', 'Gandhinagar', 97.4, 18, 'GJ-23 DE 5698');

INSERT INTO conveyance VALUES
('Kumta', 'Hubli', 158, 19, 'KA-19 BG 1259');

INSERT INTO conveyance VALUES
('Torangallu', 'Mumbai', 761, 4, 'MH-24 AK 2003');


-- ------------------------------------------------------------
-- Save inserted data
-- ------------------------------------------------------------

COMMIT;
