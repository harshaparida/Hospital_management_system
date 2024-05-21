create database hospital_management_system;
use hospital_management_system;

CREATE TABLE Patient (
    P_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB VARCHAR(20),
    Age INT(20),
    Gender CHAR(1),
    Mobile BIGINT,
    Address VARCHAR(255)
);
-- Insert sample values into the Patient table
INSERT INTO Patient (First_name, Last_name, DOB, Age, Gender, Mobile, Address) VALUES
('Rajesh', 'Patel', '1992-05-15', 29, 'M', 9876543210, '23 Gandhi Nagar, Ahmedabad'),
('Anjali', 'Joshi', '1988-08-20', 33, 'F', 8765432109, '7A Lake View Apartments, Kolkata'),
('Sunil', 'Gupta', '1975-03-10', 46, 'M', 7654321098, '101 Sai Apartments, Mumbai'),
('Kavita', 'Shah', '1998-11-05', 23, 'F', 9543210876, '55 Jain Street, Chennai'),
('Manoj', 'Kumar', '1980-09-12', 41, 'M', 9321567845, '12 Patel Nagar, Hyderabad'),
('Neha', 'Verma', '1995-06-25', 26, 'F', 9132675489, '33 Gandhi Road, Pune'),
('Amit', 'Singh', '1986-02-18', 35, 'M', 9887654321, '44 Malhotra Lane, Jaipur'),
('Pooja', 'Yadav', '1972-07-30', 49, 'F', 9776543210, '99 Shastri Nagar, Lucknow'),
('Suresh', 'Sharma', '1990-04-03', 31, 'M', 9554321768, '77 Gandhi Chowk, Chandigarh'),
('Renu', 'Mehta', '1983-12-08', 38, 'F', 9898765432, '22 Gandhi Colony, Bhopal');

-- Create the Department table
CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    name_of_specilization VARCHAR(100),
    head_of_dept VARCHAR(100)
);

-- Create the Doctor table with dept_id as a foreign key
drop table doctor;
CREATE TABLE Doctor (
    D_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Gender CHAR(1),
    Phone BIGINT
);

-- Insert additional sample values into the Department table with random dept_id values
INSERT INTO Department (dept_id, name_of_specilization, head_of_dept) VALUES
(102, 'Gynecology', 'Dr. Anushka Patel'),
(105, 'Urology', 'Dr. Vikram Singh'),
(107, 'Psychiatry', 'Dr. Maya Gupta'),
(110, 'Gastroenterology', 'Dr. Arjun Sharma'),
(115, 'Radiology', 'Dr. Nisha Reddy'),
(120, 'Oncology', 'Dr. Sameer Kapoor'),
(125, 'Endocrinology', 'Dr. Riya Verma');


-- Insert sample values into the Doctor table with specified D_ID values
INSERT INTO Doctor (D_ID, First_name, Last_name, Gender, Phone) VALUES
(101, 'Dr. Sneha', 'Patel', 'F', 9456321789),
(102, 'Dr. Ankit', 'Shah', 'M', 9898765432),
(103, 'Dr. Pooja', 'Gupta', 'F', 9776543210),
(104, 'Dr. Sunil', 'Kumar', 'M', 9554321768),
(105, 'Dr. Rahul', 'Kapoor', 'M', 9332156897),
(106, 'Dr. Priya', 'Singh', 'F', 9246578103),
(107, 'Dr. Rohan', 'Verma', 'M', 9112345678),
(108, 'Dr. Neha', 'Sharma', 'F', 9456321890),
(109, 'Dr. Rajesh', 'Singh', 'M', 9898765433),
(110, 'Dr. Aarti', 'Gupta', 'F', 9776543211),
(111, 'Dr. Arjun', 'Kapoor', 'M', 9554321770),
(112, 'Dr. Meena', 'Sharma', 'F', 9332156890),
(113, 'Dr. Sanjay', 'Verma', 'M', 9246578104),
(114, 'Dr. Priyanka', 'Patel', 'F', 9112345679);
-- Create the Doctor table
CREATE TABLE Doctor_works_in_dept (
    D_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(dept_id),
    FOREIGN KEY (D_ID) REFERENCES Doctor(D_ID)
);

INSERT INTO Doctor_works_in_dept (D_ID, First_name, Last_name, Dept_ID) VALUES
(101, 'Dr. Sneha', 'Patel', 102),
(102, 'Dr. Ankit', 'Shah', 105),
(103, 'Dr. Pooja', 'Gupta', 107),
(104, 'Dr. Sunil', 'Kumar', 110),
(105, 'Dr. Rahul', 'Kapoor', 115),
(106, 'Dr. Priya', 'Singh', 120),
(107, 'Dr. Rohan', 'Verma', 125),
(108, 'Dr. Neha', 'Sharma', 102),
(109, 'Dr. Rajesh', 'Singh', 105),
(110, 'Dr. Aarti', 'Gupta', 107),
(111, 'Dr. Arjun', 'Kapoor', 110),
(112, 'Dr. Meena', 'Sharma', 115),
(113, 'Dr. Sanjay', 'Verma', 120),
(114, 'Dr. Priyanka', 'Patel', 125);

