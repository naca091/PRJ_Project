use managerCar;

CREATE TABLE Carss (
    CarId INT PRIMARY KEY,
    Brand NVARCHAR(255),
    Model NVARCHAR(255),
    Price DECIMAL(10, 2),
    ImageUrl NVARCHAR(255)
);
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = 'InforUser')
BEGIN
    CREATE TABLE InforUser (
        UserID INT PRIMARY KEY IDENTITY(1,1),
        Name VARCHAR(255) NOT NULL,
        Phone VARCHAR(15) NOT NULL,
        Address VARCHAR(255) NOT NULL,
        Brand NVARCHAR(255),
        Model NVARCHAR(255),
        Quantity INT
    );
END;
ALTER TABLE InforUser
ADD Brand NVARCHAR(255),
    Model NVARCHAR(255),
    Quantity INT;

ALTER TABLE InforUser
ADD     Price DECIMAL(10, 2);
ALTER TABLE InforUser
ADD NameUser NVARCHAR(255) NOT NULL DEFAULT 'DefaultValue';
SELECT * FROM InforUser
ALTER TABLE InforUser
ADD     TotalPrice DECIMAL(10, 2);

INSERT INTO InforUser (Name, Phone, Address) VALUES ('Nguyen', '2938457', 'QuyNhon')
INSERT INTO Carss (CarId, Brand, Model, Price, ImageUrl)
VALUES
    (1, 'Tesla', 'Model X', 98900.00, '/assets/img/featured1.png'),
    (2, 'Tesla', 'Model 3', 45900.00, '/assets/img/featured2.png'),
    (3, 'Audi', 'E-tron', 175900.00, '/assets/img/featured3.png'),
    (4, 'Porsche', 'Boxster 987', 126900.00, '/assets/img/featured4.png'),
    (5, 'Porsche', 'Panamera', 175900.00, '/assets/img/featured5.png');

-- Thêm cột Quantity vào bảng Carss
ALTER TABLE Carss
ADD Quantity INT;
-- Xóa số lượng (Quantity) hiện có trong bảng Carss
UPDATE Carss SET Quantity = NULL;

	-- Cập nhật số lượng cho mỗi CarId là 5 cái
UPDATE Carss SET Quantity = 5 WHERE CarId IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

-- Thêm cột MaxHorsepower kiểu INT
ALTER TABLE Carss
ADD MaxHorsepower INT;

-- Thêm cột TopSpeed kiểu INT
ALTER TABLE Carss
ADD TopSpeed INT;

-- Thêm cột Acceleration kiểu DOUBLE
ALTER TABLE Carss
ADD Acceleration FLOAT;

-- Cập nhật thông tin mới cho các xe
UPDATE Carss
SET MaxHorsepower = 
    CASE
        WHEN CarId IN (1, 3) THEN 1020
        WHEN CarId IN (2) THEN 330
        WHEN CarId IN (4, 5) THEN 563
        WHEN CarId IN (7) THEN 400
        WHEN CarId IN (8) THEN 286
        WHEN CarId IN (10) THEN 380
        WHEN CarId IN (11) THEN 394
        WHEN CarId IN (12) THEN 350
        WHEN CarId IN (13, 14) THEN 430
        WHEN CarId IN (15) THEN 335
    END,
    TopSpeed = 
    CASE
        WHEN CarId IN (1, 3) THEN 163
        WHEN CarId IN (2) THEN 144
        WHEN CarId IN (4, 5) THEN 174
        WHEN CarId IN (7) THEN 168
        WHEN CarId IN (8) THEN 131
        WHEN CarId IN (10) THEN 155
        WHEN CarId IN (11) THEN 163
        WHEN CarId IN (12) THEN 142
        WHEN CarId IN (13, 14) THEN 177
        WHEN CarId IN (15) THEN 143
    END,
    Acceleration = 
    CASE
        WHEN CarId IN (1, 3) THEN 2.9
        WHEN CarId IN (2) THEN 5.3
        WHEN CarId IN (4, 5) THEN 3.8
        WHEN CarId IN (7) THEN 4.2
        WHEN CarId IN (8) THEN 5.7
        WHEN CarId IN (10) THEN 4.5
        WHEN CarId IN (11) THEN 4.9
        WHEN CarId IN (12) THEN 6.3
        WHEN CarId IN (13, 14) THEN 4.1
        WHEN CarId IN (15) THEN 5.6
    END;

	SELECT CarId, Brand, Model, Price, ImageUrl, MaxHorsepower, TopSpeed, Acceleration FROM Carss WHERE CarId = 2;

	ALTER TABLE Carss
ADD IsPurchased BIT; -- BIT kiểu dữ liệu cho trạng thái (0 - chưa mua, 1 - đã mua)
-- Đánh dấu sản phẩm có ID = 1 đã mua (IsPurchased = 1)
UPDATE Carss
SET IsPurchased = 1
WHERE CarId = 1;
-- Đánh dấu sản phẩm có ID = 1 chưa mua (IsPurchased = 0)
UPDATE Carss
SET IsPurchased = 0
WHERE CarId IN (1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15);

-- Đánh dấu tất cả các sản phẩm đã mua (IsPurchased = 1)
UPDATE Carss
SET IsPurchased = 1;

-- Đánh dấu tất cả các sản phẩm chưa mua (IsPurchased = 0)
UPDATE Carss
SET IsPurchased = 0;
SELECT * FROM Carss WHERE IsPurchased = 1

CREATE TABLE Cart (
    Id INT PRIMARY KEY,
    UserName VARCHAR(255),
    Brand VARCHAR(255),
    Model VARCHAR(255),
    Price FLOAT,
    ImageUrl VARCHAR(255),
    Quantity INT
);
SELECT * FROM Cart WHERE UserName = 'user1'
DELETE FROM Cart WHERE Id = 4

DROP TABLE IF EXISTS HistoryUser;
CREATE TABLE HistoryUser (
    PurchaseId INT PRIMARY KEY IDENTITY(1,1),
    UserName NVARCHAR(255),
	Name NVARCHAR(255),
    Phone NVARCHAR(20),
    Address NVARCHAR(255),
    Brand NVARCHAR(255),
    Model NVARCHAR(255),
    CurrentQuantity INT,
    IsPurchased BIT,
    Price FLOAT,
	ImageUrl VARCHAR(255),
	 TotalPrice DECIMAL(10, 2),
);
DELETE FROM HistoryUser WHERE UserName = 'tuan3'
SELECT * FROM HistoryUser WHERE UserName = 'user1'
UPDATE HistoryUser SET IsPurchased = 0 WHERE PurchaseId = 27
ALTER TABLE HistoryUser
ADD Name NVARCHAR(255);
ALTER TABLE HistoryUser
ADD ImageUrl VARCHAR(255);

DELETE FROM InforUser
ALTER TABLE HistoryUser
ADD     TotalPrice DECIMAL(10, 2);
SELECT * FROM HistoryUser WHERE UserName = 'user2'

SELECT* FROM Carss WHERE CarId = 13
