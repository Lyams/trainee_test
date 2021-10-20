create table Company (
 companyId int,
 companyName varchar,
 companyCountry varchar,
 PRIMARY KEY (companyId)
);

create table Phone (
phoneId int,
phoneModel varchar,
companyId int,
price int,
PRIMARY KEY(phoneId),
FOREIGN key (companyId) references Company(companyId)
);

insert into Company values (1, 'Snowman', 'IceLand');
insert into Company values (2, 'Hotbird', 'Souths');
insert into Phone values (1, 'simple', 1, 0),(2, 'soft', 1, 1),(3, 's Morkovkoy', 1, 10);
insert into Phone values (4, 'nice', 2, 5),(5, 'very strong', 2, 50),(6, 'excelent', 2, 500);
insert into Company values (3, 'Not_telephone', 'Souths');
select companyName, sum(price) as ObshayaStoimostb from Company c left join phone p on c.companyid =p.companyid GROUP by companyName ;
select count(*) as Tovarovkitaiskih  from Company c join phone p on c.companyid =p.companyid where c.companycountry = 'IceLand';
select companyName, avg(price) as ObshayaStoimostb from Company c join phone p on c.companyid =p.companyid GROUP by companyName order by ObshayaStoimostb desc limit 1;
select distinct on (companyname) companyname, phonemodel, price from (select companyname, companycountry, phonemodel, price from Company c join phone p on c.companyid =p.companyid order by price desc) as t ORDER BY companyname, price DESC;

--select companyname, max(ObshayaStoimostb) as max_phones from (select companyName, avg(price) as ObshayaStoimostb from Company c left join phone p on c.companyid =p.companyid GROUP by companyName ) as t where ObshayaStoimostb = max(ObshayaStoimostb)  ;
--select companyName, price, phoneModel as ObshayaStoimostb from Company c left join phone p on c.companyid =p.companyid GROUP by companyName, phoneModel ;
--select companyName, max(p.price), p.phonemodel as ObshayaStoimostb from Company c left join phone p on c.companyid =p.companyid GROUP by companyName;
select companyName, avg(price) as ObshayaStoimostb from Company c join phone p on c.companyid =p.companyid GROUP by companyName order by ObshayaStoimostb desc limit 1;

select companyname, companycountry, phonemodel, price into newtable from Company c join phone p on c.companyid =p.companyid order by price desc;
select * from newtable;
select distinct on (companyname) companyname, phonemodel, price from newtable ORDER BY companyname, price DESC;


select distinct on (companyname) companyname, phonemodel, price from (select companyname, companycountry, phonemodel, price from Company c join phone p on c.companyid =p.companyid order by price desc) as t ORDER BY companyname, price DESC;

