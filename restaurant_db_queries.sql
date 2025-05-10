/*what is the average dish price within each category?*/
select category,round(avg(price)) AvgPrice
from menu
group by category
order by AvgPrice desc;

/*What are the most and least ordered dishes/items?*/
select m.item_name,m.category,count(o.order_details_id) NumberOfOrders
from orders o inner join menu m on o.item_id=m.menu_item_id
group by m.item_name,m.category
order by NumberOfOrders desc ;
/*Or*/
select distinct m.item_name,m.category,
count(o.order_details_id) over (partition by m.item_name,m.category) as NumberOfOrders
from orders o inner join menu m on o.item_id=m.menu_item_id
order by NumberOfOrders desc ;

/*Which items on the menu are the most and least expensive?*/
select item_name,category,price
from menu
order by price desc;

/*What is the peak order time period (morning, afternoon or evening)?*/
select TimeOfTheDay,count(distinct order_id) NumberOfOrders
from orders 
group by TimeOfTheDay
order by NumberOfOrders desc ;

/*Which dishes have the highest number of orders during the peak time period?*/
select m.item_name,m.category,count(distinct order_id)  NumberOfOrders
from orders o inner join menu m on o.item_id=m.menu_item_id
where TimeOfTheDay="Evening"
group by m.item_name,m.category
order by NumberOfOrders desc ;
/*OR*/
With PeakTime as (
    select TimeOfTheDay, count(distinct order_id) NumberOfOrders
    from orders
    group by TimeOfTheDay
    order by NumberOfOrders Desc
    limit 1
)
select m.item_name, m.category, count(distinct order_id) NumberOfOrders
from orders o inner join menu m on o.item_id = m.menu_item_id inner join PeakTime p on o.TimeOfTheDay = p.TimeOfTheDay
group by m.item_name, m.category
order by NumberOfOrders Desc;

/*Which day of the week has the highest number of orders?*/
select Day_Name,count(distinct order_id)  NumberOfOrders
from orders 
group by Day_Name
order by NumberOfOrders desc ;

/*What are the top five highest-value orders?*/
select order_id,round(sum(price)) TotalOrderPrice
from orders o inner join menu m on o.item_id=m.menu_item_id
group by order_id
order by TotalOrderPrice desc
limit 5;

/*What is the total dishes count for each category among the top five highest-spending orders?*/
select m.category, count(*) as NumberOfItems
from orders o inner join menu m on o.item_id=m.menu_item_id
where order_id in (440,2075,1957,330,2675)
group by m.category
order by NumberOfItems desc;

/*List the items that are expensive but underperforming.*/
Select m.item_name, m.category, m.price, o.total_orders
from menu m inner join 
	(select item_id, COUNT(*) as total_orders
    from orders
    group by item_id) o
	on m.menu_item_id = o.item_id
where o.total_orders < (
    select AVG(order_count)
    from (
        select COUNT(*) as order_count
        from orders
        group by item_id
    ) as sub
)
AND m.price > (
    select AVG(price) from menu
)
order by o.total_orders;
