-- 1)
create database petpals;
use petpals;
-- 2)
create table Pets(
petID int primary key,
name varchar(255) not null,
age int,
breed varchar(255) not null,
type varchar(255) not null,
availableforadoption bit not null
);

create table Shelter(
ShelterID int primary key,
name varchar(255) not null,
location varchar(255) not null
);
select * from shelter;
create table Donations(
DonationID int primary key,
Donorname varchar(255) not null,
Donationtype varchar(255),
Donationamount decimal(10,2),
DonationItem varchar(255) ,
Donationdate datetime
);
alter table donations add shelterid int;
alter table donations add constraint fk foreign key(shelterid) references shelters(shelterid) on delete cascade;

create table AdoptionEvents(
eventID int primary key,
eventname varchar(255) not null,
eventdate datetime,
location varchar(255)
);
create table participants(
participantid int primary key,
participantname varchar(255),
participanttype varchar(255),
eventid int,
foreign key(eventid) references AdoptionEvents(eventid) on delete cascade
);
drop table pets;
set foreign_key_checks=0;
insert into pets values(1,'scooby',2,'german shepherd','Dog',1,'petdost'),
(2,'blacky',3,'labrador','Dog',1,'petkennel'),
(3,'tobby',2,'german shepherd','Dog',0,'petkennel');
insert into pets values(4,'browny',2,'lab','Dog',1,'petdost');
insert into pets values(5,'bob',2,'german shepherd','Dog',1,'petkennel');
select * from pets;
-- 5)
select * from pets where availableforadoption=1;
insert into adoptionevents values(1,'petfamily','2025-06-30','chennai'),
(2,'petfriends','2025-07-01','chennai'),
(3,'pethealth','2025-07-02','chennai');
insert into participants values(1,'maheswari','adopter',1),
(2,'nandhana','shelter',2),
(3,'logitha','adopter',3);
-- 6)
select p.participantname,p.participanttype from participants p
join adoptionevents a
on a.eventID=p.eventID
where a.eventID=3;
select * from shelter;
insert into shelter values(1,'petkennel','chennai',1),
(2,'petdost','mumbai',2),
(3,'friendlypets','chennai',3);
-- 7)
update shelter set name='petsfam',location='delhi'
 where shelterID=3;
 
 alter table donations add sheltername varchar(255); 
 
 select * from donations;
 
alter table donations add  foreign key(sheltername) references shelter(name) on delete cascade;
 insert into donations values(1,'saravana','cash','200000',null,'2025-06-30 12:00:00','petkennel'),
( 2,'sundari','item',null,'rolex watch','2025-06-30 10:00:00','friendlypets'),
(3,'sankar','cash','15000',null,current_timestamp(),'petkennel');
-- 8)
select s.name,sum(donationamount) from donations d
left join shelter s
on s.name=d.sheltername
group by s.name;

-- 9)
alter table pets add ownerid int default null;
select * from pets where ownerid is null;
insert into pets values(4,'ruby',2,'pug','Dog',1,101);
-- 10)
select month(donationdate),year(donationdate),sum(donationamount) from donations d
group by month(donationdate),year(donationdate);
-- 11)
select distinct breed from pets where age between 1 and 3 or age>5;
alter table pets add sheltername varchar(255);
alter table pets add foreign key(sheltername) references shelter(name) on delete cascade;

-- 12)
select p.name,s.name from pets p
join shelter s
on s.name=p.sheltername
where p.availableforadoption=1;
-- 13)
select count(participantid) from participants p
join adoptionevents e
on e.eventid=p.eventid
where location='chennai';
-- 14)
select distinct breed from pets where age between 1 and 5;
-- 15)
select name from pets where availableforadoption=1;
select * from shelters;
select * from pets;
alter table participants add petid int;
alter table participants add foreign key(petid) references pets(petid) on delete cascade;
insert into participants(participantid,petid) values(4,1),(5,2),(6,3);
insert into participants
values(7,'maheswari','adopter',1,4);
-- 16)
select p.participantname,pe.name from pets pe
join participants p 
on pe.petid=p.petid

join adoptionevents e
on e.eventID=p.eventID
where p.participanttype='adopter';
-- or
select adopterInfo.participantName,adopterInfo.petName
from (
    select p.participantName,pe.name AS petName
    from pets pe
    join participants p ON pe.petID = p.petID
    join adoptionEvents e ON e.eventID = p.eventID
    where p.participantType = 'adopter'
) AS adopterInfo;

select * from participants;
insert into pets values(4,'tob',2,'german shepherd','Dog',1,'petdost');
insert into pets values(6,'lucky',2,'german shepherd','Dog',1,'petdost');
insert into pets values(7,'lucy',2,'german shepherd','Dog',0,'petdost');
select * from pets;
select * from shelters;
-- 17)
select s.name,count(petID) from pets p
join shelter s
on s.name=p.sheltername and p.availableforadoption=1
group by s.name;
-- 18)
select s.name,p.breed,count(petid) from pets p
join shelter s
on p.sheltername=s.name
group by p.breed,s.name;

select * from pets;


alter table shelter add eventid int;
alter table shelter add foreign key(eventid) references adoptionevent(eventid) on delete cascade;
-- 19)
insert into shelter values(5,'fam','chennai',1);
select * from shelter s
join adoptionevents e
on s.eventid=e.eventid;
select * from adoptionevents;
select * from shelter;
select * from pets;

-- 20)
select s.shelterID, s.Name, count(p.petID) AS AdoptedPetCount
from shelter s
join pets p on s.name = p.Sheltername
where p.AvailableForAdoption = 0
group by s.shelterID, s.Name
order by AdoptedPetCount desc
Limit 1;











 




