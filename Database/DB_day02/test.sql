create table test_func(id number, num varchar2(20));
insert into test_func values(1,'34.5678');
select*from test_func where id =1;
--round : 소수점 자리수를 자르며 잘린 후 값은 반올림
select round(num, 2) from test_func where id = 1;
select round(num/2, 2)from test_func where id =1;
--trunc : 지정된 소수점 자리 이하를 버림
select trunc(num,2) from test_func where id=1;
--mod : 나머지 값
insert into test_func values(2,'55');
select num from test_func where id =2;
select mod(num,2) from test_func where id = 2;

--함수는 where절 다음에 사용할 수 있다
--quiz
select *from test_func;
insert into test_func values(3, 134);
insert into test_func values(4, 1.34);
insert into test_func values(5, 134.78);
insert into test_func values(6, 14.4);
insert into test_func values(7, 12);
insert into test_func values(8, 250);
insert into test_func values(9, 89.756);
insert into test_func values(10, 400);

select*from test_func where mod(id,2) != 0; -- or =1
select id, round(num/2, 2) from test_func where mod(id,2) = 0;
--quiz f

insert into test_func values(11,'Welcom To Otacle');
select*from test_func where id =11;
select upper(num) from test_func where id = 11; --문자를 대문자로 바꿈
select lower(num) from test_func where id = 11; --문자를 소문자로 바꿈
select initcap(num) from test_func where id = 11; --여백과 언더바 기준 첫글자만 대문자로 바꿈

--quiz02
create table test_company(
  name varchar2(20),
  연봉 varchar2(20),
  class varchar2(20)
);
insert into test_company values('hong gil dong_M','3600','Manager');
insert into test_company values('kim gea ddong_M','2555','ManaGer');
insert into test_company values('Go gil dong_M','2800','ManaGER');
insert into test_company values('hong gil dong_E','3111','EmpLoyee');
insert into test_company values('kim gea ddong_E','2600','EmpLoYee');
insert into test_company values('Go gil dong_E','2950','employee');

select*from test_company;
select*from test_company where lower(class) = 'manager';
select*from test_company where lower(class) = 'employee' and 연봉 >= 2800;
select initcap(name),trunc(연봉/12),class from test_company;
--quiz02 f

create table test_class(class varchar2(10), score number);
Insert into test_class values('A반',11);
insert into test_class values('A반',12);
insert into test_class values('A반',13);
insert into test_class values('B반',21);
insert into test_class values('B반',22);
insert into test_class values('B반',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select*from test_class;

select sum(score) from test_class; -- 총 합을 연산해줌
select avg(score) from test_class; -- 평균을 연산해줌
select max(score), min(score) from test_class; --최대값, 최솟값을 알려줌
select count(*) from test_class; --행의 갯수를 알려줌

select class, sum(score) from test_class group by class;
--앞뒤로 같은 컬럼명을 넣어준다
select class, sum(score) from test_class group by class
having sum(score)>60;
--그룹은 where절을 못쓴다. 대신 having.

---quiz03
select class count(*) from test_class group by class;
select class, avg(score) from test_class group by class
order by avg(score) desc; --order by는 정리
select class, max(score), min(score) from test_class group by class;
--quiz03 f 

create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('홍길동','A반');
insert into test_name values('김개똥','B반');
insert into test_name values('고길동','C반');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('홍길동','python',80);
insert into test_lesson values('홍길동','java',90);
insert into test_lesson values('홍길동','c언어',70);
insert into test_lesson values('김개똥','server2012',70);
insert into test_lesson values('김개똥','linux',90);
insert into test_lesson values('고길동','jsp',100);

select*from test_name, test_lesson;
--조인형태
select N.*, L.lesson, L.score from test_name N, test_lesson L;
--앞에서 별칭으로 부르고 뒤에서 각 테이블에 따르는 별칭을 부여한다

select N.*, L.lesson, L.score
from test_name N, test_lesson L
where N.id=L.id; --이너조인 형태

select*from test_name N 
inner join test_lesson L 
on N,id=L.id;

select N.*, L.lesson from test_name N inner join test_lesson L on N,id=L.id;
--?? 

create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','홍길동','산골짜기');
insert into test01 values('bbb','고길동','마포구');
insert into test01 values('ccc','초록별','이슬');

insert into test02 values('aaa','홍길동',100,90);
insert into test02 values('bbb','고길동',100,90);
insert into test02 values('ccc','초록별',100,90);

select * from test01 where name=(select name from test02 where id='aaa');
--쿼리문에서 또 다른 쿼리문을 쓸 수 있다.

--https://aquerytool.com  > 테이블 5개까지 무료로 쓸수있는 온라인사이트
--ai  > 자동으로 숫자매김
--외래키로 연결하면 둘의 A의 정보가 있을때만 B를 사용할 수 있게 한다. 

CREATE TABLE membership(
    m_id      VARCHAR2(50)    NOT NULL, 
    m_pwd     VARCHAR(50)     NULL, 
    m_name    VARCHAR(50)     NULL, 
    m_addr    VARCHAR(50)     NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE Board
(
    b_num        INT             NOT NULL, 
    b_id         VARCHAR2(50)    NULL, 
    b_title      VARCHAR(50)     NULL, 
    b_content    VARCHAR(50)     NULL, 
    b_date       DATE            NULL, 
     PRIMARY KEY (b_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - Board.b_num
CREATE SEQUENCE abc
START WITH 1
INCREMENT BY 1;
--자동 으로 숫자 1씩 올리며 할당해줌


ALTER TABLE Board
    ADD CONSTRAINT FK_Board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
        
        --ALTER TABLE 테이블명 > 이테이블명에-
        --CONSTRAINT 제약조건을 건다 뒤에오는건 그 조건의 이름
        --REFERENCES 연결해주겠다 뒤에 있는 테이블의 컬럼과
        
        
insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','홍길동','산골짜기');

insert into board(b_num, b_id, b_title, b_content, b_date)
values(abc.nextval, 'aaa', '제목', '내용', sysdate);
--멤버쉽이 가진 이름으로 맞춰줘야함- 멤버쉽이랑 보드랑 연결되어 있어서

select*from board;
insert into board(b_num, b_id, b_title, b_content, b_date)
values((select mac(b_num) from board)+1, 'aaa', '제목', '내용', sysdate);

--abc.nextval 와 (select mac(b_num) from board)+1 의 기능은 같다
--하지만 .nextval는 오류가 나도 계속 1씩 추가해 실제 입력이 되었을때 값은 오류난횟수+1이 되지만
--후자는 입력되었을때만 숫자를 추가함

delete from membership where m_id='aaa';
delete from board where b_id='aaa';
--하위인 보드에도 'aaa'값이 있어서 삭제 불가. 보드 먼저 삭제를 해줘야 함

select*from user_squences;
select*from uset_constrains;

drop sequence abc;
alter table board drop constraint FK_board;
--constraint

insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date)
values(1, 'bbb', '제목', '내용', sysdate);
insert into board(b_num, b_id, b_title, b_content, b_date)
values(2, 'aaa', '제목', '내용', sysdate);
select*from board;
select*from membership;
delete from membership; -- 지금은 연결이 끊겨서 개별적으로 삭제도 가능
delete from board;

alter table board add constraint fk_board foreign key(b_id)
references membership (m_id) on delete cascade; 
--on delete cascade;  부모를 삭제하면 하위의 모든 내용을 삭제하게함

insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','홍길동','산골짜기');
insert into board(b_num, b_id, b_title, b_content, b_date)
values(1, 'aaa', '제목', '내용', sysdate);

select*from board;
select*from membership;
delete from membership where m_id='aaa';
