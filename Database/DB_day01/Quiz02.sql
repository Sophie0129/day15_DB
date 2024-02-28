create table employee (
name varchar2(20),
sal number,
job varchar2(20),
join date
);

insert into employee values('È«±æµ¿','2000000','ÄÄÇ»ÅÍ','2222/12/24');

alter session set nls_date_format = 'YYYY/MM/DD';


select * from employee;
drop table employee;
rollback;

alter table employee add name varchar2(20);
delete from employee where name='È«±æµ¿';


insert into employee values('¼³±îÄ¡',1800000,'»ï¼º','2017/10/24');
insert into employee values('·Î¹öÆ®',1850000,'¾ÖÇÃ','2019/01/04');
insert into employee values('°íµµ¸®',2200000,'¿¤Áö','2017/11/06');
insert into employee values('±è°³¶Ë',2500000,'SK','2017/04/14');
insert into employee values('¸®¿ì¶×',2410000,'»þ¿À¹Ì','2018/01/09');
insert into employee values('°­¹Î',1900000,'»ï¼º','2019/10/24');
insert into employee values('ÇÒ¸®',1800000,'¾ÖÇÃ','2019/12/04');
insert into employee values('½É½ÉÇØ',4630000,'¿¤Áö','2015/04/02');
insert into employee values('³î¾ÆÁà',2770000,'SK','2017/01/24');
insert into employee values('¿Õ¸¸µÎ',3650000,'»þ¿À¹Ì','2016/08/04');
insert into employee values('¸Ó¸®»¡',4210000,'»ï¼º','2015/03/18');
insert into employee values('¸¶¸®¿À',2720000,'¾ÖÇÃ','2017/01/04');
insert into employee values('ÃÖÄ¡¿ì',4320000,'¿¤Áö','2015/06/07');
insert into employee values('¾È±ò½Ó',3490000,'SK','2015/09/07');
insert into employee values('³¡Â¯',2200000,'»þ¿À¹Ì','2017/05/04');
insert into employee values('¸·Àå',1920000,'»ï¼º','2018/11/24');
insert into employee values('µå¶ó¸¶',3420000,'¾ÖÇÃ','2016/07/29');
insert into employee values('°³¶ËÀÌ',1800000,'¿¤Áö','2018/12/24');
insert into employee values('¸¶Æ÷±¸',2230000,'SK','2018/01/05');
insert into employee values('¼Ò°í±â',1800000,'»þ¿À¹Ì','2019/01/09');
insert into employee values('Â¥Àå¸é',2100000,'»ï¼º','2017/10/24');
insert into employee values('¼Ò°öÃ¢',2200000,'¾ÖÇÃ','2017/11/04');
insert into employee values('ÂüÀÌ½½',1950000,'¿¤Áö','2017/10/24');
insert into employee values('·ò¿ì¶×',1800000,'SK','2018/10/24');
insert into employee values('À§¸ÞÇÁ',1800000,'»þ¿À¹Ì','2019/12/07');
insert into employee values('ºÏ°æ½Ã',1880000,'»ï¼º','2018/11/14');
insert into employee values('½º¹Ì½º',1970000,'¾ÖÇÃ','2019/06/04');
insert into employee values('ÇÚµåÆù',7200000,'¿¤Áö','2010/01/27');
insert into employee values('ºò½ººñ',3570000,'SK','2015/02/17');
insert into employee values('³ë¶óÁà',3200000,'»þ¿À¹Ì','2015/11/24');
insert into employee values('»çÀÌ´Ù',2400000,'»ï¼º','2017/09/26');
insert into employee values('±è¸»ÀÌ',7000000,'¾ÖÇÃ','2010/01/21');
insert into employee values('¿Àµµµ¶',6230000,'¿¤Áö','2011/08/19');

insert into employee values('½ÓÁöµ·',3710000,'SK','2015/08/19');
insert into employee values('È­ÀåÁö',1770000,'»þ¿À¹Ì','2019/04/28');
insert into employee values('¼ÒÈ­±â',1920000,'»ï¼º','2019/10/07');
insert into employee values('¹ÚÈ¿½Å',2670000,'¾ÖÇÃ','2017/11/24');
insert into employee values('ÆÇºùºù',3120000,'¿¤Áö','2016/05/19');
insert into employee values('±èÀç¿í',4190000,'SK','2015/01/02');
insert into employee values('¼ÛÇý±³',4280000,'»þ¿À¹Ì','2015/01/02');
insert into employee values('¼ÛÁß±â',3700000,'»ï¼º','2016/02/17');
insert into employee values('¼ÕÈ«¹Î',2220000,'¾ÖÇÃ','2018/02/04');
insert into employee values('¹éÁ¾¿ø',2760000,'¿¤Áö','2017/10/14');
insert into employee values('¿ÀÃ¢¼®',2620000,'SK','2017/09/04');
insert into employee values('½ºÅÚ¶ó',2500000,'»þ¿À¹Ì','2017/11/20');
insert into employee values('¸ß½ºÀ£',1970000,'»ï¼º','2017/10/30');
insert into employee values('Á¶Çö',  2720000,'¾ÖÇÃ','2018/11/11');
insert into employee values('·ùÇöÁø',2600000,'¿¤Áö','2015/11/19');
insert into employee values('ÀºÁö¿ø',5670000,'SK','2017/10/16');
insert into employee values('ÀüÈ¿¼º',3750000,'»þ¿À¹Ì','2015/09/15');
insert into employee values('ÀÌÃ¤Àº',3400000,'»ï¼º','2016/02/09');
insert into employee values('ÃÖ°íºÀ',8900000,'¾ÖÇÃ','2010/01/04');
insert into employee values('±¤È­¹®',1860000,'¿¤Áö','2017/10/24');
insert into employee values('µ¿´ë¹®',1790000,'SK','2017/10/24');
insert into employee values('¼­´ë¹®',2880000,'»þ¿À¹Ì','2016/02/27');
insert into employee values('´ëÅë·É',2320000,'»ï¼º','2016/05/24');
insert into employee values('¿¹Áö¿ø',1780000,'¾ÖÇÃ','2019/01/09');
insert into employee values('Á¤¼Ò¹Î',2900000,'¿¤Áö','2016/10/22');
insert into employee values('¿ö³Ê¿ø',3000000,'SK','2015/10/10');
insert into employee values('ºÏÇÑ±º',3200000,'»þ¿À¹Ì','2015/11/11');
insert into employee values('³²ÇÑ±º',2500000,'»ï¼º','2016/12/19');
insert into employee values('Â¥Åõ¸®',1850000,'¾ÖÇÃ','2018/04/03');
insert into employee values('ÀÌ½Â±â',1900000,'¿¤Áö','2018/01/01');
insert into employee values('±âÂ÷±æ',1790000,'SK','2018/05/02');
insert into employee values('±æ°Å¸®',2700000,'»þ¿À¹Ì','2016/07/20');


select * from employee where sal*12 >= 100000000;
select * from employee where join < '2015/01/01';
select * from employee where sal between 2800000 and 3000000;

select * from employee where join >= '2015/01/01' and sal*12 >= 60000000;
select * from employee where (job = '»ï¼º' or job = '¿¤Áö') and sal*12 >= 50000000;

--select * from employee order by job asc;
--select * from employee order by sal desc;
select * from employee where name like '%±è%' and sal*12 >= 30000000
order by job asc, sal desc;

desc employee;