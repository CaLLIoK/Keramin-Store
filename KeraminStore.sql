 create database KeraminStore
 go
 use KeraminStore

 --�������� ������� � �����������
 create table Post
 (postCode int not null identity,
 postName varchar(100) not null,
 constraint postNameUniq unique (postName),
 constraint postCodePK primary key (postCode))
 --���������� ������� �����������
 insert into Post(postName) values ('�������������'), ('������� ���������')

 --�������� ������� � ������������
 create table Employee
 (employeeCode int not null identity,
 employeeLogin varchar(30) not null,
 constraint employeeLoginUniq unique (employeeLogin),
 employeeAdminStatus bit not null,
 employeePassword varchar(30) not null,
 employeeName varchar(50) not null,
 employeeSurname varchar(50) not null,
 employeePatronymic varchar(50) not null,
 employeeDateOfBirth date not null,
 constraint employeeCodePK primary key (employeeCode),
 postCode int not null,
 constraint postCodeFK foreign key (postCode) references Post (postCode) on delete cascade)
 --���������� ������� ������������
 insert into Employee(employeeLogin, employeePassword, employeeName, employeeSurname, employeePatronymic, employeeDateOfBirth, postCode, employeeAdminStatus) values 
 ('Admin', 'Qwerty123', '��������', '������', '���������', '06.01.2000', 1, 1), 
 ('DefaultUser', 'Qwerty123', '������', '�����', '������������', '09.09.2001', 2, 0), 
 ('Admin2', 'Qwerty123', '�������', '���������', '��������', '09.05.1995', 1, 1), 
 ('User', 'Qwerty1', '������', '�����', '������������', '01.07.1999', 2, 0)

 --�������� ������� � ����������� ��� �������
 create table ProductCollection
 (productCollectionCode int not null identity,
 productCollectionName varchar(100) not null,
 constraint productCollectionNameUniq unique (productCollectionName),
 constraint productCollectionCodePK primary key (productCollectionCode))
 --���������� ������� �����������
 insert into ProductCollection (productCollectionName) values ('�������'), ('���'), ('�������'), ('����'), ('�������'), ('�������'), ('��������'), ('����'), ('�������'), ('�����'), 
 ('�����'), ('�����'), ('������'), ('������'), ('������'), ('������'), ('����'), ('������'), ('���� ����'), ('�����'), ('����'), ('������'), ('��������'), ('����'), ('�����'), 
 ('�������'), ('������'), ('�����'), ('������'), ('������'), ('������'), ('������'), ('�����'), ('��������'), ('�����'), ('�����'), ('�������'), ('���������'), ('�����'), ('������'), 
 ('�������'), ('�����'), ('������'), ('��������'), ('��������'), ('���������'), ('������'), ('�������'), ('�����'), ('������'), ('�����'), ('��������'), ('�������'), ('�������'), 
 ('������'), ('�������'), ('�����'), ('�������'), ('������'), ('���'), ('�����'), ('������'), ('����'), ('�������'), ('������'), ('������'), ('������'), ('�������'), ('�����'), 
 ('�����'), ('������'), ('����'), ('����'), ('������'), ('���-����'), ('�������'), ('����'), ('������'), ('������'), ('�����'), ('�������'), ('������'), ('���������'), ('�������'), 
 ('��������'), ('������'), ('���������'), ('������'), ('�����')

 --�������� ������� �� ��������� ������� �������
 create table AvailabilityStatus
 (availabilityStatusCode int not null identity,
 availabilityStatusName varchar(14),
 constraint availabilityStatusNameUniq unique (availabilityStatusName),
 constraint availabilityStatusCodePK primary key (availabilityStatusCode))
 --���������� ������� �� ��������� ������� �������
 insert into AvailabilityStatus (availabilityStatusName) values ('���� � �������'), ('��� � �������')

  --�������� ������� � ������ �������
 create table ProductType
 (productTypeCode int not null identity,
 productTypeName varchar(100) not null,
 constraint productTypeNameUniq unique (productTypeName),
 constraint productTypeCodePK primary key (productTypeCode))
 --���������� ������� ������ �������
 insert into ProductType (productTypeName) values ('��������� ������'), ('��������� ������'), ('��������� �����'), ('��������� �����'), ('�������'), ('������')

  --�������� ������� � �������������
 create table Surface
 (surfaceCode int not null identity,
 surfaceName varchar(100) not null,
 constraint surfaceNameUniq unique (surfaceName),
 constraint surfaceCodePK primary key (surfaceCode))
 --���������� ������� � �������������
 insert into Surface (surfaceName) values ('���������'), ('�������')

  --�������� ������� � �������
 create table Color
 (colorCode int not null identity,
 colorName varchar(100) not null,
 constraint colorNameUniq unique (colorName),
 constraint colorCodePK primary key (colorCode))
 --���������� ������� �������
 insert into Color (colorName) values ('������������'), ('������-�������'), ('������-�����'), ('�����'), ('�����-�������'), ('�����-�����'), ('�����'), ('������'), ('�������'), ('����������'), ('�������'), ('�������'), ('�������'), ('�������'), ('����������'), ('������'), ('���������'), ('�����')

  --�������� ������� � ���������
 create table Product 
 (productCode int not null identity,
 productName varchar(100) not null,
 productArticle varchar(11) not null,
 constraint productArticleUniq unique (productArticle),
 productWidth float not null,
 productLenght float not null,
 productBoxWeight float not null,
 productCount int not null,
 productCountInBox int null,
 productCostCount float null,
 productCostArea float null,
 productImage varchar(250) not null,
 productDescription varchar(300) null,
 constraint productCodePK primary key (productCode),
 productCollectionCode int not null, 
 availabilityStatusCode int not null,
 productTypeCode int not null,
 surfaceCode int not null,
 colorCode int not null,
 constraint productCollectionCodeFK foreign key (productCollectionCode) references ProductCollection (productCollectionCode) on delete cascade,
 constraint availabilityStatusCodeFK foreign key (availabilityStatusCode) references AvailabilityStatus (availabilityStatusCode) on delete cascade,
 constraint productTypeCodeFK foreign key (productTypeCode) references ProductType (productTypeCode) on delete cascade,
 constraint colorCodeFK foreign key (colorCode) references Color (colorCode) on delete cascade,
 constraint surfaceCodeFK foreign key (surfaceCode) references Surface (surfaceCode) on delete cascade)
 insert into Product (productName, productArticle, productWidth, productLenght, productBoxWeight, productCount, productCountInBox, productCostCount, productCostArea, productImage, productDescription, productCollectionCode, availabilityStatusCode, productTypeCode, surfaceCode, colorCode) values 
