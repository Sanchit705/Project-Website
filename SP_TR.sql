create database employee;

create table tbl_emp_details(
	Emp_Id int Identity(1,1) Primary key,
	Emp_name nvarchar(50) ,
	Emp_designation nvarchar(50),
	Emp_salary int ,
	Emp_address nvarchar(50)
	);

insert into tbl_emp_details(Emp_name,Emp_designation,Emp_salary,Emp_address)
values
('Sanchit','Dot Net Intern',15000,'Sanpada'),
('Om','Dot Net Intern',20000,'Panvel'),
('Vidush','Dot Net Intern',25000,'Chembur'),
('Siddhi','Dot Net Intern',30000,'Airoli');

Select * from tbl_emp_details;
go

create procedure insert_data
AS
Begin
insert into tbl_emp_details(Emp_name,Emp_designation,Emp_salary,Emp_address)
values
('Ishan','Pythont Intern',30000,'Sanpada'),
('Saurabh','Accounts Intern',35000,'Kamothe')
end;

exec insert_data;
go

create procedure delete_data
As
begin
delete tbl_emp_details where Emp_Id=3
end;

exec delete_data;
go

create procedure get_data
as 
begin
select * from tbl_emp_details where Emp_Id=3
end;

exec get_data;
go

create table tbl_test_emp(
	Emp_Id int Identity(1,1) Primary key,
	Emp_name nvarchar(50) ,
	Emp_designation nvarchar(50),
	Emp_salary int ,
	Emp_address nvarchar(50)
	);

go
--create trigger trigger_insert
--ON tbl_emp_details
--AFTER INSERT
--AS 
--BEGIN
--insert into tbl_test_emp(Emp_name,Emp_designation,Emp_salary,Emp_address)
--values
--('Ishan','Pythont Intern',30000,'Sanpada'),
--('Saurabh','Accounts Intern',35000,'Kamothe')
--end;

use master;
select * from tbl_emp_details;
go;

create procedure sp_insert_data 
@Emp_name nvarchar(50),@Emp_designation nvarchar(50),@Emp_salary int,@Emp_address nvarchar(50)
AS
BEGIN
insert into tbl_emp_details(Emp_name,Emp_designation,Emp_salary,Emp_address)
values
(@Emp_name,@Emp_designation,@Emp_salary,@Emp_address)
end;


exec sp_insert_data 
@Emp_name = 'Siddhant' ,
@Emp_designation = 'Hardware Intern' ,
@Emp_salary = 40000 , 
@Emp_address = 'Vashi'
GO


DECLARE	@return_value int,
		@msg_out nvarchar(50)
exec @return_value = sp_update_data 
@Emp_Id=4,
@Emp_name='Ishan',
@msg_out=@msg_out output
SELECT	@msg_out as N'@msg_out'
SELECT 'Return Value' = @return_value
go

use employee;

create procedure sp_get_data
@Emp_Id int
AS
BEGIN
select * from tbl_emp_details where Emp_Id=@Emp_Id
END
GO

exec sp_get_data
@Emp_Id=3
GO



alter procedure sp_update_data
@Emp_name nvarchar(50),
@Emp_Id int,
@msg_out nvarchar(50) out
AS
BEGIN

	DECLARE	@test nvarchar(50)
			

	set @test=(select @Emp_name from tbl_emp_details where Emp_Id=@Emp_id);

	update tbl_emp_details
	SET Emp_name=@Emp_name,

	WHERE Emp_Id=@Emp_Id

	SET @msg_out='Updated successfully';
END
GO



declare @msg_out varchar(51)
exec sp_update_data

@Emp_Id=4,
@Emp_name='Ishan',
@msg_out = @msg_out output

select @msg_out as '@msg_out'


select * from tbl_emp_details
go





