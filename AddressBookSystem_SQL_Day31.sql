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

  --UC7 = understand size of addressbook by city or state

  select COUNT(*) as StateCount, State from AddressBook group by State;
  select COUNT(*) as CityCount, City from AddressBook group by City;


  --UC8 = Retrieves entries by alphabetically order by its name

  select * from AddressBook where City = 'Latur' order by FirstName,LastName;

  --UC9 = identify addressbook with name and type

  alter table AddressBook add AddressBookName varchar(50),AddressBookType varchar(50);
select * from AddressBook;

  update AddressBook set AddressBookName = 'familybook', AddressBookType = 'Family' where FirstName = 'Rupali';
update AddressBook set AddressBookName = 'friendbook', AddressBookType = 'Friends' where FirstName = 'Mayuri';
update AddressBook set AddressBookName = 'professionbook', AddressBookType = 'Profession' where FirstName = 'laxmi';
SELECT * from AddressBook;


--UC10 = Get number of contact persons i,e count by type.

select count(AddressBookType) as 'NumberOfContacts' from AddressBook where AddressBookType='Family';
select count(AddressBookType) as 'NumberOfContacts' from AddressBook where AddressBookType='Friends';
select count(AddressBookType) as 'NumberOfContacts' from AddressBook where AddressBookType='Profession';
