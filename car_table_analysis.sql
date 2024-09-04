use car_dekho;
describe car_table;
select * from car_table;
set sql_safe_updates=0;
select * from car_table order by selling_price desc limit 1; #most expensive car
select owner,avg(km_driven) from car_table group by owner; # avg km driven by owner
select * from car_table where transmission='Automatic' and fuel='Petrol'; # car with automatic transmission and petrol
select * from car_table where seats=4;
select trim(Name),year from car_table order by trim(Name);
update car_table set Name=trim(Name);
select case when name like'%%' then substring_index(name,' ',1)
else name end as company_name from car_table;
alter table car_table add column company_name varchar(20) first;
update car_table set company_name=case when name like'%%' then substring_index(name,' ',1)
else name end;
alter table car_table modify column company_name varchar(20) first;
select * from car_table where mileage >20.0  and selling_price=500000 order by km_driven desc limit 1;
select * from car_table where max_power > 150 order by max_power desc limit 1;
select * from car_table where engine like'%1197%' and fuel like'P_____';
select substring_index(torque,'@',1) as Torque from car_table;
alter table car_table add column Torque varchar(30);
alter table car_table modify column Torque varchar(30) after max_power;
update car_table set Torque=substring_index(torque,'@',1);
select * from car_table where year='2023' and owner='First Owner' and engine>1000 order by company_name;
select count(*) from car_table as count_seat where seats=4;

select sum(selling_price) as Total from car_table;
select min(mileage) as lowest_mileage from car_table;
select engine,max(max_power) as highest_max_power from car_table group by engine limit 5;
select distinct company_name from car_table;
delete from car_table where mileage=0;
select * from car_table order by km_driven desc limit 1;
alter table car_table rename column Name to Model;
select company_name,seller_type from car_table where seller_type='Dealer';
select avg(km_driven) as avg_km_driven from car_table where fuel='CNG';
select owner,count(*) from car_table group by owner;