USE AirBnB;

INSERT INTO [User] (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES 
(NEWID(), 'Alice', 'Johnson', 'alice@example.com', 'hashed_pw_1', '1234567890', 'guest'),
(NEWID(), 'Bob', 'Smith', 'bob@example.com', 'hashed_pw_2', '0987654321', 'host'),
(NEWID(), 'Admin', 'User', 'admin@example.com', 'hashed_pw_3', NULL, 'admin');

DECLARE @host_id UNIQUEIDENTIFIER = (SELECT user_id FROM [User] WHERE email = 'bob@example.com');
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES 
(NEWID(), @host_id, 'Cozy Loft', 'A beautiful loft downtown.', 'New York', 150.00),
(NEWID(), @host_id, 'Beach House', 'Relaxing beach-side property.', 'Miami', 200.00);

DECLARE @property_id UNIQUEIDENTIFIER = (SELECT TOP 1 property_id FROM Property);
DECLARE @guest_id UNIQUEIDENTIFIER = (SELECT user_id FROM [User] WHERE email = 'alice@example.com');
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES 
(NEWID(), @property_id, @guest_id, '2025-06-01', '2025-06-05', 600.00, 'confirmed');

DECLARE @booking_id UNIQUEIDENTIFIER = (SELECT TOP 1 booking_id FROM Booking);
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES 
(NEWID(), @booking_id, 600.00, 'credit_card');

INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES 
(NEWID(), @property_id, @guest_id, 5, 'Amazing stay! Super clean and great location.');

DECLARE @host_id2 UNIQUEIDENTIFIER = (SELECT user_id FROM [User] WHERE email = 'bob@example.com');
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES 
(NEWID(), @guest_id, @host_id2, 'Hi, is the property available in July?'),
(NEWID(), @host_id2, @guest_id, 'Yes, it is available. Feel free to book!');

