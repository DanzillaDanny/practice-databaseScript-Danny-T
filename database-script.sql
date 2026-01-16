drop Database if exists OnlineStore;
create Database OnlineStore;
USE OnlineStore;

Start TRANSACTION;

drop table if exists Cart;
drop table if exists Orders;
drop table if exists Product;
drop table if exists User;

CREATE TABLE User (
AccountNumber Int Auto_increment Primary Key,
FirstName VARCHAR (50) not null,
LastName VARCHAR(50) not null,
Email VARCHAR(100) not null unique,
CreatedAt TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Product (
ProductID Int Auto_increment Primary Key,
ProductName VARCHAR(100) not null,
Description TEXT,
Price DECIMAL(10, 2) not null,
OnHand Int not null,
);

CREATE TABLE Orders (
OrderID Int Auto_increment Primary Key,
AccountNumber Int,
OrderDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
TotalAmount DECIMAL(10, 2) not null,
FOREIGN KEY (AccountNumber) REFERENCES User(AccountNumber)
);

CREATE TABLE Cart (
CartID Int Auto_increment Primary Key,
AccountNumber Int,
ProductID Int,
Quantity Int not null,
FOREIGN KEY (AccountNumber) REFERENCES User(AccountNumber),
FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
);

insert into User (FirstName, LastName, Email) values
('John', 'Doe', 'john.doe@example.com'),
('Jane', 'Smith', 'jane.smith@example.com');

insert into Product (ProductName, Description, Price, OnHand) values
('Laptop', 'DELL Latitude', 199.99, 10),
('Smartphone', 'Google Pixel 10', 879.00, 20);

INSERT INTO Orders (AccountNumber, TotalAmount) VALUES
  (1, 18.98),
  (2, 12.99);

INSERT INTO Cart (AccountNumber, ProductID, Quantity) VALUES
  (1, 1, 2),
  (2, 2, 1);

INSERT INTO totalAmount ('Laptop', 'Smartphone') values (199.99, 879.00);

COMMIT;