create database migro;
use migro;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(255) NOT NULL,
    ImageURL VARCHAR(255),
    Category ENUM('Frozen', 'Fresh', 'Beverage', 'Home', 'Pet-food') NOT NULL,
    Unit VARCHAR(50) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
	Amount INT DEFAULT 10,
    Not_in_stock BOOLEAN NOT NULL
);

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    DeliveryAddress VARCHAR(255) NOT NULL,
    RecipientName VARCHAR(100) NOT NULL,
    Mobile VARCHAR(20) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


INSERT INTO Products (Name, ImageURL, Category, Unit, Price, Not_in_stock) VALUES
    ('Frozen Pizza', 'pizza.jpg', 'Frozen', '1 unit', 5.99, 0),
    ('Frozen Vegetables', 'vegetables.jpg', 'Frozen', '1 kg', 2.49, 0),
    ('Frozen Fish Fillets', 'fish.jpg', 'Frozen', '500g', 7.99, 1), -- Example of an out-of-stock item
    ('Fresh Apples', 'apples.jpg', 'Fresh', '1 kg', 1.99, 0),
    ('Fresh Chicken Breast', 'chicken.jpg', 'Fresh', '500g', 4.99, 0),
    ('Fresh Milk', 'milk.jpg', 'Fresh', '1 liter', 1.49, 0),
    ('Beverage Cola', 'cola.jpg', 'Beverage', '1 can', 0.99, 0),
    ('Beverage Orange Juice', 'orange_juice.jpg', 'Beverage', '1 liter', 2.49, 0),
    ('Home Cleaning Spray', 'cleaner.jpg', 'Home', '500ml', 3.99, 0),
    ('Home Tissues', 'tissues.jpg', 'Home', 'Pack of 6', 4.49, 0),
    ('Pet-food Dog Food', 'dog_food.jpg', 'Pet-food', '1 kg', 8.99, 0),
    ('Pet-food Cat Food', 'cat_food.jpg', 'Pet-food', '500g', 5.49, 0);


select * from Products;
select * from Orders;
select * from OrderDetails;