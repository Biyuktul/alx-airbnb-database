-- Write SQL CREATE INDEX commands to create appropriate indexes for those columns and save them on database_index.sql
CREATE INDEX prop_search ON Property([location], pricepernight, host_id);
CREATE INDEX order_user ON User(first_name);
CREATE INDEX join_columns ON Booking(property_id, user_id, total_price, [status]);
			