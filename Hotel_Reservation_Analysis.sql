SELECT * FROM hotel_reservation.`hotel reservation dataset`; 
/*TASK 1
/*What is the total number of reservation in the dataset*/
SELECT COUNT(*) total_reservations
FROM hotel_reservation.`hotel reservation dataset`; 

/*TASK 2
/*Which meal plan is the most popular among the guest*/
SELECT type_of_meal_plan, COUNT(*) total_meal_plan
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1; 

/*TASK 3
/*What is the average price per room for reservations involving children?*/
SELECT AVG(avg_price_per_room) avg_price
FROM hotel_reservation.`hotel reservation dataset`
WHERE no_of_children > 0

/*TASK 4
/* How many reservations were made for the year 20XX (replace XX with the desired year)?*/
/* Check the data type*/
DESC hotel_reservation.`hotel reservation dataset`;
/* Change data type*/
SET SQL_SAFE_UPDATES = 0;

UPDATE hotel_reservation.`hotel reservation dataset`
SET arrival_date = STR_TO_DATE(arrival_date, "%d-%m-%Y");

ALTER TABLE hotel_reservation.`hotel reservation dataset`
MODIFY arrival_date DATE;

SELECT DISTINCT YEAR(arrival_date) FROM hotel_reservation.`hotel reservation dataset`

/*Total reservation made in 2017*/
SELECT YEAR(arrival_date) AS year_of_reservation, COUNT(*) AS total_reservations
FROM hotel_reservation.`hotel reservation dataset`
WHERE  YEAR(arrival_date) = '2017'
GROUP BY 1;

/*Total reservation made in 2018*/
SELECT YEAR(arrival_date) AS year_of_reservation, COUNT(*) AS total_reservations
FROM hotel_reservation.`hotel reservation dataset`
WHERE  YEAR(arrival_date) = '2018'
GROUP BY 1;

/*TASK 5
/* What is the most commonly booked room type?*/
SELECT room_type_reserved, COUNT(*) AS total_count 
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*TASK 6
/*How many reservations fall on a weekend (no_of_weekend_nights > 0)?*/
SELECT COUNT(*) AS weekend_reservation
FROM hotel_reservation.`hotel reservation dataset`
WHERE no_of_weekend_nights > 0

/*TASK 7
/*What is the highest and lowest lead time for reservations?*/
SELECT MAX(lead_time) AS highest_lead_time, MIN(lead_time) AS lowest_lead_time
FROM hotel_reservation.`hotel reservation dataset`

/*TASK 8
/*What is the most common market segment type for reservations?*/
SELECT market_segment_type, COUNT(*) 
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1

/*TASK 9
/* How many reservations have a booking status of "Confirmed"?*/
SELECT COUNT(*) AS total_confirmed_reservation
FROM hotel_reservation.`hotel reservation dataset`
WHERE booking_status = 'Not_Canceled'

/*TASK 10
/*What is the total number of adults and children across all reservations?*/
SELECT SUM(no_of_adults) AS total_adults, SUM(no_of_children) AS total_children
FROM hotel_reservation.`hotel reservation dataset`

/*TASK 11
/*What is the average number of weekend nights for reservations involving children?*/
SELECT AVG(no_of_weekend_nights) AS average_weekend_nights
FROM hotel_reservation.`hotel reservation dataset`
WHERE no_of_children > 0

SELECT AVG(no_of_weekend_nights) AS average_weekend_nights
FROM hotel_reservation.`hotel reservation dataset`
WHERE no_of_weekend_nights >0 AND no_of_children > 0


/*TASK 12
/*How many reservations were made in each month of the year?*/
SELECT  EXTRACT(YEAR FROM arrival_date) AS arrival_year,
        EXTRACT(MONTH FROM arrival_date) AS arrival_month, 
        COUNT(*) AS number_of_reservations
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1,2
ORDER BY 1,2

/*TASK 13
/*What is the average number of nights (both weekend and weekday) spent by guests for each room
type?*/
SELECT room_type_reserved, 
       AVG(no_of_weekend_nights + no_of_week_nights) AS avg_total_nights
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1

/*TASK 14
/*For reservations involving children, what is the most common room type, and what is the average
price for that room type?*/
SELECT room_type_reserved, 
       AVG(avg_price_per_room) AS avg_price
FROM hotel_reservation.`hotel reservation dataset`
WHERE no_of_children >0
GROUP BY 1
ORDER BY COUNT(*) DESC
LIMIT 1

/*TASK 15
/*Find the market segment type that generates the highest average price per room.*/
SELECT market_segment_type, AVG(avg_price_per_room)
FROM hotel_reservation.`hotel reservation dataset`
GROUP BY 1
ORDER BY 2 DESC
LIMIT 1
