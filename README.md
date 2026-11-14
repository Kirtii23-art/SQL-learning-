# SQL-learning-
SQL practicing on airline data
tzv-jzoc-izu

Disha Sonkar
9:17 AM
hi

Disha Sonkar
9:18 AM
little upgrade to elarn
PostgreSQL – WHERE Clause (Level 2: Beginner to Intermediate)

Now let's slightly increase the difficulty. These queries will help Kirti understand how real business conditions are applied in airline and travel databases.

We will continue using the same six tables.
1. AND – Multiple Conditions

Scenario: Find Indian customers who are older than 30.

SELECT *
FROM customers
WHERE country = 'India'
AND age > 30;

Explanation: Both conditions must be satisfied.
2. OR – Either Condition

Scenario: Find customers who belong to India or the UK.

SELECT *
FROM customers
WHERE country = 'India'
OR country = 'UK';

Explanation: Either condition can be true.
3. NOT – Exclude a Condition

Scenario: Find all bookings except cancelled bookings.

SELECT *
FROM bookings
WHERE booking_status <> 'Cancelled';

Explanation: <> means not equal to.

You can also write:

SELECT *
FROM bookings
WHERE NOT booking_status = 'Cancelled';

4. IN – Match Multiple Values

Scenario: Find bookings made in Business Class or First Class.

SELECT *
FROM bookings
WHERE travel_class IN ('Business', 'First Class');

Explanation: IN checks whether a value matches any item in a specified list.
5. NOT IN – Exclude Multiple Values

Scenario: Find all bookings except Business and First Class.

SELECT *
FROM bookings
WHERE travel_class NOT IN ('Business', 'First Class');

Explanation: Excludes the specified travel classes.
6. BETWEEN – Filter a Range

Scenario: Find bookings with ticket prices between ₹30,000 and ₹80,000.

SELECT *
FROM bookings
WHERE ticket_price BETWEEN 30000 AND 80000;

Explanation: Both boundary values are included.
7. LIKE – Pattern Matching

Scenario: Find customers whose first name starts with A.

SELECT *
FROM customers
WHERE first_name LIKE 'A%';

Explanation:

    A means the name must start with A.

    % represents zero or more characters.

Another example: Find email addresses ending in gmail.com.

SELECT *
FROM customers
WHERE email LIKE '%gmail.com';

8. ILIKE – Case-Insensitive Search

Scenario: Find customers whose country is India, regardless of letter case.

SELECT *
FROM customers
WHERE country ILIKE 'india';

Explanation: Unlike LIKE, ILIKE ignores uppercase and lowercase differences in PostgreSQL.
9. IS NULL – Find Missing Values

Scenario: Find customers whose gender information is missing.

SELECT *
FROM customers
WHERE gender IS NULL;

Explanation: IS NULL checks for missing or NULL values.

Important: Do not use = NULL.
10. Combining AND, OR and Parentheses

Scenario: Find customers who:

    Belong to India or the UK.

    Are older than 30.

SELECT *
FROM customers
WHERE (country = 'India' OR country = 'UK')
AND age > 30;

Explanation:

    Parentheses evaluate the country conditions together.

    AND checks whether the age condition is also satisfied.

Practice Assignment – Kirti
Level 2 · Independent Practice

Ask her to solve these 10 questions without looking at the solutions.

SQL homework
0/10 hints viewed

1. Find customers from India who are younger than 30.

Hint available

2. Find bookings that are either Pending or Cancelled.

Hint available

3. Find all payments except Failed payments.

Hint available

4. Find bookings with ticket prices between ₹40,000 and ₹1,00,000.

Hint available

5. Find customers whose first name starts with S.

Hint available

6. Find customers whose email ends with yahoo.com.

Hint available

7. Find flights whose status is not Completed.

Hint available

8. Find customers from India, USA or Germany.

Hint available

9. Find bookings that are not Economy class.

Hint available

10. Find customers from the UK or USA who are older than 30.

Hint available
What to teach next

After she completes this lesson, move to:

    ORDER BY – Sorting records.

    LIMIT – Restricting output.

    DISTINCT – Removing duplicate results.

    COUNT() – Counting bookings and customers.

This progression will take her from basic SQL querying towards actual airline business analysis
