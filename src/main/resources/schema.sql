CREATE TABLE IF NOT EXISTS user(
      userid VARCHAR(20) primary key ,
      username VARCHAR(100) NOT NULL ,
      password VARCHAR(300) NOT NULL ,
      first_name VARCHAR(100)NOT NULL
);
CREATE TABLE IF NOT EXISTS item(
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
CREATE TABLE IF NOT EXISTS feedback(
    feedbackid int AUTO_INCREMENT primary key ,
    userid VARCHAR(10) NOT NULL ,
    itemid int NOT NULL ,
    comment VARCHAR(500) NOT NULL ,
    rating int DEFAULT 5,
    date DATETIME NOT NULL ,
    CONSTRAINT fk_itemid FOREIGN KEY (itemid) REFERENCES item (itemid)

 );
CREATE TABLE IF NOT EXISTS view(
        viewid int PRIMARY KEY AUTO_INCREMENT,
        itemid int NOT NULL ,
        date DATETIME NOT NULL ,
        userid VARCHAR(20) NOT NULL ,
        cokieid VARCHAR(300) NOT NULL,
        CONSTRAINT fk_item FOREIGN KEY (itemid) REFERENCES item (itemid)
);
CREATE TABLE IF NOT EXISTS cartitem(
    cartitemid int PRIMARY KEY AUTO_INCREMENT,
    userid VARCHAR(20) NOT NULL ,
    itemid int NOT NULL ,
    price DECIMAL(12,2) NOT NULL ,
    qty int NOT NULL,
    CONSTRAINT fk_user FOREIGN KEY (userid) REFERENCES user (userid)
);
