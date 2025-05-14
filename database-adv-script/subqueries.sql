-- find all properties where the average rating is greater than 4.0 using a subquery.
SELECT *
FROM Property
WHERE property_id IN (
    SELECT property_id
    FROM Review
    GROUP BY property_id
    HAVING AVG(rating) > 4
)

-- Write a correlated subquery to find users who have made more than 3 bookings.
SELECT *
FROM User
WHERE user_id IN (
    SELECT COUNT(user_id)
    FROM Booking
    WHERE Booking.user_id = User.user_id
)
