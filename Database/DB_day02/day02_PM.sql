create table member_test(
id VARCHAR2(20) primary key,
pwd VARCHAR2(20),
name VARCHAR2(20),
age number
);

insert into member_test values('aaa', 'aaa', 'ȫ�浿', 20);
insert into member_test values('bbb', 'bbb', '�谳��', 30);
insert into member_test values('ccc', 'ccc', '����', 40);
commit;

select*from member_test;



insert into member_test(id, pwd, name, age) values('aaa', 'aaa', 'aaa',a10);