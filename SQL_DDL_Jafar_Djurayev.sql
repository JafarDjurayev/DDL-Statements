create database mountaineringClub;

create table climb (
climb_id bigserial PRIMARY key,
mountain varchar(255) not null,
company_id int CHECK (company_id > 0)
);

insert into climb (mountain, company_id)
values ('Elbrus', 1), 
       ('Everest', 2)
     
alter table climb
add column record_ts date;

UPDATE climb
SET record_ts = current_date;


create table "date" (
date_id bigserial PRIMARY key,
climb_id int not null REFERENCES climb,
begining_date date,
end_date date
);

insert into "date" (climb_id, begining_date, end_date)
values (1,'2023-11-13', '2023-11-26'),
       (2, '2023-12-01', '2023-12-15');

alter table "date"
add column record_ts date;

UPDATE "date"
SET record_ts = current_date;

       
       
create table "area" (
area_id bigserial PRIMARY key,
"name" varchar(255) not null,
country_id int not null REFERENCES country
);

insert into "area" (area_id, "name", country_id) 
values (1, 'Mineralniye Vodi', 1),
       (2, 'Himalai', 2);

alter table "area"
add column record_ts date;

UPDATE "area"
SET record_ts = current_date;    
       
create table country (
country_id bigserial PRIMARY key,
"name" varchar(255) not null
);

insert into country(country_id, "name")
values (1, 'Russia'),
       (2, 'China');
       
alter table country
add column record_ts date;

UPDATE country
SET record_ts = current_date;      


create table company_host (
company_id bigserial PRIMARY key,
company_name varchar(255) not null,
founding_date date NOT NULL
);

insert into company_host (company_name, founding_date)
values ('Vverh', '2002-12-15'),
       ('DoIt', '2005-08-23');
       
alter table company_host
add column record_ts date;

UPDATE company_host
SET record_ts = current_date; 

       
create table company_country_id (
company_id int not null REFERENCES company_host,
country_id int not null REFERENCES country
);

insert into company_country_id (company_id, country_id)
values (1, 1),
       (2, 2);
       
alter table company_country_id
add column record_ts date;

UPDATE company_country_id
SET record_ts = current_date; 

create table climbers (
climbers_id bigserial PRIMARY key,
climbers_name varchar(255) not null,
address_id int not null REFERENCES address,
"age" date CHECK ("age" >= 18)
);


insert into climbers (climbers_id, climbers_name, address_id, "age")
values (1, 'Andrey Kulikov', 1, 18),
       (2, 'Sebastyan Vagner', 2, 18);
       
       
alter table climbers
add column record_ts date;

UPDATE climbers
SET record_ts = current_date; 

create table address(
address_id bigserial PRIMARY key,
climbers_address varchar(255) not null
);

insert into address (address_id, climbers_address)
values (1, 'Russia, Moscow city, Lenin street 34-23'),
       (2, 'Germany, Dortmund city, Albert street 23-34');

alter table address
add column record_ts date;

UPDATE address
SET record_ts = current_date; 
       
       
create table mountain(
mountain_id bigserial PRIMARY key,
mauntain_name varchar not null,
neight decimal CHECK (neight > 0),
area_id int not null REFERENCES "area"
);

insert into mountain (mountain_id, mauntain_name, neight, area_id)
values (1, 'Elbrus', 5.642, 1),
       (2, 'Everest', 8.849, 2);

alter table mountain
add column record_ts date;

UPDATE mountain
SET record_ts = current_date; 
       
       
create table route (
route_id bigserial PRIMARY key,
levet_of_dificulty varchar(255),
mountain_id int not null REFERENCES mountain
);

insert into route (route_id, levet_of_dificulty, mountain_id)
values (1, 'middle', 1),
       (2, 'high', 2);

alter table route
add column record_ts date;

UPDATE route
SET record_ts = current_date;





