-- Include your INSERT SQL statements in this file.
-- Make sure to terminate each statement with a semicolon (;)

-- LEAVE this statement on. It is required to connect to your database.
CONNECT TO cs421;

-- Remember to put the INSERT statements for the tables with foreign key references
--    ONLY AFTER the parent tables!

-- This is only an example of how you add INSERT statements to this file.
--   You may remove it.

-- Load Data
INSERT INTO Mother VALUES('NICA19900101', '60 Rue Cariter', 'Doctor', 'Nicola Andre', '1990-01-01',
                          'A', 'nicole@test.com', '+14366278361');
INSERT INTO Mother VALUES('VICG19890327', '65 University Ave', 'Driver', 'Victoria Gutierrez', '1989-03-27',
                          'B', 'victoria7@mail.com', '+1138829381');
INSERT INTO Mother VALUES('ALIW20000515', '1080 Bay St', 'Student', 'Alice Wang', '2000-05-15',
                          'O', 'alicewang@mail.com', '+14386776453');
INSERT INTO Mother VALUES('MIXC19850323', '50 Wellesley St', 'Cook', 'Mixian Chen', '1985-03-23',
                          'AB', 'meichen@gmail.com', '+1778987372');
INSERT INTO Mother VALUES('DORZ19970401', '501 Yonge St', 'House Wife', 'Dora Zhang', '1997-04-01',
                          'O', 'dorazhang1997@gmail.com', '+17556254187');
INSERT INTO Mother VALUES('ABBX19900302', '1450 King St', 'Teacher', 'Abby Xin', '1990-03-02',
                          'A', 'abby@mail.com', '+15166418472');

INSERT INTO Father VALUES('niko001', 'NIKW19990918', '1080 Bay St', 'Programmer', 'Niko Wang', '1999-09-18',
                          'B', 'niko@test.com', '+14385799933');
INSERT INTO Father VALUES('cwang131', NULL, '501 Yonge St', 'Bank Manager', 'Charles Wang', '1990-07-16',
                          'A', NULL, '+15156150510');
INSERT INTO Father VALUES('devid246', 'DEVW19930101', NULL, 'Police Officer', 'Devid Warner', '1993-01-01',
                          'A', 'devid@mail.com', '+132638391733');
INSERT INTO Father VALUES('ljames23', 'LEBJ19880808', '955 Bay St', 'Basketball Player', 'Lebron James',
                          '1988-08-08', 'B', NULL, '+14386502855');
INSERT INTO Father VALUES('kevin237', 'KEVD19920223', '11 Queens St', 'Farmer', 'Kevin Durant', '1992-02-23',
                          'AB', 'kevin@qq.com', '+12556776453');

INSERT INTO HealthcareInstitution VALUES(001, 'www.lhin.com', 'Local Health Integration Network',
                                         '+9233243423', 'lhin@info.com', '1360 Notre-Dame St W');
INSERT INTO HealthcareInstitution VALUES(002, 'www.chc.com', 'Community Health Centres',
                                         '+7393938576', 'chc@mail.com', '4500 WEllington St');
INSERT INTO HealthcareInstitution VALUES(003, 'www.lacsaintlouis.com', 'Lac-Saint-Louis',
                                         '+4367195867', 'lacsaintlouis@mail.com', '103 Rue Jacques-le Ber');
INSERT INTO HealthcareInstitution VALUES(004, 'www.ehealth.com', 'eHealth Ontraio', '+5638164850',
                                         'ehealth@info.com', '1600 University Rd');
INSERT INTO HealthcareInstitution VALUES(005, 'www.misshospital.com', 'Mississauga Hospital',
                                         '+3385869274', 'misshosp@mail.com', '1107 Lorne Park Rd');

INSERT INTO CommunityClinic VALUES (001);
INSERT INTO CommunityClinic VALUES (002);
INSERT INTO CommunityClinic VALUES (003);
INSERT INTO CommunityClinic VALUES (004);

INSERT INTO BirthCenter VALUES (003);
INSERT INTO BirthCenter VALUES (004);
INSERT INTO BirthCenter VALUES (005);

