-- find all properties where the average rating is greater than 4.0 using a subquery.
SELECT Property.[name], Property.[location], Review.rating, Review.comment
FROM Review INNER JOIN Property
ON Review.property_id = Property.property_id
WHERE rating IN(SELECT rating FROM Review WHERE (Review.rating) > 4)
