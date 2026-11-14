select * from bookings
select * from payments
select airline_name, country from airlines
select first_name, last_name, email, age from customers where age > 30
select customer_id, flight_id, travel_class, booking_status from bookings
select airport_name, airport_code from airports
select * from bookings where ticket_price >50000
select * from flights where flight_status = 'Cancelled'
select * from customers where country = 'UK'
select * from bookings where booking_status = 'Confirmed'
select * from customers where gender ='Female'
select * from airports where country = 'India'
select * from customers where age > 35
select * from payments where payment_status = 'Successful'
select * from bookings where ticket_price < 40000
select * from bookings where booking_status <> 'Cancelled'
select * from bookings where not booking_status = 'Cancelled'
