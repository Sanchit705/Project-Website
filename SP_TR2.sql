create table tbl_test_emp(
	Emp_Id int Identity(1,1) Primary key,
	Emp_name nvarchar(50) ,
	Emp_designation nvarchar(50),
	Emp_salary int ,
	Emp_address nvarchar(50)
	);

go

alter procedure sp_insert_data 
@Emp_name nvarchar(50),@Emp_designation nvarchar(50),@Emp_salary int,@Emp_address nvarchar(50)
AS
BEGIN
insert into tbl_emp_details(Emp_name,Emp_designation,Emp_salary,Emp_address)
values
(@Emp_name,@Emp_designation,@Emp_salary,@Emp_address)
end;
go

exec sp_insert_data 
@Emp_name = 'Siddhant2' ,
@Emp_designation = 'Hardware Intern2' ,
@Emp_salary = 40000 , 
@Emp_address = 'Vashi2'
go

alter trigger tr_insert
ON tbl_emp_details
AFTER INSERT
AS 
BEGIN
insert into tbl_test_emp(Emp_name,Emp_designation,Emp_salary,Emp_address)
SELECT Emp_name,Emp_designation,Emp_salary,Emp_address from inserted
end;
go

SELECT * from tbl_test_emp
go

SELECT * from tbl_emp_details

use employee;


create procedure sp_delete_data
@Emp_Id int
AS 
BEGIN
delete from tbl_emp_details where Emp_Id=@Emp_Id
END;
go;

SELECT * from tbl_emp_details;
go

create trigger tr_insert_before
BEFORE DELETE 
ON tbl_emp_details
For EACH ROW	
AS 
BEGIN
	insert into tbl_test_emp(Emp_name,Emp_designation,Emp_salary,Emp_address)
	SELECT Emp_name,Emp_designation,Emp_salary,Emp_address from inserted
end;

CREATE TRIGGER tr_insert_before
BEFORE DELETE
ON table_name
FOR EACH ROW
BEGIN
    -- trigger logic
END;