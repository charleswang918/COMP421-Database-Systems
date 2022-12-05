-- Include your create table DDL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the create table ddls for the tables with foreign key references
--    ONLY AFTER the parent tables has already been created.

-- This is only an example of how you add create table ddls to this file.
--   You may remove it.

--Create Tables
CREATE TABLE Mother(
    hcid VARCHAR(50) NOT NULL,
    addr VARCHAR(50) NOT NULL,
    profession VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    bloodtype VARCHAR(10),
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (hcid)
);

CREATE TABLE Father(
    fid VARCHAR(50) NOT NULL,
    hcid VARCHAR(50),
    addr VARCHAR(50),
    profession VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    dob DATE NOT NULL,
    bloodtype VARCHAR(10),
    email VARCHAR(50),
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (fid)
);

CREATE TABLE HealthcareInstitution(
    instid INT NOT NULL,
    web VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    addr VARCHAR(100) NOT NULL,
    PRIMARY KEY (instid)
);

CREATE TABLE CommunityClinic(
    instid INT NOT NULL,
    PRIMARY KEY (instid),
    FOREIGN KEY (instid) REFERENCES HealthcareInstitution(instid)
);

CREATE TABLE BirthCenter(
    instid INT NOT NULL,
    PRIMARY KEY (instid),
    FOREIGN KEY (instid) REFERENCES HealthcareInstitution(instid)
);

CREATE TABLE Midwife(
    practid VARCHAR(50) NOT NULL,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    instid INT NOT NULL,
    PRIMARY KEY (practid),
    FOREIGN KEY (instid) REFERENCES HealthcareInstitution(instid)
);

CREATE TABLE Parent(
    pid VARCHAR(50) NOT NULL,
    hcid VARCHAR(50) NOT NULL,
    fid VARCHAR(50),
    PRIMARY KEY (pid),
    FOREIGN KEY (hcid) REFERENCES Mother(hcid),
    FOREIGN KEY (fid) REFERENCES Father(fid)
);

CREATE TABLE InfoSession(
    infoid INT NOT NULL,
    language VARCHAR(50) NOT NULL,
    infodate DATE NOT NULL,
    infotime time NOT NULL,
    practid VARCHAR(50) NOT NULL,
    pid VARCHAR(50) NOT NULL,
    PRIMARY KEY (infoid),
    FOREIGN KEY (practid) REFERENCES Midwife(practid),
    FOREIGN KEY (pid) REFERENCES Parent(pid)
);

CREATE TABLE Pregnancy(
    pregnum INT NOT NULL,
    pid VARCHAR(50) NOT NULL,
    birthplace VARCHAR(50) NOT NULL,
    expdatebirth DATE NOT NULL,
    expdatelastperiod DATE NOT NULL,
    expdateusound DATE NOT NULL,
    finalestimatedate DATE NOT NULL,
    ppractid VARCHAR(50) NOT NULL,
    bpractid VARCHAR(50) NOT NULl,
    instid INT,
    PRIMARY KEY (pregnum, pid),
    FOREIGN KEY (pid) REFERENCES Parent(pid),
    FOREIGN KEY (ppractid) REFERENCES Midwife(practid),
    FOREIGN KEY (bpractid) REFERENCES Midwife(practid),
    FOREIGN KEY (instid) REFERENCES HealthcareInstitution(instid)
);

CREATE TABLE Appointment(
    appid INT NOT NULL,
    appdate DATE NOT NULL,
    apptime time NOT NULL,
    pregnum INT NOT NULL,
    practid VARCHAR(50) NOT NULL,
    pid VARCHAR(50) NOT NULL,
    PRIMARY KEY (appid),
    FOREIGN KEY (pregnum, pid) REFERENCES Pregnancy(pregnum, pid),
    FOREIGN KEY (practid) REFERENCES Midwife(practid)
);

CREATE TABLE Observation(
    obsid INT NOT NULL,
    obstime time NOT NULL,
    obsdate DATE NOT NULL,
    obsnote VARCHAR(150) NOT NULL,
    appid INT NOT NULL,
    PRIMARY KEY (obsid),
    FOREIGN KEY (appid) REFERENCES Appointment(appid)
);

CREATE TABLE Baby(
    babyid VARCHAR(50) NOT NULL,
    babyname VARCHAR(50),
    dob DATE NOT NULL,
    gender VARCHAR(10) NOT NULL,
    bloodtype VARCHAR(5) NOT NULL,
    borntime time NOT NULL,
    numofbaby INT NOT NULL,
    pregnum INT NOT NULL,
    pid VARCHAR(50) NOT NULL,
    PRIMARY KEY (babyid),
    FOREIGN KEY (pregnum, pid) REFERENCES Pregnancy(pregnum, pid)
);

CREATE TABLE LabTech(
    techid VARCHAR(50) NOT NULl,
    name VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (techid)
);

CREATE TABLE MedicalTest(
    testid INT NOT NULL,
    presdate DATE NOT NULL,
    sampledate DATE NOT NULL,
    labdate DATE NOT NULL,
    testtype VARCHAR(20) NOT NULL,
    results VARCHAR(50) NOT NULL,
    practid VARCHAR(50) NOT NULL,
    pid VARCHAR(50) NOT NULL,
    pregnum INT NOT NULL,
    babyid VARCHAR(50) NOT NULL,
    techid VARCHAR(50) NOT NULL,
    PRIMARY KEY (testid),
    FOREIGN KEY (practid) REFERENCES Midwife(practid),
    FOREIGN KEY (pid, pregnum) REFERENCES Pregnancy(pid, pregnum),
    FOREIGN KEY (babyid) REFERENCES Baby(babyid),
    FOREIGN KEY (techid) REFERENCES LabTech(techid)
);