('������������ ������ ������� ������� 5� 300�93,8',	'CDB00018925', 94, 300, 7.37, 3948, 16,	NULL, 38.69, 'ProductImages/classic_black_300x938_0.jpg', '', 1, 1, 1, 1, 8),
('������������ ������ ������� ���� ���� 7� 750�250', 'CDB00022604', 250, 750, 28.88, 1494, 9, NULL, 38.23, 'ProductImages/mari_ermi_d_dots1_250x750.jpg', '', 19, 1, 1, 2, 1),
('���� ���� 3 400�25', 'CDB00010217', 25, 400, 22.4, 2844, 90, 3.52, NULL, 'ProductImages/charm_listel_400x25.jpg', '', 21, 1, 3, 2, 9),
('������������ ������� ����� 1 400�400', 'CDB00022471', 400, 400, 31.43, 1328, 11, NULL, 25.82,	'ProductImages/assam_400x400_1_1_0.jpg', '', 20, 1, 2, 2, 7),
('������������ ������ ������� ���� 6� 750�250',	'CDB00019398', 250, 750, 28.84, 2500, 9, NULL, 34.92, 'ProductImages/decor_skien_6d_750x250_0.jpg', '', 17, 1, 1, 2, 9),
('������������ ������ ������� ����� 5� 300�93,8', 'CDB00018356', 94, 300, 7, 510, 17, NULL,	35.77, 'ProductImages/vento_5d_v1_300x100_1.jpg', '', 51, 1, 1, 2, 1),
('������������ ������ ������� ������ 4 ��� 1 750�250', 'CDB00019471', 250, 750, 28.84, 950,	9, NULL, 36.57,	'ProductImages/sonora_4_type_1_750x250.jpg', '', 15, 1, 1, 2, 9),
('������������ ������ ������� ����� 3� 300�93,8', 'CDB00018350', 94, 300, 7, 1200, 17, NULL, 33.63, 'ProductImages/vento_3t_300x100.jpg', '', 51, 1, 1, 2, 10),
('������������ ������ ������� ������ 5� 750�250', 'CDB00019404', 250, 750, 28.84, 2053, 9, NULL, 34.92, 'ProductImages/monaco_5d_tip_1_750x250_kopirovat.jpg', '', 13, 1, 1, 1, 8),
('������������ ������ ������� ������ 1� 400�400', 'CDB00003002', 400, 400, 30.5, 1800, 11, NULL, 24.3, 'ProductImages/michell_1p_grey_400x400.jpg', '',	86, 1, 2, 2, 7),
('������������ ������ ������� ���� 3 600�300',	'CDB00016956', 300, 600, 31.3, 974, 10, NULL, 28.36, 'ProductImages/dune_3_600x300.jpg', '', 8, 1, 1, 1, 9),
('������������ ������ ������� ������� 4 600�300', 'CDB00018836', 300, 600, 29, 3538, 10, NULL, 27.36, 'ProductImages/bologna_4_01_600x300.jpg', '',	5, 1, 1, 2, 10),
('������������ ������ ������� ������ 2� 750�250', 'CDB00019402', 250, 750, 28.84, 1300, 9, NULL, 34.92, 'ProductImages/monaco_2d_tip_1_750x250_kopirovat_0.jpg', '',  13, 1, 1, 1, 7),
('������������ ������ ������� ��������� 1� 600�300', 'CDB00006737', 300, 600, 31.3, 999, 10, NULL, 27.42, 'ProductImages/manhattan_1t_grey_600x300.jpg', '', 87, 1, 1, 2, 7),
('������ ����� 200�200', 'CDB00015176', 200, 200, 0.52,	925, 26, NULL,	20.44, 'ProductImages/21_5.jpg', '', 79, 1, 6, 1, 12),
('������ ����� 200�200', 'CDB00015179', 200, 200, 0.52, 724, 26, NULL, 20.44, 'ProductImages/19_13.jpg', '', 79, 1, 6, 1, 1),
('������ ������� 200�200', 'CDB00015177', 200, 200,	0.52, 522, 26,	NULL, 20.44, 'ProductImages/3_170.jpg', '', 79, 1,	6, 1, 2),
('������ ����� 200�200', 'CDB00015175', 200, 200, 0.52, 2000, 26, NULL,	20.44, 'ProductImages/2_177.jpg', '', 79, 1, 6, 1, 1),
('����� ������� 200�200', 'CDB00015088', 200, 200, 0.52, 421, 25, 20.44, NULL, 'ProductImages/kartina.jpg',	'', 79, 1, 3, 1, 1),
('������������ ������ ������� ������� 3� 400x275 � ������������.', 'CDB00014159',  275, 400, 22, 1144, 15,	NULL, 25.53, 'ProductImages/calypso_3t_275x400.jpg', '', 68, 1, 1, 2, 10),
('������������ ������ ������� ������� 1� 200�200', 'CDB00018909',  200, 200, 14, 50, 26, NULL, 21.85, 'ProductImages/granada_1t_01_200x200.jpg', '', 6, 1, 1, 2, 7),
('������������ ������ ������� ������ 3� 500�200', 'CDB00018887', 	200,	500,	21.58,	1772,	13,	NULL,	25.74,	'ProductImages/vintage_3d_500x200_v1.jpg',	'',	50,	1,	1,	2,	1),
('������������ ������ ������� ������� 2� 400x400', 'CDB00013773', 	400,	400,	34.43,	3636,	11,	NULL,	26.39,	'ProductImages/calypso_2p_400x400_0.jpg',	'',	68,	1,	2,	2,	4),
('������������ ������ ������� ������ 5 400�275', 'CDB00018895', 	275,	400,	22.25,	2545,	15,	NULL,	21.36,	'ProductImages/fresco_5_400x275.jpg',	'',	47,	1,	1,	1,	15),
('������������ ������ ������� �������� 3� 600�300', 'CDB00016930', 	300,	600,	31.3,	1806,	10,	NULL,	28.3,	'ProductImages/buskingham_3t_600h300.jpg',	'',	7,	1,	1,	1,	10),
('������������ ������ ������� ����� 4� 300�93,8', 'CDB00018355', 	94,	300,	7,	751,	17,	NULL,	35.77,	'ProductImages/vento_4d_v1_300x100_1.jpg',	'',	51,	1,	1,	2,	1),
('������������ ������ ������� ������ 2� ��� 2 400x275', 'CDB00015142', 	275,	400,	22,	700,	15,	NULL,	20.93,	'ProductImages/damask_2c_type2_275x400.jpg',	'',	59,	1,	1,	2,	7),
('������������ ������ ������� ����� 4� 300�93,8', 'CDB00018351', 	94,	300,	7,	879,	17,	NULL,	33.63,	'ProductImages/vento_4t_300x100_0.jpg',	'',	51,	1,	1,	2,	11),
('������������ ������ ������� ������� 5� 400x400',	'CDB00012067', 	400,	400,	31.5,	2943,	11,	NULL,	22.32,	'ProductImages/concept_5p_lilac_400x400.jpg',	'',	76,	1,	2,	2,	13),
('������������ ������ ������� ������ 1 ��� 1 750�250', 'CDB00019400', 	250,	750,	28.84,	1967,	9,	NULL,	33.48,	'ProductImages/monaco_1_2_750x250_struct_kopirovat_1.jpg',	'',	13,	1,	1,	1,	18),
('������������ ������ ������� �����-� 7� 900�300',	'CDB00022300', 	300,	900,	25.21,	853,	5,	NULL,	42.83,	'ProductImages/monte_7c_900x300_01.jpg',	'',	28,	1,	1,	1,	18),
('�������� ������ ��������� 7 250�125',	'CDB00020742', 	125,	275,	0.01,	700,	25,	4.35,	NULL,	'ProductImages/villandry_7_fason_white_250x125.jpg', '',	38,	1,	3,	2,	18),
('������������ ������ ������� �������� 7� 600�300',	'CDB00020364', 	300,	600,	29.05,	4957,	11,	NULL,	33.72,	'ProductImages/mirabel_7d_600h300.jpg',	'',	45,	1,	1,	2,	18),
('���� ������� 275x64,5', 'CDB00015933', 	65,	275,	5,	740,	30,	1.42,	NULL,	'ProductImages/morocco_7_listel_275x62.jpg',	'',	58,	1,	3,	1,	1),
('������������ ������ ������� ������ 1� 400�275', 'CDB00020406', 	275,	400,	22.04,	1000,	15,	NULL,	22.24,	'ProductImages/aveyru_1t_400h275-min.jpg',	'',	40,	1,	1,	2,	13),
('������� ������������ �� ������ ���� ���� 2 500x20', 'CDB00015625', 	20,	500,	6,	571,	30,	6.99,	NULL,	'ProductImages/solo_2_glass_border_light_pink_500x20.jpg',	'',	73,	1,	3,	1,	13),
('������������ ������ ������� ������ 3 400�275', 'CDB00018893', 	275,	400,	22.04,	1018,	15,	NULL,	20.73,	'ProductImages/fresco_3_400x275.jpg',	'',	47,	1,	1,	2,	16),
('������� ������������ �� ������ ���� ���� 8 400x20', 'CDB00012698', 	20,	400,	4.76,	692,	30,	5.99,	NULL,	'ProductImages/fresh_8_listel_400x20.jpg',	'',	72,	1,	3,	1,	11),
('������� ������������ �� ������ ���� ���� 8 600x20', 'CDB00015534', 	20,	600,	7,	563,	30,	7.99,	NULL,	'ProductImages/solo_8_glass_border_yellow_600x20.jpg',	'',	73,	1,	3,	1,	16),
('������������ ������ ������� ������ 6 400�275', 'CDB00018896', 	275,	400,	22.25,	2000,	15,	NULL,	20.73,	'ProductImages/fresco_6_400x275.jpg',	'',	47,	1,	1,	2,	17),
('����� ��������� ��� �� ���. ���� ��������� 300x300', 'CDB00012526', 	300,	300,	8,	680,	27,	10.71,	NULL,	'ProductImages/mosaic_pastorale_300x300.jpg',	'',	83,	1,	5,	2,	10),
('������� ������ 3� 300�300', 'CDB00010704', 	300,	300,	8,	3000,	27,	10.92,	NULL,	'ProductImages/sakura_3t_chestnut_cut_300x300.jpg',	'',	82,	1,	5,	2,	10),
('���� ���� 1 ��� 1 600�98.5', 'CDB00016965', 	99,	600,	11,	1600,	60,	5.82,	NULL,	'ProductImages/dune_1_listel_type1_600x985.jpg',	'',	8,	1,	3,	1,	1),
('���� ������ 1� 275�62', 'CDB00002959', 	26,	275,	5,	990,	40,	2.72,	NULL,	'ProductImages/michell_1t_listel_275x62.jpg',	'', 86,	1,	3,	2,	7),
('�������� ������ ������ 2 275x50',	'CDB00015316', 50,	275,	2.8,	886,	28,	1.76,	NULL,	'ProductImages/damask_2_border_275x50.jpg',	'',	59,	1,	3,	2,	11),
('�������� ������ ������� 4 275x20', 'CDB00015936', 20,	275,	3.92,	780,	35,	1.37,	NULL,	'ProductImages/morocco_4_border_275x20.jpg',	'',	58,	1,	3,	1,	11),
('���������� ���� ���� 11 500x20', 'CDB00015256', 20,	500,	6,	1944,	50,	6.99,	NULL,	'ProductImages/fresh_11_glass_border_green_500x20.jpg',	'',	72,	1,	3,	1,	11)


  --�������� ������� �������
 create table Basket
 (basketCode int not null identity,
 basketNumber int not null,
 productsCount int not null,
 boxesCount int not null, 
 productsArea float not null,
 productsWeight float not null,
 generalSum float not null,
 paymentStatus bit not null,
 constraint basketNumberPK primary key (basketCode),
 productCode int not null,
 constraint productCodeFK foreign key (productCode) references Product (productCode) on delete cascade)
 insert into Basket (basketNumber, productsCount, boxesCount, productsArea, productsWeight, generalSum, paymentStatus, productCode) values  (1, 178, 12, 5.02, 81.99, 194.21, 1, 1), (2,	17,	2, 3.19, 54.55,	121.86,	1, 2), 
