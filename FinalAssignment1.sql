CREATE DATABASE FinalAssignment1;

USE FinalAssignment1;

CREATE TABLE Category (
    CategoryID NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(50),
    Sub_Category NVARCHAR(50)
);

INSERT INTO Category VALUES 
  ('C001', 'The Martian', 'Science Fiction'),
  ('C002', 'Educated', 'Memoir'),
  ('C003', 'The Girl on the Train', 'Thriller'),
  ('C004', 'The Alchemist', 'Fiction'),
  ('C005', 'Slaughterhouse-Five', 'Science Fiction');

CREATE TABLE Publisher (
    PublisherID NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(50),
    Email NVARCHAR(50),
    ContactNumber NVARCHAR(50),
    Address NVARCHAR(50)
);

INSERT INTO Publisher VALUES 
  ('P001', 'Mustang Technologies', 'vabawaf_elo25@aol.com', '0194184833', 'Kajang'),
  ('P002', 'Luigino', 'yudoram_aho1@outlook.com', '01125156483', 'Kuala Lumpur'),
  ('P003', 'Too Good To Be Threw', 'fib-eyepeku10@mail.com', '01172715392', 'Klang'),
  ('P004', 'Sharma Family', 'hafeto_cari81@yahoo.com', '01153574852', 'Kuala Lumpur'),
  ('P005', 'Raivaaja Publishing CO', 'wibadi-gihu56@aol.com', '0148233066', 'Cheras');

CREATE TABLE University (
    UniversityID NVARCHAR(50) PRIMARY KEY,
    UniName NVARCHAR(50),
    Address NVARCHAR(50),
    ContactNumber NVARCHAR(50)
);

INSERT INTO University VALUES 
  ('U001', 'Granite Bay University', 'Kuala Lumpur', '0132050417'),
  ('U002', 'Oakland University', 'Ipoh', '0111675370'),
  ('U003', 'Saint Marys University', 'Kuantan', '0197798816'),
  ('U004', 'Woodcreek University', 'Selangor', '0137002208'),
  ('U005', 'South Fork University', 'Penang', '0177264648');


CREATE TABLE Manager (
    ManagerID NVARCHAR(50) PRIMARY KEY,
    Name NVARCHAR(50),
    Number NVARCHAR(50),
    Email NVARCHAR(50)
);

INSERT INTO Manager VALUES 
  ('M01', 'Ivan', '0125036613', 'ivanchin@gmail.com'),
  ('M02', 'Ester', '01110681363', 'esterlim@gmail.com'),
  ('M03', 'Ziyi', '0182862369', 'ziyiteng@gmail.com'),
  ('M04', 'Kelly', '0106655199', 'kellyooi@gmail.com'),
  ('M05', 'Emily', '0183263195', 'emilyabc@gmail.com');

CREATE TABLE Member (
    MemberID NVARCHAR(50) PRIMARY KEY,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Gender NVARCHAR(50),
    Email NVARCHAR(50),
    Number NVARCHAR(50),
    Address NVARCHAR(50)
);

INSERT INTO Member VALUES 
  ('M001', 'Violet', 'Liew', 'Female', 'violet@gmail.com', '0123007468', 'Pahang'),
  ('M002', 'James', 'Wong', 'Male', 'james@gmail.com', '0186474694', 'Ipoh'),
  ('M003', 'Neoh', 'Lim', 'Male', 'neoh@gmail.com', '0138993193', 'Penang'),
  ('M004', 'Ariel', 'Khoo', 'Female', 'ariel@gmail.com', '0136063859', 'Seremban'),
  ('M005', 'Elaine', 'Chan', 'Female', 'elaine@gmail.com', '01175175369', 'Kuala Lumpur');

