--Project Database C (Create DML Insert)

--Position
INSERT INTO Position VALUES
('SP001','CEO'),
('SP002','Secretary'),
('SP003','Treasurer'),
('SP004','Promotion'),
('SP005','Marketing'),
('SP006','Inventory Manager'),
('SP007','Head Chef'),
('SP008','Chef'),
('SP009','Supervisor'),
('SP010','Cashier')

--Customer
INSERT INTO Customer VALUES
('CU001','Vincent Hadinata','089922221313','Jalan Kura Kura No.2','Male','vh@gmail.com'),
('CU002','Budi Doremi','089191912221','Jalan Buntu No.3','Male','budi@yahoo.co.id'),
('CU003','Kim Jong Un','082211359682','Jalan Kim No.5','Male','kimjongun@gmail.com'),
('CU004','Joko','08422223253','Jalan Sudirman No.10','Male','joko@yahoo.com'),
('CU005','Andre','084233342343','Jalan Harapan No.1','Male','andre@gmail.com'),
('CU006','Radit','084231587035','Jalan Batu No.2','Male','radit@yahoo.com'),
('CU007','Rama','084284029576','Jalan Bahagia No.80','Male','rama@yahoo.co.id'),
('CU008','Lisa','084249927584','Jalan Asia Afrika No.22','Female','lisa@yahoo.com'),
('CU009','Suzy','084333333253','Jalan Tambang No.40','Female','suzy@gmail.com'),
('CU010','Yukino','084501856934','Jalan Naruto No.1','Female','yukino@yahoo.com')

--Ingredients
INSERT INTO Ingredients VALUES
('ID001','Daging Ayam','200','75000'),
('ID002','Daging Sapi','300','100000'),
('ID003','Garam','400','20000'),
('ID004','Bawang','500','30000'),
('ID005','Cabai','200','30000'),
('ID006','Beras','200','60000'),
('ID007','Telur','150','50000'),
('ID008','Tepung Terigu','100','20000'),
('ID009','Gula','100','20000'),
('ID010','Minyak Sayur','300','30000')

--Vendor
INSERT INTO Vendor VALUES
('VE001','PT. Toyoti','089232138593','Kramat'),
('VE002','PT. Indifood','089454324593','Kelapa Gading'),
('VE003','PT. BigHot','089829574833','Kemanggisan'),
('VE004','PT. Samsing','080027584593','Ciputat'),
('VE005','PT. Melon Segar','089232139285','Senen'),
('VE006','PT. Budiman','089232820390','Tanjung Priok'),
('VE007','PT. Aquila','089209759403','Bandung'),
('VE008','PT. Samsan Tech','089220029404','Tangerang'),
('VE009','PT. Halu','084323138593','Cakung'),
('VE010','PT. Boim','0893017594305','Harmoni')

--Menu
INSERT INTO Menu VALUES
('ME001','Ayam Bakar','ayam dibakar','30000'),
('ME002','Ayam Goreng Tepung','ayam ditepungin','30000'),
('ME003','Nasi Goreng Sapi','sapi dimasak ama nasi','50000'),
('ME004','Ayam Telur Asin','ayam diolesi telur asin','35000'),
('ME005','Telur Dadar','telur didadar','20000'),
('ME006','Sapi Goreng Tepung','sapi ditepungin','50000'),
('ME007','Nasi Goreng Ayam','ayam dimasak sama nasi','30000'),
('ME008','Sapi Bakar','sapi dibakar','50000'),
('ME009','Puyunghai','telur ditepungin','30000'),
('ME010','Ayam Cabe Garam','ayam dicabein trus digaremin','30000')

--Staff
INSERT INTO Staff VALUES
('ST001','Rose Park','Female','rose@gmail.com','089402857493','Seoul','4000000','SP001'),
('ST002','Dita Karang','Female','dita@yahoo.com','089433857493','Bali','3000000','SP002'),
('ST003','Sana Minatozaki','Female','sana@gmail.com','089402857493','Bandung','2500000','SP003'),
('ST004','Jennie Kim','Female','jennie@gmail.com','089402857493','Kemang','2000000','SP004'),
('ST005','Maycriel Djiauw','Male','maycriel@gmail.com','089402857493','Harmoni','1200000','SP005'),
('ST006','Yui Yuigahama','Female','yui@gmail.com','089402857493','Cikini','800000','SP007'),
('ST007','Bambang Soesatyo','Male','bambang@gmail.com','089402857493','Kramat','1000000','SP006'),
('ST008','Christian Bong','Male','chris@gmail.com','089402857493','Tomang','1000000','SP006'),
('ST009','Michael Djiauw','Male','michael@gmail.com','089402857493','Tanjung Duren','600000','SP010'),
('ST010','Dillwyn Ignatius','Male','dillwyn@gmail.com','089402857493','Kelapa Gading','600000','SP010')

