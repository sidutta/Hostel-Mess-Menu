INSERT INTO fooditems VALUES (0, 'SCHEZWAN RICE');
INSERT INTO fooditems VALUES (1, 'BASMATTI RICE');
INSERT INTO fooditems VALUES (2, 'NORMAL RICE');
INSERT INTO fooditems VALUES (3, 'LEMON RICE');
INSERT INTO fooditems VALUES (4, 'VEG. BIRYANI');
INSERT INTO fooditems VALUES (5, 'NON VEG. BIRYANI');
INSERT INTO fooditems VALUES (6, 'DRY ROTI');
INSERT INTO fooditems VALUES (7, 'GHEE ROTI');
INSERT INTO fooditems VALUES (8, 'RUMALI ROTI');
INSERT INTO fooditems VALUES (9, 'MOONG DAL');
INSERT INTO fooditems VALUES (10, 'BLACK DAL');
INSERT INTO fooditems VALUES (11, 'IDLI');
INSERT INTO fooditems VALUES (12, 'DOSA');
INSERT INTO fooditems VALUES (13, 'POHA');
INSERT INTO fooditems VALUES (14, 'SAMOSA');
INSERT INTO fooditems VALUES (15, 'DAHI VADA');
INSERT INTO fooditems VALUES (16, 'SABUDANA VADA');
INSERT INTO fooditems VALUES (17, 'CURRY MAGGI');
INSERT INTO fooditems VALUES (18, 'HAKKA NOODLES');
INSERT INTO fooditems VALUES (19, 'TEA');
INSERT INTO fooditems VALUES (20, 'COFFEE');
INSERT INTO fooditems VALUES (21, 'BHINDI');
INSERT INTO fooditems VALUES (22, 'GATTE KA SABJI');
INSERT INTO fooditems VALUES (23, 'BRINJAL');
INSERT INTO fooditems VALUES (24, 'CHOLA');
INSERT INTO fooditems VALUES (25, 'BHATURA');

INSERT INTO foodtype VALUES (0, 'LUNCH');
INSERT INTO foodtype VALUES (1, 'LUNCH');
INSERT INTO foodtype VALUES (0, 'DINNER');
INSERT INTO foodtype VALUES (1, 'DINNER');
INSERT INTO foodtype VALUES (2, 'LUNCH');
INSERT INTO foodtype VALUES (2, 'DINNER');
INSERT INTO foodtype VALUES (3, 'LUNCH');
INSERT INTO foodtype VALUES (3, 'DINNER');
INSERT INTO foodtype VALUES (4, 'LUNCH');
INSERT INTO foodtype VALUES (4, 'DINNER');
INSERT INTO foodtype VALUES (5, 'LUNCH');
INSERT INTO foodtype VALUES (5, 'DINNER');
INSERT INTO foodtype VALUES (6, 'DINNER');
INSERT INTO foodtype VALUES (7, 'DINNER');
INSERT INTO foodtype VALUES (8, 'DINNER');
INSERT INTO foodtype VALUES (9, 'DINNER');
INSERT INTO foodtype VALUES (10, 'DINNER');
INSERT INTO foodtype VALUES (6, 'LUNCH');
INSERT INTO foodtype VALUES (7, 'LUNCH');
INSERT INTO foodtype VALUES (8, 'LUNCH');
INSERT INTO foodtype VALUES (9, 'LUNCH');
INSERT INTO foodtype VALUES (10, 'LUNCH');
INSERT INTO foodtype VALUES (11, 'BREAKFAST');
INSERT INTO foodtype VALUES (11, 'TIFFIN');
INSERT INTO foodtype VALUES (12, 'TIFFIN');
INSERT INTO foodtype VALUES (13, 'BREAKFAST');
INSERT INTO foodtype VALUES (13, 'TIFFIN');
INSERT INTO foodtype VALUES (13, 'MIDNIGHT');
INSERT INTO foodtype VALUES (14, 'TIFFIN');
INSERT INTO foodtype VALUES (15, 'TIFFIN');
INSERT INTO foodtype VALUES (16, 'TIFFIN');
INSERT INTO foodtype VALUES (17, 'TIFFIN');
INSERT INTO foodtype VALUES (17, 'MIDNIGHT');
INSERT INTO foodtype VALUES (18, 'TIFFIN');
INSERT INTO foodtype VALUES (18, 'MIDNIGHT');
INSERT INTO foodtype VALUES (19, 'BREAKFAST');
INSERT INTO foodtype VALUES (19, 'TIFFIN');
INSERT INTO foodtype VALUES (19, 'MIDNIGHT');
INSERT INTO foodtype VALUES (20, 'BREAKFAST');
INSERT INTO foodtype VALUES (20, 'TIFFIN');
INSERT INTO foodtype VALUES (20, 'MIDNIGHT');
INSERT INTO foodtype VALUES (21, 'LUNCH');
INSERT INTO foodtype VALUES (21, 'DINNER');
INSERT INTO foodtype VALUES (22, 'LUNCH');
INSERT INTO foodtype VALUES (22, 'DINNER');
INSERT INTO foodtype VALUES (23, 'LUNCH');
INSERT INTO foodtype VALUES (23, 'DINNER');
INSERT INTO foodtype VALUES (24, 'DINNER');
INSERT INTO foodtype VALUES (24, 'LUNCH');
INSERT INTO foodtype VALUES (25, 'LUNCH');