CREATE TABLE MembersOrder (
    OrderID NVARCHAR(50) PRIMARY KEY,
    DeliveryStatus NVARCHAR(50),
    Orderdate DATE,
    Total DECIMAL(10, 2),
    Paymenttype NVARCHAR(50),
    MemberID NVARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

INSERT INTO MembersOrder VALUES 
  ('ORD1', 'Deliver', '5 April 2023', 3, 'Cash', 'M001'),
  ('ORD2', 'Non-Deliver', '9 November 2023', 2, 'OnlineTransfer', 'M002'),
  ('ORD3', 'Deliver', '19 May 2023', 4, 'DebitCard', 'M003'),
  ('ORD4', 'Deliver', '30 June 2023', 1, 'Cash', 'M004'),
  ('ORD5', 'Non-Deliver', '31 October 2023', 3, 'DebitCard', 'M005');

CREATE TABLE Book_In_Store (
    BookID NVARCHAR(50) PRIMARY KEY,
    Title NVARCHAR(50),
    Quantity INT,
    Serial_Number INT,
    Price INT,
    CategoryID NVARCHAR(50),
    PublisherID NVARCHAR(50),
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

INSERT INTO Book_In_Store VALUES 
  ('B01', 'The Martian', 27, '94754827', 35, 'C001', 'P001'),
  ('B02', 'Educated', 25, '89382329', 40, 'C002', 'P002'),
  ('B03', 'The Girl on the Train', 12, '83223334', 33, 'C003', 'P003'),
  ('B04', 'The Alchemist', 23, '22227494', 42, 'C004', 'P004'),
  ('B05', 'Slaughterhouse-Five', 33, '87876974', 38, 'C005', 'P005');

CREATE TABLE BookList (
    BookListID NVARCHAR(50) PRIMARY KEY,
    Title NVARCHAR(50),
    Price INT,
    Category NVARCHAR(50),
    Quantity INT,
    PublisherID NVARCHAR(50),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

INSERT INTO BookList VALUES 
  ('BL001', 'Echoes of Eternity', 36, 'Fantasy', 29, 'P001'),
  ('BL002', 'Chronicles of Quantum Conundrum', 34, 'Science Fiction', 28, 'P002'),
  ('BL003', 'Whispers in the Shadows', 39, 'Mystery', 26, 'P003'),
  ('BL004', 'Serendipitys Song', 37, 'Romance', 25, 'P004'),
  ('BL005', 'The Nature of Humanity', 32, 'Science and Philosophy', 30, 'P005');

CREATE TABLE Cart (
    CartID NVARCHAR(50) PRIMARY KEY,
    Date DATE,
    Total INT,
    MemberID NVARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

INSERT INTO Cart VALUES 
  ('C001', '11 September 2023', 77, 'M001'),
  ('C002', '26 September 2023', 73, 'M002'),
  ('C003', '23 October 2023', 33, 'M003'),
  ('C004', '23 November 2023', 120, 'M004'),
  ('C005', '30 December 2023', 38, 'M005');

CREATE TABLE Cart_Item (
    Cart_ItemID NVARCHAR(50) PRIMARY KEY,
    Quantity INT,
    Price INT,
    BookID NVARCHAR(50),
    CartID NVARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Book_In_Store(BookID),
    FOREIGN KEY (CartID) REFERENCES Cart(CartID)
);

INSERT INTO Cart_Item VALUES 
  ('CAIT001', 1, 35, 'B01', 'C001'),
  ('CAIT002', 1, 42, 'B04', 'C001'),
  ('CAIT003', 1, 40, 'B02', 'C002'),
  ('CAIT004', 1, 33, 'B03', 'C002'),
  ('CAIT005', 1, 33, 'B03', 'C003'),
  ('CAIT006', 1, 42, 'B04', 'C004'),
  ('CAIT007', 1, 40, 'B02', 'C004'),
  ('CAIT008', 1, 38, 'B05', 'C004'),
  ('CAIT009', 1, 38, 'B05', 'C005');

CREATE TABLE Feedback (
    FeedbackID NVARCHAR(50) PRIMARY KEY,
    Rating INT,
    Comment VARCHAR(255),
    BookID NVARCHAR(50),
    MemberID NVARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Book_In_Store(BookID),
    FOREIGN KEY (MemberID) REFERENCES Member(MemberID)
);

INSERT INTO Feedback VALUES 
    ('FB01', 4, 'A must-read for suspense fans', 'B01', 'M001'),
    ('FB02', 5, 'Adding emotional depth to the story', 'B02', 'M002'),
    ('FB03', 3, 'Vivid prose for an immersive reading experience', 'B03', 'M003'),
    ('FB04', 3, 'Encourages contemplation of life complexities', 'B04', 'M004'),	
    ('FB05', 3, 'Relentless pacing for a gripping narrative', 'B05', 'M005');

CREATE TABLE Invoice (
    InvoiceID NVARCHAR(50) PRIMARY KEY,
    Date DATE,
    Total INT,
    PublisherID NVARCHAR(50),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID)
);

INSERT INTO Invoice VALUES 
  ('INV01', '2023-10-20', 77, 'P001'),
  ('INV02', '2023-10-27', 73, 'P002'),
  ('INV03', '2023-11-01', 33, 'P003'),
  ('INV04', '2023-11-13', 120, 'P004'),
  ('INV05', '2023-11-28', 38, 'P005');

CREATE TABLE Item_Invoice (
    ItemInvoiceID NVARCHAR(50) PRIMARY KEY,
    Total INT,
    Quantity INT,
    BookListID NVARCHAR(50),
    InvoiceID NVARCHAR(50),
    FOREIGN KEY (BookListID) REFERENCES BookList(BookListID),
    FOREIGN KEY (InvoiceID) REFERENCES Invoice(InvoiceID)
);

INSERT INTO Item_Invoice VALUES
('ITINV001', 77, 2, 'BL001', 'INV01'),
('ITINV002', 73, 2, 'BL002', 'INV02'),
('ITINV003', 33, 1, 'BL003', 'INV03'),
('ITINV004', 120, 3, 'BL004', 'INV04'),
('ITINV005', 38, 1, 'BL005', 'INV05');

CREATE TABLE Item_Ordered (
    ItemID NVARCHAR(50) PRIMARY KEY,
    Quantity NVARCHAR(50),
    Price DECIMAL(10, 2),
    BookID NVARCHAR(50) ,
    OrderID NVARCHAR(50),
    FOREIGN KEY (BookID) REFERENCES Book_In_Store(BookID),
    FOREIGN KEY (OrderID) REFERENCES MembersOrder(OrderID)
);

INSERT INTO Item_Ordered VALUES 
('ITM01', 3, 105, 'B01', 'ORD1'),
 ('ITM02', 2, 80, 'B02', 'ORD2'),
 ('ITM03', 4, 132, 'B03', 'ORD3'),
 ('ITM04', 1, 42, 'B04', 'ORD4'),
 ('ITM05', 3, 114, 'B05', 'ORD5');

CREATE TABLE OrderToPublisher (
    OrderP_ID NVARCHAR(50) PRIMARY KEY,
    Quantity DECIMAL(10, 2),
	Total_Price DECIMAL(10,2),
    OrderDate DATE,
    PublisherID NVARCHAR(50),
    ManagerID NVARCHAR(50),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID),
    FOREIGN KEY (ManagerID) REFERENCES Manager(ManagerID)
);

INSERT INTO OrderToPublisher VALUES
  ('OTP1', 3, 105, '2023-08-03', 'P001', 'M01'),
  ('OTP2', 2, 80, '2023-09-28', 'P002', 'M02'),
  ('OTP3', 4, 132, '2023-10-16', 'P003', 'M03'),
  ('OTP4', 1, 42, '2023-11-03', 'P004', 'M04'),
  ('OTP5', 3, 114, '2023-11-08', 'P005', 'M05');

CREATE TABLE OrderP_Item (
    Orderp_ID NVARCHAR(50),
    PublisherID NVARCHAR(50),
    Price DECIMAL(10, 2),
    Quantity NVARCHAR(50),
    PRIMARY KEY (Orderp_ID),
    FOREIGN KEY (Orderp_ID) REFERENCES OrderToPublisher(OrderP_ID),
    FOREIGN KEY (PublisherID) REFERENCES Publisher(PublisherID) 
);

INSERT INTO OrderP_Item VALUES
('OTP1', 'P001', 105, 3),
('OTP2', 'P002', 80, 2),
('OTP3', 'P003', 132, 4),
('OTP4', 'P004', 42, 1),
('OTP5', 'P005', 114, 3);

--This are all the 10 questions in the assignment--
--Q1 List all the book(s) and sort from highest to lowest of rating. Show book id, book name, publisher, and the rating.done--

SELECT	Book_In_Store.BookID,
		Book_In_Store.Title, 
		Book_In_Store.PublisherID, 
		Feedback.Rating
FROM Book_In_Store
INNER JOIN Feedback ON Book_In_Store.BookID = Feedback.BookID
WHERE Book_In_Store.BookID IN (
    SELECT TOP 5 BookID
    FROM Feedback
    ORDER BY Rating DESC
)
ORDER BY Feedback.Rating DESC;


--Q2 Find the total number of feedback per member. Show member id, member name, and total number of feedback per member.done--

SELECT	Member.MemberID, 
		Member.FirstName, 
		Member.LastName, 
		COUNT(Feedback.FeedbackID) AS FeedbackCount
FROM Member
LEFT JOIN Feedback ON Member.MemberID = Feedback.MemberID
WHERE Feedback.Rating > 0 
GROUP BY Member.MemberID, 
		 Member.FirstName, 
		 Member.LastName;

--Q3 Find the total number of books published by each publisher and sort by total number of books in ascending order.
--Show publisher id, publisher name, and total number of book published.done--

Select	BookList.PublisherID, 
		Publisher.Name, 
		SUM(BookList.Quantity) AS TotalBooksPublished
From BookList
Join Publisher on BookList.PublisherID = Publisher.PublisherID
GROUP BY	BookList.PublisherID, 
			Publisher.Name
ORDER BY TotalBooksPublished ASC;

--Q4 Find the total number of books ordered by store manager from each publisher.-- done

Select	OrderToPublisher.ManagerID, 
		Manager.Name AS ManagerName, 
		OrderToPublisher.PublisherID, 
		Publisher.Name AS PublisherName, 
		OrderToPublisher.Quantity AS TotalNumberBooks
From Manager
Join	OrderToPublisher on Manager.ManagerID = OrderToPublisher.ManagerID
Join	Publisher on Publisher.PublisherID = OrderToPublisher.PublisherID
GROUP BY	OrderToPublisher.ManagerID, 
			Manager.Name, 
			OrderToPublisher.PublisherID, 
			Publisher.Name, 
			OrderToPublisher.Quantity
ORDER BY	ManagerID,
			PublisherID;

--Q5 From the book table, list the books where quantity is more than the average quantity of all books.done--

SELECT *
FROM BookList
WHERE Quantity > (SELECT AVG(Quantity) FROM BookList);

--Q6 List the top 3 bestselling book(s).done--

SELECT TOP 3 *
FROM Item_Ordered 
ORDER BY Price desc;

--Q7 List the top 5 genre bestselling book(s).done--

Select TOP 5	Category.CategoryID, 
				Category.Name AS Genre, 
				Book_In_Store.BookID, 
				Book_In_Store.Title, 
				Item_Ordered.ItemID, 
				Item_Ordered.Quantity  
From Category
Join	Book_In_Store on Category.CategoryID = Book_In_Store.CategoryID 
Join	Item_Ordered on Book_In_Store.BookID = Item_Ordered.BookID
Where Item_Ordered.Quantity >=1
Group by	Category.CategoryID, 
			Category.Name, 
			Book_In_Store.CategoryID, 
			Book_In_Store.BookID, 
			Book_In_Store.Title, 
			Item_Ordered.ItemID, 
			Item_Ordered.Quantity
Order By	Quantity DESC;

--Q8 Show the total members based on gender who are registered as members in APU EBookstore.done--

SELECT Gender, COUNT(*) AS TotalMembers
FROM Member
GROUP BY Gender;

--Q9 A list of purchased books that have not been delivered to members.
--The list should show member identification number, address, contact number, 
--book serial number, book title, quantity, date and status of delivery.done--

Select	MembersOrder.MemberID, 
		Member.Address, 
		Member.Number AS ContactNumber, 
		MembersOrder.OrderID, 
		Book_In_Store.Serial_Number, 
		Book_In_Store.Title, 
		MembersOrder.Total AS Quantity, 
		MembersOrder.Orderdate, 
		MembersOrder.DeliveryStatus
From	MembersOrder
Inner Join	Member on Member.MemberID = MembersOrder.MemberID
Inner Join	Item_Ordered on MembersOrder.OrderID = Item_Ordered.OrderID
Inner Join	Book_In_Store on Item_Ordered.BookID = Book_In_Store.BookID
Where	MembersOrder.DeliveryStatus = 'Non-Deliver';

--Q10 Show the members who made 2 or more orders.done--
Select * From MembersOrder where Total >= 2;
