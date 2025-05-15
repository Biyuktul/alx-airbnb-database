-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
CREATE INDEX property_index ON Property([location], pricepernight, host_id);
CREATE INDEX user_index ON User(first_name);
CREATE INDEX booking_index ON Booking(property_id, user_id, total_price);
CREATE INDEX review_index ON Review(rating);
