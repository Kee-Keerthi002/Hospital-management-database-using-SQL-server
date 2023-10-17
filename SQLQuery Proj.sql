create table Patient(

Patient_ID int NOT NULL,
Patient_Name varchar (100),
Patient_Age int,
Patient_Address varchar (100),
Patient_Gender varchar (100),
Disease varchar (100)

);

Alter Table Patient
Add Doctor_ID int NOT NULL

Alter table Patient
Drop column Patient_Gender

Alter table Patient 
Add constraint Patient_PK
Primary Key (Patient_ID);

Create table Doctor(

Doctor_ID int NOT NULL,
Doctor_Name varchar (100),
Doctor_Age varchar (100),
Doctor_Gender varchar(100),
Doctor_Address varchar (100),

Constraint Doctor_PK Primary Key (Doctor_ID)
);

Create table Room(

Room_No varchar (50) NOT NULL,
Room_Type varchar (100),
Room_Status varchar (100),

Constraint Roon_PK Primary Key (Room_No)

);

Alter table Patient
Add Constraint Patient_Doc_FK
Foreign Key (Doctor_ID) references Doctor (Doctor_ID)


Create table Check_IN_OUT (

Patient_ID int NOT NULL,
Room_No varchar (50),
Join_Date Datetime,
Leave_Date Datetime,

Constraint Patient_IN_FK
Foreign Key (Patient_ID) references Patient(Patient_ID),

Constraint Room_IN_FK_FK
Foreign Key (Room_No) References Room (Room_No)

);

Insert into Doctor 
values (1, 'Sam', 55, 'Female', 'Burman'),
(2, 'Pam', 55, 'Male', 'France'),
(3, 'Harry', 55, 'Male', 'Spain'),
(4, 'Hermoine', 55, 'Female', 'Paris');


 Insert into Patient 
 values (1, 'Joe', 21, 'China', 'HIV', 3),
 (2, 'Mark', 20, 'US', 'Flu', 2),
 (3, 'Antony', 25, 'Sydney', 'Respiratory infection', 4),
 (4, 'David', 31, 'Denmark', 'Asthama', 5);

 Insert into  Room
 values (1, 'Preiumum', 'Empty'),
 (2, 'Suite', 'Reserved'),
 (3, 'Preiumum', 'Reserved'),
 (4, 'Day care', 'Reserved'),
 (5, 'Preiumum', 'Empty');

 Insert into Check_IN_OUT
 values (1, 2, '2020-01-20', ''),
(2, 4, '2020-01-10', ''),
(3, 2, '2020-01-20', '2020-01-24'),
(4, 5, '2020-01-02', '2020-01-12');

Update Check_IN_OUT
Set Leave_Date = NULL
where Patient_ID = 1 or Patient_ID = 3;

Delete from Doctor
where Doctor_ID = 4;

Select *
from Doctor

Select * 
from Doctor 
where Doctor_Age = 55

Select Doctor_Name
from Doctor

Select Patient_Name, Disease, Doctor_Name
from Patient, Doctor
where Patient.Patient_ID = Doctor.Doctor_ID

select Patient.Patient_Name, Patient.Disease, Room.Room_No, Room.Room_Status,Check_IN_OUT.Join_Date, Check_IN_OUT.Leave_Date
from Patient, Check_IN_OUT, Room
where Patient.Patient_ID = Check_IN_OUT.Patient_ID and Check_IN_OUT.Room_No = Room.Room_No and Check_IN_OUT.Leave_Date != ''

select Patient.Patient_Name, Patient.Patient_ID, Doctor.Doctor_Name, Patient.Disease, Doctor.Doctor_Age
from Patient, Doctor
where Patient.Doctor_ID = Doctor.Doctor_ID and Doctor.Doctor_Age > 55

select Patient.Patient_ID, Patient.Patient_Name, Patient.Disease, Check_IN_OUT.Join_Date, Check_IN_OUT.Leave_Date, Room.Room_No, Room.Room_Status
from Patient, Room, Check_IN_OUT
where Patient.Patient_ID = Check_IN_OUT.Patient_ID and Check_IN_OUT.Room_No = Room.Room_No
order by Patient.Patient_ID desc
