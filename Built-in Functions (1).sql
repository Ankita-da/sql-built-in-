use sakila;
use world;
select * from country;
select sum(Country_pop)/1000000 as Total_World_Pop_mn from country;

select round(avg(Country_pop)/1000000,2) as Avg_World_Pop_mn from country;

select 
round(sum(Country_pop)/1000000,2) as Total_World_Pop_mn,
round(avg(LifeExpectancy),2) as ALE,
round(avg(GNP)/1000,2) as Avg_GNP,
round(sum(SurfaceArea)/1000000,2) as TSA
from country;

select 
count(distinct Continent) as No_of_Continents, 
Count(Country_name) as No_of_Countries
from country;

select * from country;

select count(country_name), count(distinct country_name) from country;


### Group by
select 
Continent,
round(sum(Country_pop)/1000000,2) as Total_Continent_Pop_mn,
round(avg(LifeExpectancy),2) as ALE,
round(avg(GNP)/1000,2) as Avg_GNP_000s,
round(sum(SurfaceArea)/1000000,2) as TSA_mn
from country
group by Continent
having TSA_mn > 25;

use sakila;
###String Functions
# Concat
select * from actor;
select actor_id, first_name, last_name, concat(first_name," ",last_name) as Full_name from actor;
# Upper/Lower
select actor_id, lower(first_name) as lfn, lower(last_name) as lln from actor;

# Replace
select replace("Hello world","world","SQL") new_o ;
# Left/Right
select * from address;
select city_id,district,upper(left(district,3)) New_dis,upper(right(district,3)) Right_Dis from address;

# Substring
select * from customer;
select first_name, last_name, email, substring(email,4,8) subs from customer;
# Trim/Ltrim/Rtrim
select district, trim(concat("    ", district, "    ")) new_dis from address;
# Reverse
select reverse("Saurabh");
# Length
select first_name, email, length(email) as lemail from customer
order by Lemail desc;




use sakila;
use world;

select * from city;
select avg(City_Pop) from city;

select City_name, District, City_Pop, 
if(City_Pop >= 350468, "Above Global Avg","Below Global Avg") as Pop_Status
from city;

select if(City_Pop >= 350468, "Above Global Avg","Below Global Avg") as Pop_Status,
count(City_Name) as No_of_Cities
from city
group by Pop_Status;

select * from country;

select Country_Name, Continent, IndepYear, ifnull(IndepYear,0) as New_Indep_Year
from country;

select * from country;
select Country_Name, GNP, GNPOld, nullif(GNP,GNPOld) as Check_GNP from country;

## Multiple Categorization

select * from city;
## Below 50000, 50000-300000,300000-1000000, > 1000000

select City_Name,City_Pop,
Case
	when City_Pop <= 50000 then "Low"
    when City_Pop between 50000 and 300000 then "Med"
    when City_Pop between 300000 and 1000000 then "High"
	else "Very High"
End as Pop_Cat
from city;
    
select 
Case
	when City_Pop <= 50000 then "Low"
    when City_Pop between 50000 and 300000 then "Med"
    when City_Pop between 300000 and 1000000 then "High"
	else "Very High"
End as Pop_Cat,
count(City_Name) as No_of_Cities,
round(count(City_Name)*100/4079,2) as Per_of_Cities
from city
Group by Pop_Cat;

## Coalesce

select GNP, GNPOld,coalesce(GNP, GNPOld,"NA") as GNP_Check from country;


## Date and Time Functions

use sakila;
select * from rental;

select Current_time();
Select Now();

select Rental_id, Rental_Date, Date(Rental_Date) as Rental_Date2,
Time(Rental_Date) as Rental_Time from rental;

select Rental_id, Rental_Date, 
Day(Rental_Date) as RentalDay, 
Month(Rental_Date) as Rental_Month,
Year(Rental_Date) as Rental_Year
from rental;

select Rental_id, Time(Rental_Date) as Rental_Time, 
Hour(Rental_Date) as Rentalhour, 
Minute(Rental_Date) as Rental_Min,
second(Rental_Date) as Rental_Sec
from rental;

select * from rental;
select Rental_id, 
date(Rental_Date) as Rental_date,date_add(date(Rental_Date),interval 5 day) as Target_date from rental;

select * from rental;

select rental_id,Customer_id,date(Rental_Date) as Rental_date,
date(Return_Date) as Return_date,
datediff(Return_date,Rental_Date) as Holding_Days
from rental;

select Customer_id,
avg(datediff(Return_date,Rental_Date)) as Holding_Days
from rental
group by Customer_id;

select Customer_id,
if(datediff(Return_date,Rental_Date)>7,"Late","Not-Late") as Return_Status
from rental
group by Customer_id
having Return_Status = "Late";

use world;
select * from country;

## Row_number

select row_number() over (partition by Continent order by Country_Name) as Row_num, Country_name, Continent from country;

select 
Rank() over (partition by Continent order by LifeExpectancy) as Rank_num,
dense_rank() over (partition by Continent order by LifeExpectancy) as dRank_num, 
Country_name, Continent from country;

## Ntile
select *, ntile(4) over(order by City_Pop) as Pop_Cat from city;

select Country_name,Country_Pop, lead(Country_Pop,2) over (Order by Country_Pop desc) as Previous_Pop from country;

## Numeric Functions

select abs(-32) as Abs_Value;
select ceil(-7.6);

select floor(-7.6);
select round(23.237534534,2);

select mod(32,10);
select power(9,2);

select exp(3);