--Transaction Header
INSERT INTO HeaderServiceTransaction VALUES
('TR001','ST001','CU001','2020-11-13','Online','Kemanggisan'),
('TR002','ST010','CU002','2020-11-14','Offline','Tanjung Duren'),
('TR003','ST010','CU003','2020-11-12','Offline','Seoul'),
('TR004','ST010','CU004','2020-11-10','Online','Senen'),
('TR005','ST009','CU005','2020-11-12','Online','Kemang'),
('TR006','ST009','CU006','2020-11-10','Online','Blok M'),
('TR007','ST009','CU007','2020-11-08','Offline','Menteng'),
('TR008','ST001','CU008','2020-11-06','Online','Cikini'),
('TR009','ST002','CU009','2020-11-05','Offline','Dukuh Atas'),
('TR010','ST002','CU010','2020-11-02','Online','Setiabudi'),
('TR011','ST006','CU003','2020-11-01','Offline','Tanah Abang'),
('TR012','ST007','CU004','2020-10-30','Online','Kemanggisan'),
('TR013','ST007','CU005','2020-10-30','Offline','Sunter'),
('TR014','ST006','CU006','2020-11-15','Offline','Pluit'),
('TR015','ST005','CU007','2020-11-15','Online','Petamburan')

--Transaction Detail
INSERT INTO DetailServiceTransaction VALUES
('TR001','ME001',120),
('TR001','ME010',1),
('TR002','ME003',3),
('TR002','ME001',3),
('TR002','ME009',1),
('TR003','ME006',1),
('TR004','ME001',1),
('TR004','ME008',1),
('TR005','ME007',120),
('TR005','ME008',1),
('TR006','ME001',2),
('TR006','ME005',3),
('TR006','ME009',120),
('TR007','ME001',1),
('TR008','ME002',1),
('TR008','ME010',1),
('TR009','ME003',120),
('TR009','ME005',120),
('TR010','ME005',3),
('TR011','ME008',120),
('TR011','ME004',3),
('TR012','ME009',120),
('TR013','ME010',120),
('TR014','ME006',1),
('TR015','ME003',1)

-- Purchase Header
INSERT INTO HeaderPurchaseTransaction VALUES
('PU001','ST001','VE001','2020-11-01'),
('PU002','ST002','VE003','2020-11-02'),
('PU003','ST002','VE004','2020-11-03'),
('PU004','ST003','VE005','2020-12-01'),
('PU005','ST004','VE006','2020-12-01'),
('PU006','ST004','VE007','2020-12-01'),
('PU007','ST006','VE008','2020-12-01'),
('PU008','ST006','VE009','2020-12-08'),
('PU009','ST006','VE010','2020-11-07'),
('PU010','ST006','VE002','2020-11-06'),
('PU011','ST007','VE001','2020-11-05'),
('PU012','ST007','VE002','2020-11-04'),
('PU013','ST008','VE003','2020-11-03'),
('PU014','ST008','VE009','2020-11-02'),
('PU015','ST008','VE010','2020-11-01')

--Detail Purchase
INSERT INTO DetailPurchaseTransaction VALUES
('PU001','ID001',2),
('PU001','ID006',2),
('PU002','ID001',3),
('PU003','ID002',4),
('PU004','ID002',5),
('PU004','ID006',1),
('PU005','ID003',1),
('PU006','ID006',2),
('PU006','ID007',2),
('PU006','ID008',1),
('PU007','ID005',3),
('PU007','ID007',1),
('PU008','ID006',6),
('PU009','ID007',1),
('PU010','ID008',3),
('PU011','ID007',4),
('PU011','ID008',3),
('PU011','ID009',1),
('PU011','ID010',2),
('PU012','ID008',1),
('PU013','ID001',3),
('PU013','ID003',2),
('PU013','ID005',3),
('PU014','ID010',2),
('PU015','ID010',1)
