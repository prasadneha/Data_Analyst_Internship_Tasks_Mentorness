
use demo;

select * from `hotel reservation`;

/* 1. What is the total number of reservations in the dataset? */
select count(Booking_ID) as total_reservation from `hotel reservation`;

/* 2. Which meal plan is the most popular among guests? */
select type_of_meal_plan as most_popular_meal,count(type_of_meal_plan) as total_orders from `hotel reservation`
group by type_of_meal_plan
order by total_orders desc
limit 1;

/* 3. What is the average price per room for reservations involving children? */
select round(avg(avg_price_per_room),2) 
from `hotel reservation`
where no_of_children>0;

/* 4. How many reservations were made for the year 20XX (replace XX with the desired year)? */
select count(*) as total_reservations_in_2018 
from `hotel reservation`
where  year(str_to_date(arrival_date,'%d-%m-%Y'))=2018;

/* 5. What is the most commonly booked room type? */
select room_type_reserved as most_commonly_roomtype,
count(room_type_reserved) as rts from `hotel reservation`
group by room_type_reserved
order by rts desc
limit 1;

/* 6. How many reservations fall on a weekend (no_of_weekend_nights > 0)? */
select count(*) as total_reservations_on_weekends
from `hotel reservation` 
where no_of_weekend_nights>0;

/* 7. What is the highest and lowest lead time for reservations? */
select max(lead_time) as highest_lead_time,
 min(lead_time) as lowest_lead_time 
 from `hotel reservation`;

/* 8. What is the most common market segment type for reservations? */
select market_segment_type as most_common_marketsegment_type,
count(market_segment_type) as mst from `hotel reservation`
group by market_segment_type
order by mst desc
limit 1;

/* 9. How many reservations have a booking status of "Confirmed"? */
select count(*) as total_confirmed_reservations from `hotel reservation` 
where booking_status='Not_Canceled';

/* 10. What is the total number of adults and children across all reservations? */
select sum(no_of_adults) as total_no_of_adults,
sum(no_of_children) as total_no_of_childrens 
from `hotel reservation`;

/* 11. What is the average number of weekend nights for reservations involving children? */
select round(avg(no_of_weekend_nights),2) as avg_no_of_weekend_nights
from `hotel reservation` 
where no_of_children>0;

/* 12. How many reservations were made in each month of the year? */
select monthname(str_to_date(arrival_date,'%d-%m-%Y')) as month_name,
count(*) as reservations_each_month 
from `hotel reservation` 
group by month_name;

/* 13. What is the average number of nights (both weekend and weekday) spent by guests for each room
type? */
select room_type_reserved,
round(avg(no_of_weekend_nights+no_of_week_nights),2) as avg_no_of_nights
from `hotel reservation` 
group by room_type_reserved; 

/* 14. For reservations involving children, what is the most common room type, and what is the average
price for that room type? */
select room_type_reserved as common_room_type, 
round(avg(avg_price_per_room),2)
from `hotel reservation`
where no_of_children>0
group by room_type_reserved
order by count(*) desc
limit 1;

/* 15. Find the market segment type that generates the highest average price per room. */
select market_segment_type,
round(avg(avg_price_per_room),2) as highest_average_price
from `hotel reservation`
group by market_segment_type
order by highest_average_price desc
limit 1;

