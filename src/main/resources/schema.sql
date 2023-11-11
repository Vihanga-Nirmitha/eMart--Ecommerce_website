CREATE TABLE user(
      userid VARCHAR(20) primary key ,
      username VARCHAR(100) NOT NULL ,
      password VARCHAR(300) NOT NULL ,
      first_name VARCHAR(100)NOT NULL
);
INSERT INTO user (userid, username, password, first_name) VALUES ('D000002','vihanganirmitha200@gmail.com','aaaaa','vihanga');
ALTER table user DROP COLUMN username;
ALTER TABLE user ADD COLUMN username VARCHAR(100) NOT NULL ;
SELECT COUNT(*) AS row_count FROM user;