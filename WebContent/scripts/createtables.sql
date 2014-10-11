DROP TABLE IF EXISTS foodtype;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS servings;
DROP TABLE IF EXISTS fooditems;
DROP TABLE IF EXISTS users;

DROP TYPE IF EXISTS itemtype;
DROP TYPE IF EXISTS hostel;
DROP TYPE IF EXISTS usertype;


CREATE TYPE itemtype AS ENUM ('BREAKFAST','LUNCH','TIFFIN','DINNER','MIDNIGHT');
CREATE TYPE hostel AS ENUM ('H1','H2','H3','H4','H5','H6','H7','H8','H9','H10','H11','H12','H13','H14','H15','H16');
CREATE TYPE usertype AS ENUM ('ADMINISTRATOR', 'CONSUMER');

CREATE TABLE IF NOT EXISTS fooditems (itemid numeric PRIMARY KEY, itemname varchar NOT NULL);
CREATE TABLE IF NOT EXISTS users (username varchar PRIMARY KEY, name varchar, password varchar NOT NULL, hostelnumber hostel NOT NULL, category usertype NOT NULL, emailid varchar(30));
CREATE TABLE IF NOT EXISTS foodtype (itemid numeric REFERENCES fooditems(itemid) ON DELETE RESTRICT, type itemtype NOT NULL);
CREATE TABLE IF NOT EXISTS servings (sid numeric PRIMARY KEY, itemid numeric REFERENCES fooditems(itemid) ON DELETE RESTRICT NOT NULL, type itemtype NOT NULL, servedon date NOT NULL, hostelnumber hostel NOT NULL);
CREATE TABLE IF NOT EXISTS reviews (username varchar REFERENCES users(username), sid numeric REFERENCES servings(sid) ON DELETE RESTRICT, rating numeric CHECK(rating>=0 AND rating<=5) NOT NULL, review varchar(150));
CREATE TABLE IF NOT EXISTS timeFoodType (type itemtype PRIMARY KEY, startTime time NOT NULL, endTime time NOT NULL);

CREATE OR REPLACE FUNCTION insert_serving(iname text,itype itemtype, sdate date,hnum hostel) RETURNS void AS $$
    DECLARE
        fid numeric;
        maxsid numeric;
        newsid numeric;
    BEGIN
	SELECT itemid into fid from fooditems WHERE itemname=iname;
	SELECT max(sid) into maxsid from servings;
	newsid:=maxsid+1;
	INSERT INTO servings VALUES(newsid,fid,itype,sdate,hnum);
    END;
$$ LANGUAGE plpgsql;
