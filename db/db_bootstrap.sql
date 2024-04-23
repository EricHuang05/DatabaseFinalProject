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
   ISBN VARCHAR(20),
   ReleaseDate DATE,
   Format VARCHAR(50),
   Status ENUM('Available', 'Out of Stock', 'Unavailable'),
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
