-- This file is to bootstrap a database for the CS3200 project. 

-- Create a new database.  You can change the name later.  You'll
-- need this name in the FLASK API file(s),  the AppSmith 
-- data source creation.
create database bookstore;

-- Via the Docker Compose file, a special user called webapp will 
-- be created in MySQL. We are going to grant that user 
-- all privilages to the new database we just created. 
-- TODO: If you changed the name of the database above, you need 
-- to change it here too.
grant all privileges on bookstore.* to 'webapp'@'%';
flush privileges;

-- Move into the database we just created.
-- TODO: If you changed the name of the database above, you need to
-- change it here too. 
use bookstore;

-- Put your DDL 
CREATE TABLE Author (
   AuthorID INT AUTO_INCREMENT PRIMARY KEY,
   FirstName VARCHAR(255) NOT NULL,
   LastName VARCHAR(255) NOT NULL
);


CREATE TABLE Customer (
   CustomerID INT PRIMARY KEY,
   FirstName VARCHAR(255),
   LastName VARCHAR(255),
   Address VARCHAR(255),
   City VARCHAR(255),
   State VARCHAR(255),
   Email VARCHAR(255)
);


CREATE TABLE CustomerEmail (
   Email VARCHAR(255),
   CustomerID INT,
   PRIMARY KEY (Email, CustomerID),
   FOREIGN KEY (CustomerID)
       REFERENCES Customer(CustomerID)
);


CREATE TABLE Book (
   BookID INT AUTO_INCREMENT PRIMARY KEY,
   Title VARCHAR(255) NOT NULL,
   Genre VARCHAR(50),
   ISBN VARCHAR(50),
   ReleaseDate VARCHAR(50),
   BookFormat VARCHAR(50),
   Status VARCHAR(50),
   OriginalPrice DECIMAL(10, 2),
   IsOnSale BOOLEAN,
   CurrentPrice DECIMAL(10, 2),
   IsTrending BOOLEAN,
   NumStock INT
);


CREATE TABLE Book_Author (
   BookID INT,
   AuthorID INT,
   PRIMARY KEY (BookID, AuthorID),
   FOREIGN KEY (BookID)
       REFERENCES Book(BookID),
   FOREIGN KEY (AuthorID)
       REFERENCES Author(AuthorID)
);


CREATE TABLE InventoryShipment (
   ShipmentID INT AUTO_INCREMENT PRIMARY KEY,
   ArrivalDate DATE,
   SupplierName VARCHAR(255)
);


CREATE TABLE Shipment_Book (
   BookID INT,
   ShipmentID INT,
   PRIMARY KEY (BookID, ShipmentID),
   FOREIGN KEY (BookID)
       REFERENCES Book(BookID),
   FOREIGN KEY (ShipmentID)
       REFERENCES InventoryShipment(ShipmentID)
);


CREATE TABLE Orders (
   OrderID INT AUTO_INCREMENT PRIMARY KEY,
   CustomerID INT,
   OrderDate DATE,
   ArrivalDate DATE,
   CurrentLocation VARCHAR(255),
   Address VARCHAR(255),
   IsGift BOOLEAN,
   GiftMessage TEXT,
   FOREIGN KEY (CustomerID)
       REFERENCES Customer(CustomerID)
);


CREATE TABLE Order_Book (
   OrderID INT,
   BookID INT,
   PRIMARY KEY (OrderID, BookID),
   FOREIGN KEY (OrderID)
       REFERENCES Orders(OrderID),
   FOREIGN KEY (BookID)
       REFERENCES Book(BookID)
);


CREATE TABLE Profile (
   Username VARCHAR(255) PRIMARY KEY,
   CustomerID INT,
   Bio TEXT,
   FOREIGN KEY (CustomerID)
       REFERENCES Customer(CustomerID)
);




CREATE TABLE Profile_Book (
   BookID INT,
   Username VARCHAR(255),
   PRIMARY KEY (BookID, Username),
   FOREIGN KEY (BookID) REFERENCES Book(BookID),
   FOREIGN KEY (Username) REFERENCES Profile(Username)
);


CREATE TABLE Review (
   BookID INT,
   CustomerID INT,
   Rating INT,
   Comment TEXT,
   PRIMARY KEY (CustomerID, BookID),
   FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID) ON DELETE CASCADE,
   FOREIGN KEY (BookID) REFERENCES Book(BookID)
);


-- Add sample data. 
/* INSERT INTO fav_colors
  (name, color)
VALUES
  ('dev', 'blue'),
  ('pro', 'yellow'),
  ('junior', 'red'); */

