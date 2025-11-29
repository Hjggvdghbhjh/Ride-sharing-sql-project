create database project;
use project;




/* Creating the Tables */

CREATE TABLE Drivers (
    DirverID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Join_Date DATE,
    Avg_Rating DECIMAL(10 , 2 ),
    Completed_Ride INT
);

alter table Drivers rename column DirverID to Driver_ID;

CREATE TABLE Customers (
    Customer_ID VARCHAR(50) PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Gender CHAR(5),
    City varchar(20),
    Join_Date DATE,
    Loyalty_Status VARCHAR(20)
);

CREATE TABLE Vehicles (
    Vehicle_ID VARCHAR(50) PRIMARY KEY,
    Driver_ID VARCHAR(20),
    Vehicle_Type VARCHAR(20),
    Vehicle_Model VARCHAR(20),
    Vehicle_Number VARCHAR(20),
    Year INT,
    FOREIGN KEY (Driver_ID)
        REFERENCES Drivers(Driver_ID)
);

CREATE TABLE Payments (
    Payment_ID VARCHAR(10) PRIMARY KEY,
    Payment_Method VARCHAR(20),
    Amount DECIMAL(10,2),
    Status VARCHAR(20)
);

CREATE TABLE Locations (
    Location_ID VARCHAR(20) PRIMARY KEY,
    City VARCHAR(50),
    Pickup_Point VARCHAR(100),
    Dropup_Point VARCHAR(100)
);

