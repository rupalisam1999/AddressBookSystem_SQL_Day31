--UC1 = Ability to create database adressbook service
create database AddressBook_Service;
use AddressBook_Service;

--UC2 = Create Table AddressBook

create table AddressBook
(
FirstName  varchar(150),
LastName   varchar(150),
Email      varchar(150),
Address    varchar(150),
PhoneNo    BIGINT,
Zip        BIGINT,
State      varchar(150),
City       varchar(150)
);
 
SELECT * from AddressBook;

--UC3 = Insert value in AddressBook table

INSERT INTO AddressBook (FirstName,LastName,Email,Address,PhoneNo,Zip,State,City)values
('Rupali','Sangale','Rupali@123','Tawarja Colony',911256676,413512,'Maha','Latur'),
('Pallavi','Samshette','sam@123','LIC Colony',911256676,413512,'maha','pune'),
('Mayuri','jadhv','anvi@123','Sai nagar',911256676,413512,'Maha','sangli')

SELECT * from AddressBook;

--UC4 = Edit existing contact using name 
UPDATE AddressBook SET City = 'Latur' WHERE FirstName = 'Rupali';
SELECT * from AddressBook;

UPDATE AddressBook SET City = 'Kolhapur' WHERE FirstName = 'mayuri';
 SELECT * from AddressBook;

 UPDATE AddressBook SET PhoneNo = '9322775225' WHERE FirstName = 'Pallavi';
 SELECT * from AddressBook;

 --UC5 = Delet person using name

delete from AddressBook where FirstName = 'Pallavi' and LastName = 'Samshette';
  SELECT * from AddressBook;

  --UC6 = Retrieve person belongin to city or state

  select * from AddressBook where City = 'Latur' or State = 'Maha';
