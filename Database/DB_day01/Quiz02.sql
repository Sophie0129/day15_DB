create table employee (
name varchar2(20),
sal number,
job varchar2(20),
join date
);

insert into employee values('ȫ�浿','2000000','��ǻ��','2222/12/24');

alter session set nls_date_format = 'YYYY/MM/DD';


select * from employee;
drop table employee;
rollback;

alter table employee add name varchar2(20);
delete from employee where name='ȫ�浿';


insert into employee values('����ġ',1800000,'�Ｚ','2017/10/24');
insert into employee values('�ι�Ʈ',1850000,'����','2019/01/04');
insert into employee values('������',2200000,'����','2017/11/06');
insert into employee values('�谳��',2500000,'SK','2017/04/14');
insert into employee values('�����',2410000,'������','2018/01/09');
insert into employee values('����',1900000,'�Ｚ','2019/10/24');
insert into employee values('�Ҹ�',1800000,'����','2019/12/04');
insert into employee values('�ɽ���',4630000,'����','2015/04/02');
insert into employee values('�����',2770000,'SK','2017/01/24');
insert into employee values('�ո���',3650000,'������','2016/08/04');
insert into employee values('�Ӹ���',4210000,'�Ｚ','2015/03/18');
insert into employee values('������',2720000,'����','2017/01/04');
insert into employee values('��ġ��',4320000,'����','2015/06/07');
insert into employee values('�ȱ��',3490000,'SK','2015/09/07');
insert into employee values('��¯',2200000,'������','2017/05/04');
insert into employee values('����',1920000,'�Ｚ','2018/11/24');
insert into employee values('���',3420000,'����','2016/07/29');
insert into employee values('������',1800000,'����','2018/12/24');
insert into employee values('������',2230000,'SK','2018/01/05');
insert into employee values('�Ұ���',1800000,'������','2019/01/09');
insert into employee values('¥���',2100000,'�Ｚ','2017/10/24');
insert into employee values('�Ұ�â',2200000,'����','2017/11/04');
insert into employee values('���̽�',1950000,'����','2017/10/24');
insert into employee values('����',1800000,'SK','2018/10/24');
insert into employee values('������',1800000,'������','2019/12/07');
insert into employee values('�ϰ��',1880000,'�Ｚ','2018/11/14');
insert into employee values('���̽�',1970000,'����','2019/06/04');
insert into employee values('�ڵ���',7200000,'����','2010/01/27');
insert into employee values('�򽺺�',3570000,'SK','2015/02/17');
insert into employee values('�����',3200000,'������','2015/11/24');
insert into employee values('���̴�',2400000,'�Ｚ','2017/09/26');
insert into employee values('�踻��',7000000,'����','2010/01/21');
insert into employee values('������',6230000,'����','2011/08/19');

insert into employee values('������',3710000,'SK','2015/08/19');
insert into employee values('ȭ����',1770000,'������','2019/04/28');
insert into employee values('��ȭ��',1920000,'�Ｚ','2019/10/07');
insert into employee values('��ȿ��',2670000,'����','2017/11/24');
insert into employee values('�Ǻ���',3120000,'����','2016/05/19');
insert into employee values('�����',4190000,'SK','2015/01/02');
insert into employee values('������',4280000,'������','2015/01/02');
insert into employee values('���߱�',3700000,'�Ｚ','2016/02/17');
insert into employee values('��ȫ��',2220000,'����','2018/02/04');
insert into employee values('������',2760000,'����','2017/10/14');
insert into employee values('��â��',2620000,'SK','2017/09/04');
insert into employee values('���ڶ�',2500000,'������','2017/11/20');
insert into employee values('�߽���',1970000,'�Ｚ','2017/10/30');
insert into employee values('����',  2720000,'����','2018/11/11');
insert into employee values('������',2600000,'����','2015/11/19');
insert into employee values('������',5670000,'SK','2017/10/16');
insert into employee values('��ȿ��',3750000,'������','2015/09/15');
insert into employee values('��ä��',3400000,'�Ｚ','2016/02/09');
insert into employee values('�ְ���',8900000,'����','2010/01/04');
insert into employee values('��ȭ��',1860000,'����','2017/10/24');
insert into employee values('���빮',1790000,'SK','2017/10/24');
insert into employee values('���빮',2880000,'������','2016/02/27');
insert into employee values('�����',2320000,'�Ｚ','2016/05/24');
insert into employee values('������',1780000,'����','2019/01/09');
insert into employee values('���ҹ�',2900000,'����','2016/10/22');
insert into employee values('���ʿ�',3000000,'SK','2015/10/10');
insert into employee values('���ѱ�',3200000,'������','2015/11/11');
insert into employee values('���ѱ�',2500000,'�Ｚ','2016/12/19');
insert into employee values('¥����',1850000,'����','2018/04/03');
insert into employee values('�̽±�',1900000,'����','2018/01/01');
insert into employee values('������',1790000,'SK','2018/05/02');
insert into employee values('��Ÿ�',2700000,'������','2016/07/20');


select * from employee where sal*12 >= 100000000;
select * from employee where join < '2015/01/01';
select * from employee where sal between 2800000 and 3000000;

select * from employee where join >= '2015/01/01' and sal*12 >= 60000000;
select * from employee where (job = '�Ｚ' or job = '����') and sal*12 >= 50000000;

--select * from employee order by job asc;
--select * from employee order by sal desc;
select * from employee where name like '%��%' and sal*12 >= 30000000
order by job asc, sal desc;

desc employee;