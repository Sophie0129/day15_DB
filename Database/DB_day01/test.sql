--������ ���̽� = �����, ���� �������� ����ȭ ���ѳ��� ��, ���� ǥ = 

--ȣ��Ʈ �̸� localhost = 127.0.0.1
--��Ʈ�� �ڵ����� 1521
--SID �� ���� 18���ϴ� xe / 19�̻��� orcl

--sql developer�� ������

--cntl + enter = ����

--������ ����, �Ϲ� ����. �Ϲݰ����� ������ �ִ� ����

--���� ���� �����ݷ�;

--create user ����ڸ� identified dy ��й�ȣ;
--19������ ����ڸ� �տ� C##�� �ٿ��� �Ѵ�.(������ ���� ������ �ʾƵ� �����ȴ�)

--���� ������ �Ҷ��� c##����ڸ� ���·� ����� �̸��� �����ش�

--grant = ���� �ο�

--�÷��� number > ���� �ڷ��� / �÷��� varchar2(20) > ���� �ڷ���,20����Ʈ�� �ִ�
--�÷��� date > ��¥ �ڷ���
--primary key(�÷���) > �ش� �÷��� �ߺ� ���� ������� �ʰ� �Ѵ�
--��ҹ��ڸ� �������� �ʴ´�.

--desc �÷���; > �÷��� �ڷ��� ���
--�� ��¿��� ��? �κп� ��ĭ�̶�� ���� ���������, not null �̸� ���� ������� �ʴ´ٴ� ��
--�����̸Ӹ�Ű�� ����� not null�̴�.


create table person(
    num number, --���� ����
    name VARCHAR2(10)not null --��ҹ��ڸ� �������� �ʴ´�
    BIRth varchar2(10),
    tel VARchar2(20),
    primary key(num)--�ߺ��� ������� �ʴ´�
    --�����̸Ӹ�Ű�� ������ ���� �ߺ��� �Ǹ� ������
);

desc person;--�÷��� �ڷ��� ���

create table person111(
    num number,
    name VARCHAR2(10)not null 
    BIRth varchar2(10) not null,
    tel VARchar2(20),
    primary key(name)
 );
 desc person111;--�� ���
    
insert into person values(10,'ȫ�浿','20231216','010xx');
--���ڿ��� ���� ����ǥ
insert into person values(1001,'ȫ��2','202316','123456');

insert into person(num, name, birth, tel) --�� ���� �Ҵ�ǵ��� �´� ��ġ�� �����ֱ�
values(100,'�谳��','2023','7894');

select * from person; --�����͸� ������ �´�
select num, name from person;
select * from person where num = 10; --Ư�������� ��������
select * from person where name = '�谳��'; --ã�� �����Ϳ� ���� �÷��� �ٲ��ֱ�

select * from tab; --���̺� ��� ���� �ִ���

delete from person; --������ ����
select * from person;

insert into person values(10,'ȫ�浿','20231216','010xx');
insert into person values(1001,'ȫ��2','202316','123456');
insert into person(num, name, birth, tel)
values(100,'�谳��','2023','7894');

--�巡�׷� �� ���� �����Ű�� �ѹ��� ������ �����
--�׿� �����ϰ� ������ �ش� ���� ���õ� ���¿��� �����ؾ� �����

select * from person;
delete from person where tel='010xx'; --�ش簪�� �ִ� ���� �� ����
select * from person;

update person set name ='�����'; --����� ��� ���� �� �ش簪���� �ٲ�
--where�� �̿��� Ư���� �ٲٱ� ����
select * from person;

update person set name='ȫ�浿', birth='111' where num=100;
select * from person;
--Ŀ�� = ��������. Ŀ�������� �ӽ�����ҿ� �����Ѱ�
--cmd â������ sql�� ���� ������ Ŀ���� ���ϸ� ���� ������ �ӽ�����ҿ��� ����� ���¶�
--���� ���� �������� ����

select * from person;

commit;

delete from person; --���� ���� Ŀ���� ���� ������ �ӽ� ������� ���� ��������,
--�����ͺ��̽����� ������ ������ ���� �ִ�.
--DB���� �ѹ����� ���� �ٽ� �ҷ��� �� ����
select * from person;

rollback; --Ŀ��-�ѹ� - Ʈ�������̶�� �θ�
select * from person;
----------
create table test_table(num number);
desc test_table;

alter table test_table add(name varchar2(20));
desc test_table;

alter table test_table modify(name number);--�÷� �ڷ��� ��ȯ
desc test_table;

alter table test_table drop column name;-- �÷� ����
desc test_table;
    
alter table test_table rename column num to num_b;--�÷��� ����
--DB���� _����ٴ� ����� ���� ���
desc test_table;

drop table test_table;--���̺� ����
desc test_table;