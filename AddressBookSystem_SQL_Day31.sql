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
