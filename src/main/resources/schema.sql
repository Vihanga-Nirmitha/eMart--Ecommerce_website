CREATE TABLE user(
      userid VARCHAR(20) primary key ,
      username VARCHAR(100) NOT NULL ,
      password VARCHAR(300) NOT NULL ,
      first_name VARCHAR(100)NOT NULL
);
CREATE TABLE item(
    itemid int AUTO_INCREMENT PRIMARY KEY ,
  title VARCHAR(50) NOT NULL  ,
  category VARCHAR(50) NOT NULL ,
  price DECIMAL(12,2) NOT NULL ,
  brand VARCHAR(20) NOT NULL ,
    model VARCHAR(20) NOT NULL ,
    qty int not null DEFAULT 0,
    image1 VARCHAR(100) NOT NULL ,
    image2 VARCHAR(100) NOT NULL ,
    image3 VARCHAR(100) NOT NULL ,
    image4 VARCHAR(100) NOT NULL ,
    image5 VARCHAR(100) NOT NULL ,
    description VARCHAR(500) NOT NULL ,
    date DATETIME NOT NULL ,
    sold int DEFAULT 0,
    rating DECIMAL(3,1) DEFAULT 5
);
CREATE TABLE feedback(
    feedbackid int AUTO_INCREMENT primary key ,
    userid VARCHAR(10) NOT NULL ,
    itemid int NOT NULL ,
    comment VARCHAR(500) NOT NULL ,
    rating int DEFAULT 5,
    date DATETIME NOT NULL ,
    CONSTRAINT fk_itemid FOREIGN KEY (itemid) REFERENCES item (itemid)

 );
CREATE TABLE view(
        viewid int PRIMARY KEY AUTO_INCREMENT,
        itemid int NOT NULL ,
        date DATETIME NOT NULL ,
        userid VARCHAR(20) NOT NULL ,
        cokieid VARCHAR(300) NOT NULL,
        CONSTRAINT fk_item FOREIGN KEY (itemid) REFERENCES item (itemid)
);
CREATE TABLE cartitem(
    cartitemid int PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(20) NOT NULL ,
    itemid int NOT NULL ,
    price DECIMAL(12,2) NOT NULL ,
    qty int NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES user (userid)
);
INSERT INTO user (userid, username, password, first_name) VALUES ('D000002','vihanganirmitha200@gmail.com','aaaaa','vihanga');
ALTER table user DROP COLUMN username;
ALTER TABLE user ADD COLUMN username VARCHAR(100) NOT NULL ;
SELECT COUNT(*) AS row_count FROM user;
ALTER  TABLE  item MODIFY COLUMN  rating DECIMAL(3,1) DEFAULT 5 ;
SELECT * FROM item WHERE price < 20.00 AND price > 5.00 AND (category = 'Electronics' OR category = 'Sports' ) ORDER BY price DESC;
SELECT * FROM item ORDER BY date DESC;

ALTER TABLE view ADD COLUMN cokieid VARCHAR(300) NOT NULL ;
SELECT * FROM view WHERE userid = 'D00001';
SELECT * FROM item as i INNER JOIN (SELECT date,itemid FROM view WHERE userid = 'D00001') as v on v.itemid = i.itemid ORDER BY v.date DESC ;

INSERT INTO feedback (userid, itemid, comment, rating, date) VALUES ('D00001','18','Not Good!' , '3', LOCALTIME);
SELECT * FROM feedback WHERE itemid = '3';
SELECT * FROM (SELECT * FROM feedback WHERE itemid = '3') as f INNER JOIN user as u on f.userid = u.userid;

SELECT * FROM item ORDER BY price ASC ;
SELECT * FROM cartitem WHERE itemid = '3' AND userid = 'D00001';
SELECT i.itemid,i.price,i.image1,i.title,i.brand,i.model,c.qty  FROM item AS i INNER JOIN cartitem AS c on i.itemid = c.itemid WHERE c.userid = 'D00001';
UPDATE cartitem SET qty = 5 WHERE userid = 'D00001' AND itemid = '20';
SELECT i.itemid,i.price,i.image1,i.title,i.brand,i.model,c.qty  FROM item AS i INNER JOIN cartitem AS c on i.itemid = c.itemid WHERE c.userid = 'D00001';
SELECT * FROM item WHERE title LIKE '%large%'  OR model LIKE '%large%' OR brand LIKE '%large%' OR description LIKE '%large%';
DELETE FROM cartitem WHERE itemid = 2 AND userid = 'D00001'