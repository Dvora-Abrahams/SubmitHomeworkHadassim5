insert into FamilTies(Person_Id,Relative_Id,Connection_Type)
	SELECT p.Person_Id, f.Person_Id ,
	CASE
		when p.Gender = 'Male' then 'Wife'
        when p.Gender = 'Female' then 'Husband'
	END
		from person p
		join person f on p.Person_Id = f.Spouse_Id and p.Spouse_Id = null
		where f.Spouse_Id is not null
;
SELECT * from FamilTies;

insert into Person(Spouse_Id)
	SELECT f.Person_Id 
	from person p
	join person f on p.Person_Id = f.Spouse_Id and p.Spouse_Id = null
	where f.Spouse_Id is not null
;