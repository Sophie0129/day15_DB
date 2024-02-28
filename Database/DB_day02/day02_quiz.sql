CREATE TABLE member(
    m_id      VARCHAR(20)    NOT NULL, 
    m_pwd     VARCHAR(20)    NULL, 
    m_name    VARCHAR(20)    NULL, 
    m_addr    VARCHAR(20)    NULL, 
     PRIMARY KEY (m_id)
);

CREATE TABLE goods(
    g_num          INT            NOT NULL, 
    g_id           VARCHAR(20)    NULL, 
    g_name         VARCHAR(20)    NULL, 
    g_price        INT            NULL, 
    g_count        INT            NULL, 
    g_price_sum    INT            NULL, 
    g_date         DATE           NULL, 
     PRIMARY KEY (g_num)
);

-- Auto Increment를 위한 Sequence 추가 SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key 설정 SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_goods FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
drop SEQUENCE goods_SEQ;
alter table goods drop constraint FK_goods_g_id_member_m_id;

select*from member;
select*from goods;
        
        
insert into member values('aaa', 'aaa', '홍길동', '산골짜기');
insert into member values('bbb', 'bbb', '김개똥', '개똥별');
insert into member values('ccc', 'ccc', '고길동', '마포구');
insert into member values('ddd', 'ddd', '김말이', '분식집');

insert into goods values(goods_SEQ.nextval, 'aaa', '운동화', 75000, 2, 150000, sysdate);
insert into goods values(goods_SEQ.nextval, 'aaa', '티셔츠', 15000, 5, 750000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb', '가방', 450000, 1, 450000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb', '책', 35000, 2, 70000, sysdate);

select*from member;
select*from goods;

select m.*, g.*
from member m
Inner join goods g
on m.m_id = g.g_id;

select m.m_id, m.m_name, g.g_name, g.g_price_sum
from member m
Inner join goods g
on m.m_id = g.g_id;

select m.m_id, m.m_name, m.m_addr, sum(g.g_price_sum) --연산때문에?
from member m
Inner join goods g
on m.m_id = g.g_id
group by m.m_id, m.m_name, m.m_addr;







