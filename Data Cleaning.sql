create database restaurant;

use restaurant;

show tables;

select * from menu;

alter table menu
rename column ï»¿menu_item_id to menu_item_id;

select * from orders;

alter table orders
rename column ï»¿order_details_id to order_details_id;

alter table orders
add column Order_date_new date;

alter table orders
add column Order_date_new date;

update orders
set Order_date_new= case 
				     when order_date like '%-%-%' then str_to_date(order_date,'%m-%d-%Y')
                     else str_to_date(order_date,'%m/%d/%Y')
                     end;
set sql_safe_updates =0;

alter table orders 
add column TimeOfTheDay varchar(20);
update orders 
set TimeOfTheDay=
case 
    when order_time between "00:00:00" and "12:00:00" then "Morning"
    when order_time between "12:00:01" and "17:00:00" then "Afternoon"
    Else "Evening" 
    end ;
    
alter table orders 
add column Day_Name varchar(20);
update orders 
set Day_Name=dayname(order_date_new) ;

