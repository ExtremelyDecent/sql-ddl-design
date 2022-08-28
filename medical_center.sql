DROP DATABASE IF EXISTS medical_center;

CREATE DATABASE medical_center;

\c medical_center

CREATE TABLE doctors
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  field TEXT NOT NULL
);
CREATE TABLE patients
(
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  phone_num INT,
  birthdate DATE
);
CREATE TABLE diseases
(
  id SERIAL PRIMARY KEY,
  name TEXT UNIQUE NOT NULL,
  info TEXT
);
CREATE TABLE diagnoses
(
  id SERIAL PRIMARY KEY,
  disease_id INT REFERENCES diseases
);
CREATE TABLE visits
(
  id SERIAL PRIMARY KEY,
  doctor_id INT REFERENCES doctors, 
  patient_id INT REFERENCES patients,
  diagnosis_id INT REFERENCES diagnoses,
  visit_time TIMESTAMP NOT NULL
);



