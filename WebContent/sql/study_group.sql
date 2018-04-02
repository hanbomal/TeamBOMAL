DROP table studygroup PURGE ;
CREATE table studygroup(
  num int,
  studyName VARCHAR2(100) PRIMARY KEY ,
  peopleCount INT NOT NULL ,
  leader VARCHAR2(100) NOT NULL ,
  openDate DATE NOT NULL ,
  study_pro VARCHAR2(100),
  study_back VARCHAR2(100),
  study_intro VARCHAR2(3000),
  proSize INT,
  backSize INT
);
SELECT *
FROM studygroup;

drop SEQUENCE  groupSer;
create sequence groupSer
  start with 1
  increment by 1
  NOMAXVALUE
  NOCYCLE ;