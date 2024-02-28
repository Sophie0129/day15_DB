
create table STUDENT(
id varchar2(10),
name varchar2(10),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);

insert into STUDENT values(
'240201','홍길동','60','80','70'
);
insert into STUDENT values(
'240202','김길동','50','60','90'
);
insert into STUDENT values(
'240203','김개똥','70','40','80'
);

update STUDENT set 
kor='100', eng='95', math='90' where id='240201';
update STUDENT set 
kor='85', eng='80', math='75' where id='240202';
update STUDENT set 
kor='70', eng='65', math='60' where id='240203';

select * from student;
commit;
delete student;
select * from student;
rollback;
select * from student;

select * from student where eng >= 90;--이조건에 해당하는 값을 불러옴
select * from student shere kor != 100;
--점수는 문자로써 등록되었지만 일반 숫자로 연산과 비교가 가능함

select math from student where name='홍길동'; --홍길동에 대한 수학 값만 가져옴
select math/2 from student where name='홍길동';
select math+100 from student where name='홍길동';
select math*100 from student where name='홍길동';
select mod(math,3) from student where name='홍길동';

select * from student;
select * from student where kor >= 90 and math >= 60;
select * from student where kor >= 90 or math >= 60;
select * from student where not kor >= 90;

select * from student where kor >= 90 and kor <= 100; --90이상 100이하 값인 국어값 가져오기
select * from student where kor between  90 and 100;--위의 식과 같다.

create table test_number(
    num_ps number(5,2), --앞숫자는 전체자리수, 뒷숫자는 소수점 2개까지 넣겠다는 의미
    num_p number(3), --정수로 3자리까지 저장한다
    num number
);

insert into test_number values(1.123456, 1.123456, 1.123456);
select * from test_table;
insert into test_number values(1234.123456, 1.123456, 1.123456);
--(5, 2)이기 때문에 소수점 2개를 포함해 정수값까지 전부 5자리여야해서 정수값이 4개가 되면 
--소수 2자리를 넣을 수 없어서 오류남
select * from test_table;

--Date java.util.Date, java.sql.Date

create table test_date(my_date date);
insert into test_date values(sysdate);--시스템 날짜를 얻어오는 기능
insert into test_date values('2000/12/24');--직접 날짜 넣기
select * from test_date;
--보이기엔 날짜만 보이지만 시간분초 도 같이 들어가 있다.
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
insert into test_date values('2000/12/24 12:12:12');
select * from test_date where my_date < '2024/02/24';--날짜도 비교가 가능하다
--해당 일자의 값만 가져온다.

create table test_char(
ch char(5),
var varchar2(20)--varchar2는 20바이트가 최대
);

insert into test_char values('1', '1');
select lengthb(ch), lengthb(var) from test_char;

select * from student;
insert into student values('4', '길고인', '10', '10', '10');
select*from student where name like '김%';--김으로 시작하는 모든 값을 가져옴
select*from student where name like '%김';--김으로 끝나는 모든 값을 가져옴
select*from student where name like '%김%';--김 자가 들어가는 모든 값을 가져옴

select * from student;
select * from student order by name desc; --내림차순 출력
select * from student order by name asc; --오름차순 출력

select * from student order by eng desc, math asc; -- 점수별 정렬
