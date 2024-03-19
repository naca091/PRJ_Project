use managerCar;

CREATE TABLE Admin (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    Username NVARCHAR(255) NOT NULL,
    Password NVARCHAR(255) NOT NULL
);


-- Chèn dữ liệu cho quản trị viên 1
INSERT INTO Admin (Username, Password)
VALUES ('admin1', '12345');

-- Chèn dữ liệu cho quản trị viên 2
INSERT INTO Admin (Username, Password)
VALUES ('admin2', '12345');
