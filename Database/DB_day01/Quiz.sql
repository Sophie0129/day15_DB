
create table STUDENT(
id varchar2(10),
name varchar2(10),
kor varchar2(5),
eng varchar2(5),
math varchar2(5),
primary key(id)
);

insert into STUDENT values(
'240201','ȫ�浿','60','80','70'
);
insert into STUDENT values(
'240202','��浿','50','60','90'
);
insert into STUDENT values(
'240203','�谳��','70','40','80'
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

select * from student where eng >= 90;--�����ǿ� �ش��ϴ� ���� �ҷ���
select * from student shere kor != 100;
--������ ���ڷν� ��ϵǾ����� �Ϲ� ���ڷ� ����� �񱳰� ������

select math from student where name='ȫ�浿'; --ȫ�浿�� ���� ���� ���� ������
select math/2 from student where name='ȫ�浿';
select math+100 from student where name='ȫ�浿';
select math*100 from student where name='ȫ�浿';
select mod(math,3) from student where name='ȫ�浿';

select * from student;
select * from student where kor >= 90 and math >= 60;
select * from student where kor >= 90 or math >= 60;
select * from student where not kor >= 90;

select * from student where kor >= 90 and kor <= 100; --90�̻� 100���� ���� ��� ��������
select * from student where kor between  90 and 100;--���� �İ� ����.

create table test_number(
    num_ps number(5,2), --�ռ��ڴ� ��ü�ڸ���, �޼��ڴ� �Ҽ��� 2������ �ְڴٴ� �ǹ�
    num_p number(3), --������ 3�ڸ����� �����Ѵ�
    num number
);

insert into test_number values(1.123456, 1.123456, 1.123456);
select * from test_table;
insert into test_number values(1234.123456, 1.123456, 1.123456);
--(5, 2)�̱� ������ �Ҽ��� 2���� ������ ���������� ���� 5�ڸ������ؼ� �������� 4���� �Ǹ� 
--�Ҽ� 2�ڸ��� ���� �� ��� ������
select * from test_table;

--Date java.util.Date, java.sql.Date

create table test_date(my_date date);
insert into test_date values(sysdate);--�ý��� ��¥�� ������ ���
insert into test_date values('2000/12/24');--���� ��¥ �ֱ�
select * from test_date;
--���̱⿣ ��¥�� �������� �ð����� �� ���� �� �ִ�.
alter session set nls_date_format = 'YYYY/MM/DD HH:MI:SS';
insert into test_date values('2000/12/24 12:12:12');
select * from test_date where my_date < '2024/02/24';--��¥�� �񱳰� �����ϴ�
--�ش� ������ ���� �����´�.

create table test_char(
ch char(5),
var varchar2(20)--varchar2�� 20����Ʈ�� �ִ�
);

insert into test_char values('1', '1');
select lengthb(ch), lengthb(var) from test_char;

select * from student;
insert into student values('4', '�����', '10', '10', '10');
select*from student where name like '��%';--������ �����ϴ� ��� ���� ������
select*from student where name like '%��';--������ ������ ��� ���� ������
select*from student where name like '%��%';--�� �ڰ� ���� ��� ���� ������

select * from student;
select * from student order by name desc; --�������� ���
select * from student order by name asc; --�������� ���

select * from student order by eng desc, math asc; -- ������ ����
