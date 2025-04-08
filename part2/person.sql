create database familyTree;

CREATE TABLE Person (
    Person_Id VARCHAR(9) PRIMARY KEY,  
    Personal_Name VARCHAR(50),
    Family_Name VARCHAR(50),
    Gender ENUM('Male', 'Female'),
    Father_Id VARCHAR(9),
    Mother_Id VARCHAR(9),
    Spouse_Id VARCHAR(9),
    FOREIGN KEY (Father_Id) REFERENCES Person(Person_Id) ON DELETE SET NULL,
    FOREIGN KEY (Mother_Id) REFERENCES Person(Person_Id) ON DELETE SET NULL,
    FOREIGN KEY (Spouse_Id) REFERENCES Person(Person_Id) ON DELETE SET NULL
);

INSERT INTO People (Person_Id, Personal_Name, Family_Name, Gender, Father_Id, Mother_Id) VALUES
('100000001', 'David', 'Cohen', 'Male', NULL, NULL),
('100000002', 'Sarah', 'Cohen', 'Female', NULL, NULL),
('100000038', 'Mordechai', 'Cohen', 'Male', '100000001', '100000002'),
('100000039', 'Chana', 'Katz', 'Female', '100000001', '100000002'),
('100000003', 'Yossi', 'Cohen', 'Male', '100000001', '100000002'),
('100000004', 'Rivka', 'Levi', 'Female', '100000001', '100000002'),
('100000005', 'Moshe', 'Levi', 'Male', NULL, NULL),
('100000006', 'Shira', 'Levi', 'Female', '100000005', '100000004'),
('100000007', 'Eli', 'Levi', 'Male', '100000005', '100000004'),
('100000008', 'Yaakov', 'Weiss', 'Male', NULL, NULL),
('100000009', 'Miriam', 'Weiss', 'Female', NULL, NULL),
('100000010', 'Rachel', 'Weiss', 'Female', '100000008', '100000009'),
('100000011', 'Avi', 'Katz', 'Male', NULL, NULL),
('100000012', 'Noa', 'Katz', 'Female', '100000011', '100000010'),
('100000013', 'Dan', 'Katz', 'Male', '100000011', '100000010'),
('100000014', 'Shmuel', 'Rosen', 'Male', NULL, NULL),
('100000015', 'Esther', 'Rosen', 'Female', NULL, NULL),
('100000016', 'Yonatan', 'Rosen', 'Male', '100000014', '100000015'),
('100000017', 'Tamar', 'Rosen', 'Female', '100000014', '100000015'),
('100000018', 'Baruch', 'Friedman', 'Male', NULL, NULL),
('100000019', 'Leah', 'Friedman', 'Female', NULL, NULL),
('100000020', 'Chaim', 'Friedman', 'Male', '100000018', '100000019'),
('100000021', 'Maya', 'Friedman', 'Female', '100000018', '100000019'),
('100000022', 'Eliyahu', 'Goldberg', 'Male', NULL, NULL),
('100000023', 'Devorah', 'Goldberg', 'Female', NULL, NULL),
('100000024', 'Yael', 'Goldberg', 'Female', '100000022', '100000023'),
('100000025', 'Itamar', 'Goldberg', 'Male', '100000022', '100000023'),
('100000026', 'Aharon', 'Mizrachi', 'Male', NULL, NULL),
('100000027', 'Batya', 'Mizrachi', 'Female', NULL, NULL),
('100000028', 'Omer', 'Mizrachi', 'Male', '100000026', '100000027'),
('100000029', 'Hadas', 'Mizrachi', 'Female', '100000026', '100000027'),
('100000030', 'Gideon', 'Shwartz', 'Male', NULL, NULL),
('100000031', 'Naomi', 'Shwartz', 'Female', NULL, NULL),
('100000032', 'Ron', 'Shwartz', 'Male', '100000030', '100000031'),
('100000033', 'Efrat', 'Shwartz', 'Female', '100000030', '100000031'),
('100000034', 'Tzvi', 'Berger', 'Male', NULL, NULL),
('100000035', 'Rina', 'Berger', 'Female', NULL, NULL),
('100000036', 'Avital', 'Berger', 'Female', '100000034', '100000035'),
('100000037', 'Nir', 'Berger', 'Male', '100000034', '100000035'),
('100000040', 'Eliana', 'Shwartz', 'Female', '100000034', '100000035');

UPDATE Person SET Spouse_Id = '100000002' WHERE Person_Id = '100000001';
UPDATE Person SET Spouse_Id = '100000001' WHERE Person_Id = '100000002';

UPDATE Person SET Spouse_Id = '100000004' WHERE Person_Id = '100000005';
UPDATE Person SET Spouse_Id = '100000005' WHERE Person_Id = '100000004';

UPDATE Person SET Spouse_Id = '100000008' WHERE Person_Id = '100000009';
UPDATE Person SET Spouse_Id = '100000009' WHERE Person_Id = '100000008';

UPDATE Person SET Spouse_Id = '100000010' WHERE Person_Id = '100000011';
UPDATE Person SET Spouse_Id = '100000011' WHERE Person_Id = '100000010';

UPDATE Person SET Spouse_Id = '100000014' WHERE Person_Id = '100000015';
UPDATE Person SET Spouse_Id = '100000015' WHERE Person_Id = '100000014';

UPDATE Person SET Spouse_Id = '100000018' WHERE Person_Id = '100000019';
UPDATE Person SET Spouse_Id = '100000019' WHERE Person_Id = '100000018';

UPDATE Person SET Spouse_Id = '100000022' WHERE Person_Id = '100000023';
UPDATE Person SET Spouse_Id = '100000023' WHERE Person_Id = '100000022';

UPDATE Person SET Spouse_Id = '100000026' WHERE Person_Id = '100000027';
UPDATE Person SET Spouse_Id = '100000027' WHERE Person_Id = '100000026';

UPDATE Person SET Spouse_Id = '100000030' WHERE Person_Id = '100000031';
UPDATE Person SET Spouse_Id = '100000031' WHERE Person_Id = '100000030';

UPDATE Person SET Spouse_Id = '100000034' WHERE Person_Id = '100000035';
UPDATE Person SET Spouse_Id = '100000035' WHERE Person_Id = '100000034';

UPDATE Person SET Spouse_Id = '100000013' WHERE Person_Id = '100000039';
UPDATE Person SET Spouse_Id = '100000039' WHERE Person_Id = '100000013';

UPDATE Person SET Spouse_Id = '100000032' WHERE Person_Id = '100000040';
UPDATE Person SET Spouse_Id = '100000040' WHERE Person_Id = '100000032';










