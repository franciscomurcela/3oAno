CREATE TABLE department (
  Dname varchar(30),
  Dnumber int PRIMARY KEY,
  Mgr_ssn char(9),
  Mgr_start_date date
);

CREATE TABLE employee (
  Fname varchar(20),
  Minit char(1),
  Lname varchar(30),
  Ssn char(9) PRIMARY KEY,
  Bdate date,
  [Address] varchar(50),
  Sex char(1),
  Salary float(7),
  Super_ssn char(9),
  Dno int references Department (Dnumber),
);

CREATE TABLE dept_location (
  Dnumber int references Department(Dnumber),
  Dlocation varchar(30),
  primary key (Dnumber,Dlocation),
);

CREATE TABLE project (
  Pname varchar(30),
  Pnumber int PRIMARY KEY,
  Plocation varchar(30),
  Dnum int references Department(Dnumber),
);

CREATE TABLE works_on (
  Essn char(9) references Employee (Ssn),
  Pno int references Project (Pnumber),
  [Hours] int,
  primary key (Essn,Pno),
);

CREATE TABLE dependent (
  Essn char(9) references Employee (Ssn),
  Dependent_name varchar(20),
  Sex char(1),
  Bdate date,
  Relationship varchar(20)
  primary key (Essn,Dependent_name),
);