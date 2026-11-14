-------------- Data base ---------------
-- 1. Airlines
CREATE TABLE airlines (
    airline_id SERIAL PRIMARY KEY,
    airline_name VARCHAR(100) NOT NULL,
    country VARCHAR(50),
    airline_code VARCHAR(10) UNIQUE
);

-- 2. Airports
CREATE TABLE airports (
    airport_id SERIAL PRIMARY KEY,
    airport_name VARCHAR(100),
    city VARCHAR(100),
    country VARCHAR(50),
    airport_code VARCHAR(10) UNIQUE
);

-- 3. Customers
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE,
    gender VARCHAR(20),
    age INT,
    country VARCHAR(50),
    registration_date DATE
);

-- 4. Flights
CREATE TABLE flights (
    flight_id SERIAL PRIMARY KEY,
    airline_id INT REFERENCES airlines(airline_id),
    source_airport_id INT REFERENCES airports(airport_id),
    destination_airport_id INT REFERENCES airports(airport_id),
    flight_number VARCHAR(20),
    departure_time TIMESTAMP,
    arrival_time TIMESTAMP,
    aircraft_type VARCHAR(50),
    flight_status VARCHAR(30)
);

-- 5. Bookings
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(customer_id),
    flight_id INT REFERENCES flights(flight_id),
    booking_date DATE,
    travel_class VARCHAR(30),
    ticket_price NUMERIC(10,2),
    booking_status VARCHAR(30)
);

-- 6. Payments
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT REFERENCES bookings(booking_id),
    payment_date DATE,
    payment_method VARCHAR(30),
    amount NUMERIC(10,2),
    payment_status VARCHAR(30)
);
INSERT INTO airlines
(airline_name, country, airline_code)
VALUES
('Air India', 'India', 'AI'),
('IndiGo', 'India', '6E'),
('Emirates', 'UAE', 'EK'),
('British Airways', 'UK', 'BA'),
('Qatar Airways', 'Qatar', 'QR'),
('Singapore Airlines', 'Singapore', 'SQ'),
('Lufthansa', 'Germany', 'LH');

