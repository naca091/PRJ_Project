create database managerCar;

use managerCar;

-- Tạo lại bảng Cars với kiểu dữ liệu CarID là INT và Picture là NVARCHAR(50)
CREATE TABLE Cars (
    CarID INT PRIMARY KEY IDENTITY(1,1),
    Picture NVARCHAR(50),  -- Đây là kiểu NVARCHAR(50) cho hình ảnh (lưu đường dẫn ảnh)
    Brand NVARCHAR(50),
    Model NVARCHAR(50),
    Year INT,
    Price DECIMAL(10, 2)
);

-- Thêm dữ liệu vào bảng
INSERT INTO Cars (Picture, Brand, Model, Year, Price)
VALUES (
    N'/images/toyota.jpg', -- Đường dẫn hình ảnh
    N'Toyota',
    N'Camry',
    2020,
    25000.00
);

INSERT INTO Cars (Picture, Brand, Model, Year, Price)
VALUES (
    N'/images/honda.jpg', -- Đường dẫn hình ảnh
    N'Honda',
    N'Civic',
    2022,
    22000.00
);

INSERT INTO Cars (Picture, Brand, Model, Year, Price)
VALUES (
    N'/images/ford.jpg', -- Đường dẫn hình ảnh
    N'Ford',
    N'Mustang',
    2019,
    35000.00
);
