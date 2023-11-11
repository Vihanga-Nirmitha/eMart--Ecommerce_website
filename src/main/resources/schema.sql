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
  price VARCHAR(10) NOT NULL ,
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
    rating DECIMAL DEFAULT 5
);
CREATE TABLE feedback(
    feedbackid int AUTO_INCREMENT primary key ,
    username VARCHAR(100) NOT NULL ,
    comment VARCHAR(500) NOT NULL ,
    rating int DEFAULT 5,
    orderid int NOT NULL ,
    itemid int NOT NULL ,

 );
INSERT INTO user (userid, username, password, first_name) VALUES ('D000002','vihanganirmitha200@gmail.com','aaaaa','vihanga');
ALTER table user DROP COLUMN username;
ALTER TABLE user ADD COLUMN username VARCHAR(100) NOT NULL ;
SELECT COUNT(*) AS row_count FROM user;