insert into Author (AuthorID, FirstName, LastName) values (1, 'Penn', 'Topp');
insert into Author (AuthorID, FirstName, LastName) values (2, 'Izak', 'Pointin');
insert into Author (AuthorID, FirstName, LastName) values (3, 'Daffy', 'Penvarne');
insert into Author (AuthorID, FirstName, LastName) values (4, 'Addy', 'Ausello');
insert into Author (AuthorID, FirstName, LastName) values (5, 'Terrye', 'Jeffes');
insert into Author (AuthorID, FirstName, LastName) values (6, 'Chaddy', 'Shrubshall');
insert into Author (AuthorID, FirstName, LastName) values (7, 'Marice', 'Staries');
insert into Author (AuthorID, FirstName, LastName) values (8, 'Lazar', 'Flaonier');
insert into Author (AuthorID, FirstName, LastName) values (9, 'Sibilla', 'Warburton');
insert into Author (AuthorID, FirstName, LastName) values (10, 'Colline', 'Parsisson');
insert into Author (AuthorID, FirstName, LastName) values (11, 'Seth', 'Dunckley');
insert into Author (AuthorID, FirstName, LastName) values (12, 'Karrie', 'O''Sullivan');
insert into Author (AuthorID, FirstName, LastName) values (13, 'Elnora', 'Matijasevic');
insert into Author (AuthorID, FirstName, LastName) values (14, 'Valentijn', 'Hannis');
insert into Author (AuthorID, FirstName, LastName) values (15, 'Anderea', 'Geale');
insert into Author (AuthorID, FirstName, LastName) values (16, 'Ailsun', 'Sauvan');
insert into Author (AuthorID, FirstName, LastName) values (17, 'Wrennie', 'Toffanini');
insert into Author (AuthorID, FirstName, LastName) values (18, 'Tadeas', 'Brizell');
insert into Author (AuthorID, FirstName, LastName) values (19, 'Casey', 'Wanjek');
insert into Author (AuthorID, FirstName, LastName) values (20, 'Randie', 'Morcom');
insert into Author (AuthorID, FirstName, LastName) values (21, 'Obed', 'Scullard');
insert into Author (AuthorID, FirstName, LastName) values (22, 'Vivia', 'Dunham');
insert into Author (AuthorID, FirstName, LastName) values (23, 'Ellyn', 'Jinkins');
insert into Author (AuthorID, FirstName, LastName) values (24, 'Bartholomeo', 'Doughartie');
insert into Author (AuthorID, FirstName, LastName) values (25, 'Adele', 'Rigbye');
insert into Author (AuthorID, FirstName, LastName) values (26, 'Shermie', 'Stoke');
insert into Author (AuthorID, FirstName, LastName) values (27, 'Guillermo', 'Causon');
insert into Author (AuthorID, FirstName, LastName) values (28, 'Maddie', 'Charles');
insert into Author (AuthorID, FirstName, LastName) values (29, 'Westleigh', 'Dyka');
insert into Author (AuthorID, FirstName, LastName) values (30, 'Boigie', 'Purkins');
insert into Author (AuthorID, FirstName, LastName) values (31, 'Harriett', 'Prestwich');
insert into Author (AuthorID, FirstName, LastName) values (32, 'Lauryn', 'Littlefair');
insert into Author (AuthorID, FirstName, LastName) values (33, 'Alexio', 'Mussard');
insert into Author (AuthorID, FirstName, LastName) values (34, 'Tomi', 'Stopper');
insert into Author (AuthorID, FirstName, LastName) values (35, 'Adams', 'Dyet');
insert into Author (AuthorID, FirstName, LastName) values (36, 'Burch', 'Stovold');
insert into Author (AuthorID, FirstName, LastName) values (37, 'Kinna', 'Elsie');
insert into Author (AuthorID, FirstName, LastName) values (38, 'Eben', 'Corten');
insert into Author (AuthorID, FirstName, LastName) values (39, 'Cam', 'Parnham');
insert into Author (AuthorID, FirstName, LastName) values (40, 'Andros', 'Synke');
insert into Author (AuthorID, FirstName, LastName) values (41, 'Darrel', 'Dower');
insert into Author (AuthorID, FirstName, LastName) values (42, 'Guenna', 'Allston');
insert into Author (AuthorID, FirstName, LastName) values (43, 'Bennett', 'Delgaty');
insert into Author (AuthorID, FirstName, LastName) values (44, 'Cass', 'Sommerling');
insert into Author (AuthorID, FirstName, LastName) values (45, 'Amery', 'Tranckle');
insert into Author (AuthorID, FirstName, LastName) values (46, 'Westleigh', 'Aubery');
insert into Author (AuthorID, FirstName, LastName) values (47, 'Fidelity', 'Offner');
insert into Author (AuthorID, FirstName, LastName) values (48, 'Farley', 'Hudleston');
insert into Author (AuthorID, FirstName, LastName) values (49, 'Alejandrina', 'Braidon');
insert into Author (AuthorID, FirstName, LastName) values (50, 'Rosy', 'Gaspar');
insert into Author (AuthorID, FirstName, LastName) values (51, 'Truman', 'Lotte');
insert into Author (AuthorID, FirstName, LastName) values (52, 'Rois', 'Blaase');
insert into Author (AuthorID, FirstName, LastName) values (53, 'Marissa', 'Perche');
insert into Author (AuthorID, FirstName, LastName) values (54, 'Rubin', 'Haliburn');
insert into Author (AuthorID, FirstName, LastName) values (55, 'Floria', 'Clulee');
insert into Author (AuthorID, FirstName, LastName) values (56, 'Marin', 'Newcomen');
insert into Author (AuthorID, FirstName, LastName) values (57, 'Corrie', 'Dunford');
insert into Author (AuthorID, FirstName, LastName) values (58, 'Selma', 'Smithen');
insert into Author (AuthorID, FirstName, LastName) values (59, 'Rosalind', 'Hiddy');
insert into Author (AuthorID, FirstName, LastName) values (60, 'Jobey', 'Caws');
insert into Author (AuthorID, FirstName, LastName) values (61, 'Lenka', 'Vanin');
insert into Author (AuthorID, FirstName, LastName) values (62, 'Pier', 'Dabel');
insert into Author (AuthorID, FirstName, LastName) values (63, 'Fawne', 'Iglesia');
insert into Author (AuthorID, FirstName, LastName) values (64, 'Dee', 'Noone');
insert into Author (AuthorID, FirstName, LastName) values (65, 'Minerva', 'Bertin');
insert into Author (AuthorID, FirstName, LastName) values (66, 'Tanney', 'Brannan');
insert into Author (AuthorID, FirstName, LastName) values (67, 'Casi', 'Slate');
insert into Author (AuthorID, FirstName, LastName) values (68, 'Ethyl', 'Frostdick');
insert into Author (AuthorID, FirstName, LastName) values (69, 'Ceil', 'Sayce');
insert into Author (AuthorID, FirstName, LastName) values (70, 'Amabelle', 'McJury');
insert into Author (AuthorID, FirstName, LastName) values (71, 'Benetta', 'Huzzay');
insert into Author (AuthorID, FirstName, LastName) values (72, 'Odelia', 'Schrir');
insert into Author (AuthorID, FirstName, LastName) values (73, 'Marinna', 'Stirrup');
insert into Author (AuthorID, FirstName, LastName) values (74, 'Toddy', 'Sooper');
insert into Author (AuthorID, FirstName, LastName) values (75, 'Dallas', 'Batalle');
insert into Author (AuthorID, FirstName, LastName) values (76, 'Astrid', 'Enden');
insert into Author (AuthorID, FirstName, LastName) values (77, 'Daniele', 'Schaumann');
insert into Author (AuthorID, FirstName, LastName) values (78, 'Lowrance', 'Guidotti');
insert into Author (AuthorID, FirstName, LastName) values (79, 'Axe', 'Lewer');
insert into Author (AuthorID, FirstName, LastName) values (80, 'Creighton', 'Ivanaev');
insert into Author (AuthorID, FirstName, LastName) values (81, 'Selia', 'Varker');
insert into Author (AuthorID, FirstName, LastName) values (82, 'Florella', 'Gellion');
insert into Author (AuthorID, FirstName, LastName) values (83, 'Sherwin', 'Tomlin');
insert into Author (AuthorID, FirstName, LastName) values (84, 'Nadia', 'Bernardini');
insert into Author (AuthorID, FirstName, LastName) values (85, 'Stanislaus', 'Sobey');
insert into Author (AuthorID, FirstName, LastName) values (86, 'Fielding', 'Hazard');
insert into Author (AuthorID, FirstName, LastName) values (87, 'Marian', 'Elger');
insert into Author (AuthorID, FirstName, LastName) values (88, 'Cheryl', 'Mc Kellen');
insert into Author (AuthorID, FirstName, LastName) values (89, 'Fredra', 'Andrzejewski');
insert into Author (AuthorID, FirstName, LastName) values (90, 'Daisey', 'Cathrall');
insert into Author (AuthorID, FirstName, LastName) values (91, 'Tedra', 'McCart');
insert into Author (AuthorID, FirstName, LastName) values (92, 'Delia', 'Ricardon');
insert into Author (AuthorID, FirstName, LastName) values (93, 'Jinny', 'Benley');
insert into Author (AuthorID, FirstName, LastName) values (94, 'Clayson', 'Kilmartin');
insert into Author (AuthorID, FirstName, LastName) values (95, 'Arvy', 'Mandifield');
insert into Author (AuthorID, FirstName, LastName) values (96, 'Sean', 'Stubbs');
insert into Author (AuthorID, FirstName, LastName) values (97, 'Lauraine', 'Ridder');
insert into Author (AuthorID, FirstName, LastName) values (98, 'Gilda', 'Lampert');
insert into Author (AuthorID, FirstName, LastName) values (99, 'Evin', 'Bratch');
insert into Author (AuthorID, FirstName, LastName) values (100, 'Leland', 'Dresse');
insert into Author (AuthorID, FirstName, LastName) values (101, 'Marlo', 'Gouth');
insert into Author (AuthorID, FirstName, LastName) values (102, 'Clement', 'Braim');
insert into Author (AuthorID, FirstName, LastName) values (103, 'Giselle', 'Clipson');
insert into Author (AuthorID, FirstName, LastName) values (104, 'Cora', 'Worsfold');
insert into Author (AuthorID, FirstName, LastName) values (105, 'Cecil', 'Cockrell');
insert into Author (AuthorID, FirstName, LastName) values (106, 'Marita', 'Kensley');
insert into Author (AuthorID, FirstName, LastName) values (107, 'Renie', 'Brantzen');
insert into Author (AuthorID, FirstName, LastName) values (108, 'Helen', 'Beacock');
insert into Author (AuthorID, FirstName, LastName) values (109, 'Henrie', 'Kryzhov');
insert into Author (AuthorID, FirstName, LastName) values (110, 'Merissa', 'Lansly');
insert into Author (AuthorID, FirstName, LastName) values (111, 'Giorgi', 'Halford');
insert into Author (AuthorID, FirstName, LastName) values (112, 'Amandy', 'O''Dowd');
insert into Author (AuthorID, FirstName, LastName) values (113, 'Max', 'Squelch');
insert into Author (AuthorID, FirstName, LastName) values (114, 'Nicolina', 'Farryann');
insert into Author (AuthorID, FirstName, LastName) values (115, 'Nevin', 'Worsam');
insert into Author (AuthorID, FirstName, LastName) values (116, 'Issie', 'Roddie');
insert into Author (AuthorID, FirstName, LastName) values (117, 'Katerine', 'Faill');
insert into Author (AuthorID, FirstName, LastName) values (118, 'Barbaraanne', 'Isles');
insert into Author (AuthorID, FirstName, LastName) values (119, 'Adriena', 'Pollicatt');
insert into Author (AuthorID, FirstName, LastName) values (120, 'Jasper', 'Corrado');
insert into Author (AuthorID, FirstName, LastName) values (121, 'Tabby', 'McGaugan');
insert into Author (AuthorID, FirstName, LastName) values (122, 'Aretha', 'MacTrustram');
insert into Author (AuthorID, FirstName, LastName) values (123, 'Wallace', 'Tregaskis');
insert into Author (AuthorID, FirstName, LastName) values (124, 'Winonah', 'Kermode');
insert into Author (AuthorID, FirstName, LastName) values (125, 'Bartlett', 'Sindell');
insert into Author (AuthorID, FirstName, LastName) values (126, 'Arlyne', 'Osgar');
insert into Author (AuthorID, FirstName, LastName) values (127, 'Edi', 'Lehrer');
insert into Author (AuthorID, FirstName, LastName) values (128, 'Katalin', 'Bartoletti');
insert into Author (AuthorID, FirstName, LastName) values (129, 'Spike', 'Gobel');
insert into Author (AuthorID, FirstName, LastName) values (130, 'Kare', 'Pollicote');
insert into Author (AuthorID, FirstName, LastName) values (131, 'Linea', 'Guillon');
insert into Author (AuthorID, FirstName, LastName) values (132, 'Page', 'Sneesbie');
insert into Author (AuthorID, FirstName, LastName) values (133, 'Roi', 'Verey');
insert into Author (AuthorID, FirstName, LastName) values (134, 'Sylas', 'Rohlf');
insert into Author (AuthorID, FirstName, LastName) values (135, 'Ase', 'Follan');
insert into Author (AuthorID, FirstName, LastName) values (136, 'Cammy', 'Ribey');
insert into Author (AuthorID, FirstName, LastName) values (137, 'David', 'Otridge');
insert into Author (AuthorID, FirstName, LastName) values (138, 'Susan', 'Sobey');
insert into Author (AuthorID, FirstName, LastName) values (139, 'Trista', 'Zanre');
insert into Author (AuthorID, FirstName, LastName) values (140, 'Lothaire', 'Allington');
insert into Author (AuthorID, FirstName, LastName) values (141, 'Stephanus', 'Towey');
insert into Author (AuthorID, FirstName, LastName) values (142, 'Andonis', 'Snalom');
insert into Author (AuthorID, FirstName, LastName) values (143, 'Ivy', 'Lutzmann');
insert into Author (AuthorID, FirstName, LastName) values (144, 'Rivalee', 'Chivrall');
insert into Author (AuthorID, FirstName, LastName) values (145, 'Amaleta', 'Domeney');
insert into Author (AuthorID, FirstName, LastName) values (146, 'Reina', 'Abbotts');
insert into Author (AuthorID, FirstName, LastName) values (147, 'Russell', 'Spreadbury');
insert into Author (AuthorID, FirstName, LastName) values (148, 'Alexa', 'Johnys');
insert into Author (AuthorID, FirstName, LastName) values (149, 'Berkly', 'Sushams');
insert into Author (AuthorID, FirstName, LastName) values (150, 'Ulrikaumeko', 'Hearnshaw');
insert into Author (AuthorID, FirstName, LastName) values (151, 'Alverta', 'Espinos');
insert into Author (AuthorID, FirstName, LastName) values (152, 'Harriott', 'Longhirst');
insert into Author (AuthorID, FirstName, LastName) values (153, 'Pietrek', 'Strafen');
insert into Author (AuthorID, FirstName, LastName) values (154, 'Torie', 'Rispin');
insert into Author (AuthorID, FirstName, LastName) values (155, 'Cris', 'Forgie');
insert into Author (AuthorID, FirstName, LastName) values (156, 'Rodie', 'Grinnell');
insert into Author (AuthorID, FirstName, LastName) values (157, 'Alwin', 'Philler');
insert into Author (AuthorID, FirstName, LastName) values (158, 'Bathsheba', 'Rowthorn');
insert into Author (AuthorID, FirstName, LastName) values (159, 'Vito', 'Maleck');
insert into Author (AuthorID, FirstName, LastName) values (160, 'Johnny', 'Raulston');
insert into Author (AuthorID, FirstName, LastName) values (161, 'Samuel', 'Faunt');
insert into Author (AuthorID, FirstName, LastName) values (162, 'Garrott', 'Salerg');
insert into Author (AuthorID, FirstName, LastName) values (163, 'Vivienne', 'Cheeney');
insert into Author (AuthorID, FirstName, LastName) values (164, 'Holt', 'Carrier');
insert into Author (AuthorID, FirstName, LastName) values (165, 'Corabel', 'Agate');
insert into Author (AuthorID, FirstName, LastName) values (166, 'Delano', 'Laugherane');
insert into Author (AuthorID, FirstName, LastName) values (167, 'Heywood', 'Ubsdale');
insert into Author (AuthorID, FirstName, LastName) values (168, 'Stefan', 'Roebuck');
insert into Author (AuthorID, FirstName, LastName) values (169, 'Kaye', 'Estoile');
insert into Author (AuthorID, FirstName, LastName) values (170, 'Kelsey', 'Beggini');
insert into Author (AuthorID, FirstName, LastName) values (171, 'Jo', 'Renbold');
insert into Author (AuthorID, FirstName, LastName) values (172, 'Faunie', 'Rizzone');
insert into Author (AuthorID, FirstName, LastName) values (173, 'Anthe', 'Fellenor');
insert into Author (AuthorID, FirstName, LastName) values (174, 'Clemmy', 'Ormistone');
insert into Author (AuthorID, FirstName, LastName) values (175, 'Irwin', 'Ballaam');
insert into Author (AuthorID, FirstName, LastName) values (176, 'Dirk', 'Simic');
insert into Author (AuthorID, FirstName, LastName) values (177, 'Cody', 'Kochel');
insert into Author (AuthorID, FirstName, LastName) values (178, 'Nicolis', 'Gartrell');
insert into Author (AuthorID, FirstName, LastName) values (179, 'Austine', 'Maccari');
insert into Author (AuthorID, FirstName, LastName) values (180, 'Danya', 'Braxay');
insert into Author (AuthorID, FirstName, LastName) values (181, 'Madel', 'Lamplough');
insert into Author (AuthorID, FirstName, LastName) values (182, 'Cooper', 'Tour');
insert into Author (AuthorID, FirstName, LastName) values (183, 'Bernard', 'Carss');
insert into Author (AuthorID, FirstName, LastName) values (184, 'Randie', 'Ferrillo');
insert into Author (AuthorID, FirstName, LastName) values (185, 'Maxim', 'Meers');
insert into Author (AuthorID, FirstName, LastName) values (186, 'Frants', 'McSkeagan');
insert into Author (AuthorID, FirstName, LastName) values (187, 'Reider', 'Buzza');
insert into Author (AuthorID, FirstName, LastName) values (188, 'Gerladina', 'Ortner');
insert into Author (AuthorID, FirstName, LastName) values (189, 'Marje', 'Mousley');
insert into Author (AuthorID, FirstName, LastName) values (190, 'Harley', 'Dudenie');
insert into Author (AuthorID, FirstName, LastName) values (191, 'Brandi', 'Pitrelli');
insert into Author (AuthorID, FirstName, LastName) values (192, 'Tobie', 'Anders');
insert into Author (AuthorID, FirstName, LastName) values (193, 'Danya', 'Cameli');
insert into Author (AuthorID, FirstName, LastName) values (194, 'Cherlyn', 'Annon');
insert into Author (AuthorID, FirstName, LastName) values (195, 'Bendick', 'Augustin');
insert into Author (AuthorID, FirstName, LastName) values (196, 'Ashli', 'Canet');
insert into Author (AuthorID, FirstName, LastName) values (197, 'Ardene', 'Goodburn');
insert into Author (AuthorID, FirstName, LastName) values (198, 'Ber', 'Dellar');
insert into Author (AuthorID, FirstName, LastName) values (199, 'Celina', 'Pingstone');
insert into Author (AuthorID, FirstName, LastName) values (200, 'Diandra', 'Chese');

insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (1, 'Quiet American, The', 'Mystery', '528832271-6', '10/18/1988', 'Digital', 'Out of Stock', 38.38, true, 19.19, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (2, 'Detention', 'Comedy', '007491436-7', '7/22/2015', 'Paperback', 'Available', 62.66, false, 62.66, false, 67);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (3, '711 Ocean Drive', 'Comedy', '424205901-9', '6/25/1904', 'Paperback', 'Out of Stock', 43.72, false, 43.72, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (4, 'Pathfinder (Ofelas)', 'Comedy', '253643311-0', '6/26/2009', 'Digital', 'Out of Stock', 40.42, true, 20.21, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (5, 'Mr. Jones', 'Action', '276590640-8', '3/26/1908', 'Digital', 'Unavailable', 60.75, true, 30.375, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (6, 'The Missionaries', 'Adventure', '914802327-2', '6/8/1936', 'Paperback', 'Out of Stock', 40.1, true, 20.05, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (7, 'Richard III', 'Romance', '316133723-9', '7/28/1995', 'Paperback', 'Out of Stock', 46.99, false, 46.99, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (8, 'Born to Fight', 'Action', '963396007-X', '8/8/1923', 'Digital', 'Available', 49.35, false, 49.35, false, 74);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (9, 'Nowhere in Africa (Nirgendwo in Afrika)', 'Adventure', '898209538-1', '9/1/1966', 'Digital', 'Out of Stock', 49.32, true, 24.66, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (10, 'Convent, The (O Convento)', 'Comedy', '921548385-3', '1/24/1925', 'Digital', 'Out of Stock', 59.08, false, 59.08, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (11, 'Funny Games', 'Adventure', '546080536-8', '9/8/1984', 'Digital', 'Available', 69.55, true, 34.775, false, 31);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (12, 'Hunter Prey', 'Comedy', '496847216-1', '1/5/1908', 'Paperback', 'Unavailable', 63.24, true, 31.62, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (13, 'Lethal Weapon 2', 'Action', '473673615-1', '9/10/1954', 'Paperback', 'Available', 67.34, false, 67.34, false, 92);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (14, 'Assassins', 'Mystery', '575697928-X', '11/25/1925', 'Digital', 'Unavailable', 45.7, false, 45.7, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (15, 'RFK Must Die: The Assassination of Bobby Kennedy', 'Romance', '831120537-X', '2/5/1969', 'Digital', 'Out of Stock', 30.74, false, 30.74, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (16, 'Twister', 'Adventure', '973170901-0', '3/31/1914', 'Paperback', 'Available', 34.03, true, 17.015, true, 36);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (17, 'Crossing the Bridge: The Sound of Istanbul', 'Romance', '284442768-5', '12/10/1900', 'Digital', 'Available', 62.73, false, 62.73, true, 94);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (18, 'Raise Your Voice', 'Adventure', '522223932-2', '5/9/1914', 'Digital', 'Out of Stock', 54.81, true, 27.405, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (19, 'Tough Guise: Violence, Media & the Crisis in Masculinity', 'Comedy', '792509783-3', '12/14/1939', 'Digital', 'Unavailable', 53.62, true, 26.81, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (20, 'Out of Sight', 'Romance', '287559328-5', '11/8/1994', 'Digital', 'Available', 61.41, false, 61.41, false, 61);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (21, 'Jellyfish (Meduzot)', 'Adventure', '764981180-8', '1/24/1933', 'Digital', 'Available', 55.24, true, 27.62, false, 98);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (22, 'Entrapment', 'Fantasy', '224966872-8', '1/5/1901', 'Paperback', 'Out of Stock', 37.05, false, 37.05, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (23, 'Idiocracy', 'Fantasy', '436827741-4', '5/24/2012', 'Digital', 'Available', 60.42, false, 60.42, false, 62);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (24, 'Figures in a Landscape', 'Adventure', '141332984-5', '5/29/1970', 'Digital', 'Available', 43.12, true, 21.56, false, 38);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (25, 'My Life So Far', 'Fantasy', '787871927-6', '4/6/1949', 'Digital', 'Available', 45.87, true, 22.935, false, 61);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (26, 'Kon-Tiki', 'Mystery', '892794699-5', '4/19/2014', 'Digital', 'Unavailable', 40.41, true, 20.205, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (27, 'Pumpkinhead II: Blood Wings', 'Fantasy', '158432925-4', '3/10/1957', 'Digital', 'Unavailable', 46.67, true, 23.335, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (28, 'Roman de gare', 'Romance', '349968749-6', '8/4/2013', 'Digital', 'Out of Stock', 38.02, true, 19.01, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (29, 'Mr. & Mrs. Smith', 'Mystery', '747621788-8', '10/23/2014', 'Digital', 'Unavailable', 36.28, false, 36.28, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (30, 'Coming to America', 'Action', '506973385-0', '4/3/2024', 'Paperback', 'Available', 60.91, true, 30.455, false, 57);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (31, 'Bodies, Rest & Motion', 'Comedy', '061744650-4', '7/27/1962', 'Paperback', 'Unavailable', 39.05, false, 39.05, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (32, 'Rize', 'Mystery', '034436250-7', '1/29/1994', 'Digital', 'Unavailable', 69.03, false, 69.03, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (33, 'Joyful Noise', 'Adventure', '738658615-9', '6/18/1982', 'Digital', 'Unavailable', 51.08, false, 51.08, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (34, 'Mr. Jealousy', 'Action', '019205619-0', '7/26/2011', 'Digital', 'Unavailable', 31.16, true, 15.58, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (35, 'Toronto Stories', 'Comedy', '324379886-8', '5/19/1904', 'Paperback', 'Available', 35.03, false, 35.03, false, 84);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (36, 'Time of Favor (Ha-Hesder)', 'Action', '724257760-8', '10/21/1976', 'Digital', 'Unavailable', 63.65, true, 31.825, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (37, 'Sand Sharks', 'Adventure', '438970051-0', '5/30/1975', 'Paperback', 'Out of Stock', 32.91, false, 32.91, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (38, 'Jupiter''s Darling', 'Fantasy', '780629838-X', '1/1/1997', 'Paperback', 'Out of Stock', 66.24, true, 33.12, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (39, 'Oily Maniac, The (You gui zi)', 'Comedy', '022717733-9', '5/30/1996', 'Digital', 'Available', 49.39, false, 49.39, false, 97);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (40, 'Dedication', 'Mystery', '684190046-4', '10/20/1964', 'Paperback', 'Unavailable', 39.5, false, 39.5, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (41, 'Suite Française', 'Mystery', '738134804-7', '4/28/2011', 'Digital', 'Available', 40.7, true, 20.35, false, 51);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (42, 'Last Godfather, The', 'Action', '811987942-2', '5/18/1946', 'Digital', 'Available', 43.06, false, 43.06, false, 37);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (43, 'Tokyo!', 'Adventure', '201709982-1', '10/23/1949', 'Paperback', 'Available', 45.9, false, 45.9, false, 83);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (44, 'A.C.O.D.', 'Adventure', '628409093-5', '4/4/2024', 'Digital', 'Available', 69.46, true, 34.73, false, 92);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (45, 'Midsummer Night''s Dream, A', 'Adventure', '583263330-X', '11/14/2016', 'Digital', 'Available', 67.01, true, 33.505, false, 61);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (46, 'Just Cause', 'Comedy', '649139794-7', '2/23/1986', 'Paperback', 'Unavailable', 66.23, false, 66.23, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (47, 'Land', 'Adventure', '563384941-8', '12/17/1955', 'Paperback', 'Unavailable', 51.88, true, 25.94, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (48, 'La Belle Verte', 'Mystery', '751052795-3', '10/4/1907', 'Paperback', 'Available', 67.22, true, 33.61, true, 71);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (49, 'Four Christmases', 'Comedy', '693259694-6', '3/18/1985', 'Paperback', 'Unavailable', 69.69, false, 69.69, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (50, 'Enemy of the People, An', 'Mystery', '579876911-9', '10/2/1998', 'Paperback', 'Available', 30.23, true, 15.115, true, 47);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (51, 'Ingenious', 'Comedy', '751073334-0', '5/24/1926', 'Paperback', 'Unavailable', 63.49, false, 63.49, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (52, 'Sometimes in April', 'Mystery', '415627107-2', '1/16/2005', 'Digital', 'Available', 47.93, true, 23.965, false, 97);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (53, 'Margin Call', 'Action', '023973182-4', '10/28/1917', 'Digital', 'Out of Stock', 59.8, true, 29.9, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (54, 'Reality Bites', 'Mystery', '689013761-2', '11/7/1988', 'Paperback', 'Available', 54.73, false, 54.73, true, 58);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (55, 'MURDER and murder', 'Fantasy', '727889539-1', '9/22/1972', 'Digital', 'Available', 48.52, true, 24.26, true, 76);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (56, 'Ghost Breakers, The', 'Adventure', '442656352-6', '2/2/1974', 'Digital', 'Out of Stock', 30.88, true, 15.44, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (57, 'Smile', 'Romance', '511297856-2', '12/9/1991', 'Digital', 'Unavailable', 51.66, false, 51.66, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (58, 'Comes a Bright Day', 'Action', '327766124-5', '10/19/1940', 'Paperback', 'Unavailable', 47.66, false, 47.66, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (59, 'Hui Buh: The Castle Ghost', 'Adventure', '089888536-1', '4/26/2001', 'Digital', 'Available', 32.37, false, 32.37, true, 46);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (60, 'My Man Godfrey', 'Comedy', '921891575-4', '10/27/1999', 'Paperback', 'Available', 61.59, false, 61.59, true, 66);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (61, 'Reign of Fire', 'Mystery', '822234433-1', '2/11/1907', 'Digital', 'Out of Stock', 30.49, false, 30.49, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (62, 'Garage, The', 'Romance', '404132597-8', '4/21/2004', 'Digital', 'Out of Stock', 39.65, true, 19.825, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (63, 'How to Train Your Dragon 2', 'Fantasy', '955627745-5', '1/11/2009', 'Paperback', 'Available', 31.99, true, 15.995, true, 97);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (64, 'Faith Like Potatoes', 'Mystery', '469013762-5', '10/9/1996', 'Digital', 'Out of Stock', 32.6, false, 32.6, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (65, 'Island President, The', 'Mystery', '671679173-6', '2/21/1962', 'Digital', 'Unavailable', 30.21, false, 30.21, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (66, 'American Ninja 2: The Confrontation', 'Action', '473534937-5', '10/21/1969', 'Digital', 'Unavailable', 42.16, false, 42.16, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (67, 'Paths of Hate', 'Romance', '845535161-6', '10/10/1940', 'Paperback', 'Unavailable', 37.2, false, 37.2, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (68, 'Falls, The', 'Fantasy', '718192920-8', '10/10/1961', 'Paperback', 'Unavailable', 54.23, true, 27.115, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (69, 'Crashing', 'Fantasy', '457616097-4', '9/15/1999', 'Digital', 'Out of Stock', 69.55, false, 69.55, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (70, 'Arise, My Love', 'Fantasy', '764747534-7', '11/26/2019', 'Paperback', 'Out of Stock', 59.95, false, 59.95, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (71, 'Apart from You (After Our Separation) (Kimi to wakarete)', 'Fantasy', '047887645-9', '6/10/2012', 'Digital', 'Unavailable', 54.64, false, 54.64, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (72, 'The Diary of Anne Frank', 'Action', '917024403-0', '2/5/1987', 'Digital', 'Available', 47.33, false, 47.33, true, 53);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (73, 'Miss Kicki', 'Fantasy', '657925136-0', '10/15/2008', 'Digital', 'Unavailable', 36.0, true, 18.0, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (74, 'Verbo', 'Comedy', '870272409-X', '9/9/1945', 'Paperback', 'Unavailable', 37.23, false, 37.23, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (75, 'Thumbelina', 'Comedy', '453544843-4', '11/13/1947', 'Digital', 'Available', 62.25, false, 62.25, false, 50);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (76, 'Happy-Go-Lucky', 'Romance', '963060591-0', '4/7/1947', 'Digital', 'Available', 34.14, true, 17.07, true, 37);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (77, 'Starlet', 'Adventure', '289352422-2', '11/11/1943', 'Paperback', 'Available', 45.06, true, 22.53, false, 60);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (78, 'Grass Is Greener, The', 'Comedy', '313155129-1', '4/26/2013', 'Paperback', 'Available', 63.14, true, 31.57, false, 30);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (79, 'Legacy, The', 'Mystery', '718519820-8', '7/9/1926', 'Paperback', 'Out of Stock', 45.59, false, 45.59, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (80, 'Drive', 'Comedy', '749343314-3', '6/7/1916', 'Digital', 'Unavailable', 54.74, true, 27.37, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (81, 'Face in the Crowd, A', 'Adventure', '157451260-9', '10/3/1984', 'Paperback', 'Unavailable', 31.16, false, 31.16, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (82, 'I Want Candy', 'Fantasy', '735551598-5', '1/24/1963', 'Digital', 'Available', 44.77, false, 44.77, true, 79);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (83, 'Secretary', 'Mystery', '629543824-5', '6/5/2010', 'Paperback', 'Out of Stock', 61.53, true, 30.765, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (84, 'Wrestling for Jesus: The Tale of T-Money', 'Romance', '898950851-7', '6/23/2017', 'Paperback', 'Available', 51.93, true, 25.965, true, 38);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (85, 'Sweet Rush (Tatarak)', 'Action', '905249746-X', '4/3/1922', 'Digital', 'Available', 48.94, true, 24.47, false, 45);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (86, 'Red Canyon', 'Mystery', '114546655-9', '7/10/1983', 'Paperback', 'Unavailable', 33.89, false, 33.89, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (87, 'Mystery on Monster Island', 'Action', '281450512-2', '12/14/1937', 'Paperback', 'Unavailable', 60.57, false, 60.57, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (88, 'Woman Who Wasn''t There, The', 'Comedy', '335806349-6', '8/10/2015', 'Digital', 'Available', 55.95, true, 27.975, false, 55);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (89, 'Ides of March, The', 'Mystery', '232087038-5', '3/9/2019', 'Paperback', 'Out of Stock', 35.53, false, 35.53, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (90, 'Hi Tessa (Czesc Tereska)', 'Comedy', '296617429-3', '2/5/1933', 'Digital', 'Unavailable', 59.91, false, 59.91, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (91, 'Horsemen', 'Comedy', '522518382-4', '8/24/2004', 'Paperback', 'Out of Stock', 43.55, true, 21.775, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (92, 'The Sword and the Rose', 'Action', '247126436-0', '1/14/1908', 'Paperback', 'Unavailable', 51.22, false, 51.22, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (93, 'Last September, The', 'Comedy', '835690595-8', '6/19/1949', 'Digital', 'Out of Stock', 34.75, true, 17.375, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (94, 'Hitman''s Run', 'Action', '117932103-0', '11/3/2001', 'Paperback', 'Out of Stock', 63.74, false, 63.74, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (95, 'King of Fighters, The', 'Action', '473420107-2', '2/8/1903', 'Paperback', 'Out of Stock', 64.06, true, 32.03, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (96, 'Whitey: United States of America v. James J. Bulger', 'Mystery', '928804872-3', '5/26/1970', 'Digital', 'Out of Stock', 35.48, false, 35.48, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (97, 'Jolly Boys'' Last Stand, The', 'Romance', '294567746-6', '9/18/1909', 'Digital', 'Out of Stock', 55.83, true, 27.915, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (98, 'Snow Angels', 'Action', '318653483-6', '5/5/1955', 'Paperback', 'Unavailable', 37.82, true, 18.91, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (99, 'Adrift in Tokyo (Tenten)', 'Adventure', '053834619-1', '6/15/1958', 'Digital', 'Available', 39.99, false, 39.99, false, 94);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (100, 'Anchorman 2: The Legend Continues', 'Mystery', '675079608-7', '12/13/2001', 'Paperback', 'Out of Stock', 50.04, false, 50.04, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (101, 'Cabaret Balkan (Bure Baruta)', 'Comedy', '643144760-3', '5/31/1916', 'Digital', 'Available', 48.9, true, 24.45, true, 30);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (102, 'Business of Being Born, The', 'Fantasy', '890910763-4', '4/15/2008', 'Digital', 'Available', 35.4, true, 17.7, false, 96);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (103, 'Scum', 'Fantasy', '944622410-1', '4/16/2000', 'Paperback', 'Unavailable', 43.07, false, 43.07, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (104, 'Sexy Beast', 'Mystery', '124335235-3', '7/5/1910', 'Digital', 'Available', 42.03, false, 42.03, true, 37);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (105, 'Oz the Great and Powerful', 'Adventure', '641339324-6', '7/16/1974', 'Paperback', 'Out of Stock', 64.16, false, 64.16, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (106, 'Extraordinary Adventures of Mr. West in the Land of the Bolsheviks, The (Neobychainye priklyucheniya mistera Vesta v strane bolshevikov)', 'Romance', '331127272-2', '5/21/1969', 'Digital', 'Available', 61.09, true, 30.545, false, 47);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (107, 'Along the Sungari River (Song hua jiang shang)', 'Romance', '748515446-X', '12/1/1909', 'Digital', 'Out of Stock', 34.0, true, 17.0, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (108, 'The Story of Asya Klyachina', 'Romance', '743045775-4', '4/17/1927', 'Paperback', 'Unavailable', 60.93, false, 60.93, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (109, 'Bugsy Malone', 'Adventure', '950428139-7', '9/21/1970', 'Digital', 'Out of Stock', 60.79, true, 30.395, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (110, 'The Referees', 'Action', '535569322-9', '2/1/1931', 'Digital', 'Unavailable', 44.55, false, 44.55, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (111, 'Chapman Report, The', 'Romance', '448571876-X', '3/19/1945', 'Paperback', 'Available', 42.25, false, 42.25, false, 91);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (112, 'Grumpy Old Men', 'Comedy', '651502244-1', '8/23/1974', 'Paperback', 'Available', 35.74, false, 35.74, false, 68);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (113, 'D.C.H. (Dil Chahta Hai)', 'Fantasy', '130732768-0', '10/2/1931', 'Paperback', 'Available', 68.54, false, 68.54, true, 96);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (114, 'Carter, The', 'Romance', '908819622-2', '5/22/1967', 'Digital', 'Available', 54.73, false, 54.73, false, 99);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (115, 'Deaths of Ian Stone, The', 'Action', '628705919-2', '6/22/1984', 'Digital', 'Out of Stock', 31.28, true, 15.64, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (116, 'Canyon Passage', 'Mystery', '449993185-1', '7/28/1990', 'Paperback', 'Available', 49.89, true, 24.945, false, 51);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (117, 'Proposition, The', 'Comedy', '589059142-8', '2/2/1979', 'Digital', 'Available', 33.48, false, 33.48, false, 92);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (118, 'Seducing Mr. Perfect', 'Action', '356161361-6', '3/5/1901', 'Paperback', 'Unavailable', 67.62, true, 33.81, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (119, 'Forever Young', 'Fantasy', '519324012-7', '9/15/1985', 'Paperback', 'Unavailable', 36.35, false, 36.35, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (120, 'Mirage', 'Adventure', '499321768-4', '8/23/1934', 'Digital', 'Out of Stock', 31.75, false, 31.75, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (121, 'No Way Home', 'Mystery', '483241573-5', '4/28/1989', 'Paperback', 'Out of Stock', 41.14, false, 41.14, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (122, 'Alice in Wonderland', 'Romance', '862928226-6', '4/10/1930', 'Paperback', 'Out of Stock', 47.32, true, 23.66, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (123, 'Hard Corps, The', 'Romance', '229644293-5', '5/13/1912', 'Paperback', 'Out of Stock', 69.67, false, 69.67, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (124, 'Cool, Calm and Collected (Calmos)', 'Fantasy', '865376581-6', '6/23/1987', 'Paperback', 'Unavailable', 50.15, false, 50.15, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (125, 'Law and Order', 'Fantasy', '395724567-2', '2/23/1931', 'Paperback', 'Out of Stock', 42.4, false, 42.4, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (126, 'Ticked-Off Trannies with Knives', 'Action', '383101145-1', '2/16/1994', 'Paperback', 'Unavailable', 52.26, false, 52.26, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (127, 'Boy of the Streets', 'Romance', '022976882-2', '4/30/1907', 'Digital', 'Available', 56.29, false, 56.29, false, 37);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (128, 'Born Reckless', 'Action', '525879560-8', '3/27/1965', 'Paperback', 'Unavailable', 42.08, true, 21.04, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (129, 'Ella Enchanted', 'Action', '421964435-0', '3/11/2018', 'Paperback', 'Available', 36.36, true, 18.18, false, 76);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (130, 'Love and Other Troubles', 'Fantasy', '398800103-1', '3/5/1918', 'Digital', 'Available', 65.89, false, 65.89, false, 95);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (131, 'Holy Smoke', 'Romance', '056843532-X', '10/2/1963', 'Paperback', 'Out of Stock', 42.52, true, 21.26, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (132, 'Whole', 'Action', '079967852-X', '4/4/1940', 'Digital', 'Out of Stock', 58.76, false, 58.76, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (133, 'Fear Strikes Out', 'Romance', '757180353-5', '10/27/1958', 'Digital', 'Available', 43.91, true, 21.955, true, 42);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (134, 'I''m a Cyborg, But That''s OK (Saibogujiman kwenchana)', 'Action', '623012349-5', '7/5/1917', 'Digital', 'Available', 36.5, true, 18.25, false, 53);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (135, 'Tape', 'Fantasy', '476409396-0', '10/31/1948', 'Digital', 'Available', 42.6, true, 21.3, true, 60);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (136, 'Hatchet for the Honeymoon (Rosso segno della follia, Il)', 'Mystery', '711798958-0', '2/6/1939', 'Paperback', 'Unavailable', 66.08, true, 33.04, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (137, 'Sorority Boys', 'Action', '450544268-3', '8/28/2005', 'Paperback', 'Available', 62.33, true, 31.165, false, 70);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (138, 'The Sea That Thinks', 'Adventure', '634087667-6', '6/7/1982', 'Paperback', 'Unavailable', 40.72, false, 40.72, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (139, 'Last Klezmer: Leopold Kozlowski, His Life and Music, The', 'Mystery', '342215653-4', '12/17/1983', 'Paperback', 'Available', 66.56, true, 33.28, true, 65);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (140, 'Where the Boys Are ''84', 'Romance', '615504953-X', '7/30/1903', 'Digital', 'Unavailable', 48.45, false, 48.45, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (141, 'The Unexpected Love', 'Adventure', '612026312-8', '7/1/1954', 'Paperback', 'Available', 32.25, true, 16.125, false, 57);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (142, 'Drona', 'Comedy', '612269900-4', '7/23/1942', 'Digital', 'Out of Stock', 47.96, false, 47.96, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (143, 'Sergeant, The', 'Mystery', '733507344-8', '12/10/1945', 'Digital', 'Available', 45.93, true, 22.965, true, 51);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (144, 'Let''s Go to Prison', 'Adventure', '033720007-6', '4/21/1919', 'Digital', 'Out of Stock', 60.03, false, 60.03, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (145, 'Samurai Cop', 'Romance', '379818521-2', '9/14/1947', 'Digital', 'Available', 44.95, true, 22.475, false, 67);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (146, '700 Sundays', 'Fantasy', '970325595-7', '7/17/1904', 'Paperback', 'Available', 50.93, true, 25.465, true, 55);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (147, 'Four Sided Triangle', 'Comedy', '149986899-5', '9/8/1915', 'Digital', 'Unavailable', 56.1, true, 28.05, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (148, 'Phar Lap', 'Comedy', '836089361-6', '12/12/1919', 'Paperback', 'Unavailable', 58.84, false, 58.84, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (149, 'Expecting Love (Mala wielka milosc)', 'Adventure', '016787800-X', '3/29/1980', 'Paperback', 'Available', 41.98, true, 20.99, false, 48);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (150, '009 Re: Cyborg', 'Adventure', '582196777-5', '2/9/1971', 'Paperback', 'Unavailable', 57.59, false, 57.59, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (151, 'Terminal, The', 'Action', '789856090-6', '7/31/1947', 'Paperback', 'Available', 47.81, false, 47.81, false, 34);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (152, 'All Night Long', 'Fantasy', '170653197-4', '12/2/2020', 'Paperback', 'Out of Stock', 38.25, true, 19.125, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (153, 'Mr. Holland''s Opus', 'Adventure', '830014578-8', '8/14/1992', 'Digital', 'Unavailable', 41.58, false, 41.58, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (154, 'She Monkeys', 'Fantasy', '093287009-0', '7/4/1933', 'Digital', 'Unavailable', 39.72, true, 19.86, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (155, 'Clockwork Orange, A', 'Fantasy', '920318164-4', '5/16/1999', 'Digital', 'Unavailable', 63.78, false, 63.78, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (156, 'Meteor', 'Action', '959747808-0', '2/12/1987', 'Digital', 'Unavailable', 45.38, false, 45.38, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (157, 'Heart Condition', 'Romance', '420008400-7', '10/10/1960', 'Paperback', 'Available', 63.95, false, 63.95, false, 98);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (158, 'Donald Glover: Weirdo', 'Adventure', '835345203-0', '2/27/1990', 'Digital', 'Unavailable', 51.51, true, 25.755, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (159, 'Breezy', 'Mystery', '762056038-6', '2/23/2020', 'Digital', 'Out of Stock', 63.31, true, 31.655, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (160, 'Sky Fighters (Les Chevaliers Du Ciel)', 'Action', '532966392-X', '2/21/1937', 'Paperback', 'Unavailable', 64.77, false, 64.77, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (161, 'Precious Find', 'Comedy', '830891273-7', '4/18/1905', 'Paperback', 'Unavailable', 64.61, true, 32.305, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (162, 'The Horseplayer', 'Mystery', '754101241-6', '4/27/2017', 'Paperback', 'Unavailable', 60.22, false, 60.22, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (163, 'Woody Allen: A Documentary', 'Comedy', '329368779-2', '6/8/1988', 'Digital', 'Available', 59.0, true, 29.5, true, 53);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (164, 'Diary of a Hitman', 'Comedy', '222298923-X', '5/6/1921', 'Paperback', 'Out of Stock', 60.44, true, 30.22, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (165, 'Occupants, The', 'Comedy', '859846408-2', '8/8/1997', 'Digital', 'Out of Stock', 35.2, true, 17.6, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (166, 'For Love of the Game', 'Action', '694282326-0', '3/26/1978', 'Paperback', 'Unavailable', 52.49, false, 52.49, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (167, 'Oliver Twist', 'Fantasy', '611017262-6', '2/9/1910', 'Digital', 'Out of Stock', 52.58, true, 26.29, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (168, 'Terribly Happy (Frygtelig lykkelig)', 'Fantasy', '227181947-4', '12/12/1973', 'Digital', 'Out of Stock', 42.8, false, 42.8, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (169, 'Meilleur espoir féminin', 'Comedy', '190053691-9', '3/14/1991', 'Paperback', 'Out of Stock', 36.0, true, 18.0, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (170, 'Densha otoko (Train Man)', 'Mystery', '951327455-1', '4/27/1926', 'Paperback', 'Out of Stock', 52.42, true, 26.21, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (171, 'Some Guy Who Kills People', 'Adventure', '266773062-3', '2/26/1982', 'Digital', 'Out of Stock', 56.03, true, 28.015, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (172, 'Carried Away', 'Action', '701145489-6', '7/28/1981', 'Digital', 'Unavailable', 48.12, true, 24.06, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (173, 'Drinking Buddies', 'Comedy', '538729802-3', '8/7/1921', 'Paperback', 'Available', 42.11, true, 21.055, false, 64);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (174, 'Band Baaja Baaraat', 'Action', '813414392-X', '10/14/1962', 'Digital', 'Unavailable', 33.48, false, 33.48, true, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (175, 'Mr. Deeds', 'Comedy', '185201817-8', '9/22/1996', 'Paperback', 'Out of Stock', 68.71, false, 68.71, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (176, 'Villain, The (Ek Villain)', 'Fantasy', '056810413-7', '9/21/2021', 'Paperback', 'Out of Stock', 37.03, false, 37.03, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (177, 'Substance of Fire, The', 'Action', '102854175-9', '3/18/1919', 'Paperback', 'Out of Stock', 48.54, false, 48.54, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (178, 'Martha Marcy May Marlene', 'Romance', '194004500-2', '3/5/2012', 'Paperback', 'Available', 41.09, false, 41.09, true, 80);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (179, 'Route Irish', 'Adventure', '578160708-0', '8/9/1933', 'Paperback', 'Out of Stock', 46.2, false, 46.2, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (180, 'Trois', 'Fantasy', '147427485-4', '12/28/1938', 'Paperback', 'Available', 62.82, false, 62.82, false, 90);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (181, 'Full Body Massage', 'Adventure', '948313110-3', '11/12/2014', 'Paperback', 'Available', 64.99, true, 32.495, true, 44);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (182, 'Ladies They Talk About', 'Romance', '758908419-0', '12/31/1904', 'Paperback', 'Available', 51.09, true, 25.545, true, 42);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (183, 'Paul Blart: Mall Cop', 'Mystery', '020138392-6', '12/3/2000', 'Paperback', 'Available', 34.13, true, 17.065, false, 94);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (184, 'Bashu, the Little Stranger (Bashu, gharibeye koochak)', 'Fantasy', '772889146-4', '8/31/1991', 'Paperback', 'Out of Stock', 64.07, false, 64.07, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (185, '13th Letter, The', 'Romance', '409944994-7', '6/19/1911', 'Digital', 'Available', 38.45, false, 38.45, true, 37);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (186, 'Importance of Tying Your Own Shoes, The (Hur många lingon finns det i världen?)', 'Comedy', '654900287-7', '9/24/1980', 'Digital', 'Out of Stock', 57.9, true, 28.95, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (187, 'Last Minute, The', 'Action', '884625191-1', '6/27/1951', 'Digital', 'Available', 37.14, true, 18.57, false, 90);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (188, 'Rocky IV', 'Action', '903892639-1', '8/1/2014', 'Paperback', 'Unavailable', 41.81, false, 41.81, false, 0);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (189, 'Shortbus', 'Comedy', '221036848-0', '12/29/1944', 'Digital', 'Out of Stock', 55.03, false, 55.03, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (190, 'Multiplicity', 'Action', '476538243-5', '6/30/1942', 'Digital', 'Out of Stock', 39.56, true, 19.78, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (191, 'Triangle (Tie saam gok)', 'Fantasy', '975670735-6', '5/9/1909', 'Digital', 'Out of Stock', 38.32, true, 19.16, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (192, 'Open Season', 'Adventure', '717712136-6', '7/7/1959', 'Digital', 'Out of Stock', 61.03, false, 61.03, false, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (193, 'Three Stooges, The', 'Comedy', '885470988-3', '1/7/1944', 'Paperback', 'Out of Stock', 49.91, false, 49.91, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (194, 'Play it to the Bone', 'Fantasy', '576678033-8', '5/6/1920', 'Digital', 'Available', 37.4, true, 18.7, true, 74);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (195, 'Last Winter, The', 'Adventure', '243383754-5', '4/3/1915', 'Paperback', 'Out of Stock', 68.84, true, 34.42, true, null);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (196, 'Abominable', 'Romance', '869468134-X', '8/21/1936', 'Paperback', 'Available', 61.77, true, 30.885, true, 59);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (197, 'Global Metal', 'Romance', '025369096-X', '4/22/1953', 'Digital', 'Available', 35.55, true, 17.775, true, 51);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (198, 'Brothers Karamazov, The', 'Comedy', '949649410-2', '8/20/1921', 'Digital', 'Available', 52.06, false, 52.06, true, 31);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (199, 'Primary Colors', 'Mystery', '814346439-3', '6/23/1917', 'Digital', 'Available', 55.85, false, 55.85, false, 57);
insert into Book (BookID, Title, Genre, ISBN, ReleaseDate, BookFormat, Status, OriginalPrice, IsOnSale, CurrentPrice, IsTrending, NumStock) values (200, 'Angels'' Share, The', 'Comedy', '845032553-6', '8/2/1923', 'Digital', 'Out of Stock', 58.11, false, 58.11, false, null);