insert into timeFoodType values ('BREAKFAST', '7:00:00', '12:00:00');
insert into timeFoodType values ('LUNCH', '12:00:00', '16:30:00');
insert into timeFoodType values ('TIFFIN', '16:30:00', '19:30:00');
insert into timeFoodType values ('DINNER', '19:30:00', '23:59:00');
insert into timeFoodType values ('MIDNIGHT', '00:00:00', '7:00:00');

alter table fooditems add column portion numeric;
alter table fooditems add column calories numeric;
alter table fooditems add column carbohydrates numeric;
alter table fooditems add column fats numeric;
alter table fooditems add column protein numeric;

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(27, 'ALOO-BEANS', 100, 134, 34.3, 2.4, 8.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(28, 'ALOO-CURRY', 100, 105, 14.4, 1.2, 5.0);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") valuesinsert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(29, 'BAIGAN-KA-BHARTA', 100, 70, 5.7, 1.2, 4.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(30, 'BHINDI', 100, 161, 12.1, 3.9, 10.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(31, 'CABBAGE', 100, 131, 7.0, 2.3, 6.0);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(32, 'CHOLE', 100, 74, 3.3, 4.3, 4.1);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(33, 'CURRY', 100, 100, 15.0, 2.9, 5.1);
                                                                 ^
insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(34, 'GATTE KA SABJI', 100, 275, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(35, 'METHI ALOO', 100, 121, 16.0, 2.2, 5.4);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(36, 'MATTAR PANEER', 100, 147, 10.7, 8.5, 8.1);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(37, 'PUMPKIN', 100, 67, 6.7, 1.6, 3.8);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(38, 'RAJMA', 100, 102, 10.7, 4.7, 3.4);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(39, 'SHAHI PANEER', 95, 283, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(40, 'SHIMLA MIRCH ALOO', 100, 93, 12.8, 1.5, 3.4);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(41, 'STUFFED TOMATO', 100, 85, 11.0, 2.1, 3.4);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(42, 'TORAI', 100, 65, 4.0, 1.2, 4.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(43, 'VEG. KOFTA', 100, 147, 13.3, 2.6, 9.1);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(44, 'VEG. KORMA', 100, 88, 8.7, 1.4, 5.3);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(45, 'ARHAR DAL', 100, 53, 8.0, 2.8, 1.2);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(46, 'CHANA DAL', 100, 99, 12.8, 4.5, 3.2);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(47, 'DAL MAKHANI', 100, 117, 14.0, 6.8, 1.3);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(48, 'MOONG DAL', 100, 211, 31.3, 12.8, 3.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(49, 'MASOOR DAL', 100, 165, 24.7, 10.3, 2.7);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(50, 'URAD DAL', 100, 107, 14.0, 6.0, 3.0);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(51, 'SAMBHAR', 100, 5.0, 2.6, 15.0, 1.8);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(52, 'BOONDI RAITA', 145, 169, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(53, 'CORIANDER CHUTNEY', 25, 72, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(54, 'COCONUT CHUTNEY', 20, 83, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(55, 'PLAIN DOSA', 1, 145, 21.5, 2.8, 5.2);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(56, 'ONION DOSA', 20, 157, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(58, 'IDLI', 1, 69, 15, 1.2, 0.2);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(57, 'ONION PAKODA', 58, 315, NULL, NULL, NULL);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(59, 'POTATO TIKKI', 1, 60, 3.4, 0.2, 5);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(60, 'SAMOSA', 1, 369, 48.1, 6.3, 17.6);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "prote(61, 'BUTTER MILK', 1, 15, 0.5, 0.8, 1.1);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(62, 'COW MILK', 100, 67, 4.4, 3.2, 4.1);

insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(63, 'KHICHADI', 100, 215, 33.0, 4.3, 7.4);

insert into foodtype values(45, 'LUNCH');

insert into foodtype values(45, 'DINNER');

insert into foodtype values(46, 'LUNCH');

insert into foodtype values(46, 'DINNER');

insert into foodtype values(47, 'DINNER');

insert into foodtype values(47, 'LUNCH');

insert into foodtype values(48, 'LUNCH');

insert into foodtype values(48, 'DINNER');

insert into foodtype values(49, 'LUNCH');

insert into foodtype values(49, 'DINNER');

insert into foodtype values(50, 'DINNER');

insert into foodtype values(50, 'LUNCH');
insert into foodtype values(63, 'LUNCH');

insert into foodtype values(63, 'DINNER');

insert into foodtype values(62, 'BREAKFAST');

insert into foodtype values(62, 'TIFFIN');

insert into foodtype values(61, 'LUNCH');

insert into foodtype values(60, 'TIFFIN');

insert into foodtype values(59, 'TIFFIN');

insert into foodtype values(58, 'TIFFIN');

insert into foodtype values(57, 'TIFFIN');

insert into foodtype values(56, 'TIFFIN');

insert into foodtype values(55, 'TIFFIN');

insert into foodtype values(55, 'BREAKFAST');

insert into foodtype values(56, 'BREAKFAST');

insert into foodtype values(54, 'BREAKFAST');

insert into foodtype values(54, 'TIFFIN');

insert into foodtype values(53, 'TIFFIN');

insert into foodtype values(53, 'LUNCH');

insert into foodtype values(53, 'DINNER');

insert into foodtype values(53, 'BREAKFAST');

insert into servings values('1','35','BREAKFAST','2014-10-11','H1');
insert into servings values('2','37','BREAKFAST','2014-10-11','H1');
insert into servings values('3','38','BREAKFAST','2014-10-11','H1');
insert into servings values('4','39','LUNCH','2014-10-11','H1');
insert into servings values('5','40','LUNCH','2014-10-11','H1');
insert into servings values('6','41','LUNCH','2014-10-11','H1');
insert into servings values('7','42','TIFFIN','2014-10-11','H1');
insert into servings values('8','43','TIFFIN','2014-10-11','H1');
insert into servings values('9','44','TIFFIN','2014-10-11','H1');
insert into servings values('10','31','DINNER','2014-10-11','H1');
insert into servings values('11','58','DINNER','2014-10-11','H1');
insert into servings values('12','33','DINNER','2014-10-11','H1');
insert into servings values('13','32','DINNER','2014-10-11','H1');
insert into servings values('14','51','BREAKFAST','2014-10-05','H1');
insert into servings values('15','52','BREAKFAST','2014-10-05','H1');
insert into servings values('16','38','BREAKFAST','2014-10-05','H1');
insert into servings values('17','60','LUNCH','2014-10-05','H1');
insert into servings values('18','40','LUNCH','2014-10-05','H1');
insert into servings values('19','41','LUNCH','2014-10-05','H1');
insert into servings values('20','42','TIFFIN','2014-10-05','H1');
insert into servings values('21','43','TIFFIN','2014-10-05','H1');
insert into servings values('22','44','TIFFIN','2014-10-05','H1');
insert into servings values('23','31','DINNER','2014-10-05','H1');
insert into servings values('24','58','DINNER','2014-10-05','H1');
insert into servings values('25','33','DINNER','2014-10-12','H1');
insert into servings values('26','32','DINNER','2014-10-12','H1');
insert into servings values('27','51','BREAKFAST','2014-10-02','H1');
insert into servings values('28','52','BREAKFAST','2014-10-02','H1');
insert into servings values('29','38','BREAKFAST','2014-10-02','H1');
insert into servings values('30','60','LUNCH','2014-10-02','H1');
insert into servings values('31','40','LUNCH','2014-10-02','H1');
insert into servings values('32','41','LUNCH','2014-10-02','H1');
insert into servings values('33','42','TIFFIN','2014-10-02','H1');
insert into servings values('34','43','TIFFIN','2014-10-02','H1');
insert into servings values('35','44','TIFFIN','2014-10-02','H1');
insert into servings values('36','31','DINNER','2014-10-02','H1');
insert into servings values('37','58','DINNER','2014-10-02','H1');
insert into servings values('38','33','DINNER','2014-10-09','H1');
insert into servings values('39','32','DINNER','2014-10-09','H1');


select * from insert_item('BHINDI',0,1,0,1);
select * from insert_item('CABBAGE',0,1,0,1);
select * from insert_item('RAJMA',0,1,0,1);
select * from insert_item('SHAHI PANEER',0,1,0,1);
select * from insert_item('MATTAR PANEER',0,1,0,1);
select * from insert_item('IDLI',1,0,1,0);
select * from insert_item('SAMOSA',0,0,1,0);
select * from insert_item('PLAIN DOSA',1,0,1,0);
select * from insert_item('ONION DOSA',1,0,1,0);
select * from insert_item('SAMBHAR',1,1,1,1);
select * from insert_item('DAL MAKHANI',0,1,0,1);


