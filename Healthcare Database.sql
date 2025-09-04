CREATE DATABASE HealthcareDB;
USE HealthcareDB;

-- Patients Table (stores patient details)
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

-- Doctors Table (stores doctor details)
CREATE TABLE Doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);

-- Appointments Table (connects patients and doctors)
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctors(doctor_id)
);

-- Billing Table (stores payment info)
CREATE TABLE Billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    status VARCHAR(10), -- Paid / Pending
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

-- Insert some Patients
INSERT INTO Patients (name, age, gender, phone) VALUES
('Rahul Sharma', 35, 'Male', '9876543210'),
('Priya Nair', 28, 'Female', '9876501234');

-- Insert some Doctors
INSERT INTO Doctors (name, specialization) VALUES
('Dr. Amit Verma', 'Cardiologist'),
('Dr. Sneha Rao', 'Dermatologist');

-- Insert some Appointments
INSERT INTO Appointments (patient_id, doctor_id, appointment_date) VALUES
(1, 1, '2025-08-25'),
(2, 2, '2025-08-26');

-- Insert some Billing Info
INSERT INTO Billing (patient_id, amount, status) VALUES
(1, 2500.00, 'Paid'),
(2, 1500.00, 'Pending');

--- List patients with their doctor appointments
SELECT p.name AS Patient, d.name AS Doctor, d.specialization, a.appointment_date
FROM Appointments a
JOIN Patients p ON a.patient_id = p.patient_id
JOIN Doctors d ON a.doctor_id = d.doctor_id;

--- Find unpaid bills
SELECT b.bill_id, p.name, b.amount, b.status
FROM Billing b
JOIN Patients p ON b.patient_id = p.patient_id
WHERE b.status = 'Pending';





