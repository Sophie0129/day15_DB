create table test_func(id number, num varchar2(20));
insert into test_func values(1,'34.5678');
select*from test_func where id =1;
--round : �Ҽ��� �ڸ����� �ڸ��� �߸� �� ���� �ݿø�
select round(num, 2) from test_func where id = 1;
select round(num/2, 2)from test_func where id =1;
--trunc : ������ �Ҽ��� �ڸ� ���ϸ� ����
select trunc(num,2) from test_func where id=1;
--mod : ������ ��
insert into test_func values(2,'55');
select num from test_func where id =2;
select mod(num,2) from test_func where id = 2;

--�Լ��� where�� ������ ����� �� �ִ�
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
select upper(num) from test_func where id = 11; --���ڸ� �빮�ڷ� �ٲ�
select lower(num) from test_func where id = 11; --���ڸ� �ҹ��ڷ� �ٲ�
select initcap(num) from test_func where id = 11; --����� ����� ���� ù���ڸ� �빮�ڷ� �ٲ�

--quiz02
create table test_company(
  name varchar2(20),
  ���� varchar2(20),
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
select*from test_company where lower(class) = 'employee' and ���� >= 2800;
select initcap(name),trunc(����/12),class from test_company;
--quiz02 f

create table test_class(class varchar2(10), score number);
Insert into test_class values('A��',11);
insert into test_class values('A��',12);
insert into test_class values('A��',13);
insert into test_class values('B��',21);
insert into test_class values('B��',22);
insert into test_class values('B��',23);
insert into test_class values('1',31);
insert into test_class values('1',32);
insert into test_class values('1',33);
insert into test_class values('',40);

select*from test_class;

select sum(score) from test_class; -- �� ���� ��������
select avg(score) from test_class; -- ����� ��������
select max(score), min(score) from test_class; --�ִ밪, �ּڰ��� �˷���
select count(*) from test_class; --���� ������ �˷���

select class, sum(score) from test_class group by class;
--�յڷ� ���� �÷����� �־��ش�
select class, sum(score) from test_class group by class
having sum(score)>60;
--�׷��� where���� ������. ��� having.

---quiz03
select class count(*) from test_class group by class;
select class, avg(score) from test_class group by class
order by avg(score) desc; --order by�� ����
select class, max(score), min(score) from test_class group by class;
--quiz03 f 

create table test_name(id varchar2(20), class varchar2(20));
Insert into test_name values('ȫ�浿','A��');
insert into test_name values('�谳��','B��');
insert into test_name values('��浿','C��');

create table test_lesson(id varchar2(20), lesson varchar2(20), score number);
insert into test_lesson values('ȫ�浿','python',80);
insert into test_lesson values('ȫ�浿','java',90);
insert into test_lesson values('ȫ�浿','c���',70);
insert into test_lesson values('�谳��','server2012',70);
insert into test_lesson values('�谳��','linux',90);
insert into test_lesson values('��浿','jsp',100);

select*from test_name, test_lesson;
--��������
select N.*, L.lesson, L.score from test_name N, test_lesson L;
--�տ��� ��Ī���� �θ��� �ڿ��� �� ���̺� ������ ��Ī�� �ο��Ѵ�

select N.*, L.lesson, L.score
from test_name N, test_lesson L
where N.id=L.id; --�̳����� ����

select*from test_name N 
inner join test_lesson L 
on N,id=L.id;

select N.*, L.lesson from test_name N inner join test_lesson L on N,id=L.id;
--?? 

create table test01( id varchar2(20), name varchar2(20), addr varchar2(100) );
create table test02( id varchar2(20), name varchar2(20), kor number, eng number );

insert into test01 values('aaa','ȫ�浿','���¥��');
insert into test01 values('bbb','��浿','������');
insert into test01 values('ccc','�ʷϺ�','�̽�');

insert into test02 values('aaa','ȫ�浿',100,90);
insert into test02 values('bbb','��浿',100,90);
insert into test02 values('ccc','�ʷϺ�',100,90);

select * from test01 where name=(select name from test02 where id='aaa');
--���������� �� �ٸ� �������� �� �� �ִ�.

--https://aquerytool.com  > ���̺� 5������ ����� �����ִ� �¶��λ���Ʈ
--ai  > �ڵ����� ���ڸű�
--�ܷ�Ű�� �����ϸ� ���� A�� ������ �������� B�� ����� �� �ְ� �Ѵ�. 

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

-- Auto Increment�� ���� Sequence �߰� SQL - Board.b_num
CREATE SEQUENCE abc
START WITH 1
INCREMENT BY 1;
--�ڵ� ���� ���� 1�� �ø��� �Ҵ�����


ALTER TABLE Board
    ADD CONSTRAINT FK_Board FOREIGN KEY (b_id)
        REFERENCES membership (m_id) ;
        
        --ALTER TABLE ���̺�� > �����̺��-
        --CONSTRAINT ���������� �Ǵ� �ڿ����°� �� ������ �̸�
        --REFERENCES �������ְڴ� �ڿ� �ִ� ���̺��� �÷���
        
        
insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','ȫ�浿','���¥��');

insert into board(b_num, b_id, b_title, b_content, b_date)
values(abc.nextval, 'aaa', '����', '����', sysdate);
--������� ���� �̸����� ���������- ������̶� ����� ����Ǿ� �־

select*from board;
insert into board(b_num, b_id, b_title, b_content, b_date)
values((select mac(b_num) from board)+1, 'aaa', '����', '����', sysdate);

--abc.nextval �� (select mac(b_num) from board)+1 �� ����� ����
--������ .nextval�� ������ ���� ��� 1�� �߰��� ���� �Է��� �Ǿ����� ���� ������Ƚ��+1�� ������
--���ڴ� �ԷµǾ������� ���ڸ� �߰���

delete from membership where m_id='aaa';
delete from board where b_id='aaa';
--������ ���忡�� 'aaa'���� �־ ���� �Ұ�. ���� ���� ������ ����� ��

select*from user_squences;
select*from uset_constrains;

drop sequence abc;
alter table board drop constraint FK_board;
--constraint

insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date)
values(1, 'bbb', '����', '����', sysdate);
insert into board(b_num, b_id, b_title, b_content, b_date)
values(2, 'aaa', '����', '����', sysdate);
select*from board;
select*from membership;
delete from membership; -- ������ ������ ���ܼ� ���������� ������ ����
delete from board;

alter table board add constraint fk_board foreign key(b_id)
references membership (m_id) on delete cascade; 
--on delete cascade;  �θ� �����ϸ� ������ ��� ������ �����ϰ���

insert into membership(m_id,m_pwd, m_name, m_addr)
values('aaa','aaa','ȫ�浿','���¥��');
insert into board(b_num, b_id, b_title, b_content, b_date)
values(1, 'aaa', '����', '����', sysdate);

select*from board;
select*from membership;
delete from membership where m_id='aaa';
