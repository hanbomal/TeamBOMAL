DROP table studyrelation PURGE ;
CREATE table studyrelation(
  memberId VARCHAR2(100) ,
  studyName VARCHAR2(100) ,
  joinPoint INT,
  nickName VARCHAR2(100) ,
  joinDate DATE NOT NULL ,
  lastDate DATE NOT NULL ,
  position VARCHAR2(100),
  leader VARCHAR2(100),
  status INT
);
SELECT *
FROM studyrelation;