INSERT INTO Midwife VALUES('oashley188', 'Olivia Ashley', 'olivia66@mail.com', '+4298506933', 001);
INSERT INTO Midwife VALUES('eelizabeth873', 'Emma Elizabeth', 'emma@gmail.com', '+166482642', 002);
INSERT INTO Midwife VALUES('asusan472', 'Ava Susan', 'avasusan@mail.com', '+1758275024', 003);
INSERT INTO Midwife VALUES('cjane671', 'Charlotte Jane', 'charj52@mail.com', '+1678461942', 004);
INSERT INTO Midwife VALUES('semily123', 'Sophia Emily', 'sophia@qq.com', '+4649164242', 005);
INSERT INTO Midwife VALUES('cocomia785', 'Mia Coco', 'cocomia@mial.com', '+3518468461', 002);
INSERT INTO Midwife VALUES('mgirard121', 'Marion Girard', 'marion@qq.com', '+1425583752', 003);

INSERT INTO Parent VALUES('aliceniko001', 'ALIW20000515', 'niko001');
INSERT INTO Parent VALUES('nicola001', 'NICA19900101', NULL);
INSERT INTO Parent VALUES('victoriadevid001', 'VICG19890327', 'devid246');
INSERT INTO Parent VALUES('mixianjames001', 'MIXC19850323', 'ljames23');
INSERT INTO Parent VALUES('doracharles001', 'DORZ19970401', 'cwang131');
INSERT INTO Parent VALUES('abbykevin001', 'ABBX19900302', 'kevin237');

INSERT INTO InfoSession VALUES(001,'English','2021-12-23','11:00:00', 'asusan472', 'aliceniko001');
INSERT INTO InfoSession VALUES(002,'English','2021-11-20','12:00:00', 'cjane671', 'nicola001');
INSERT INTO InfoSession VALUES(003,'French','2021-12-19','10:30:00', 'eelizabeth873', 'mixianjames001');
INSERT INTO InfoSession VALUES(004,'French','2021-11-11','14:00:00', 'cocomia785', 'victoriadevid001');
INSERT INTO InfoSession VALUES(005,'Chinese','2021-12-01','12:30:00', 'mgirard121', 'doracharles001');
INSERT INTO InfoSession VALUES(006, 'English', '2022-01-01', '12:00:00', 'semily123', 'abbykevin001');

INSERT INTO Pregnancy VALUES(1, 'victoriadevid001', 'birthing center', '2020-04-01', '2020-04-01', '2020-04-03', '2020-04-04',
                             'asusan472', 'oashley188', 004);
INSERT INTO Pregnancy VALUES(1, 'aliceniko001', 'home', '2022-06-06', '2022-06-03', '2022-06-08', '2022-06-07',
                             'oashley188', 'cocomia785', NULL);
INSERT INTO Pregnancy VALUES(3, 'nicola001', 'birthing center', '2022-01-01', '2022-01-03', '2021-12-29', '2022-01-05',
                             'oashley188', 'eelizabeth873', 003);
INSERT INTO Pregnancy VALUES(2, 'victoriadevid001', 'birthing center', '2022-07-10', '2022-07-04', '2022-07-01', '2022-07-01',
                              'mgirard121', 'cjane671', 004);
INSERT INTO Pregnancy VALUES(2, 'mixianjames001', 'birthing center', '2022-07-15', '2022-07-18', '2022-07-20', '2022-07-16',
                             'mgirard121', 'cocomia785', 003);
INSERT INTO Pregnancy VALUES(1, 'doracharles001', 'birthing center', '2022-07-18', '2022-07-20', '2022-07-19', '2022-07-15',
                             'mgirard121', 'asusan472', 005);
INSERT INTO Pregnancy VALUES(1, 'abbykevin001', 'birthing center', '2022-07-01', '2022-07-01', '2022-07-04', '2022-07-03',
                             'semily123', 'asusan472', 005);

INSERT INTO Appointment VALUES(001, '2021-12-10', '10:00:00', 3, 'oashley188', 'nicola001');
INSERT INTO Appointment VALUES(002, '2022-03-18', '14:00:00', 1, 'oashley188', 'aliceniko001');
INSERT INTO Appointment VALUES(003, '2022-03-21', '14:00:00', 1, 'mgirard121', 'doracharles001');
INSERT INTO Appointment VALUES(004, '2022-03-22', '11:00:00', 2, 'mgirard121', 'mixianjames001');
INSERT INTO Appointment VALUES(005, '2022-03-25', '12:30:00', 2, 'mgirard121', 'victoriadevid001');
INSERT INTO Appointment VALUES(006, '2022-04-01', '15:00:00', 1, 'oashley188', 'aliceniko001');
INSERT INTO Appointment VALUES(007, '2022-04-06', '13:00:00', 2, 'mgirard121', 'mixianjames001');
INSERT INTO Appointment VALUES(008, '2022-04-14', '15:00:00', 1, 'semily123', 'abbykevin001');

