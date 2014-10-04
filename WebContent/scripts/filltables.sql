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

siddutta_project=> alter table fooditems add column calories numeric;
ALTER TABLE
siddutta_project=> alter table fooditems add column carbohydrates numeric;
ALTER TABLE
siddutta_project=> alter table fooditems add column fats numeric;
ALTER TABLE
siddutta_project=> alter table fooditems add column protein numeric;
ALTER TABLE
siddutta_project=> delete from fooditems;
ERROR:  update or delete on table "fooditems" violates foreign key constraint "servings_itemid_fkey" on table "servings"
DETAIL:  Key (itemid)=(0) is still referenced from table "servings".
siddutta_project=> insert into fooditems('itemname', 'portion', 'calories', 'carbohydrates', 'protein', 'fats') values('ALOO-BAIGAN', siddutta_project=> insert into fooditems('itemname', 'portion', 'calories', 'carbohydrates', 'protein', 'fats') values('ALOO-BN', 100, 103, 32.3, 1.3, 4.7);
ERROR:  syntax error at or near "'itemname'"
LINE 1: insert into fooditems('itemname', 'portion', 'calories', 'ca...
                              ^
siddutta_project=> insert into fooditems("itemname", "portion", "calories", "carbohydrates", "protein", "fats") values("ALOO-BAIGAN", 100, 103, 32.3, 1.3, 4.7);
ERROR:  column "ALOO-BAIGAN" does not exist
LINE 1: ...ries", "carbohydrates", "protein", "fats") values("ALOO-BAIG...
                                                             ^
siddutta_project=> insert into fooditems("itemname", "portion", "calories", "carbohydrates", "protein", "fats") values('ALOO-BAIGAN', 100, 103, 32.3, 1.3, 4.7);
ERROR:  null value in column "itemid" violates not-null constraint
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(26, 'ALOO-
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(27, 'ALOO-BEANS', 100, 134, 34.3, 2.4, 8.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(28, 'ALOO-CURRY', 100, 105, 14.4, 1.2, 5.0);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") valuessiddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(29, 'BAIGAN-KA-BHARTA', 100, 70, 5.7, 1.2, 4.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(30, 'BHINDI', 100, 161, 12.1, 3.9, 10.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(31, 'CABBAGE', 100, 131, 7.0, 2.3, 6.0);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(32, 'CHOLE', 100, 74, 3.3, 4.3, 4.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(32, 'CURRY', 100, 100, 15.0, 2.9, 5.1);
ERROR:  duplicate key value violates unique constraint "fooditems_pkey"
DETAIL:  Key (itemid)=(32) already exists.
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(33, 'CURRY', 100, 100, 15.0, 2.9, 5.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(34, 'GATTE KA SABJI', 100, 275, , , );
ERROR:  syntax error at or near ","
LINE 1: ...tein", "fats") values(34, 'GATTE KA SABJI', 100, 275, , , );
                                                                 ^
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(34, 'GATTE KA SABJI', 100, 275, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(35, 'METHI ALOO', 100, 121, 16.0, 2.2, 5.4);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(36, 'MATTAR PANEER', 100, 147, 10.7, 8.5, 8.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(37, 'PUMPKIN', 100, 67, 6.7, 1.6, 3.8);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(38, 'RAJMA', 100, 102, 10.7, 4.7, 3.4);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(39, 'SHAHI PANEER', 95, 283, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(40, 'SHIMLA MIRCH ALOO', 100, 93, 12.8, 1.5, 3.4);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(41, 'STUFFED TOMATO', 100, 85, 11.0, 2.1, 3.4);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(42, 'TORAI', 100, 65, 4.0, 1.2, 4.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(43, 'VEG. KOFTA', 100, 147, 13.3, 2.6, 9.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(44, 'VEG. KORMA', 100, 88, 8.7, 1.4, 5.3);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(45, 'ARHAR DAL', 100, 53, 8.0, 2.8, 1.2);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(46, 'CHANA DAL', 100, 99, 12.8, 4.5, 3.2);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(47, 'DAL MAKHANI', 100, 117, 14.0, 6.8, 1.3);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(48, 'MOONG DAL', 100, 211, 31.3, 12.8, 3.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(49, 'MASOOR DAL', 100, 165, 24.7, 10.3, 2.7);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(50, 'URAD DAL', 100, 107, 14.0, 6.0, 3.0);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(51, 'SAMBHAR', 100, 5.0, 2.6, 15.0, 1.8);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(52, 'BOONDI RAITA', 145, 169, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(53, 'CORIANDER CHUTNEY', 25, 72, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(54, 'COCONUT CHUTNEY', 20, 83, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(55, 'PLAIN DOSA', 1, 145, 21.5, 2.8, 5.2);

siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(56, 'ONION DOSA', 20, 157, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(58, 'IDLI', 1, 69, 15, 1.2, 0.2);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(57, 'ONION PAKODA', 58, 315, NULL, NULL, NULL);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(59, 'POTATO TIKKI', 1, 60, 3.4, 0.2, 5);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(60, 'SAMOSA', 1, 369, 48.1, 6.3, 17.6);
INSERT 0 1
siddutta_project=> siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "prote(61, 'BUTTER MILK', 1, 15, 0.5, 0.8, 1.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(62, 'COW MILK', 100, 67, 4.4, 3.2, 4.1);
INSERT 0 1
siddutta_project=> insert into fooditems("itemid", "itemname", "portion", "calories", "carbohydrates", "protein", "fats") values(63, 'KHICHADI', 100, 215, 33.0, 4.3, 7.4);
INSERT 0 1
