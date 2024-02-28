--데이터 베이스 = 저장소, 각종 정보들을 정형화 시켜놓은 것, 엑셀 표 = 

--호스트 이름 localhost = 127.0.0.1
--포트는 자동으로 1521
--SID 는 버전 18이하는 xe / 19이상은 orcl

--sql developer가 편집기

--cntl + enter = 실행

--관리자 계정, 일반 계정. 일반계정은 제약이 있는 계정

--문장 끝에 세미콜론;

--create user 사용자명 identified dy 비밀번호;
--19버전은 사용자명 앞에 C##을 붙여햐 한다.(설정에 따라 붙히지 않아도 생성된다)

--이후 접속을 할때도 c##사용자명 형태로 사용자 이름을 적어준다

--grant = 권한 부여

--컬럼명 number > 숫자 자료형 / 컬럼명 varchar2(20) > 문자 자료형,20바이트가 최대
--컬럼명 date > 날짜 자료형
--primary key(컬럼명) > 해당 컬럼의 중복 값을 허용하지 않게 한다
--대소문자를 구분하지 않는다.

--desc 컬럼명; > 컬럼과 자료형 출력
--위 출력에서 널? 부분에 빈칸이라면 빈값을 허용하지만, not null 이면 빈값을 허용하지 않는다는 뜻
--프라이머리키로 만들면 not null이다.


create table person(
    num number, --숫자 저장
    name VARCHAR2(10)not null --대소문자를 구분하지 않는다
    BIRth varchar2(10),
    tel VARchar2(20),
    primary key(num)--중복을 허용하지 않는다
    --프라이머리키로 설정된 값이 중복이 되면 에러남
);

desc person;--컬럼과 자료형 출력

create table person111(
    num number,
    name VARCHAR2(10)not null 
    BIRth varchar2(10) not null,
    tel VARchar2(20),
    primary key(name)
 );
 desc person111;--값 출력
    
insert into person values(10,'홍길동','20231216','010xx');
--문자열은 작은 따옴표
insert into person values(1001,'홍길2','202316','123456');

insert into person(num, name, birth, tel) --각 값에 할당되도록 맞는 위치에 적어주기
values(100,'김개똥','2023','7894');

select * from person; --데이터를 가지고 온다
select num, name from person;
select * from person where num = 10; --특정데이터 가져오기
select * from person where name = '김개똥'; --찾는 데이터에 따라 컬럼명 바꿔주기

select * from tab; --테이블에 몇개의 값이 있는지

delete from person; --데이터 삭제
select * from person;

insert into person values(10,'홍길동','20231216','010xx');
insert into person values(1001,'홍길2','202316','123456');
insert into person(num, name, birth, tel)
values(100,'김개똥','2023','7894');

--드래그로 다 묶고 실행시키면 한번에 여러개 실행됨
--그외 실행하고 싶으면 해당 줄이 선택된 상태에서 실행해야 실행됨

select * from person;
delete from person where tel='010xx'; --해당값이 있는 행을 다 삭제
select * from person;

update person set name ='김길이'; --저장된 모든 값을 다 해당값으로 바꿈
--where을 이용해 특정값 바꾸기 가능
select * from person;

update person set name='홍길동', birth='111' where num=100;
select * from person;
--커밋 = 완전저장. 커밋전에는 임시저장소에 저장한것
--cmd 창에서도 sql을 쓸수 있지만 커밋을 안하면 서로 각자의 임시저장소에만 저장된 상태라
--서로 값을 공유하지 않음

select * from person;

commit;

delete from person; --삭제 이후 커밋을 하지 않으면 임시 저장소의 값만 지워지고,
--데이터베이스에는 그전에 저장한 값이 있다.
--DB에서 롤백으로 값을 다시 불러올 수 있음
select * from person;

rollback; --커밋-롤백 - 트랜젝션이라고 부름
select * from person;
----------
create table test_table(num number);
desc test_table;

alter table test_table add(name varchar2(20));
desc test_table;

alter table test_table modify(name number);--컬럼 자료형 변환
desc test_table;

alter table test_table drop column name;-- 컬럼 삭제
desc test_table;
    
alter table test_table rename column num to num_b;--컬럼명 변경
--DB에서 _언더바는 연결어 쓸때 사용
desc test_table;

drop table test_table;--테이블 삭제
desc test_table;