-- Create the patient_consult_doctor table
CREATE TABLE patient_consult_doctor (
    P_ID INT,
    D_ID INT,
    PRIMARY KEY (P_ID, D_ID),
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (D_ID) REFERENCES Doctor(D_ID)
);

-- Insert sample values into the patient_consult_doctor table
INSERT INTO patient_consult_doctor (P_ID, D_ID) VALUES
(1, 101),
(2, 102),
(3, 101),
(4, 104),
(5, 105),
(6,103),
(7,110),
(8,110),
(9,110),
(10,110);

CREATE TABLE patient_pays_bills (
    B_ID INT PRIMARY KEY,
    Amount DECIMAL(10,2),
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);

-- Insert sample values into the patient_pays_bills table with 4-digit B_ID values
INSERT INTO patient_pays_bills (B_ID, Amount, P_ID) VALUES
(1001, 10000.00, 1),
(1002, 10050.50, 2),
(1003, 7500.25, 3),
(1004, 254000.00, 4),
(1005, 106525.75, 5),
(1006, 8050.00, 6),
(1007, 90000.50, 7),
(1008, 10410.25, 8),
(1009, 18000.00, 9),
(1010, 19500.75, 10);

CREATE TABLE test_report_of_patient (
    T_ID INT PRIMARY KEY,
    Test_Type VARCHAR(100),
    Result VARCHAR(255),
    P_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID)
);
-- Insert sample values into the test_report_of_patient table with T_ID starting from 3 and incremented by 1
INSERT INTO test_report_of_patient (T_ID, Test_Type, Result, P_ID) VALUES
(103, 'Blood Test', 'Normal', 1),
(104, 'X-Ray', 'Negative', 2),
(105, 'MRI', 'Positive', 3),
(106, 'Ultrasound', 'Normal', 4),
(107, 'CT Scan', 'Abnormal', 5),
(108, 'Blood Test', 'Abnormal', 6),
(109, 'X-Ray', 'Normal', 7),
(110, 'MRI', 'Negative', 8),
(111, 'Ultrasound', 'Positive', 9),
(112, 'CT Scan', 'Normal', 10);

-- Create the Room table
CREATE TABLE Room (
    R_ID INT PRIMARY KEY,
    Type VARCHAR(100), 
    Capacity VARCHAR(20),
    Availability VARCHAR(10)
);

-- Insert sample values into the Room table
INSERT INTO Room (R_ID, Type, Capacity, Availability) VALUES
(1, 'General Ward', 10, 'Available'),
(2, 'Step-down Unit', 5, 'Occupied'),
(3, 'Isolation Room', 5, 'Available'),
(4, 'Dialysis Room', 5, 'Available'),
(5, 'Postoperative Care Room', 5, 'Occupied'),
(6, 'Cardiac Care Unit', 5, 'Available'),
(7, 'Intensive Care Unit', 5, 'Occupied'),
(8, 'Labor and Delivery Room', 5, 'Available'),
(9, 'Neonatal Intensive Care Unit', 5, 'Available'),
(10, 'Recovery Room', 5, 'Occupied');

CREATE TABLE patient_admitted_in_room (
    P_ID INT,
    R_ID INT,
    FOREIGN KEY (P_ID) REFERENCES Patient(P_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);

-- Inserting values into patient_admitted_in_room table
INSERT INTO patient_admitted_in_room (P_ID, R_ID) VALUES
(1, 1),  
(2, 2),  
(3, 3),
(4,1),
(5,1),
(6,1),
(7,1),
(8,2),
(9,1),
(10,4);  

CREATE TABLE Nurse (
    N_ID INT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Mobile_no BIGINT
);
INSERT INTO Nurse (N_ID, First_name, Last_name, Mobile_no) VALUES
(1, 'Priya', 'Patel', 9876543210),
(2, 'Amit', 'Sharma', 9876543211),
(3, 'Ritu', 'Verma', 9876543212),
(4, 'Vikram', 'Singh', 9876543213),
(5, 'Kavita', 'Gupta', 9876543214),
(6, 'Rohit', 'Kumar', 9876543215),
(7, 'Neha', 'Choudhury', 9876543216),
(8, 'Raj', 'Yadav', 9876543217),
(9, 'Ananya', 'Srivastava', 9876543218),
(10, 'Rakesh', 'Mishra', 9876543219);

CREATE TABLE nurse_assigned_to_room (
    N_ID INT,
    R_ID INT,
    PRIMARY KEY (N_ID, R_ID),
    FOREIGN KEY (N_ID) REFERENCES Nurse(N_ID),
    FOREIGN KEY (R_ID) REFERENCES Room(R_ID)
);

INSERT INTO nurse_assigned_to_room (N_ID, R_ID) VALUES
(1, 1),  
(2, 2),  
(3, 3),  
(4, 4),  
(5, 5),  
(6, 6),  
(7, 7),  
(8, 8),  
(9, 9),  
(10, 10); 