(2, 25, 1, 0.25,	6.22, 88, 1, 3), (3, 76, 3, 3.04, 1.52,	62.14, 1, 16), (3, 20, 1, 0.2, 4, 139.8, 1,	36), (4,	20,	4, 5.4, 100.84,	231.28,	1, 31), (4, 30, 2, 1.03, 0.01, 130.5, 1, 32), 
(5, 143, 9, 4.03, 58.88, 135.62, 1, 28), (5, 18, 1, 0.25, 1.8, 31.68, 1, 45), (5,	21,	2, 2.1, 34.86, 54.05, 1, 22),  (6, 12, 1, 0.34, 5.53, 13.09,	1, 1), (6, 75, 3, 3, 40.38,	65.55, 1, 21), 
(6, 18, 2, 1.98,	26.4, 50.55, 1,	20), (7,	32,	3, 3.52, 47.02, 72.97, 1, 37), (7, 37, 2, 0.44, 8.63, 295.63, 1, 39), (8, 817, 52, 23.04, 376.33, 891.39, 1, 1), (8,	40,	5, 7.5, 128.36, 286.73,	1, 2), 
(9,	94,	9, 15.04, 268.58, 388.33, 1, 4), (9, 26, 1, 0.26, 6.47,	91.52, 1, 3), (10, 100,	4, 4, 2, 81.76,	1, 17), (10, 71, 5,	2, 29.24, 71.62, 1,	26), (10, 89, 6, 2.51, 36.65, 84.4, 1, 28), (10, 40, 2, 0.55, 4, 70.4, 1, 45), 
(10, 20, 2, 2, 33.2, 51.48,	1,	22), (11, 14, 2, 2.62, 44.92, 100.35, 1, 2), (11, 15, 2,	2.4, 42.86,	61.97, 1, 4), (11, 8, 1, 1.5, 25.64, 50.22,	1, 30), (12, 17, 2,	3.06, 53.21, 86.78,	1, 11),  (12, 9,	1, 1.62, 23.77,	54.63, 1, 33), 
(12, 4,	1, 1.08, 20.17,	46.26, 1, 31), (13,	67,	7, 12.06, 209.71, 330.69, 1, 14), (13, 110,	8, 12.1, 161.33, 308.91, 1,	20), (13, 35, 1, 0.35, 8.71, 123.2, 1, 3),  (14, 500, 20, 20, 10, 408.8, 1,	15), 
(14, 60, 2, 1.07, 10, 85.2, 1,	34), (15, 40, 2, 1.6, 0.83,	817.6, 1, 19), (15, 304, 12, 12.16, 6.08, 248.55, 1, 17), (15, 12, 2, 2.16, 34.8, 59.1, 1, 12), (16, 16, 2, 3, 51.27,	104.76,	1, 13), (16, 11, 2, 2.06, 35.25, 69.05, 1, 30), 
(16, 45, 2,	1.55, 0.02,	195.75,	1, 32), (17, 37, 3,	3.7, 61.42,	95.24, 1, 22), (17, 100, 6,	2.82, 41.18, 94.84,	1, 28), (17, 56, 2,	0.77, 5.6, 98.56, 1, 45),  (18, 88, 8,14.08, 275.44, 371.57, 1, 23),  (18, 55, 4,	6.05, 81.58, 129.23, 1,	24),
(19, 86, 10, 16.12, 275.96, 616.46, 1,	2), (19, 70, 1,	0.7, 17.42,	246.4, 1, 3), (19, 106, 7, 2.99, 43.65, 106.92, 1, 6), (20, 124, 14, 23.25, 397.35, 811.89, 1, 9), (20, 134, 15, 25.12, 429.4, 877.36, 1,	13),
(21, 19, 2, 3.04, 59.47, 80.23, 1, 23), (21, 75, 3, 0.75, 15, 524.25, 1, 36), (22, 14, 2,	2.62, 44.86, 87.88,	1, 30), (22, 58, 2,	0.46, 9.2, 347.42, 1, 38), (22,	56,	2, 0.56, 6.72, 391.44, 1, 47), (23, 100, 4, 9, 29.63, 1071, 1, 41), 
(23, 84, 9,	15.12, 262.92, 427.9, 1, 25), (24, 400, 16,	16,	8, 327.04, 1, 16), (24,	10,	1, 0.4, 0.21, 204.4, 1,	19), (25, 178, 11, 5.02,	73.29, 179.55, 1, 26), (25, 50, 4, 5, 83, 128.7, 1, 22),  (25, 89, 6, 2.51,	36.65, 84.4, 1,	28), 
(26, 9, 1,	1.62, 28.17, 45.94,	1, 11), (26, 64, 3,	2.56, 1.28,	52.33, 1, 17), (26, 34, 2,	0.34, 6.8, 237.66, 1, 36), (27, 29, 2, 1.16, 0.6, 592.76, 1, 19), (27, 46, 4, 5.06, 67.47, 129.18, 1, 20),  (28, 25, 1, 0.86, 0.01, 108.75, 1, 32), 
(28, 23, 5, 6.21, 115.97, 265.97, 1, 31), (28, 34, 4,	6.12, 89.79, 206.37, 1,	33), (29, 75, 9, 14.06,	240.67,	537.61,	1,	2), (29, 19, 2,	3.04, 54.29, 78.49, 1, 4), (29,	284, 17, 8.01, 116.94, 286.47, 1, 6), 
(30,	86,	10,	16.12, 275.96, 616.46, 1, 2), (30, 86, 10, 16.12, 275.58, 563.08, 1, 9), (30, 15, 1,	1.35, 4.44,	160.65, 1, 41), (31, 34, 4,	6.12, 106.42, 167.81, 1, 14), (31, 75, 3, 3, 40.38,	65.55, 1, 21),
(31,	5, 1, 0.45, 1.48, 53.55, 1,	41), (32, 48, 6,	9, 154.03, 344.07, 1, 2), (32, 50, 5, 9, 145, 246.24, 1, 12), (32, 82, 6, 9.02,	120.27,	230.28,	1,	20), (32, 57, 6, 9.12, 178.41, 240.68, 1, 23), (32, 57, 6,	9.12, 163.23, 203.56, 1, 29),
(33, 32, 4, 6, 102.68, 229.38, 1, 2), (33, 37, 5,	6.94, 118.56, 242.26, 1, 9), (33, 175,	7, 7, 3.5, 143.08, 1, 15), (34, 86, 10, 16.12,	275.96,	616.46,	1, 2), (34,	44,	4, 7.04, 125.72, 181.77, 1,	4), (35, 22, 3,	4.12, 70.6,	157.7, 1, 2)

  --�������� ������� � ������ ��������
 create table Delivery
 (deliveryCode int not null identity,
 deliveryName varchar(100) not null,
 constraint deliveryNameUniq unique (deliveryName),
 constraint deliveryCodePK primary key (deliveryCode))
 --���������� ������� ������ ��������
 insert into Delivery (deliveryName) values ('���������'), ('�������� �� �.������ (��������������)'), ('�������� �� �.������ (� ��������)'), ('�������� �� ������� �.������')

  --�������� ������� � ������ ������
 create table Payment
 (paymentCode int not null identity,
 paymentType varchar(100) not null,
 constraint paymentTypeUniq unique (paymentType),
 constraint paymentCodePK primary key (paymentCode))
 --���������� ������� ������ ������
 insert into Payment (paymentType) values ('���������'), ('���������� ������ ����� ��������� ��������'), ('������ ������ ������ Visa, Master Card ��� �������'), ('����� ������� "������" (����)')

  --�������� ������� � ��������
 create table Town
 (townCode int not null identity,
 townName varchar(100) not null,
 constraint townNameUniq unique (townName),
 constraint townCodePK primary key (townCode))
 --���������� ������� ��������
 insert into Town (townName) values ('�����'), ('�������'), ('�����'), ('������'), ('������'), ('�������'), ('����������'), ('��������'), ('�������'), ('�����'), ('����'), ('������'), ('���������'), ('�����'), ('���������')

  --�������� ������� � �������� ��� ������� ����������
 create table PickupTown
 (pickupTownCode int not null identity,
 pickupTownName varchar(100) not null,
 constraint pickupTownNameUniq unique (pickupTownName),
 constraint pickupTownCodePK primary key (pickupTownCode))
 --���������� ������� �������� ��� ������� ����������
 insert into pickupTown (pickupTownName) values ('�����'), ('�������'), ('�����'), ('������'), ('������'), ('�������'), ('����������'), ('��������'), ('�����'), ('����'), ('������'), ('���������'), ('�����'), ('���������')

  --�������� ������� � �������
 create table Street
 (streetCode int not null identity,
 streetName varchar(100) not null,
 constraint streetNameUniq unique (streetName),
 constraint streetCodePK primary key (streetCode))
  --���������� ������� �������
 insert into Street (streetName) values ('�����������'), ('�������'), ('�����������'), ('�������'), ('�����������'), ('�������������'), ('�������������'), ('��������������'), ('������'),
 ('�������'), ('��������'), ('������������'), ('�������������'), ('��������'), ('���������������'), ('����� ������'), ('���������'), ('��������'), ('���������'), ('������������'),
 ('������������'), ('��������'), ('���������'), ('�����������'), ('�������'), ('�����������'), ('���������������'), ('��������'), ('�����������'), ('�����'), ('�������������'),
 ('����������'), ('�������'), ('�����������'), ('������������'), ('50 ��� ����'), ('������'), ('����������'), ('��������'), ('���������'), ('������'), ('������������'), ('������������'), 
 ('����������'), ('������� ��������'), ('���������'), ('�������������'), ('��������� '), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), (''),
 (''), (''), (''), (''), (''), (''), (''), (''), (''), (''), ('')

  --�������� ������� � ������������
 create table Customer 
 (customerCode int not null identity,
 customerName varchar(50) null,
 customerSurname varchar(50) null,
 customerPatronymic varchar(50) null,
 phone varchar(17) not null,
 mail varchar(40) not null,
 building varchar(8) null,
 floor_ int null,
 apartment int null,
 legalName varchar(100) null, 
 UTN int null,
 townCode int null,
 streetCode int null,
 orderNumber int null,
 constraint townCodeFK foreign key (townCode) references Town (townCode) on delete cascade,
 constraint streetCodeFK foreign key (streetCode) references Street (streetCode) on delete cascade,
 constraint customerCodePK primary key (customerCode))
 insert into Customer (customerName, customerSurname, customerPatronymic, phone, mail, building, floor_, apartment, legalName, UTN, townCode, streetCode, orderNumber) values
 ('������', '�������',	'��������',	'+375(29)470-67-34', 'srg.smrnv@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	1),
 ('�������',	'����������',	'�����������',	'+375(33)458-90-01', 'valeriya.al@gmail.com',	'16',	5,	56,	NULL,	NULL,	1,	13,	2),
 ('������',	'�������',	'�������������',	'+375(44)779-12-00',	'mihail89@mail.ru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	3),
 ('����',	'�����',	'���������',	'+375(25)255-67-89',	'shipov99@mail.ru',	NULL,	NULL, NULL,	NULL,	NULL,	NULL,	NULL,	4),
 ('�������',	'��������',	'����������',	'+375(44)567-88-30',	'dmitry.dmitriev@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	5),
 ('����',	'��������', '�����������',	'+375(29)673-89-01',	'ilya.ger@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	6),
 ('������',	'������',	'������������',	'+375(25)612-89-34',	'boevoi.ildar88@mail.ru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	7),
 (NULL,	NULL,	NULL,	'+375(17)218-84-31',	'info@belarusbank.by',	'18',	1,	1,	'��� "�����������"',	100325912,	1,	44,	8),
 ('�����',	'�������',	'��������',	'+375(44)556-67-89',	'sergey.minaev79@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	9),
 ('�����',	'�������',	'����������',	'+375(33)456-78-33',	'usupova@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	10),
 ('������',	'�������',	'����������',	'+375(33)789-65-00',	'semen@gmail.com',	'4',	6,	67,	NULL,	NULL,	2,	43,	11),
 ('�����',	'������',	'��������',	'+375(25)563-78-10',	'ivanov97@mail.ru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	12),
 ('����',	'�����',	'����������',	'+375(44)561-65-56',	'IvDb@yandex.by',	'15/2',	7,	89,	NULL,	NULL,	1,	6,	13),
 (NULL, NULL,	NULL,	'80(29)643-78-94',	'water.world@gmail.com',	'7',	1,	1,	'��� "������ ���"',	543896543,	1,	43,	14),
 ('����', '�������',	'�����������',	'+375(29)230-15-66',	'smrnv88@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	15),
 ('����',	'������',	'��������',	'+375(44)671-15-10',	'ivanov.ivan@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	16),
 ('����',	'������',	'��������',	'+375(25)259-25-90',	'ptrv.ptr@mail.ru',	'46',	4,	57,	NULL,	NULL,	9,	12,	17),
 ('�������',	'��������', '����������',	'+375(44)678-10-20',	'dmtrv67@mail.ru',	'56',	8,	167,	NULL,	NULL,	1,	11,	18),
 ('�������',	'������',	'������������',	'+375(25)874-13-87',	'klimov_evg@mail.ru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL, 19),
 ('�������',	'����������',	'�������',	'+375(33)570-95-32',	'alexey1985@mail.ru',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	20),
 ('���������',	'�����������',	'�������������',	'+375(44)478-74-08',	'alexandr_alexandrov@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	21),
 ('�������', '��������',	'����������',	'+375(25)257-76-50',	'alexeev_alexey@mail.ru',	'36',	7,	97,	NULL,	NULL,	1,	10,	22),
 ('�������',	'������',	'��������',	'+375(29)654-09-87',	'klenov.valery@maul.ru',	'78',	1,	12,	NULL,	NULL,	1,	6,	23),
 (NULL,	NULL,	NULL,	'80(29)657-45-40',	'cvetochek.time@yandex.by',	NULL,	NULL,	NULL,	'��� "��������� ����"',	467898765,	NULL,	NULL,	24),
 ('�������',	'���������',	'��������',	'+375(33)584-12-43',	'litvinchyk.evgeny@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	25),
 ('�����',	'������',	'����������',	'+375(44)752-78-80',	'serova.olga@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	26),
 ('�����',	'�������',	'����������',	'+375(33)234-57-07',	'begynovpavel@mail.ru',	'6/1',	6,	78,	NULL,	NULL,	1,	16,	27),
 ('�����',	'������',	'����������',	'+375(29)180-66-41',	'belyaev@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	28),
 ('�������',	'���������',	'��������',	'+375(44)875-98-34',	'sigizmynd@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	29),
 ('�����',	'���������',	'��������',	'+375(44)678-93-02',	'zelensky.damir@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	30),
 ('����','	���������',	'���������',	'+375(44)678-90-52',	'petr.sergeevich@yandex.by',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	31),
 ('�������',	'�����',	'��������',	'+375(44)567-89-00',	'zhorinarseny@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	32),
 ('�������',	'�����',	'���������',	'+375(44)684-64-14',	'yhovavaleriya@gmail.com',	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	NULL,	33),
 ('������',	'�������',	'���������',	'+375(44)528-73-25',	'yablonev.serhey@gmail.com', '78�/1',	5,	64,	NULL,	NULL,	1,	10,	34),
 (NULL,	NULL,	NULL,	'80(29)444-44-44',	'mail@mail.ru',	'3',	4,	45,	'��� "���� �����"',	123456789,	1,	17,	36)

  --�������� ������� � ������� ����������
 create table Pickup
 (pickupCode int not null identity,
 streetName varchar(100) not null,
 building varchar(8) null,
 pickupTownCode int not null,
 constraint townFK foreign key (pickupTownCode) references PickupTown (pickupTownCode) on delete cascade,
 constraint pickupCodePK primary key (pickupCode))
 insert into Pickup(streetName, building, pickupTownCode) values ('50 ��� ����', '25', 7), ('������', '16', 8), ('����������', '204', 3), ('��������', '21', 2),
('���������', '10',	5), ('������', '26/1', 9), ('������������', '20', 4), ('������������',	'73', 10), ('����������', '123/2', 1), ('���������', '22', 6), ('���������', '12�', 11),
('������� ��������', '67�',	12), ('�������������', '15�', 13), ('���������', '20�',	14)

  --�������� ������� � ��������
 create table CustomerOrder
 (customerOrderCode int not null identity,
 orderNumber int not null,
 issueDate date not null, 
 generalSum float not null,
 deliveryCost float null,
 constraint customerOrderCodePK primary key (customerOrderCode),
 deliveryCode int not null,
 constraint deliveryCodeFK foreign key (deliveryCode) references Delivery (deliveryCode) on delete cascade,
 basketCode int not null,
 constraint basketCodeFK foreign key (basketCode) references Basket (basketCode) on delete cascade,
 customerCode int not null,
 constraint customerCodeFK foreign key (customerCode) references Customer (customerCode) on delete cascade,
 employeeCode int not null,
 constraint employeeCodeFK foreign key (employeeCode) references Employee (employeeCode) on delete cascade,
 paymentCode int not null,
 constraint paymentCodeFK foreign key (paymentCode) references Payment (paymentCode) on delete cascade,
 pickupCode int null,
 constraint pickupCodeFK foreign key (pickupCode) references Pickup (pickupCode) on delete no action)
 insert into CustomerOrder (orderNumber, issueDate, generalSum, deliveryCost, deliveryCode, basketCode, customerCode, employeeCode, paymentCode, pickupCode) values (1, '29/05/2021',  194.21, 0, 1, 1, 1, 1, 1, 9), 
 (2, '29/05/2021', 224.86, 15, 2, 2, 2, 1, 1, NULL), (2, '29/05/2021', 224.86, 15, 2, 3, 2, 1, 1, NULL),
 (3, '30/05/2021', 201.94, 0, 1, 4, 3, 1, 1, 3), (3, '30/05/2021', 201.94, 0, 1, 5, 3, 1, 1, 3),
 (4, '30/05/2021', 361.78, 0, 1, 6, 4, 1, 1, 4), (4, '30/05/2021', 361.78, 0, 1, 7, 4, 1, 1, 4),
 (5, '31/05/2021', 221.35, 0, 1, 8, 5, 1, 1, 2), (5, '31/05/2021', 221.35, 0, 1, 9, 5, 1, 1, 2), (5, '31/05/2021', 221.35, 0, 1, 10, 5, 1, 1, 2),
 (6, '01/06/2021', 129.19, 0, 1, 11, 6, 1, 1, 5), (6, '01/06/2021', 129.19, 0, 1, 12, 6, 1, 1, 5), (6, '01/06/2021', 129.19, 0, 1, 13, 6, 1, 1, 5),
 (7, '01/06/2021', 368.60, 0, 1, 14, 7, 1, 1, 6), (7, '01/06/2021', 368.60, 0, 1, 15, 7, 1, 1, 6),
 (8, '02/06/2021', 1193.12, 15, 3, 16, 8, 1, 1, NULL), (8, '02/06/2021', 1193.12, 15, 3, 17, 8, 1, 1, NULL),
 (9, '02/06/2021', 479.85, 0, 1, 18, 9, 1, 1, 8), (9, '02/06/2021', 479.85, 0, 1, 19, 9, 1, 1, 8),
 (10, '02/06/2021', 359.66, 0, 1, 20, 10, 1, 1, 7), (10, '02/06/2021', 359.66, 0, 1, 21, 10, 1, 1, 7), (10, '02/06/2021', 359.66, 0, 1, 22, 10, 1, 1, 7), (10, '02/06/2021', 359.66, 0, 1, 23, 10, 1, 1, 7), (10, '02/06/2021', 359.66, 0, 1, 24, 10, 1, 1, 7),
 (11, '29/05/2021', 227.54, 15, 4, 25, 11, 3, 1, NULL), (11, '29/05/2021', 227.54, 15, 4, 26, 11, 3, 1, NULL), (11, '29/05/2021', 227.54, 15, 4, 27, 11, 3, 1, NULL),
 (12, '29/05/2021', 187.67, 0, 1, 28, 12, 3, 1, 10), (12, '29/05/2021', 187.67, 0, 1, 29, 12, 3, 1, 10), (12, '29/05/2021', 187.67, 0, 1, 30, 12, 3, 1, 10),
 (13, '30/05/2021', 777.80, 15, 3, 31, 13, 3, 1, NULL), (13, '30/05/2021', 777.80, 15, 3, 32, 13, 3, 1, NULL), (13, '30/05/2021', 777.80, 15, 3, 33, 13, 3, 1, NULL),
 (14, '30/05/2021', 509.00, 15, 2, 34, 14, 3, 1, NULL), (14, '30/05/2021', 509.00, 15, 2, 35, 14, 3, 1, NULL),
 (15, '31/05/2021', 1125.25, 0, 1, 36, 15, 3, 1, 11), (15, '31/05/2021', 1125.25, 0, 1, 37, 15, 3, 1, 11), (15, '31/05/2021', 1125.25, 0, 1, 38, 15, 3, 1, 11),
 (16, '01/06/2021', 369.56, 0, 1, 39, 16, 3, 1, 14), (16, '01/06/2021', 369.56, 0, 1, 40, 16, 3, 1, 14), (16, '01/06/2021', 369.56, 0, 1, 41, 16, 3, 1, 14),
 (17, '01/06/2021', 303.64, 15, 4, 42, 17, 3, 1, NULL), (17, '01/06/2021', 303.64, 15, 4, 43, 17, 3, 1, NULL), (17, '01/06/2021', 303.64, 15, 4, 44, 17, 3, 1, NULL),
 (18, '02/06/2021', 515.80, 15, 2, 45, 18, 3, 1, NULL), (18, '02/06/2021', 515.80, 15, 2, 46, 18, 3, 1, NULL),
 (19, '02/06/2021', 969.78, 0, 1, 47, 19, 3, 1, 1), (19, '02/06/2021', 969.78, 0, 1, 48, 19, 3, 1, 1), (19, '02/06/2021', 969.78, 0, 1, 49, 19, 3, 1, 1),
 (20, '02/06/2021', 1689.25, 0, 1, 50, 20, 3, 1, 3), (20, '02/06/2021', 1689.25, 0, 1, 51, 20, 3, 1, 3), 
 (21, '29/05/2021', 604.48, 0, 1, 52, 21, 2, 1, 5), (21, '29/05/2021', 604.48, 0, 1, 53, 21, 2, 1, 5),
 (22, '29/05/2021', 841.74, 15, 2, 54, 22, 2, 1, NULL), (22, '29/05/2021', 841.74, 15, 2, 55, 22, 2, 1, NULL), (22, '29/05/2021', 841.74, 15, 2, 56, 22, 2, 1, NULL),
 (23, '30/05/2021', 1513.90, 15, 3, 57, 23, 2, 1, NULL), (23, '30/05/2021', 1513.90, 15, 3, 58, 23, 2, 1, NULL),
 (24, '30/05/2021', 531.44, 0, 1, 59, 24, 2, 1, 12), (24, '30/05/2021', 531.44, 0, 1, 60, 24, 2, 1, 12),
 (25, '31/05/2021', 392.65, 0, 1, 61, 25, 2, 1, 13), (25, '31/05/2021', 392.65, 0, 1, 62, 25, 2, 1, 13), (25, '31/05/2021', 392.65, 0, 1, 63, 25, 2, 1, 13),
 (26, '01/06/2021', 335.93, 0, 1, 64, 26, 2, 1, 7), (26, '01/06/2021', 335.93, 0, 1, 65, 26, 2, 1, 7), (26, '01/06/2021', 335.93, 0, 1, 66, 26, 2, 1, 7),
 (27, '01/06/2021', 736.94, 15, 3, 67, 27, 2, 1, NULL), (27, '01/06/2021', 736.94, 15, 3, 68, 27, 2, 1, NULL),
 (28, '02/06/2021', 581.09, 0, 1, 69, 28, 2, 1, 9), (28, '02/06/2021', 581.09, 0, 1, 70, 28, 2, 1, 9), (28, '02/06/2021', 581.09, 0, 1, 71, 28, 2, 1, 9),
 (29, '02/06/2021', 902.57, 0, 1, 72, 29, 2, 1, 9), (29, '02/06/2021', 902.57, 0, 1, 73, 29, 2, 1, 9), (29, '02/06/2021', 902.57, 0, 1, 74, 29, 2, 1, 9), 
 (30, '02/06/2021', 1340.19, 0, 1, 75, 30, 2, 1, 11), (30, '02/06/2021', 1340.19, 0, 1, 76, 30, 2, 1, 11), (30, '02/06/2021', 1340.19, 0, 1, 77, 30, 2, 1, 11),
 (31, '29/05/2021', 286.91, 0, 1, 78, 31, 4, 1, 3), (31, '29/05/2021', 286.91, 0, 1, 79, 31, 4, 1, 3), (31, '29/05/2021', 286.91, 0, 1, 80, 31, 4, 1, 3),
 (32, '29/05/2021', 1264.83, 0, 1, 81, 32, 4, 1, 5), (32, '29/05/2021', 1264.83, 0, 1, 82, 32, 4, 1, 5), (32, '29/05/2021', 1264.83, 0, 1, 83, 32, 4, 1, 5), (32, '29/05/2021', 1264.83, 0, 1, 84, 32, 4, 1, 5), (32, '29/05/2021', 1264.83, 0, 1, 85, 32, 4, 1, 5),
 (33, '30/05/2021', 614.72, 0, 1, 86, 33, 4, 1, 14), (33, '30/05/2021', 614.72, 0, 1, 87, 33, 4, 1, 14), (33, '30/05/2021', 614.72, 0, 1, 88, 33, 4, 1, 14),
 (34, '30/05/2021', 813.23, 15, 3, 89, 34, 4, 1, NULL), (34, '30/05/2021', 813.23, 15, 3, 90, 34, 4, 1, NULL),
 (35, '31/05/2021', 172.70, 15, 2, 91, 35, 4, 1, NULL)