DROP table calendar;
CREATE TABLE calendar(
	num int primary key,
    studynum int not null,
	title varchar(20) not NULL,
	place varchar(10),
    description varchar(50),
	startdate varchar(30),
	enddate varchar(30),
    rdate date default sysdate
    
) 

create SEQUENCE calendarSer 
   START WITH 1
  INCREMENT BY 1
  NOMAXVALUE ;
  
  select * from calendar;

  insert into calendar values(CALENDARSER.NEXTVAL, 1, 'test title', 'test place', 'test description', '2018-03-21', '2018-03-25', sysdate);
   insert into calendar values(CALENDARSER.NEXTVAL, 1, 'test title1', 'test place', 'test description', '2018-03-21', '2018-03-25', sysdate);
    insert into calendar values(CALENDARSER.NEXTVAL, 1, 'test title2', 'test place', 'test description', '2018-03-27', '2018-03-28', sysdate);
     insert into calendar values(CALENDARSER.NEXTVAL, 1, 'test title3', 'test place', 'test description', '2018-03-02', '2018-03-05', sysdate);
      insert into calendar values(CALENDARSER.NEXTVAL, 1, 'test title4', 'test place', 'test description', '2018-03-06T18:00:00', '2018-03-08T20:00:00', sysdate);
    commit;