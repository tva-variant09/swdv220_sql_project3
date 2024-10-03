-- Project 3: Disk Inventory Database
-- Author: Marco Ramos
-- Updated to diskUserMR1 from project02
-- Date: October 1st, 2024


-- Create new login for user
CREATE LOGIN diskUserMR1
    WITH PASSWORD = 'MSPress#1';

-- Create new user
CREATE USER diskUserMR1 FOR LOGIN diskUserMR1;

-- Grant read permission to user
ALTER ROLE db_datareader
    ADD MEMBER diskUserMR1;

-- Grant permission for database tables
GRANT SELECT ON Artist TO diskUserMR1;
GRANT SELECT ON ArtistType TO diskUserMR1;
GRANT SELECT ON Borrower TO diskUserMR1;
GRANT SELECT ON Disk TO diskUserMR1;
GRANT SELECT ON DiskHasArtist TO diskUserMR1;
GRANT SELECT ON DiskHasBorrower TO diskUserMR1;
GRANT SELECT ON DiskType TO diskUserMR1;
GRANT SELECT ON Genre TO diskUserMR1;
GRANT SELECT ON Status TO diskUserMR1;

-- Insert disk types into the DiskType table
INSERT INTO DiskType (Description)
VALUES 
    ('Virryl'),
    ('CD'),
    ('Cassette'),
    ('Digital Download'),
    ('Streaming');

-- Insert genres into Genre table
INSERT INTO Genre (Description)
VALUES
	('Pop'),
    ('Rock'),
    ('Progressive Rock'),
    ('Soundtrack/Pop'),
    ('Disco'),
    ('Country/Pop'),
    ('Pop/Soul'),
    ('Alternative/Rock'),
    ('Hard Rock'),
    ('Rock/Latin'),
    ('Grunge');

-- Insert status options into Status table
INSERT INTO Status (Description)
VALUES
	('Available'), 
	('Checked Out'), 
	('Reserved'),
	('Damaged'),
	('Lost');

-- Insert at least 20 rows into the Disk table with real-world disk names
INSERT INTO Disk (DiskName, ReleaseDate, GenreID, StatusID, DiskTypeID)
VALUES
	('Thriller - Michael Jackson', '1982-11-30', 1, 2, 3),
	('Back in Black - AC/DC', '1980-07-25', 2, 2, 3),
	('The Dark Side of the Moon - Pink Floyd', '1973-03-01', 3, 2, 3),
	('The Bodyguard - Whitney Houston', '1992-11-17', 4, 2, 3),
	('Rumours - Fleetwood Mac', '1977-02-04', 2, 2, 3),
	('Saturday Night Fever - Bee Gees', '1977-11-15', 5, 3, 3),
	('Hotel California - Eagles', '1976-12-08', 2, 2, 3),
	('Come On Over - Shania Twain', '1997-11-04', 6, 3, 3),
	('Abbey Road - The Beatles', '1969-09-26', 2, 2, 3),
	('Led Zeppelin IV - Led Zeppelin', '1971-11-08', 2, 2, 3),
	('21 - Adele', '2011-01-24', 7, 3, 3),
	('Born in the U.S.A. - Bruce Springsteen', '1984-06-04', 2, 2, 3),
	('Bat Out of Hell - Meat Loaf', '1977-10-21', 2, 2, 3),
	('Greatest Hits - Queen', '1981-10-26', 2, 3, 3),
	('Jagged Little Pill - Alanis Morissette', '1995-06-13', 8, 2, 3),
	('Appetite for Destruction - Guns N\ Roses', '1987-07-21', 9, 3, 3),
	('Supernatural - Santana', '1999-06-15', 10, 2, 3),
	('The Wall - Pink Floyd', '1979-11-30', 3, 2, 3),
	('Brothers in Arms - Dire Straits', '1985-05-13', 2, 3, 3),
	('Nevermind - Nirvana', '1991-09-24', 11, 3, 3);

-- Update a disk record using a WHERE clause
UPDATE Disk
SET DiskName = 'Un Verano Sin Ti - Bad Bunny', 
    ReleaseDate = '2022-05-06', 
    GenreID = 1, -- Pop genre
    StatusID = 2, -- Checked out
    DiskTypeID = 3 -- CD
WHERE DiskID = 2;

-- Update at least 1 disk has only 1 word in the name
UPDATE Disk
SET DiskName = 'Back'	
WHERE DiskID = 3;

-- Update at least 1 disk has only 2 words in the name
UPDATE Disk
SET DiskName = 'Dark Side'	
WHERE DiskID = 4;

-- Revert to the original name (more than two words)
UPDATE Disk
SET DiskName = 'The Dark Side of the Moon'	
WHERE DiskID = 4;

