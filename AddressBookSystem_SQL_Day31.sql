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

--UC11 = ADD PERSON IN FAMILY AND FRIEND ADDRESSBOOK

insert into AddressBook(FirstName,LastName,Email,Address,PhoneNo,Zip,State,City, AddressBookName, AddressBookType)values

('Alia', 'Bhatt', 'alia', 'abcd', 91123455, 560040, 'Maha','Mumbai', 'familybook', 'Family'),
('Sidhi', 'kumar', 'alia', 'abcd', 91123455, 560040, 'Maha','Goa', 'friendbook', 'Family');
select * from AddressBook;

--UC12 implement ER Diagrams in AddressBook_Service

create table Address
(
address_id int not null primary key,
address varchar(200) not null,
city varchar(50) not null,
state varchar(50) not null,
zip bigint not null
)
insert into Address values
(101,'tawarja','latur','maha',413512),
(102,'gandhi chowk','pune','karnatak',413452),
(103,'mataji negar','amravati','kerala',433512),
(104,'shivaji chowk','nagpur','hariyana',443512),
(105,'adarsh colony','delhi','rajshthan',453512);
select * from Address;

create table ContactType
(
contact_type_id int not null  primary key,
contact_type_name varchar(100) not null
)
insert into ContactType values
(201,'Family'),
(202,'Friends'),
(203,'Profession');
select * from ContactType;

create table Contact
(
contact_id int not null primary key,
address_id int not null,
first_name varchar(30) not null,
last_name varchar(30) not null,
phone_number bigint not null,
email varchar(100) not null,
contact_name varchar(20) not null,
foreign key(address_id) REFERENCES Address(address_id)
)
insert into Contact values
(1,101,'Riya','hudge',8149713160,'riya@gmail,com','riyaFriend'),
(2,102,'Rupali','Samshette',8349713160,'rupali@gmail,com','rupaliFamily'),
(3,103,'kajol','paw',8549713160,'kajol@gmail,com','kajolProfession'),
(4,104,'priya','tondare',8749713160,'priya@gmail,com','priyaFamily');
select * from Contact;

create table ContactMapping
(
contact_mapping_id int not null primary key,
contact_id int not null,
contact_type_id int not null
foreign key(contact_id) REFERENCES Contact(contact_id),
foreign key(contact_type_id) REFERENCES ContactType(contact_type_id)
)
insert into ContactMapping values
(301,1,201),
(302,2,202),
(303,3,201),
(304,1,202),
(305,2,201),
(306,3,202),
(307,2,203);
select * from ContactMapping;