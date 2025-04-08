create table FamilTies(
	 Person_Id INT,
     Relative_Id INT,
     Connection_Type ENUM('Father', 'Mother', 'Brother', 'Sister', 'Son', 'Daughter', 'Husband','wife'),
     PRIMARY KEY (Person_Id, Relative_Id),
     FOREIGN KEY (Person_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE,
     FOREIGN KEY (Relative_Id) REFERENCES Person(Person_Id) ON DELETE CASCADE
    
);

select * from FamilTies;

insert into FamilTies(Person_Id,Relative_Id,Connection_Type)
	SELECT p.Person_Id, p.Father_Id , 'Father' 
		from person p
		join person f on p.Father_Id = f.Person_Id
		where p.Father_Id is not null
	UNION ALL
	SELECT p.Father_Id , p.Person_Id,
    CASE 
		when p.Gender = 'Male' THEN 'Son'
        when p.Gender = 'Female' then 'Daughter'
	END
		from Person p
		join person f on p.Father_Id = f.Person_Id
		where p.Father_Id is not null
	UNION ALL
    	SELECT p.Person_Id, p.Mother_Id , 'Mother' 
		from person p
		join person m on p.Mother_Id = m.Person_Id
		where p.Mother_Id is not null
	UNION ALL
	SELECT p.Mother_Id , p.Person_Id,
    CASE 
		when p.Gender = 'Male' THEN 'Son'
        when p.Gender = 'Female' then 'Daughter'
	END
		from Person p
		join person m on p.Mother_Id = m.Person_Id
		where p.Mother_Id is not null
;
select * from FamilTies;

insert into FamilTies(Person_Id,Relative_Id,Connection_Type)
	SELECT p.Person_Id, p.Spouse_Id ,
	CASE
		when p.Gender = 'Male' then 'Wife'
        when p.Gender = 'Female' then 'Husband'
	END
		from person p
		join person f on p.Spouse_Id = f.Person_Id
		where p.Spouse_Id is not null
;

-- insert into FamilTies(Person_Id,Relative_Id,Connection_Type)
-- 	SELECT p.Person_Id, f.Person_Id ,
-- 	CASE
-- 		when f.Gender = 'Male' then 'Brother'
--         when f.Gender = 'Female' then 'Sister'
-- 	END
-- 		from person p
-- 		join person f on p.Mother_Id = f.Mother_Id or p.Father_Id = f.Father_Id
-- 		where p.Mother_Id is not null or p.Father_Id is not null
-- ;


-- SET SQL_SAFE_UPDATES = 0;

-- DELETE FROM FamilTies
-- WHERE Connection_Type IN ('Brother', 'Sister');

-- SET SQL_SAFE_UPDATES = 1;

insert into FamilTies(Person_Id,Relative_Id,Connection_Type)
	SELECT p.Person_Id, f.Person_Id ,
	CASE
		when f.Gender = 'Male' then 'Brother'
        when f.Gender = 'Female' then 'Sister'
	END
		from person p
		join person f on p.Mother_Id = f.Mother_Id or p.Father_Id = f.Father_Id
		where (p.Mother_Id is not null or p.Father_Id is not null )and p.Person_Id != f.Person_Id
;