CREATE TABLE Rides (
    Ride_ID VARCHAR(10) PRIMARY KEY,
    Customer_ID VARCHAR(20),
    Driver_ID VARCHAR(20),
    Vehicle_ID VARCHAR(20),
    Location_ID VARCHAR(20),
    City VARCHAR(20),
    Date DATE,
    Time TIME,
    Distance_Km DECIMAL(5 , 2 ),
    Fare DECIMAL(10 , 2 ),
    Payment_ID VARCHAR(20),
    Reting DECIMAL(2 , 1 ),
    FOREIGN KEY (Customer_Id) REFERENCES Customers (Customer_ID),
    FOREIGN KEY (Driver_ID) REFERENCES Drivers (Driver_ID),
    FOREIGN KEY (Vehicle_ID) REFERENCES Vehicles (Vehicle_ID),
    FOREIGN KEY (Location_ID) REFERENCES Locations (Location_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payments (Payment_ID)
);

CREATE TABLE RideFeedback (
    Feedback_ID VARCHAR(10) PRIMARY KEY,
    Ride_ID VARCHAR(20),
    Customer_ID VARCHAR(20),
    Comments VARCHAR(255),
    Rating DECIMAL(2 , 1 ),
    FOREIGN KEY (Ride_ID) REFERENCES Rides (Ride_ID),
    FOREIGN KEY (Customer_ID) REFERENCES Customers (Customer_ID)
);

-- Insert the Values into the Tables

INSERT INTO Customers(Customer_ID,Name,Age,Gender,City,Join_Date,Loyalty_Status) VALUES
('C001','Rohan',29,'M','Mumbai','2022-01-05','Gold'),
('C002','Meera',34,'F','Delhi','2021-06-11','Silver'),
('C003','Karan',41,'M','Mumbai','2020-09-19','Platinum'),
('C004','Aisha',27,'F','Bangalore','2022-03-21','Silver'),
('C005','Sneha',31,'F','Kolkata','2021-12-09','Gold'),
('C006','Dev',36,'M','Delhi','2023-01-12','Bronze'),
('C007','Simran',25,'F','Bangalore','2022-06-17','Gold'),
('C008','Vikram',33,'M','Mumbai','2021-11-22','Silver'),
('C009','Neha',30,'F','Delhi','2023-02-01','Gold'),
('C010','Amit',28,'M','Kolkata','2022-05-20','Bronze');
insert into Customers values('C011','Sahil',22,'M','Kolkata','2025-08-21','Bronze');
select * from customers;



INSERT INTO Drivers (Driver_ID,Name,City,Join_Date,Avg_Rating,Completed_Ride) VALUES
('D001','Rajesh','Mumbai','2022-03-01',4.7,560),
('D002','Anita','Bangalore','2021-07-15',4.9,730),
('D003','Salman','Delhi','2023-01-20',4.5,310),
('D004','Priya','Mumbai','2020-10-11',4.6,900),
('D005','Arjun','Kolkata','2021-05-03',4.8,650),
('D006','Farhan','Delhi','2022-09-09',4.4,280),
('D007','Isha','Bangalore','2023-03-18',4.7,190),
('D008','Suresh','Mumbai','2021-01-25',4.5,770),
('D009','Tina','Kolkata','2022-07-07',4.6,340),
('D010','Neha','Delhi','2023-04-18',4.7,250);
select * from drivers;

INSERT INTO Drivers VALUES
('D011','Shubham','Mumbai','2022-10-01',2.5,10),
('D012','Ketan','Bangalore','2021-7-15',3.1,30),
('D023','Saleem','Delhi','2025-01-20',3.9,50);
update Drivers set Avg_Rating = 3.40 where Driver_ID ='D005' ;

INSERT INTO Vehicles (Vehicle_ID,Driver_ID,Vehicle_Type,Vehicle_Model,Vehicle_Number,Year) VALUES
('V001','D001','Car','Toyota Etios','MH12AB1234',2020),
('V002','D002','Car','Hyundai i20','KA05BC4567',2021),
('V003','D003','Bike','Honda Activa','DL03DE7890',2019),
('V004','D004','Car','Maruti Swift','MH14CD6789',2022),
('V005','D005','Car','Honda City','WB20EF3456',2021),
('V006','D006','Car','Hyundai Verna','DL09XY2222',2020),
('V007','D007','Bike','Royal Enfield','KA03GH9876',2021),
('V008','D008','Car','Tata Nexon','MH15JK1111',2022),
('V009','D009','Car','Suzuki Baleno','WB10LM4567',2019),
('V010','D010','Car','Hyundai Creta','DL11ZZ6789',2021);



INSERT INTO Payments (Payment_ID,Payment_Method,Amount,Status) VALUES
('P001','Card',320,'Success'),
('P002','Cash',250,'Success'),
('P003','Wallet',150,'Success'),
('P004','UPI',480,'Success'),
('P005','Card',280,'Failed'),
('P006','Cash',200,'Success'),
('P007','Wallet',310,'Success'),
('P008','UPI',400,'Success'),
('P009','Card',275,'Success'),
('P010','Wallet',340,'Success');


SELECT * FROM payments;


INSERT INTO Locations (Location_ID,City,Pickup_Point,Dropup_Point) VALUES
('L001','Mumbai','Andheri','Bandra'),
('L002','Delhi','Connaught Place','Karol Bagh'),
('L003','Bangalore','MG Road','Whitefield'),
('L004','Kolkata','Howrah','Salt Lake'),
('L005','Mumbai','Powai','Dadar'),
('L006','Delhi','Saket','Dwarka'),
('L007','Bangalore','Electronic City','Indiranagar'),
('L008','Kolkata','Park Street','Dum Dum'),
('L009','Mumbai','Borivali','Churchgate'),
('L010','Delhi','Lajpat Nagar','Hauz Khas');
SELECT * FROM locations;

INSERT INTO Rides VALUES
('R101','C001','D001','V001','L001','Mumbai','2025-01-01','08:15',12.0,320,'P001',4.8),
('R102','C002','D003','V003','L002','Delhi','2025-01-01','09:30',8.5,250,'P002',4.6),
('R103','C004','D002','V002','L003','Bangalore','2025-01-02','10:45',5.0,150,'P003',4.2),
('R104','C005','D005','V005','L004','Kolkata','2025-01-03','12:10',18.0,480,'P004',5.0),
('R105','C003','D004','V004','L005','Mumbai','2025-01-04','14:20',10.0,280,'P005',4.4),
('R106','C006','D006','V006','L006','Delhi','2025-01-05','15:10',7.0,200,'P006',4.3),
('R107','C007','D007','V007','L007','Bangalore','2025-01-05','17:40',14.5,310,'P007',4.9),
('R108','C008','D008','V008','L008','Mumbai','2025-01-06','19:05',16.0,400,'P008',4.7),
('R109','C009','D009','V009','L009','Kolkata','2025-01-07','20:25',9.2,275,'P009',4.5),
('R110','C010','D010','V010','L010','Delhi','2025-01-08','21:15',12.5,340,'P010',4.9),
('R111','C001','D004','V004','L005','Mumbai','2025-01-09','08:20',11.0,300,'P001',4.6),
('R112','C002','D006','V006','L002','Delhi','2025-01-09','09:45',6.5,190,'P002',4.4),
('R113','C003','D002','V002','L003','Bangalore','2025-01-10','10:30',9.0,260,'P003',4.7),
('R114','C004','D008','V008','L001','Mumbai','2025-01-11','12:15',15.5,420,'P004',5.0),
('R115','C005','D009','V009','L004','Kolkata','2025-01-12','13:40',8.2,210,'P005',4.1),
('R116','C006','D001','V001','L009','Mumbai','2025-01-13','15:50',13.0,360,'P006',4.8),
('R117','C007','D003','V003','L010','Delhi','2025-01-14','17:25',7.8,230,'P007',4.6),
('R118','C008','D005','V005','L008','Kolkata','2025-01-15','19:30',16.4,450,'P008',4.9),
('R119','C009','D002','V002','L007','Bangalore','2025-01-16','20:05',10.2,310,'P009',4.3),
('R120','C010','D006','V006','L002','Delhi','2025-01-17','21:45',9.5,290,'P010',4.5),
('R121','C001','D007','V007','L003','Bangalore','2025-01-18','08:00',14.0,350,'P001',4.7),
('R122','C002','D008','V008','L009','Mumbai','2025-01-19','09:10',12.8,330,'P002',4.6),
('R123','C003','D009','V009','L004','Kolkata','2025-01-20','11:25',17.3,500,'P003',5.0),
('R124','C004','D010','V010','L006','Delhi','2025-01-21','13:15',8.7,240,'P004',4.2),
('R125','C005','D001','V001','L001','Mumbai','2025-01-22','15:05',11.9,315,'P005',4.8);
insert into Rides values('R126','C011','D002','V002','L008','Kolkata','2025-08-21','15:05',10.5,300,'P003',4.5);

INSERT INTO Rides VALUES
('R151','C006','D007','V007','L003','Bangalore','2025-01-23','08:45',9.5,270,'P006',4.4),
('R127','C007','D008','V008','L004','Kolkata','2025-01-23','10:10',12.2,350,'P007',4.8),
('R128','C008','D009','V009','L005','Mumbai','2025-01-24','11:30',14.8,410,'P008',4.9),
('R129','C009','D010','V010','L006','Delhi','2025-01-24','13:20',7.6,220,'P009',4.2),
('R130','C010','D001','V001','L007','Bangalore','2025-01-25','14:05',16.3,470,'P010',5.0),
('R131','C001','D002','V002','L008','Mumbai','2025-01-25','15:15',10.1,300,'P001',4.7),
('R132','C002','D003','V003','L009','Kolkata','2025-01-26','16:45',13.4,390,'P002',4.5),
('R133','C003','D004','V004','L010','Delhi','2025-01-26','18:25',6.8,180,'P003',4.3),
('R134','C004','D005','V005','L001','Mumbai','2025-01-27','19:50',17.0,500,'P004',4.9),
('R135','C005','D006','V006','L002','Delhi','2025-01-28','20:30',11.6,330,'P005',4.6),
('R136','C006','D007','V007','L003','Bangalore','2025-01-28','21:15',15.2,450,'P006',5.0),
('R137','C007','D008','V008','L004','Kolkata','2025-01-29','08:05',9.9,260,'P007',4.4),
('R138','C008','D009','V009','L005','Mumbai','2025-01-29','09:25',12.7,370,'P008',4.8),
('R139','C009','D010','V010','L006','Delhi','2025-01-30','10:40',14.2,420,'P009',4.7),
('R140','C010','D001','V001','L007','Bangalore','2025-01-30','12:15',8.5,240,'P010',4.3),
('R141','C001','D002','V002','L008','Mumbai','2025-01-31','13:05',18.0,520,'P001',5.0),
('R142','C002','D003','V003','L009','Kolkata','2025-02-01','14:20',7.1,210,'P002',4.2),
('R143','C003','D004','V004','L010','Delhi','2025-02-01','15:45',10.8,310,'P003',4.6),
('R144','C004','D005','V005','L001','Mumbai','2025-02-02','17:00',13.9,390,'P004',4.9),
('R145','C005','D006','V006','L002','Delhi','2025-02-02','18:30',16.7,480,'P005',5.0),
('R146','C006','D007','V007','L003','Bangalore','2025-02-03','19:40',9.3,260,'P006',4.5),
('R147','C007','D008','V008','L004','Kolkata','2025-02-03','20:25',12.5,360,'P007',4.7),
('R148','C008','D009','V009','L005','Mumbai','2025-02-04','21:50',14.1,400,'P008',4.8),
('R149','C009','D010','V010','L006','Delhi','2025-02-05','08:35',11.3,320,'P009',4.6),
('R150','C010','D001','V001','L007','Bangalore','2025-02-05','09:55',15.6,450,'P010',4.9);

SELECT * FROM rides;

show tables;

INSERT INTO RideFeedback (Feedback_ID, Ride_ID, Customer_ID, Comments, Rating)
VALUES
('FD001', 'R101', 'C001', 'Smooth ride, very polite driver.', 4.5),
('FD002', 'R102', 'C002', 'Car was clean and comfortable.', 4.8),
('FD003', 'R103', 'C003', 'Driver arrived late but was courteous.', 3.7),
('FD004', 'R104', 'C004', 'Excellent service, will book again.', 5.0),
('FD005', 'R105', 'C005', 'Average experience, nothing special.', 3.0),
('FD006', 'R106', 'C006', 'Driver took a longer route.', 2.5),
('FD007', 'R107', 'C007', 'Quick and efficient ride.', 4.2),
('FD008', 'R108', 'C008', 'Driver was friendly and helpful.', 4.6),
('FD009', 'R109', 'C009', 'Unpleasant odor in the car.', 2.8),
('FD010', 'R110', 'C010', 'Great experience overall.', 4.9);

select * from Customers;
select * from Drivers;
select * from locations;
select * from Payments;
select * from Rides;
select * from RideFeedback;
select * from vehicles;


# 1. Identify the top 3 drivers with the highest earnings in each city using ranking functions.
use project;

SELECT rr.Driver_ID, d.Name,rr.City,Total_Earnings
FROM (
    SELECT R.City, R.Driver_ID, SUM(R.Fare) AS Total_Earnings,
           RANK() OVER (PARTITION BY R.City ORDER BY SUM(R.Fare) DESC) AS Rank_Driver
    FROM Rides R
    GROUP BY R.City, R.Driver_ID
) rr
join Drivers d on rr.Driver_ID = d.Driver_ID
WHERE Rank_Driver <= 3;



# 2.Find customers whose total spending is greater than the average spending across all customers.

SELECT c.Name, SUM(r.Fare) 'total Spending'FROM rides r
INNER JOIN customers c ON r.Customer_ID = c.Customer_ID
GROUP BY c.Name
HAVING SUM(r.Fare) > (SELECT AVG(TotalFare) FROM
(select sum(Fare) as TotalFare from Rides
group by Customer_ID) as CustomerTotals );

select  avg(Fare) 'Average Spending Amount' from Rides;

select * from rides where Customer_ID ='C011';

# 3. Determine the driver with the maximum number of rides in each city using window functions.

select Name,
 City,
 Completed_Ride 
 from (select Name,
 City,
 Completed_Ride,
 row_number() over (partition by City order by Completed_Ride desc )
as rn from Drivers) as 
ranked where rn =1;

# 4. Evaluate each driver’s performance by calculating their average rating and 
# classify them as Excellent, Good, or Needs Improvement.

SELECT row_number() over ( order by Avg_Rating desc)'Index',
Name, Avg_Rating,
    IF(avg_Rating >4.5, 'Excellent',
        IF(avg_Rating >= 3.5,'Good', 'Needs Improvement')) ' Performance'
FROM Drivers;

/* Q.5 Top Spending Customers
 Find the top 5 customers who spent the most on rides 
 with their name, city, loyalty status, and total spending.*/
 
 select c.Customer_ID,c.Name,c.City,c.Loyalty_Status,sum(p.Amount) as Total_Spending from Rides r
 inner join Customers c on r.Customer_ID = c.Customer_ID
 inner join Payments p on r.Payment_ID =p.Payment_ID
 group by c.Customer_ID,c.Name ,c.City,c.Loyalty_Status
 order by Total_Spending desc limit 5;
 
 /* Q.6 Driver Performance Analysis
calculate the average fare per ride and total rides completed by each driver.
Show only those drivers whose average rating is greater than 4.5. */

select d.Driver_ID,d.Name 'Driver Name',
avg(r.Fare) as Avg_Fare, 
count(r.Ride_ID) as Total_Rides, 
d.Avg_Rating 
from Rides r
join Drivers d on r.Driver_ID = d.Driver_ID
group by d.Driver_ID , d.Name
having d.Avg_Rating > 4.5;
 
/*Q.6 Most Popular Pickup & Drop Locations
identify the most frequently used pickup and drop pairs from the Locations table. 
Also show the total number of rides and total revenue generated for each pickup-drop pair. */

select l.Pickup_Point,l.Dropup_Point,count(r.Ride_ID) as Total_Rides,sum(p.Amount) as Total_Revenue from Rides r
inner join Locations l on l.Location_ID = r.Location_ID
inner join Payments p on r.Payment_ID= p.Payment_ID
group by l.Pickup_Point,l.Dropup_Point
order by Total_Rides desc,Total_Revenue desc;

/*Q.7 High-Value Customers 
Problem: Find customers who have taken rides with a total fare greater than the average total fare of all customers.*/
SELECT c.Customer_ID, c.Name, SUM(r.Fare) AS Total_Fare
FROM Rides r
JOIN Customers c ON r.Customer_ID = c.Customer_ID
GROUP BY c.Customer_ID , c.Name
HAVING SUM(r.Fare) > (SELECT AVG(TotalFare)
    FROM(SELECT SUM(Fare) AS TotalFare
        FROM Rides
        GROUP BY Customer_ID) AS CustomerTotals);

/* Q.8 Customers Without Feedback
Problem: Find all customers who have taken at least one ride but never provided feedback.*/
select distinct c.Customer_ID,c.Name ,c.City from Customers c
join rides r on c.Customer_ID = r.Customer_ID
left join ridefeedback fb on c.Customer_ID = fb.Customer_Id
where fb.Feedback_ID is null;

/* Q.9 Top Paying Customers in Each City
Problem: Find the top 3 customers by total spending in each city.*/

select * from (select c.Customer_ID,c.Name,c.City,sum(r.Fare) as Total_Spending , 
rank()over(partition by c.City order by sum(r.Fare) desc) as Rank_in_City
from Rides r
join Customers c on r.Customer_ID = c.Customer_ID
group by c.Customer_ID,c.Name,c.City) as RankedCustomers
where Rank_in_City <=3;

use project;

/*Q.10 Ride Volume Trends (DATE functions + GROUP BY + HAVING)
Problem: Show the number of rides taken per month, 
ridesand only return months where rides were above the overall monthly average.
*/
SELECT 
    MONTH(Date) AS Ride_Month,
    YEAR(Date) AS Ride_Year,
    COUNT(Ride_ID) AS Total_Rides
FROM Rides
GROUP BY YEAR(Date), MONTH(Date)
HAVING COUNT(Ride_ID) > (
    SELECT AVG(MonthlyCount)
    FROM (
        SELECT COUNT(Ride_ID) AS MonthlyCount
        FROM Rides
        GROUP BY YEAR(Date), MONTH(Date)
    ) MonthlyTotals
)
ORDER BY Ride_Year, Ride_Month;

select * from vehicles;
select * from rides;

select v.Vehicle_Type, count(vehicle_Type) 'More Used' from vehicles v 
inner join rides r on v.Vehicle_ID = r.Vehicle_ID
group by v.Vehicle_Type;


select Payment_Method, count(*)  as  Total from Payments
group by Payment_Method
order by Total desc limit 1;

select * from rides;

select p.Payment_Method,count( p.Payment_ID)as Total from rides r
join Payments p on r.Payment_ID = p.Payment_ID
group by p.Payment_Method
 order by Total desc limit 1;

select p.Payment_Method,count( p.Payment_ID)as Total from rides r
join Payments p on r.Payment_ID = p.Payment_ID
group by p.Payment_Method
having Total < (select max(Totl) from(select count(Payment_ID) as Totl from rides ) rss)
 order by Total desc ;