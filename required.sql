


CREATE TABLE APPLICATION (
Application_id INT PRIMARY KEY, 
full_name VARCHAR2(20) NOT NULL, 
date_of_birth DATE NOT NULL,
highest_qualification VARCHAR2(10) NOT NULL, 
marks_obtained NUMBER NOT NULL, 
goals VARCHAR2(20), 
email_id VARCHAR2(20) REFERENCES Participant(email_id), 
Scheduled_program_id VARCHAR2(5) REFERENCES Programs_Scheduled(Scheduled_program_id), 
status VARCHAR2(10) DEFAULT 'applied' CHECK(status IN ('applied', 'accepted', 'rejected', 'confirmed')),
Date_Of_Interview DATE
);

CREATE TABLE Programs_Offered (
ProgramName VARCHAR2(5) PRIMARY KEY, 
description VARCHAR2(40), 
applicant_eligibility VARCHAR2(40) NOT NULL, 
duration NUMBER NOT NULL, 
degree_certificate_offered VARCHAR2(10) NOT NULL
);

CREATE TABLE Programs_Scheduled(
Scheduled_program_id VARCHAR2(5) PRIMARY KEY, 
ProgramName VARCHAR2(5) REFERENCES Programs_Offered(ProgramName), 
City VARCHAR2(20) NOT NULL, 
State VARCHAR2(20) NOT NULL, 
Zipcode int NOT NULL, 
start_date DATE NOT NULL, 
end_date DATE NOT NULL, 
sessions_per_week NUMBER NOT NULL
);

CREATE TABLE Participant(
Roll_no VARCHAR2(5) UNIQUE NOT NULL, 
email_id VARCHAR2(20) PRIMARY KEY,
Application_id REFERENCES APPLICATION(Application_id) , 
Scheduled_program_id VARCHAR2(5) REFERENCES Programs_Scheduled(Scheduled_program_id)
);

CREATE TABLE Users(
login_id VARCHAR2(5) PRIMARY KEY, 
password VARCHAR2(10) NOT NULL, 
role VARCHAR2(5) CHECK(role IN ('mac', 'admin','student'))
);

ALTER TABLE application
ADD FOREIGN KEY (email_id) REFERENCES Participant(email_id);