-- Insert 21 rows of data
INSERT INTO Borrower (FName, LName, PhoneNumber)
VALUES
	('John', 'Doe', '555-1234'),
	('Jane', 'Smith', '555-5678'),
	('Michael', 'Johnson', '555-8765'),
	('Emily', 'Davis', '555-4321'),
	('Chris', 'Brown', '555-6789'),
	('Jessica', 'Wilson', '555-9876'),
	('Daniel', 'Taylor', '555-3456'),
	('Sarah', 'Moore', '555-6543'),
	('David', 'Anderson', '555-7890'),
	('Laura', 'Thomas', '555-0987'),
	('James', 'Jackson', '555-2345'),
	('Linda', 'White', '555-5432'),
	('Robert', 'Harris', '555-8901'),
	('Patricia', 'Martin', '555-1098'),
	('Charles', 'Thompson', '555-3457'),
	('Barbara', 'Garcia', '555-6548'),
	('Joseph', 'Martinez', '555-7891'),
	('Susan', 'Robinson', '555-0986'),
	('Thomas', 'Clark', '555-2346'),
	('Karen', 'Rodriguez', '555-5433'),
	('Mark', 'Lewis', '555-8902');

-- Delete one row from the Borrower table
DELETE FROM Borrower
WHERE BorrowerID = 21; -- Delete a specific borrower record

-- Insert at least 20 rows of data into DiskHasBorrower table
INSERT INTO DiskHasBorrower (BorrowedDate, DueDate, ReturnedDate, BorrowerID, DiskID)
VALUES
	('2023-01-01', '2023-01-15', '2023-01-10', 1, 2),
	('2023-01-02', '2023-01-16', '2023-01-12', 2, 3),
	('2023-01-03', '2023-01-17', '2023-01-14', 3, 4),
	('2023-01-04', '2023-01-18', '2023-01-16', 4, 5),
	('2023-01-05', '2023-01-19', '2023-01-18', 5, 6),
	('2023-01-06', '2023-01-20', '2023-01-19', 6, 7),
	('2023-01-07', '2023-01-21', '2023-01-20', 7, 8),
	('2023-01-08', '2023-01-22', '2023-01-21', 8, 9),
	('2023-01-09', '2023-01-23', '2023-01-22', 9, 10),
	('2023-01-10', '2023-01-24', '2023-01-23', 10, 11),
	('2023-01-11', '2023-01-25', '2023-01-24', 11, 12),
	('2023-01-12', '2023-01-26', '2023-01-25', 12, 13),
	('2023-01-13', '2023-01-27', '2023-01-26', 13, 14),
	('2023-01-06', '2023-01-20', '2023-01-19', 14, 15),
	('2023-01-07', '2023-01-21', '2023-01-20', 15, 16),
	('2023-01-08', '2023-01-22', '2023-01-21', 16, 17),
	('2023-01-08', '2023-01-22', '2023-01-21', 17, 18),
	('2023-01-09', '2023-01-23', '2023-01-22', 18, 19),
	('2023-01-10', '2023-01-24', '2023-01-23', 19, 20),
	('2023-01-11', '2023-01-25', '2023-01-24', 20, 21);

-- insert two different disk
INSERT INTO Disk 
VALUES
	('Beautiful Things - Benson Boone', '2024', 1, 3, 3),
	('Por Primera Vez - Camilo', '2020', 1, 3, 3);

-- insert two different borrowers
INSERT INTO Borrower 
VALUES
	('Pedro', 'Martinez', '(208) 123-4567'),
	('Alex', 'Walmart', '(555) 123-1234');

-- At least 1 disk has been borrowed by the same borrower 2 different times
-- Insert a duplicate borrow entry with different dates
INSERT INTO DiskHasBorrower (BorrowedDate, DueDate, ReturnedDate, BorrowerID, DiskID)
VALUES
	('2023-02-01', '2023-02-15', '2023-02-10', 1, 2);

-- this checks for borrower checkout same disk more than two times
SELECT DiskID, BorrowerID, COUNT(*) as BorrowCount
FROM DiskHasBorrower
GROUP BY DiskID, BorrowerID
HAVING COUNT(*) >= 2;

-- at least 1 disk in the disk table does not have a related row here
SELECT d.*
FROM Disk d
LEFT JOIN DiskHasBorrower dhb ON d.DiskID = dhb.DiskID
WHERE dhb.DiskID IS NULL;

-- at least 1 disk must have at least 2 different rows here
SELECT DiskID
FROM DiskHasBorrower
GROUP BY DiskID
HAVING COUNT(*) >= 2;

--	at least 1 borrower in the borrower table does not have a related row here
SELECT b.*
FROM Borrower b
LEFT JOIN DiskHasBorrower dhb ON b.BorrowerID = dhb.BorrowerID
WHERE dhb.BorrowerID IS NULL;

-- Query to find a disk that has been borrowed by the same borrower twice
SELECT DiskID, BorrowerID, COUNT(*) AS BorrowCount
FROM DiskHasBorrower
GROUP BY DiskID, BorrowerID
HAVING COUNT(*) >= 2;

-- Query to list disks that are on loan and have not been returned
SELECT b.FName, b.Lname, d.*
FROM Disk d
JOIN DiskHasBorrower dhb ON d.DiskID = dhb.DiskID
JOIN Borrower b ON dhb.BorrowerID = b.BorrowerID
WHERE dhb.ReturnedDate IS NULL;