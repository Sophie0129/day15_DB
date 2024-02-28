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

-- Auto Increment�� ���� Sequence �߰� SQL - goods.g_num
CREATE SEQUENCE goods_SEQ
START WITH 1
INCREMENT BY 1;

-- Foreign Key ���� SQL - goods(g_id) -> member(m_id)
ALTER TABLE goods
    ADD CONSTRAINT FK_goods FOREIGN KEY (g_id)
        REFERENCES member (m_id) ;
        
drop SEQUENCE goods_SEQ;
alter table goods drop constraint FK_goods_g_id_member_m_id;

select*from member;
select*from goods;
        
        
insert into member values('aaa', 'aaa', 'ȫ�浿', '���¥��');
insert into member values('bbb', 'bbb', '�谳��', '���˺�');
insert into member values('ccc', 'ccc', '��浿', '������');
insert into member values('ddd', 'ddd', '�踻��', '�н���');

insert into goods values(goods_SEQ.nextval, 'aaa', '�ȭ', 75000, 2, 150000, sysdate);
insert into goods values(goods_SEQ.nextval, 'aaa', 'Ƽ����', 15000, 5, 750000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb', '����', 450000, 1, 450000, sysdate);
insert into goods values(goods_SEQ.nextval, 'bbb', 'å', 35000, 2, 70000, sysdate);

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

select m.m_id, m.m_name, m.m_addr, sum(g.g_price_sum) --���궧����?
from member m
Inner join goods g
on m.m_id = g.g_id
group by m.m_id, m.m_name, m.m_addr;







