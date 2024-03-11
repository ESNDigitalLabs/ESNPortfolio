-- Database Project - Software Development - Erica Samba-Ngoie --

Create Database LeisureCentre;

Use LeisureCentre;

create table Course
(CourseId int primary key,
Level int, 
Sessions int, 
Instructor varchar(20) not null,
startDate date, 
LessonTime time
);
create table Lessons 
(LessonId int primary key,
CourseId int,
MemberId int
);
create table Members
(MemberId int primary key,
FirstName varchar(10),
Surname varchar(20),
DOB date, 
Address varchar(50),
City varchar(20)
);

show tables;
describe course;
describe members;
describe lessons;


insert into Course (CourseId, Level, Sessions, Instructor, startDate, LessonTime) 
values (1, 4, 29, 'Opal Everingham', '2021-12-29', '13:34:28'),
(2, 5, 10, 'Morganne Papierz', '2023-08-23', '18:12:31'),
(3, 5, 35, 'Dorris Dodd', '2021-04-22', '7:46:59'),
(4, 2, 2, 'Alida Tabard', '2023-08-31', '7:38:43'),
(5, 5, 35, 'Cele Ferenc', '2021-02-10', '13:26:26'),
(6, 4, 41, 'Karry Wheadon', '2023-06-05', '15:00:30'),
(7, 6, 24, 'Myrilla Nicolson', '2023-08-08', '9:57:13'),
(8, 2, 38, 'Lacie Milroy', '2021-04-23', '8:11:42'),
(9, 4, 34, 'Ker Gatheral', '2023-06-10', '9:04:02'),
(10, 5, 32, 'Odelinda Vicar', '2022-12-31', '19:15:18');

insert into Lessons (LessonId, CourseId, MemberId) 
values (31, 1, 10),
(35, 2, 9),
(56, 3, 8),
(90, 4, 7),
(55, 5, 6),
(63, 6, 5),
(7, 7, 4),
(47, 8, 3),
(18, 9, 2),
(5, 10, 1);

insert into Members (MemberId, Firstname, Surname, DOB, Address, City) 
values (2, 'Evvie', 'Keggin', '2002-09-03', '9604 7th Terrace', 'Lingbeizhou'),
(9, 'Krystle', 'Enoch', '1982-10-18', '71 Golf Course Way', 'Yelets'),
(1, 'Hortensia', 'Hatt', '1979-08-30', '14 Boyd Court', 'Checun'),
(3, 'Lauree', 'Gooda', '1979-11-30', '05457 Florence Street', 'Kibre Mengist'),
(6, 'Ivonne', 'McMeekin', '1977-12-25', '6 Lien Drive', 'Xingpinglu'),
(5, 'Fionnula', 'Disley', '1977-11-19', '8737 Towne Alley', 'Gorodets'),
(4, 'Dallon', 'Passe', '2004-01-11', '2956 Melody Park', 'Lyubinskiy'),
(10, 'Simonette', 'Madden', '2007-08-23', '3081 Raven Drive', 'Wola Uhruska'),
(7, 'Zia', 'Gepp', '1974-08-30', '9330 Helena Place', 'Marapat'),
(8, 'Chelsie', 'Summersett', '2001-01-25', '28398 Westerfield Terrace', 'Marne-la-Vallée');

select * from courses;
select * from Lessons;
select * from members;

-- EXERCISES ---
-- A.	Use the SQL AND, OR and NOT Operators in your query (The WHERE clause can be combined with AND, OR, and NOT operators)
-- 1.	Where courseID is equals to a number below 5 and the instructor of any of the instructors 
select * from Course where CourseId<5 and Instructor is not null;

-- 2.	Where courseID is equals to a number above 5 and the lesson time is in the morning or afternoon. 
select * from Course where CourseId>5 and LessonTime between '09:00:00' and '16:00:00';

-- B.	Order by the above results by:
-- 1.	 startDate in “course” table
select * from Course order by startDate desc;

-- 2.	 MemberID in “members” table
select * from Members order by MemberId desc;

-- C.	UPDATE the following:
-- 1.	 Members table, change the addresses of any three members.
update Members set Address ='4 Queens Gate' where MemberId >7;

-- 2.	Course table, change the startDate and lesson time for three of the sessions.
Update Course set startDate = '2024-03-01', LessonTime = '09:30:00' where CourseId<4;

-- D.	Use the SQL MIN () and MAX () Functions to return the smallest and largest value 
-- 1.	Of the LessonID column in the “lesson” table
select min(LessonId) as 'Min no. of Lessons' from Lessons;
select max(lessonId) as 'Max no. of Lessons' from Lessons;

-- 2.	Of the membersID column in the “members” table 
select min(memeberId) from members;
select max(memeberId) from memebers;

-- E.	Use the SQL COUNT (), AVG () and SUM () Functions for these:
-- 1.	Count the total number of members in the “members” table
select count(memberId) as 'Total No. of Members' from Members;

-- 2.	Count the total number of sessions in the” members” table
select sum(sessions) as 'Total No. of Sessions' from Members; -- Note: this will return error as no sessions in Members

-- 3.	Find the average session time for all “sessions” in course table 
select avg(sessions) as 'Average session time' from Course;

-- F.	WILDCARD queries (like operator) 
-- a)	Find all the people from the “members” table whose last name starts with A.
select * from members where Surname like 'a/%';

-- b)	Find all the people from the “members” table whose last name ends with A.
select * from members where Surname like '%a';

-- c)	Find all the people from the “members” table that have "ab" in any position in the last name.
select * from members where Surname like '%ab%';

-- d)	Find all the people from the “members” table that that have "b" in the second position in their first name.
select * from members where FirstName like '_b%';

-- e)	Find all the people from the “members” table whose last name starts with "a" and are at least 3 characters in length:
select * from members where Surname like 'a___%';

-- f)	Find all the people from the “members” table whose last name starts with "a" and ends with "y"
select * from members where Surname like 'a%y';

-- g)	Find all the people from the “members” table whose last name does not starts with "a" and ends with "y"
select * from Members where Surname not like 'a%y';



