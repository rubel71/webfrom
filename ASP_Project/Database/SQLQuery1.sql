create database SchoolSysDb
go
use SchoolSysDb
create table Class(
	classId int primary key identity(1,1) not null,
	className varchar(50) null
)
select * from Class
go
select Row_NUMBER() over(order by(select 1)) as[Sr.No],classId,className from Class
create table Subject(
	subjectId int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	subjectName varchar(50) null
)
go
create table Student(
	studentId int primary key identity(1,1) not null,
	name varchar(50) not null,
	DOB date null,
	gender varchar(50) null,
	mobile varchar(15) null,
	rollNo varchar(50) null,
	address varchar(max) null,
	photo nvarchar(50) null,
	classId int foreign key references Class (classId) null
)
go
insert into Student values ('Rubel','10/10/2000','Male','01677379471','01','Dhaka',null,1)
select* from Student


create table Teacher(
	teacherId int primary key identity(1,1) not null,
	name varchar(50) not null,
	DOB date null,
	gender varchar(50) null,
	mobile varchar(15) null,
	address varchar(max) null,
	email varchar(50) null,
	password varchar(20) null,
	photo nvarchar(50) null
)
go
select* from Teacher

create table TeacherSubject(
	Id int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	subjectId int foreign key references Subject (subjectId) null,
	teacherId int foreign key references Teacher (teacherId) null

)
go

create table TeacherAttendance(
	Id int primary key identity(1,1) not null,
	teacherId int foreign key references Teacher (teacherId) null,
	status bit null,
	date date null,
)
go
create table StudentAttendance(
	Id int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	subjectId int foreign key references Subject (subjectId) null,
	rollNo varchar(50) null,
	status bit null,
	date date null
)
go
create table Fees(
	FeesId int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	FeesAmount int null
)
go

create table Exam(
	ExamId int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	subjectId int foreign key references Subject (subjectId) null,
	rollNo varchar(50) null,
	totalMarks int null,
	outOfMarks int null
)
go
insert into Exam values (1,1,01,700,1000)
select* from Exam

create table Expense(
	expenseId int primary key identity(1,1) not null,
	classId int foreign key references Class (classId) null,
	subjectId int foreign key references Subject (subjectId) null,
	chargeAmount int null
)
go
insert into Expense values (1,1,5000)
select* from Expense
