-- Project Database D (Simulasi)

--Purchase Transaction Simulation

--Purchase 1
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU016','ST001','VE001','2020-11-02')
INSERT INTO DetailPurchaseTransaction
VALUES('PU016','ID002',2)

--Purchase 2
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU017','ST002','VE002','2020-11-02')
INSERT INTO DetailPurchaseTransaction
VALUES('PU017','ID004',2)

--Purchase 3
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU018','ST002','VE003','2020-11-02')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU018','ID004',2),
		('PU018','ID005',1)

--Purchase 4
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU019','ST009','VE004','2020-11-02')
INSERT INTO DetailPurchaseTransaction
VALUES('PU019','ID010',1)

--Purchase 5
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU020','ST009','VE004','2020-11-02')
INSERT INTO DetailPurchaseTransaction
VALUES('PU020','ID010',1)

--Purchase 6
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU021','ST010','VE008','2020-11-01')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU021','ID004',3),
		('PU021','ID007',3)

--Purchase 7
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU022','ST006','VE007','2020-11-03')
INSERT INTO DetailPurchaseTransaction
VALUES('PU022','ID001',1)

--Purchase 8
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU023','ST003','VE008','2020-11-03')
INSERT INTO DetailPurchaseTransaction
VALUES('PU023','ID001',1)

--Purchase 9
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU024','ST003','VE003','2020-11-03')
INSERT INTO DetailPurchaseTransaction
VALUES('PU024','ID002',5)

--Purchase 10
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU025','ST001','VE001','2020-11-06')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU025','ID001',1),
		('PU025','ID002',1),


--Purchase 11
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU026','ST008','VE008','2020-11-06')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU026','ID008',2),
		('PU026','ID009',2),
		('PU026','ID010',3)

--Purchase 12
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU027','ST008','VE008','2020-11-06')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU027','ID008',2),
		('PU027','ID010',2)

--Purchase 13
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU028','ST003','VE001','2020-11-07')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU028','ID003',1),
		('PU028','ID004',1),
		('PU028','ID006',1)

--Purchase 14
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU029','ST010','VE010','2020-12-01')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU029','ID004',1),
		('PU029','ID009',1)

--Purchase 15
INSERT INTO HeaderPurchaseTransaction
VALUES ('PU030','ST001','VE007','2020-12-01')
INSERT INTO DetailPurchaseTransaction
VALUES	('PU030','ID005',2),
		('PU030','ID006',3)

-- Service Transaction Simulation

--Transaction 1
INSERT INTO HeaderServiceTransaction VALUES
('TR016','ST002','CU001','2020-11-14','Online','Bandung')
INSERT INTO DetailServiceTransaction VALUES
('TR016','ME002',1)

--Transaction 2
INSERT INTO HeaderServiceTransaction VALUES
('TR017','ST006','CU004','2020-11-14','Online','Surabaya')
INSERT INTO DetailServiceTransaction VALUES
('TR017','ME002',1),
('TR017','ME003',120)

--Transaction 3
INSERT INTO HeaderServiceTransaction VALUES
('TR018','ST008','CU007','2020-11-13','Offline','Tomang')
INSERT INTO DetailServiceTransaction VALUES
('TR018','ME004',120),
('TR018','ME008',3)

--Transaction 4
INSERT INTO HeaderServiceTransaction VALUES
('TR019','ST010','CU009','2020-11-04','Offline','Pondok Kelapa')
INSERT INTO DetailServiceTransaction VALUES
('TR019','ME006',4)

--Transaction 5
INSERT INTO HeaderServiceTransaction VALUES
('TR020','ST009','CU006','2020-11-04','Offline','Grogol')
INSERT INTO DetailServiceTransaction VALUES
('TR020','ME001',120)

--Transaction 6
INSERT INTO HeaderServiceTransaction VALUES
('TR021','ST004','CU009','2020-11-04','Offline','Pondok Kelapa')
INSERT INTO DetailServiceTransaction VALUES
('TR021','ME002',1)

--Transaction 7
INSERT INTO HeaderServiceTransaction VALUES
('TR022','ST001','CU010','2020-10-04','Online','Pondok Kelapa')
INSERT INTO DetailServiceTransaction VALUES
('TR022','ME006',1)

--Transaction 8
INSERT INTO HeaderServiceTransaction VALUES
('TR023','ST003','CU005','2020-10-30','Offline','Sunter')
INSERT INTO DetailServiceTransaction VALUES
('TR023','ME006',1),
('TR023','ME008',1)

--Transaction 9
INSERT INTO HeaderServiceTransaction VALUES
('TR024','ST002','CU002','2020-11-01','Online','Sunter')
INSERT INTO DetailServiceTransaction VALUES
('TR024','ME008',1)

--Transaction 10
INSERT INTO HeaderServiceTransaction VALUES
('TR025','ST004','CU001','2020-11-01','Online','Blok A')
INSERT INTO DetailServiceTransaction VALUES
('TR025','ME004',120),
('TR025','ME005',120)

--Transaction 11
INSERT INTO HeaderServiceTransaction VALUES
('TR026','ST005','CU005','2020-11-01','Online','Blok M')
INSERT INTO DetailServiceTransaction VALUES
('TR026','ME001',1),
('TR026','ME005',120)

--Transaction 12
INSERT INTO HeaderServiceTransaction VALUES
('TR027','ST001','CU002','2020-11-11','Online','Senen')
INSERT INTO DetailServiceTransaction VALUES
('TR027','ME001',1),
('TR027','ME003',120)

--Transaction 13
INSERT INTO HeaderServiceTransaction VALUES
('TR028','ST009','CU010','2020-11-10','Online','Tanah Merah')
INSERT INTO DetailServiceTransaction VALUES
('TR028','ME005',120),
('TR028','ME006',1)

--Transaction 14
INSERT INTO HeaderServiceTransaction VALUES
('TR029','ST009','CU009','2020-11-10','Offline','Tanah Merah')
INSERT INTO DetailServiceTransaction VALUES
('TR029','ME007',120),
('TR029','ME010',1)

--Transaction 15
INSERT INTO HeaderServiceTransaction VALUES
('TR030','ST010','CU007','2020-11-10','Offline','Kemanggisan')
INSERT INTO DetailServiceTransaction VALUES
('TR030','ME005',120),
('TR030','ME006',120),
('TR030','ME009',120)
