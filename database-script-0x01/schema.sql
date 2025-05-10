CREATE DATABASE AirBnB;

USE AirBnB;

CREATE TABLE [User] (
	[user_id] UNIQUEIDENTIFIER primary key,
	first_name VARCHAR(100) NOT NULL,
	last_name VARCHAR(100) NOT NULL,
	email VARCHAR(100) UNIQUE NOT NULL,
	password_hash VARCHAR(255) NOT NULL,
	phone_number VARCHAR(50) NULL,
	[role] VARCHAR(15) NOT NULL,
	created_at DATETIME DEFAULT GETDATE()
);

CREATE TABLE Property (
	property_id UNIQUEIDENTIFIER primary key,
	[host_id] UNIQUEIDENTIFIER,
	[name] VARCHAR(100) NOT NULL,
	[description] VARCHAR(255) NOT NULL,
	[location] VARCHAR(100) NOT NULL,
	pricepernight DECIMAL NOT NULL,
	created_at DATETIME DEFAULT GETDATE(),
	updated_at DATETIME DEFAULT GETDATE(),
	FOREIGN KEY ([host_id]) REFERENCES [User]([user_id])
);

CREATE TABLE Booking (
	booking_id UNIQUEIDENTIFIER primary key,
	property_id UNIQUEIDENTIFIER,
	[user_id] UNIQUEIDENTIFIER,
	[start_date] DATETIME NOT NULL,
	end_date DATETIME NOT NULL,
	total_price DECIMAL NOT NULL,
	[status] VARCHAR(15) NOT NULL,
	created_at DATETIME DEFAULT GETDATE(),
	FOREIGN KEY ([user_id]) REFERENCES [User]([user_id]),
	FOREIGN KEY (property_id) REFERENCES Property(property_id)
);

CREATE TABLE Payment (
	payment_id UNIQUEIDENTIFIER primary key,
	booking_id UNIQUEIDENTIFIER,
	amount DECIMAL NOT NULL,
	payment_date DATETIME DEFAULT GETDATE(),
	payment_method VARCHAR(45) NOT NULL,
	FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)
);

CREATE TABLE Review (
	review_id UNIQUEIDENTIFIER primary key,
	property_id UNIQUEIDENTIFIER,
	[user_id] UNIQUEIDENTIFIER,
	rating INT NOT NULL CHECK (rating >= 1 AND rating <= 5),
	comment TEXT NOT NULL,
	created_at DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (property_id) REFERENCES Property(property_id),
	FOREIGN KEY ([user_id]) REFERENCES [User]([user_id])
);

CREATE TABLE Message (
	message_id UNIQUEIDENTIFIER primary key,
	sender_id UNIQUEIDENTIFIER,
	recipient_id UNIQUEIDENTIFIER,
	message_body TEXT NOT NULL,
	sent_at DATETIME DEFAULT GETDATE(),
	FOREIGN KEY (sender_id) REFERENCES [User]([user_id]),
	FOREIGN KEY (recipient_id) REFERENCES [User]([user_id])
);


 CREATE NONCLUSTERED INDEX idx_user_email ON [User](email);
 CREATE NONCLUSTERED INDEX idx_property_host_id ON Property(host_id);
 CREATE NONCLUSTERED INDEX idx_booking_property_id ON Booking(property_id);
 CREATE NONCLUSTERED INDEX idx_booking_user_id ON Booking(user_id);
 CREATE NONCLUSTERED INDEX idx_payment_booking_id ON Payment(booking_id);
 CREATE NONCLUSTERED INDEX idx_review_property_id ON Review(property_id);
 CREATE NONCLUSTERED INDEX idx_review_user_id ON Review(user_id);
 CREATE NONCLUSTERED INDEX idx_message_sender_id ON Message(sender_id);
 CREATE NONCLUSTERED INDEX idx_message_recipient_id ON Message(recipient_id);