INSERT INTO Observation VALUES(001, '11:00:00', '2021-12-10', 'ObsNote#1', 001);
INSERT INTO Observation VALUES(002, '15:00:00', '2022-03-18', 'ObsNote#2', 002);
INSERT INTO Observation VALUES(003, '12:00:00', '2022-03-21', 'ObsNote#3', 003);
INSERT INTO Observation VALUES(004, '13:00:00', '2022-03-22', 'ObsNote#4', 004);
INSERT INTO Observation VALUES(005, '13:30:00', '2022-03-25', 'ObsNote#5', 005);
INSERT INTO Observation VALUES(006, '16:00:00', '2022-04-01', 'ObsNote#6', 006);
INSERT INTO Observation VALUES(007, '14:10:00', '2022-04-06', 'ObsNote#7', 007);
INSERT INTO Observation VALUES(008, '16:00:00', '2022-04-14', 'ObsNote#8', 008);

INSERT INTO Baby VALUES('jw001', 'Jaden Warner', '2020-04-05', 'M', 'O', '07:00:00', 1, 1, 'victoriadevid001');
INSERT INTO Baby VALUES('tw001', 'Thomas Wang', '2022-06-09', 'M', 'A', '09:00:00', 1, 1, 'aliceniko001');
INSERT INTO Baby VALUES('sa001', 'Sarah Andre', '2022-01-02', 'F', 'O', '14:00:00', 1, 3, 'nicola001');
INSERT INTO Baby VALUES('ew001', 'Elaine Warner', '2022-07-02', 'F', 'B', '10:00:00', 1, 2, 'victoriadevid001');
INSERT INTO Baby VALUES('hw001', 'Hailey Warner', '2022-07-02', 'F', 'B', '11:00:00', 2, 2, 'victoriadevid001');
INSERT INTO Baby VALUES('aj001', 'Anthony James', '2022-07-03', 'M', 'AB', '01:00:00', 1, 2, 'mixianjames001');
INSERT INTO Baby VALUES('dw001', 'Donald Wang', '2022-07-20', 'M', 'A', '12:00:00', 1, 1, 'doracharles001');
INSERT INTO Baby VALUES('rd001', 'Rock Durant', '2022-07-07', 'M', 'A', '16:30:00', 1, 1, 'abbykevin001');

INSERT INTO LabTech VALUES('rd001', 'Robert Donny', '+18472642748');
INSERT INTO LabTech VALUES('jj001', 'John Josh', '+1248326174');
INSERT INTO LabTech VALUES('pp001', 'Peter Pan', '+1495716491');
INSERT INTO LabTech VALUES('mh001', 'Mark He', '+15146471644');
INSERT INTO LabTech VALUES('wy001', 'William Yan', '+1231537451');

INSERT INTO MedicalTest VALUES(001, '2020-03-03', '2020-03-03', '2020-03-04', 'blood iron', 'result#0',
                               'asusan472', 'victoriadevid001', 1, 'jw001', 'jj001');
INSERT INTO MedicalTest VALUES(002, '2022-05-01', '2022-05-02', '2022-05-03', 'blood iron', 'result#1',
                               'oashley188', 'aliceniko001', 1, 'tw001', 'rd001');
INSERT INTO MedicalTest VALUES(003, '2022-05-23', '2022-05-24', '2022-05-25', 'ultrasound', 'result#2',
                               'oashley188', 'nicola001', 3, 'sa001', 'jj001');
INSERT INTO MedicalTest VALUES(004, '2022-06-01', '2022-06-02', '2022-06-03', 'blood iron', 'result#3',
                               'mgirard121', 'victoriadevid001', 2, 'ew001', 'pp001');
INSERT INTO MedicalTest VALUES(005, '2022-06-01', '2022-06-02', '2022-06-03', 'ultrasound', 'result#4',
                               'mgirard121', 'victoriadevid001', 2, 'hw001', 'pp001');
INSERT INTO MedicalTest VALUES(006, '2022-06-15', '2022-06-15', '2022-06-16', 'ultrasound', 'result#5',
                               'mgirard121', 'mixianjames001', 2, 'aj001', 'mh001');
INSERT INTO MedicalTest VALUES(007, '2022-06-20', '2022-06-21', '2022-06-21', 'ultrasound', 'result#6',
                               'mgirard121', 'doracharles001', 1, 'dw001', 'wy001');
INSERT INTO MedicalTest VALUES(008, '2022-06-21', '2022-06-22', '2022-06-22', 'blood iron', 'result#7',
                               'semily123', 'abbykevin001', 1, 'rd001', 'jj001');

