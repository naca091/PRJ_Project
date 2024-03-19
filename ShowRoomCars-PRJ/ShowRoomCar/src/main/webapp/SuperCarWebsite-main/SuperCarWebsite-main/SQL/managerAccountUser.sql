use managerCar


-- Create a new table with the 'Role' column
CREATE TABLE Users (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Role NVARCHAR(255) NOT NULL
);
ALTER TABLE Users
ADD Role NVARCHAR(255) NOT NULL;
-- Copy data from the old 'Users' table to the new 'NewUsers' table
INSERT INTO Users (Name, Email, Password, Role)
SELECT Name, Email, Password, 'user' FROM Users;
USE managerCar;

-- Insert 3 users
INSERT INTO Users (Name, Email, Password, Role)
VALUES ('user1', 'user1@example.com', '123', 'user');

INSERT INTO Users (Name, Email, Password, Role)
VALUES ('user2', 'user2@example.com', '123', 'user');

INSERT INTO Users (Name, Email, Password, Role)
VALUES ('user3', 'user3@example.com', '123', 'user');

-- Insert 2 admins
INSERT INTO Users (Name, Email, Password, Role)
VALUES ('admin1', 'admin1@example.com', '12345', 'admin');

INSERT INTO Users (Name, Email, Password, Role)
VALUES ('admin2', 'admin2@example.com', '12345', 'admin');


