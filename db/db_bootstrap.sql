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
   OrderDate VARCHAR(255),
   ArrivalDate VARCHAR(255),
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

insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (1, 'Lise', 'Pavese', '63 Kim Hill', 'Raleigh', 'North Carolina', 'lpavese0@google.co.jp');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (2, 'Malvina', 'Lokier', '554 South Crossing', 'Waterbury', 'Connecticut', 'mlokier1@chronoengine.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (3, 'Leicester', 'Henryson', '97765 Pawling Court', 'Wilmington', 'Delaware', 'lhenryson2@virginia.edu');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (4, 'Merissa', 'Cundict', '3 Cherokee Plaza', 'Des Moines', 'Iowa', 'mcundict3@printfriendly.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (5, 'Penelopa', 'Lafaye', '8 Melvin Avenue', 'Anaheim', 'California', 'plafaye4@discovery.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (6, 'Cthrine', 'Duell', '927 Southridge Center', 'Everett', 'Washington', 'cduell5@google.fr');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (7, 'Karine', 'Llewellin', '5372 Banding Drive', 'Tulsa', 'Oklahoma', 'kllewellin6@twitter.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (8, 'Aaren', 'Jochen', '71 Talmadge Parkway', 'Scranton', 'Pennsylvania', 'ajochen7@naver.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (9, 'Web', 'Caverhill', '64 Dunning Terrace', 'Chicago', 'Illinois', 'wcaverhill8@pbs.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (10, 'Stanleigh', 'Bourdis', '13 Michigan Court', 'Birmingham', 'Alabama', 'sbourdis9@fotki.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (11, 'Cecile', 'Mathen', '6 Mayfield Plaza', 'Fort Worth', 'Texas', 'cmathena@accuweather.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (12, 'Jaquelyn', 'Knellen', '89 Maple Wood Junction', 'Philadelphia', 'Pennsylvania', 'jknellenb@reference.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (13, 'Frederigo', 'Impson', '91718 Ridge Oak Center', 'Oklahoma City', 'Oklahoma', 'fimpsonc@wsj.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (14, 'Susannah', 'Cleave', '5403 Express Pass', 'Nashville', 'Tennessee', 'scleaved@dailymail.co.uk');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (15, 'Paddie', 'Scorton', '396 Lyons Alley', 'Conroe', 'Texas', 'pscortone@imdb.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (16, 'Caritta', 'Minerdo', '0 Hollow Ridge Alley', 'Washington', 'District of Columbia', 'cminerdof@whitehouse.gov');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (17, 'Fabien', 'Vakhonin', '33718 Upham Trail', 'Bozeman', 'Montana', 'fvakhoning@bing.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (18, 'Dayle', 'Stranks', '9 Elka Crossing', 'Staten Island', 'New York', 'dstranksh@1688.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (19, 'Fred', 'Allsup', '3 Debra Center', 'Boston', 'Massachusetts', 'fallsupi@1688.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (20, 'Dud', 'McKain', '9 Summerview Way', 'Memphis', 'Tennessee', 'dmckainj@ask.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (21, 'Godwin', 'Antalffy', '302 Rockefeller Center', 'San Jose', 'California', 'gantalffyk@home.pl');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (22, 'Griffin', 'Gleadhall', '59 Banding Plaza', 'Kansas City', 'Missouri', 'ggleadhalll@latimes.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (23, 'Irita', 'Jancic', '94 Clarendon Terrace', 'Charleston', 'West Virginia', 'ijancicm@nytimes.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (24, 'Morlee', 'Lebarree', '6598 Almo Junction', 'Anchorage', 'Alaska', 'mlebarreen@mac.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (25, 'Caritta', 'Kier', '76139 Meadow Vale Drive', 'Toledo', 'Ohio', 'ckiero@etsy.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (26, 'Vanya', 'Hughlock', '197 Union Center', 'Anchorage', 'Alaska', 'vhughlockp@multiply.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (27, 'Heath', 'Jenks', '01237 Lyons Avenue', 'Corona', 'California', 'hjenksq@cam.ac.uk');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (28, 'Sheila-kathryn', 'Marchelli', '7 Roth Court', 'Brooklyn', 'New York', 'smarchellir@goo.ne.jp');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (29, 'Frederique', 'Attril', '07 Lakewood Crossing', 'Kansas City', 'Missouri', 'fattrils@mediafire.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (30, 'Cullie', 'Gibard', '529 Mitchell Point', 'Seattle', 'Washington', 'cgibardt@webnode.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (31, 'Moishe', 'Bly', '11 Larry Center', 'Kissimmee', 'Florida', 'mblyu@homestead.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (32, 'Chandra', 'Howat', '0 Graceland Hill', 'Salinas', 'California', 'chowatv@aol.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (33, 'Delores', 'McInnes', '8082 Sommers Trail', 'Macon', 'Georgia', 'dmcinnesw@t-online.de');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (34, 'Jobie', 'Divers', '5 Arkansas Way', 'Great Neck', 'New York', 'jdiversx@mlb.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (35, 'Bibi', 'Von Gladbach', '26859 Evergreen Trail', 'Olympia', 'Washington', 'bvongladbachy@eventbrite.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (36, 'Beverie', 'Morewood', '64 Delladonna Park', 'Topeka', 'Kansas', 'bmorewoodz@wikipedia.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (37, 'Donella', 'Mc Corley', '9672 Muir Crossing', 'Charleston', 'West Virginia', 'dmccorley10@theatlantic.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (38, 'Laurent', 'Have', '1 Dovetail Crossing', 'Fort Worth', 'Texas', 'lhave11@cmu.edu');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (39, 'Chelsy', 'Hembry', '48 Towne Hill', 'Columbia', 'South Carolina', 'chembry12@springer.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (40, 'Shurwood', 'Aldren', '6 Nevada Hill', 'Jamaica', 'New York', 'saldren13@un.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (41, 'Pearle', 'Blanch', '81 Bartelt Road', 'El Paso', 'Texas', 'pblanch14@quantcast.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (42, 'Debby', 'Shankster', '27041 Kings Terrace', 'Fort Lauderdale', 'Florida', 'dshankster15@sun.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (43, 'Thedrick', 'Baude', '157 Spaight Terrace', 'Philadelphia', 'Pennsylvania', 'tbaude16@prlog.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (44, 'Berna', 'Szimoni', '8 Shopko Circle', 'Omaha', 'Nebraska', 'bszimoni17@purevolume.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (45, 'Rudy', 'Prater', '03 Green Ridge Junction', 'Yonkers', 'New York', 'rprater18@histats.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (46, 'Rosalia', 'Richfield', '90 Miller Road', 'Lexington', 'Kentucky', 'rrichfield19@symantec.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (47, 'Charley', 'Rosa', '1 Stuart Street', 'Albuquerque', 'New Mexico', 'crosa1a@fotki.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (48, 'Lyell', 'Olivera', '0 Golf Avenue', 'Las Vegas', 'Nevada', 'lolivera1b@qq.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (49, 'Nowell', 'Hauxwell', '8556 Messerschmidt Circle', 'Shreveport', 'Louisiana', 'nhauxwell1c@issuu.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (50, 'Holly-anne', 'Feehely', '39 Browning Point', 'Los Angeles', 'California', 'hfeehely1d@ifeng.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (51, 'Hamlin', 'O''Scully', '623 Chive Trail', 'Los Angeles', 'California', 'hoscully1e@jiathis.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (52, 'Leigha', 'McCarron', '2611 Summerview Avenue', 'Little Rock', 'Arkansas', 'lmccarron1f@so-net.ne.jp');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (53, 'Nial', 'MacGahey', '20 Daystar Drive', 'Dayton', 'Ohio', 'nmacgahey1g@sphinn.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (54, 'Tatiana', 'Albin', '892 Dayton Parkway', 'New York City', 'New York', 'talbin1h@statcounter.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (55, 'Amabel', 'Dumelow', '14367 Caliangt Lane', 'Montgomery', 'Alabama', 'adumelow1i@chronoengine.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (56, 'Kenny', 'Behan', '57555 Sheridan Road', 'Arvada', 'Colorado', 'kbehan1j@comcast.net');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (57, 'Purcell', 'Rosenbloom', '347 Morning Way', 'Sacramento', 'California', 'prosenbloom1k@mapy.cz');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (58, 'Edsel', 'Reschke', '58 Melrose Street', 'Chicago', 'Illinois', 'ereschke1l@cbslocal.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (59, 'Erl', 'Relfe', '039 Carpenter Way', 'Austin', 'Texas', 'erelfe1m@cdbaby.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (60, 'Dalli', 'Crickmer', '203 Fair Oaks Drive', 'Phoenix', 'Arizona', 'dcrickmer1n@theglobeandmail.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (61, 'Clifford', 'Gudge', '27 Lien Pass', 'Gainesville', 'Georgia', 'cgudge1o@mashable.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (62, 'Mair', 'Quigg', '60 Manley Point', 'Memphis', 'Tennessee', 'mquigg1p@cocolog-nifty.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (63, 'Shelli', 'Southall', '57373 Valley Edge Trail', 'Saint Petersburg', 'Florida', 'ssouthall1q@usatoday.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (64, 'Giraldo', 'Gwioneth', '6209 Artisan Hill', 'North Hollywood', 'California', 'ggwioneth1r@a8.net');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (65, 'Merle', 'Prodrick', '287 Kropf Circle', 'Palatine', 'Illinois', 'mprodrick1s@dyndns.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (66, 'Jeremiah', 'Burghall', '9 Huxley Avenue', 'Denver', 'Colorado', 'jburghall1t@diigo.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (67, 'Trudi', 'Copp', '570 Birchwood Drive', 'Brooklyn', 'New York', 'tcopp1u@nifty.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (68, 'Hillard', 'Stalf', '24 Truax Lane', 'Lakeland', 'Florida', 'hstalf1v@oaic.gov.au');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (69, 'Revkah', 'Peskin', '28 Coolidge Crossing', 'Las Vegas', 'Nevada', 'rpeskin1w@va.gov');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (70, 'Costanza', 'Debenham', '58169 Eagle Crest Point', 'Huntington', 'West Virginia', 'cdebenham1x@narod.ru');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (71, 'Robby', 'Birtley', '716 Debs Point', 'Memphis', 'Tennessee', 'rbirtley1y@netlog.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (72, 'Darcey', 'Livingston', '86798 Butterfield Lane', 'Tacoma', 'Washington', 'dlivingston1z@gov.uk');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (73, 'Sauncho', 'Shatliff', '1451 Thierer Circle', 'Washington', 'District of Columbia', 'sshatliff20@1und1.de');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (74, 'Merry', 'Lafaye', '92 Old Gate Place', 'Indianapolis', 'Indiana', 'mlafaye21@yahoo.co.jp');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (75, 'Carolynn', 'Furmedge', '86853 Green Park', 'Cleveland', 'Ohio', 'cfurmedge22@hugedomains.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (76, 'Alphard', 'Hinkley', '9 Spohn Plaza', 'Columbus', 'Georgia', 'ahinkley23@toplist.cz');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (77, 'Olivie', 'Hartley', '16 Lerdahl Park', 'Fairfax', 'Virginia', 'ohartley24@amazon.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (78, 'Ange', 'Lackmann', '69 Grim Road', 'Glendale', 'Arizona', 'alackmann25@diigo.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (79, 'Thain', 'Gunnell', '44 Sunfield Parkway', 'Reston', 'Virginia', 'tgunnell26@usa.gov');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (80, 'Alidia', 'Jeaycock', '0185 Montana Park', 'Austin', 'Texas', 'ajeaycock27@hao123.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (81, 'Mirelle', 'Copperwaite', '7180 Di Loreto Court', 'Atlanta', 'Georgia', 'mcopperwaite28@technorati.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (82, 'Dennet', 'Perrigo', '8594 Brown Parkway', 'Birmingham', 'Alabama', 'dperrigo29@statcounter.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (83, 'Christian', 'Yarnton', '70 Novick Crossing', 'Saint Paul', 'Minnesota', 'cyarnton2a@boston.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (84, 'Andres', 'Streets', '00770 Oriole Terrace', 'Spring', 'Texas', 'astreets2b@surveymonkey.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (85, 'Brandy', 'Younge', '08686 West Parkway', 'Sacramento', 'California', 'byounge2c@phpbb.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (86, 'Tracy', 'Dury', '2331 Ruskin Drive', 'Salt Lake City', 'Utah', 'tdury2d@chron.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (87, 'Amanda', 'Jaine', '13395 Hermina Pass', 'Sacramento', 'California', 'ajaine2e@cisco.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (88, 'Genni', 'Stalf', '6015 Moland Place', 'Sioux City', 'Iowa', 'gstalf2f@drupal.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (89, 'Kevon', 'Van der Mark', '35824 Hauk Trail', 'San Antonio', 'Texas', 'kvandermark2g@digg.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (90, 'Anatola', 'Errol', '582 Heffernan Crossing', 'Wilkes Barre', 'Pennsylvania', 'aerrol2h@si.edu');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (91, 'Cleveland', 'Bengtsen', '6430 Valley Edge Crossing', 'Pensacola', 'Florida', 'cbengtsen2i@smugmug.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (92, 'Donia', 'Kristof', '80038 Anniversary Junction', 'Austin', 'Texas', 'dkristof2j@yellowbook.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (93, 'Joli', 'Hearon', '54 Barnett Place', 'Washington', 'District of Columbia', 'jhearon2k@hostgator.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (94, 'Chadd', 'Lortzing', '9730 Kinsman Trail', 'Fort Smith', 'Arkansas', 'clortzing2l@dmoz.org');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (95, 'Ralph', 'Knight', '389 Leroy Way', 'Syracuse', 'New York', 'rknight2m@forbes.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (96, 'Siouxie', 'Elesander', '173 Almo Center', 'Jeffersonville', 'Indiana', 'selesander2n@dedecms.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (97, 'Cindelyn', 'Banister', '7 Forest Run Lane', 'Louisville', 'Kentucky', 'cbanister2o@stumbleupon.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (98, 'Franklin', 'Mauditt', '139 Eagle Crest Parkway', 'Hollywood', 'Florida', 'fmauditt2p@blogger.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (99, 'Torey', 'Hagger', '11158 Jana Road', 'Lansing', 'Michigan', 'thagger2q@indiatimes.com');
insert into Customer (CustomerID, FirstName, LastName, Address, City, State, Email) values (100, 'Aurlie', 'Sweetman', '6 Sutteridge Center', 'Duluth', 'Minnesota', 'asweetman2r@hc360.com');

insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (1, null, '4/14/2024', '4/19/2024', 'Ohio', '905 Armistice Place', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (2, null, '4/11/2024', '4/20/2024', 'California', '79661 Di Loreto Place', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (3, null, '4/14/2024', '4/19/2024', 'New York', '99069 Gateway Way', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (4, null, '4/12/2024', '4/18/2024', 'Minnesota', '6 Burrows Alley', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (5, null, '4/10/2024', '4/20/2024', 'Illinois', '13 Bashford Way', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (6, null, '4/11/2024', '4/18/2024', 'Ohio', '3 Heffernan Drive', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (7, null, '4/10/2024', '4/18/2024', 'Connecticut', '82542 Schiller Trail', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (8, null, '4/11/2024', '4/20/2024', 'Tennessee', '0 Mosinee Road', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (9, null, '4/13/2024', '4/19/2024', 'North Carolina', '9 Hansons Hill', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (10, null, '4/14/2024', '4/18/2024', 'West Virginia', '10835 Norway Maple Circle', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (11, null, '4/13/2024', '4/18/2024', 'Washington', '7735 Bayside Center', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (12, null, '4/13/2024', '4/20/2024', 'Pennsylvania', '43524 Stuart Crossing', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (13, null, '4/12/2024', '4/19/2024', 'New York', '3 Lotheville Place', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (14, null, '4/13/2024', '4/18/2024', 'North Carolina', '07 Eliot Way', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (15, null, '4/11/2024', '4/20/2024', 'Oklahoma', '2826 Namekagon Place', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (16, null, '4/14/2024', '4/19/2024', 'California', '910 Mockingbird Way', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (17, null, '4/11/2024', '4/19/2024', 'Ohio', '98 Bartillon Crossing', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (18, null, '4/13/2024', '4/19/2024', 'North Carolina', '21 Oriole Junction', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (19, null, '4/14/2024', '4/18/2024', 'Oklahoma', '651 Crescent Oaks Point', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (20, null, '4/13/2024', '4/20/2024', 'Colorado', '99 Bellgrove Center', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (21, null, '4/14/2024', '4/20/2024', 'South Carolina', '4 Duke Terrace', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (22, null, '4/11/2024', '4/18/2024', 'Florida', '6 Swallow Way', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (23, null, '4/12/2024', '4/19/2024', 'California', '072 Golf View Circle', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (24, null, '4/14/2024', '4/19/2024', 'District of Columbia', '458 Johnson Circle', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (25, null, '4/11/2024', '4/20/2024', 'South Dakota', '224 Lien Alley', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (26, null, '4/11/2024', '4/20/2024', 'Arizona', '01 Mendota Circle', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (27, null, '4/11/2024', '4/20/2024', 'Pennsylvania', '0774 Mandrake Trail', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (28, null, '4/10/2024', '4/20/2024', 'California', '19 Bunting Point', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (29, null, '4/14/2024', '4/20/2024', 'Illinois', '0 Warbler Drive', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (30, null, '4/10/2024', '4/18/2024', 'Texas', '00576 Eagle Crest Place', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (31, null, '4/11/2024', '4/19/2024', 'Louisiana', '65579 Gina Alley', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (32, null, '4/14/2024', '4/19/2024', 'Florida', '26 Little Fleur Drive', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (33, null, '4/12/2024', '4/19/2024', 'Virginia', '0171 Monument Lane', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (34, null, '4/11/2024', '4/20/2024', 'Texas', '472 Clyde Gallagher Trail', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (35, null, '4/12/2024', '4/19/2024', 'Florida', '389 Golf View Drive', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (36, null, '4/14/2024', '4/19/2024', 'California', '2 Lien Way', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (37, null, '4/14/2024', '4/19/2024', 'Nevada', '92 Rutledge Lane', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (38, null, '4/12/2024', '4/18/2024', 'New York', '6 Warbler Place', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (39, null, '4/13/2024', '4/19/2024', 'Ohio', '3 Mallory Park', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (40, null, '4/11/2024', '4/20/2024', 'Texas', '20124 Drewry Trail', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (41, null, '4/14/2024', '4/20/2024', 'Texas', '21943 Vidon Hill', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (42, null, '4/14/2024', '4/20/2024', 'Illinois', '332 Barnett Plaza', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (43, null, '4/10/2024', '4/18/2024', 'Indiana', '80510 Lukken Junction', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (44, null, '4/11/2024', '4/18/2024', 'Texas', '8503 Memorial Center', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (45, null, '4/10/2024', '4/20/2024', 'California', '83903 Nancy Hill', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (46, null, '4/13/2024', '4/19/2024', 'California', '085 Carpenter Center', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (47, null, '4/13/2024', '4/20/2024', 'Florida', '63 Oriole Alley', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (48, null, '4/10/2024', '4/19/2024', 'Colorado', '0 Havey Court', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (49, null, '4/11/2024', '4/20/2024', 'Washington', '55860 Hallows Lane', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (50, null, '4/14/2024', '4/18/2024', 'Washington', '42996 Elka Lane', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (51, null, '4/14/2024', '4/20/2024', 'Pennsylvania', '4 Truax Way', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (52, null, '4/13/2024', '4/20/2024', 'North Carolina', '81331 Crownhardt Pass', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (53, null, '4/12/2024', '4/18/2024', 'Kansas', '5 Bobwhite Drive', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (54, null, '4/12/2024', '4/18/2024', 'New York', '30 Green Hill', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (55, null, '4/14/2024', '4/18/2024', 'Texas', '4 Crescent Oaks Alley', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (56, null, '4/13/2024', '4/20/2024', 'Indiana', '39 Pine View Junction', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (57, null, '4/12/2024', '4/20/2024', 'Ohio', '6 Johnson Circle', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (58, null, '4/11/2024', '4/19/2024', 'Kansas', '87756 Anthes Lane', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (59, null, '4/14/2024', '4/20/2024', 'New York', '70456 Becker Circle', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (60, null, '4/14/2024', '4/18/2024', 'Ohio', '56727 Sloan Terrace', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (61, null, '4/14/2024', '4/19/2024', 'Pennsylvania', '86 Marcy Park', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (62, null, '4/13/2024', '4/19/2024', 'Texas', '40578 Sunnyside Terrace', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (63, null, '4/11/2024', '4/18/2024', 'New Jersey', '190 Luster Trail', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (64, null, '4/12/2024', '4/19/2024', 'Wisconsin', '8161 Loftsgordon Plaza', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (65, null, '4/12/2024', '4/18/2024', 'Missouri', '4776 Sutteridge Trail', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (66, null, '4/13/2024', '4/18/2024', 'California', '16737 Tennessee Parkway', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (67, null, '4/12/2024', '4/18/2024', 'Missouri', '71833 Pleasure Road', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (68, null, '4/14/2024', '4/19/2024', 'California', '85369 Oxford Terrace', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (69, null, '4/11/2024', '4/19/2024', 'Oklahoma', '2 Arkansas Junction', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (70, null, '4/13/2024', '4/18/2024', 'Missouri', '97 Gateway Hill', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (71, null, '4/13/2024', '4/18/2024', 'Alabama', '388 Debra Center', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (72, null, '4/11/2024', '4/20/2024', 'California', '08 Meadow Vale Way', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (73, null, '4/12/2024', '4/18/2024', 'Colorado', '66 Grasskamp Parkway', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (74, null, '4/12/2024', '4/20/2024', 'Massachusetts', '2081 Montana Road', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (75, null, '4/12/2024', '4/19/2024', 'Florida', '6093 Scofield Crossing', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (76, null, '4/10/2024', '4/19/2024', 'Ohio', '58 American Ash Crossing', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (77, null, '4/11/2024', '4/18/2024', 'California', '056 Pine View Center', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (78, null, '4/10/2024', '4/20/2024', 'Missouri', '0 Fieldstone Terrace', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (79, null, '4/12/2024', '4/19/2024', 'Colorado', '955 Cody Alley', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (80, null, '4/11/2024', '4/19/2024', 'West Virginia', '70 Southridge Parkway', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (81, null, '4/13/2024', '4/20/2024', 'Illinois', '05822 Portage Park', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (82, null, '4/10/2024', '4/20/2024', 'Connecticut', '16673 Ilene Road', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (83, null, '4/13/2024', '4/18/2024', 'California', '67 Goodland Pass', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (84, null, '4/12/2024', '4/18/2024', 'West Virginia', '90022 Hanover Street', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (85, null, '4/12/2024', '4/19/2024', 'Illinois', '6 Portage Crossing', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (86, null, '4/12/2024', '4/18/2024', 'Ohio', '5 Hanover Hill', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (87, null, '4/12/2024', '4/20/2024', 'Kentucky', '3929 Mayfield Way', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (88, null, '4/10/2024', '4/18/2024', 'Texas', '07 Northview Road', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (89, null, '4/11/2024', '4/19/2024', 'California', '18029 Old Shore Center', true, 'Happy Birthday');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (90, null, '4/13/2024', '4/19/2024', 'Iowa', '671 Blue Bill Park Road', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (91, null, '4/12/2024', '4/20/2024', 'District of Columbia', '09940 Magdeline Drive', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (92, null, '4/13/2024', '4/18/2024', 'Connecticut', '68 Anhalt Center', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (93, null, '4/14/2024', '4/20/2024', 'Minnesota', '2021 Vera Point', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (94, null, '4/10/2024', '4/18/2024', 'Maryland', '16801 Randy Street', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (95, null, '4/12/2024', '4/20/2024', 'Texas', '8 5th Plaza', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (96, null, '4/14/2024', '4/19/2024', 'Pennsylvania', '23839 Rowland Trail', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (97, null, '4/12/2024', '4/19/2024', 'Pennsylvania', '4403 Sutteridge Place', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (98, null, '4/13/2024', '4/18/2024', 'Florida', '98423 Moland Hill', true, 'Merry Christmas');
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (99, null, '4/14/2024', '4/20/2024', 'California', '649 Kings Alley', false, null);
insert into Orders (OrderID, CustomerID, OrderDate, ArrivalDate, CurrentLocation, Address, IsGift, GiftMessage) values (100, null, '4/13/2024', '4/19/2024', 'Ohio', '65523 Dryden Center', true, 'Happy Birthday');

insert into Book_Author (BookID, AuthorID) values (null, 22);
insert into Book_Author (BookID, AuthorID) values (null, 79);
insert into Book_Author (BookID, AuthorID) values (null, 43);
insert into Book_Author (BookID, AuthorID) values (null, 37);
insert into Book_Author (BookID, AuthorID) values (null, 64);
insert into Book_Author (BookID, AuthorID) values (null, 76);
insert into Book_Author (BookID, AuthorID) values (null, 71);
insert into Book_Author (BookID, AuthorID) values (null, 98);
insert into Book_Author (BookID, AuthorID) values (null, 61);
insert into Book_Author (BookID, AuthorID) values (null, 42);
insert into Book_Author (BookID, AuthorID) values (null, 9);
insert into Book_Author (BookID, AuthorID) values (null, 46);
insert into Book_Author (BookID, AuthorID) values (null, 24);
insert into Book_Author (BookID, AuthorID) values (null, 80);
insert into Book_Author (BookID, AuthorID) values (null, 73);
insert into Book_Author (BookID, AuthorID) values (null, 88);
insert into Book_Author (BookID, AuthorID) values (null, 67);
insert into Book_Author (BookID, AuthorID) values (null, 58);
insert into Book_Author (BookID, AuthorID) values (null, 36);
insert into Book_Author (BookID, AuthorID) values (null, 94);
insert into Book_Author (BookID, AuthorID) values (null, 75);
insert into Book_Author (BookID, AuthorID) values (null, 84);
insert into Book_Author (BookID, AuthorID) values (null, 69);
insert into Book_Author (BookID, AuthorID) values (null, 19);
insert into Book_Author (BookID, AuthorID) values (null, 95);
insert into Book_Author (BookID, AuthorID) values (null, 52);
insert into Book_Author (BookID, AuthorID) values (null, 56);
insert into Book_Author (BookID, AuthorID) values (null, 34);
insert into Book_Author (BookID, AuthorID) values (null, 17);
insert into Book_Author (BookID, AuthorID) values (null, 35);
insert into Book_Author (BookID, AuthorID) values (null, 4);
insert into Book_Author (BookID, AuthorID) values (null, 48);
insert into Book_Author (BookID, AuthorID) values (null, 68);
insert into Book_Author (BookID, AuthorID) values (null, 41);
insert into Book_Author (BookID, AuthorID) values (null, 50);
insert into Book_Author (BookID, AuthorID) values (null, 16);
insert into Book_Author (BookID, AuthorID) values (null, 65);
insert into Book_Author (BookID, AuthorID) values (null, 62);
insert into Book_Author (BookID, AuthorID) values (null, 51);
insert into Book_Author (BookID, AuthorID) values (null, 87);
insert into Book_Author (BookID, AuthorID) values (null, 100);
insert into Book_Author (BookID, AuthorID) values (null, 15);
insert into Book_Author (BookID, AuthorID) values (null, 72);
insert into Book_Author (BookID, AuthorID) values (null, 33);
insert into Book_Author (BookID, AuthorID) values (null, 8);
insert into Book_Author (BookID, AuthorID) values (null, 5);
insert into Book_Author (BookID, AuthorID) values (null, 31);
insert into Book_Author (BookID, AuthorID) values (null, 99);
insert into Book_Author (BookID, AuthorID) values (null, 45);
insert into Book_Author (BookID, AuthorID) values (null, 77);
insert into Book_Author (BookID, AuthorID) values (null, 81);
insert into Book_Author (BookID, AuthorID) values (null, 78);
insert into Book_Author (BookID, AuthorID) values (null, 54);
insert into Book_Author (BookID, AuthorID) values (null, 70);
insert into Book_Author (BookID, AuthorID) values (null, 18);
insert into Book_Author (BookID, AuthorID) values (null, 7);
insert into Book_Author (BookID, AuthorID) values (null, 11);
insert into Book_Author (BookID, AuthorID) values (null, 90);
insert into Book_Author (BookID, AuthorID) values (null, 82);
insert into Book_Author (BookID, AuthorID) values (null, 59);
insert into Book_Author (BookID, AuthorID) values (null, 27);
insert into Book_Author (BookID, AuthorID) values (null, 85);
insert into Book_Author (BookID, AuthorID) values (null, 21);
insert into Book_Author (BookID, AuthorID) values (null, 60);
insert into Book_Author (BookID, AuthorID) values (null, 47);
insert into Book_Author (BookID, AuthorID) values (null, 28);
insert into Book_Author (BookID, AuthorID) values (null, 26);
insert into Book_Author (BookID, AuthorID) values (null, 20);
insert into Book_Author (BookID, AuthorID) values (null, 6);
insert into Book_Author (BookID, AuthorID) values (null, 53);
insert into Book_Author (BookID, AuthorID) values (null, 92);
insert into Book_Author (BookID, AuthorID) values (null, 83);
insert into Book_Author (BookID, AuthorID) values (null, 12);
insert into Book_Author (BookID, AuthorID) values (null, 49);
insert into Book_Author (BookID, AuthorID) values (null, 63);
insert into Book_Author (BookID, AuthorID) values (null, 97);
insert into Book_Author (BookID, AuthorID) values (null, 86);
insert into Book_Author (BookID, AuthorID) values (null, 32);
insert into Book_Author (BookID, AuthorID) values (null, 23);
insert into Book_Author (BookID, AuthorID) values (null, 25);
insert into Book_Author (BookID, AuthorID) values (null, 39);
insert into Book_Author (BookID, AuthorID) values (null, 66);
insert into Book_Author (BookID, AuthorID) values (null, 10);
insert into Book_Author (BookID, AuthorID) values (null, 2);
insert into Book_Author (BookID, AuthorID) values (null, 13);
insert into Book_Author (BookID, AuthorID) values (null, 38);
insert into Book_Author (BookID, AuthorID) values (null, 74);
insert into Book_Author (BookID, AuthorID) values (null, 3);
insert into Book_Author (BookID, AuthorID) values (null, 29);
insert into Book_Author (BookID, AuthorID) values (null, 44);
insert into Book_Author (BookID, AuthorID) values (null, 57);
insert into Book_Author (BookID, AuthorID) values (null, 93);
insert into Book_Author (BookID, AuthorID) values (null, 40);
insert into Book_Author (BookID, AuthorID) values (null, 91);
insert into Book_Author (BookID, AuthorID) values (null, 1);
insert into Book_Author (BookID, AuthorID) values (null, 96);
insert into Book_Author (BookID, AuthorID) values (null, 14);
insert into Book_Author (BookID, AuthorID) values (null, 89);
insert into Book_Author (BookID, AuthorID) values (null, 30);
insert into Book_Author (BookID, AuthorID) values (null, 55);

insert into CustomerEmail (CusomterID, Email) values (null, 'mmaiklem0@telegraph.co.uk');
insert into CustomerEmail (CusomterID, Email) values (null, 'odochon1@howstuffworks.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'cridwood2@elegantthemes.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'fbettington3@google.co.uk');
insert into CustomerEmail (CusomterID, Email) values (null, 'slindenfeld4@prlog.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'gtapin5@mozilla.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'kdysart6@nature.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'lbedenham7@yellowpages.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'rbroadbury8@usatoday.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ksleney9@mozilla.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ndobeya@globo.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'kedensb@webnode.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'dbletsoc@people.com.cn');
insert into CustomerEmail (CusomterID, Email) values (null, 'rayscoughd@over-blog.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'pmansele@tumblr.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'klealef@amazon.de');
insert into CustomerEmail (CusomterID, Email) values (null, 'lmacekg@pbs.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'ctelfordh@umn.edu');
insert into CustomerEmail (CusomterID, Email) values (null, 'kwinwardi@jigsy.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'smcwilliamj@addthis.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'bmosconk@netscape.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'lmulvaghl@wikispaces.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'hsautterm@vinaora.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'wsearyn@nature.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'zhayfieldo@ezinearticles.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'rrawlinp@quantcast.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'pcootesq@storify.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'aaubrayr@timesonline.co.uk');
insert into CustomerEmail (CusomterID, Email) values (null, 'nfosdikes@wsj.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'haberhartt@netscape.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'psagrottu@blogs.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'mcorbettv@google.com.br');
insert into CustomerEmail (CusomterID, Email) values (null, 'kmelbournw@simplemachines.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'bkayesx@spotify.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'panslowy@icq.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'jzanussiiz@jugem.jp');
insert into CustomerEmail (CusomterID, Email) values (null, 'cbridger10@toplist.cz');
insert into CustomerEmail (CusomterID, Email) values (null, 'aorsman11@infoseek.co.jp');
insert into CustomerEmail (CusomterID, Email) values (null, 'jfranek12@si.edu');
insert into CustomerEmail (CusomterID, Email) values (null, 'clattimore13@wufoo.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'mgoulbourn14@canalblog.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'vcutchie15@jalbum.net');
insert into CustomerEmail (CusomterID, Email) values (null, 'chealey16@rediff.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'nchicken17@tamu.edu');
insert into CustomerEmail (CusomterID, Email) values (null, 'sfosken18@microsoft.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ccobleigh19@vinaora.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'rriches1a@ihg.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ddomelow1b@chron.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'hmingo1c@com.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'tlutsch1d@instagram.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'shaddacks1e@unblog.fr');
insert into CustomerEmail (CusomterID, Email) values (null, 'edonalson1f@wikipedia.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'crodie1g@gizmodo.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'glorryman1h@zimbio.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'lsholem1i@shop-pro.jp');
insert into CustomerEmail (CusomterID, Email) values (null, 'jscantleberry1j@nymag.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'rflemmich1k@dion.ne.jp');
insert into CustomerEmail (CusomterID, Email) values (null, 'ccarayol1l@drupal.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'cescott1m@sfgate.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'mludewig1n@youtube.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'sschukraft1o@gmpg.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'vbeesley1p@de.vu');
insert into CustomerEmail (CusomterID, Email) values (null, 'lstedmond1q@wiley.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'lstut1r@about.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'dgrzesiewicz1s@gravatar.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'bklimentov1t@sourceforge.net');
insert into CustomerEmail (CusomterID, Email) values (null, 'cdytham1u@discovery.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'mrawdall1v@cargocollective.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'tdeavall1w@cnn.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'tcolville1x@cam.ac.uk');
insert into CustomerEmail (CusomterID, Email) values (null, 'kgregoire1y@huffingtonpost.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'hgarrattley1z@addthis.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'bdowglass20@google.es');
insert into CustomerEmail (CusomterID, Email) values (null, 'lvell21@wikia.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'mnorcross22@elegantthemes.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'dilyin23@house.gov');
insert into CustomerEmail (CusomterID, Email) values (null, 'tlubbock24@hhs.gov');
insert into CustomerEmail (CusomterID, Email) values (null, 'mstanes25@reuters.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'fgramer26@craigslist.org');
insert into CustomerEmail (CusomterID, Email) values (null, 'pgarr27@abc.net.au');
insert into CustomerEmail (CusomterID, Email) values (null, 'mbellenger28@blinklist.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'dvidloc29@telegraph.co.uk');
insert into CustomerEmail (CusomterID, Email) values (null, 'rommundsen2a@reuters.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ipearson2b@google.es');
insert into CustomerEmail (CusomterID, Email) values (null, 'bilyas2c@reference.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'djelf2d@geocities.jp');
insert into CustomerEmail (CusomterID, Email) values (null, 'snewvill2e@indiegogo.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'jwestmorland2f@mysql.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'hplayford2g@mediafire.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'sbattaille2h@hc360.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'rmcmackin2i@blogtalkradio.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'ehabbema2j@va.gov');
insert into CustomerEmail (CusomterID, Email) values (null, 'ddaughtrey2k@stumbleupon.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'sfacher2l@psu.edu');
insert into CustomerEmail (CusomterID, Email) values (null, 'elabram2m@google.ca');
insert into CustomerEmail (CusomterID, Email) values (null, 'cscudder2n@bigcartel.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'lmallender2o@reverbnation.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'nlathom2p@msn.com');
insert into CustomerEmail (CusomterID, Email) values (null, 'fsaben2q@state.gov');
insert into CustomerEmail (CusomterID, Email) values (null, 'dtrittam2r@t-online.de');

insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (1, '4/14/2019', 'Goodwin, Sauer and Gislason');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (2, '3/24/2008', 'Medhurst and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (3, '8/14/2010', 'Goodwin Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (4, '4/3/2016', 'Hagenes-Jenkins');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (5, '1/17/2021', 'Willms and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (6, '3/8/2014', 'Zulauf, Cruickshank and Greenfelder');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (7, '12/10/2023', 'Gleason-Dicki');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (8, '1/25/2016', 'Kuphal, Pfeffer and Franecki');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (9, '10/4/2004', 'Hickle, Lowe and Moore');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (10, '1/5/2017', 'Russel, Lynch and Rohan');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (11, '10/2/2010', 'Swaniawski, Dicki and Fahey');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (12, '2/12/2017', 'Osinski LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (13, '6/29/2018', 'McGlynn Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (14, '5/15/2020', 'Hodkiewicz, Weber and Kihn');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (15, '11/14/2007', 'Toy-Herzog');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (16, '11/30/2012', 'Jacobson-Kohler');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (17, '12/30/2014', 'Roberts LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (18, '11/25/2016', 'Swaniawski, Blick and Klocko');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (19, '6/16/2020', 'Larson, Corkery and Price');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (20, '1/21/2002', 'O''Conner Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (21, '11/14/2011', 'Barrows Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (22, '1/14/2012', 'Zulauf, Pacocha and Donnelly');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (23, '3/5/2010', 'McKenzie Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (24, '5/29/2018', 'Hoeger, Kuvalis and Schultz');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (25, '1/7/2005', 'Hessel and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (26, '4/15/2023', 'Brown, Rippin and Quitzon');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (27, '2/18/2015', 'Weimann-O''Connell');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (28, '5/27/2005', 'Willms LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (29, '2/10/2007', 'Collins-Christiansen');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (30, '6/18/2017', 'Hahn-Dickens');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (31, '5/12/2001', 'Keebler-Brown');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (32, '5/8/2019', 'Bergnaum-McGlynn');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (33, '4/4/2002', 'Conn LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (34, '6/3/2011', 'Adams Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (35, '9/2/2004', 'Kerluke LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (36, '1/24/2003', 'Schulist-Armstrong');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (37, '3/21/2017', 'Fahey LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (38, '9/11/2001', 'Grady and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (39, '1/12/2019', 'Kihn LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (40, '8/31/2004', 'Ritchie, Labadie and Barrows');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (41, '8/19/2011', 'Shanahan, Price and Schuster');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (42, '6/24/2009', 'Orn Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (43, '10/20/2016', 'Rippin-Anderson');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (44, '6/27/2002', 'Marvin Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (45, '7/21/2021', 'Cormier Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (46, '9/18/2000', 'Walsh-Mohr');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (47, '6/1/2007', 'Farrell, Schamberger and Abshire');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (48, '8/14/2021', 'O''Conner, Denesik and Mills');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (49, '12/25/2014', 'Thompson Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (50, '4/14/2024', 'Orn Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (51, '6/27/2013', 'Reinger LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (52, '7/27/2012', 'Morissette-Roob');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (53, '6/27/2001', 'Heidenreich, Swaniawski and O''Hara');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (54, '9/14/2008', 'Toy-Bins');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (55, '6/4/2012', 'Kiehn, Nolan and Harris');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (56, '2/23/2005', 'Turcotte, Parker and Moen');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (57, '3/6/2020', 'Schaden-Jacobs');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (58, '1/4/2005', 'Robel LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (59, '1/16/2002', 'Hamill, Klein and Rutherford');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (60, '7/29/2014', 'Jakubowski, Ortiz and Sauer');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (61, '12/6/2002', 'Kertzmann Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (62, '7/10/2005', 'Bruen, Shanahan and Batz');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (63, '3/1/2022', 'Kutch Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (64, '12/10/2000', 'McGlynn-Crooks');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (65, '9/20/2009', 'Adams, Cronin and Hills');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (66, '12/30/2003', 'Weissnat, Schaden and Ryan');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (67, '8/22/2006', 'Morissette Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (68, '10/4/2011', 'Davis-Toy');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (69, '8/16/2010', 'Morissette Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (70, '10/23/2000', 'Zemlak-Hauck');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (71, '5/10/2016', 'Mosciski, Kulas and Schimmel');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (72, '9/27/2012', 'Simonis, Crona and Welch');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (73, '12/23/2010', 'Kuhn and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (74, '11/23/2014', 'Collins Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (75, '5/9/2021', 'Stanton and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (76, '11/10/2002', 'Nolan, McKenzie and Bayer');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (77, '12/13/2002', 'Heidenreich, Gleichner and Koelpin');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (78, '9/9/2013', 'McKenzie, Kling and Bechtelar');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (79, '5/26/2012', 'Homenick, Wehner and Von');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (80, '6/7/2019', 'Cormier-Towne');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (81, '4/10/2006', 'Gorczany and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (82, '3/11/2014', 'Gerlach-Hirthe');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (83, '10/18/2019', 'McCullough, Metz and Jacobi');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (84, '2/22/2004', 'Strosin Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (85, '11/17/2015', 'Terry-Rosenbaum');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (86, '11/28/2022', 'Farrell Group');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (87, '5/7/2016', 'Hirthe, West and Bradtke');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (88, '10/11/2013', 'Runolfsdottir and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (89, '6/1/2008', 'Frami LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (90, '2/13/2001', 'Langworth, Emard and Purdy');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (91, '2/28/2013', 'Kuhlman LLC');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (92, '11/9/2012', 'Waters and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (93, '7/14/2004', 'Hagenes, Reichert and Mayer');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (94, '1/3/2003', 'Schamberger, Haag and Spinka');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (95, '5/6/2020', 'Senger Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (96, '6/17/2010', 'Leannon Inc');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (97, '6/29/2014', 'Leuschke-Hoppe');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (98, '5/20/2021', 'Littel and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (99, '5/14/2011', 'Hoeger and Sons');
insert into InventoryShipment (ShipmentID, ArrivalDate, SupplierName) values (100, '6/29/2016', 'Jacobson-Lemke');

insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);
insert into Order_Book (BookID, OrderID) values (null, null);

insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);
insert into Shipment_Book (BookID, ShipmentID) values (null, null);