INSERT INTO airports
(airport_name, city, country, airport_code)
VALUES
('Indira Gandhi International Airport', 'Delhi', 'India', 'DEL'),
('Chhatrapati Shivaji Maharaj Airport', 'Mumbai', 'India', 'BOM'),
('Kempegowda International Airport', 'Bengaluru', 'India', 'BLR'),
('Heathrow Airport', 'London', 'UK', 'LHR'),
('Dubai International Airport', 'Dubai', 'UAE', 'DXB'),
('John F Kennedy International Airport', 'New York', 'USA', 'JFK'),
('Singapore Changi Airport', 'Singapore', 'Singapore', 'SIN'),
('Hamad International Airport', 'Doha', 'Qatar', 'DOH'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA'),
('Rajiv Gandhi International Airport', 'Hyderabad', 'India', 'HYD');

INSERT INTO customers
(first_name, last_name, email, gender, age, country, registration_date)
VALUES
('Aarav', 'Sharma', 'aarav@gmail.com', 'Male', 28, 'India', '2025-01-10'),
('Emma', 'Wilson', 'emma@gmail.com', 'Female', 34, 'UK', '2025-02-15'),
('Rahul', 'Verma', 'rahul@gmail.com', 'Male', 41, 'India', '2025-03-20'),
('Sophia', 'Brown', 'sophia@gmail.com', 'Female', 29, 'USA', '2025-04-05'),
('Liam', 'Smith', 'liam@gmail.com', 'Male', 37, 'UK', '2025-04-18'),
('Ananya', 'Patel', 'ananya@gmail.com', 'Female', 25, 'India', '2025-05-12'),
('Noah', 'Taylor', 'noah@gmail.com', 'Male', 32, 'USA', '2025-06-08'),
('Isha', 'Mehta', 'isha@gmail.com', 'Female', 30, 'India', '2025-07-11'),
('Oliver', 'Martin', 'oliver@gmail.com', 'Male', 45, 'Germany', '2025-08-01'),
('Mia', 'Clark', 'mia@gmail.com', 'Female', 27, 'Singapore', '2025-08-22');

INSERT INTO flights
(airline_id, source_airport_id, destination_airport_id,
 flight_number, departure_time, arrival_time,
 aircraft_type, flight_status)
VALUES
(1, 1, 4, 'AI101', '2025-11-01 08:00', '2025-11-01 14:00', 'Boeing 787', 'Completed'),
(2, 2, 3, '6E201', '2025-11-02 09:00', '2025-11-02 10:30', 'Airbus A320', 'Completed'),
(3, 5, 4, 'EK501', '2025-11-03 10:00', '2025-11-03 15:00', 'Airbus A380', 'Completed'),
(4, 4, 6, 'BA301', '2025-11-04 11:00', '2025-11-04 19:00', 'Boeing 777', 'Completed'),
(5, 8, 1, 'QR401', '2025-11-05 07:00', '2025-11-05 13:00', 'Airbus A350', 'Delayed'),
(6, 7, 5, 'SQ601', '2025-11-06 12:00', '2025-11-06 19:00', 'Boeing 787', 'Completed'),
(1, 3, 9, 'AI102', '2025-11-07 06:00', '2025-11-07 12:00', 'Boeing 777', 'Cancelled'),
(2, 10, 2, '6E202', '2025-11-08 14:00', '2025-11-08 16:00', 'Airbus A321', 'Completed'),
(7, 9, 4, 'LH701', '2025-11-09 08:00', '2025-11-09 10:00', 'Airbus A350', 'Completed'),
(3, 5, 7, 'EK502', '2025-11-10 18:00', '2025-11-10 23:00', 'Boeing 777', 'Delayed');

INSERT INTO bookings
(customer_id, flight_id, booking_date, travel_class,
 ticket_price, booking_status)
VALUES
(1, 1, '2025-10-01', 'Economy', 45000, 'Confirmed'),
(2, 3, '2025-10-02', 'Business', 95000, 'Confirmed'),
(3, 2, '2025-10-03', 'Economy', 8500, 'Confirmed'),
(4, 4, '2025-10-04', 'Business', 110000, 'Confirmed'),
(5, 5, '2025-10-05', 'Economy', 55000, 'Confirmed'),
(6, 6, '2025-10-06', 'First Class', 150000, 'Confirmed'),
(7, 7, '2025-10-07', 'Economy', 65000, 'Cancelled'),
(8, 8, '2025-10-08', 'Economy', 12000, 'Confirmed'),
(9, 9, '2025-10-09', 'Business', 80000, 'Confirmed'),
(10, 10, '2025-10-10', 'Economy', 40000, 'Pending'),
(1, 3, '2025-10-11', 'Business', 90000, 'Confirmed'),
(2, 6, '2025-10-12', 'Economy', 35000, 'Confirmed'),
(3, 4, '2025-10-13', 'Economy', 75000, 'Confirmed'),
(4, 8, '2025-10-14', 'Business', 25000, 'Cancelled'),
(5, 1, '2025-10-15', 'Economy', 42000, 'Confirmed');

INSERT INTO payments
(booking_id, payment_date, payment_method, amount, payment_status)
VALUES
(1, '2025-10-01', 'Credit Card', 45000, 'Successful'),
(2, '2025-10-02', 'Debit Card', 95000, 'Successful'),
(3, '2025-10-03', 'UPI', 8500, 'Successful'),
(4, '2025-10-04', 'Credit Card', 110000, 'Successful'),
(5, '2025-10-05', 'PayPal', 55000, 'Successful'),
(6, '2025-10-06', 'Credit Card', 150000, 'Successful'),
(7, '2025-10-07', 'UPI', 65000, 'Refunded'),
(8, '2025-10-08', 'Debit Card', 12000, 'Successful'),
(9, '2025-10-09', 'Credit Card', 80000, 'Successful'),
(10, '2025-10-10', 'PayPal', 40000, 'Pending'),
(11, '2025-10-11', 'Credit Card', 90000, 'Successful'),
(12, '2025-10-12', 'UPI', 35000, 'Successful'),
(13, '2025-10-13', 'Debit Card', 75000, 'Successful'),
(14, '2025-10-14', 'PayPal', 25000, 'Failed'),
(15, '2025-10-15', 'Credit Card', 42000, 'Successful');

SELECT * FROM airlines;
SELECT * FROM airports;
SELECT * FROM customers;
SELECT * FROM flights;
SELECT * FROM bookings;
SELECT * FROM payments;
