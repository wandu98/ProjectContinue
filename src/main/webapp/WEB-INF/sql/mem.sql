show databases;


ALTER TABLE tb_mem convert to charset UTF8;
create database practice;

use practice;
use @localhost;

CREATE TABLE tb_mem
(
    mem_id      varchar(20)  NOT NULL PRIMARY KEY -- 회원ID
    ,
    mem_pw      varchar(20)  NOT NULL             -- 회원PW
    ,
    mem_nick    varchar(255)  NOT NULL             -- 닉네임
    ,
    mem_name    varchar(20)  NOT NULL             -- 이름
    ,
    mem_zip     varchar(6)   NOT NULL             -- 우편번호
    ,
    mem_adr1    varchar(255) NOT NULL             -- 주소1
    ,
    mem_adr2    varchar(255) NOT NULL             -- 주소2
    ,
    mem_phone   varchar(20)  NOT NULL             -- 연락처
    ,
    mem_birth   date         NOT NULL             -- 생년월일
    ,
    mem_grade   varchar(20)  NOT NULL             -- 회원등급
    ,
    upoint      int          NOT NULL             -- 가용적립금
    ,
    apoint      int          NOT NULL             -- 누적적립금
    ,
    mem_receive char(1)      default ''             -- 수신여부
    ,
    good        int          NOT NULL default 0   -- 좋아요
    ,
    buyer_bad   int          NOT NULL default 0   -- 누적신고횟수
    ,
    mem_pic    varchar(255)   NOT NULL default 'ProfilePicture.png'  -- 프로필사진
    ,
    mem_joindate date       NOT NULL  default now()     -- 가입일
);

drop table tb_mem;

select * from tb_mem;

SELECT mem_id
FROM tb_mem
WHERE mem_id = '1234';

ALTER TABLE tb_mem convert to charset utf8;

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('gjdjj888', 'kkeioh45@', '방이동도도민경', '김민경', '12345', '서울특별시 중구 세종대로', '67', '02-6466-4564', '19980224', 'VIP', 5000, 5000, 'N', 0, 0,'gjdjj888.img', '9999-12-31');

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('oejdf9090', 'dkhofk777!!@@', '장지동십만우', '구천우', '34567', '서울특별시 서초구 서초대로78길', '5 대각빌딩', '010-4363-5464', '19951103', 'GOLD', 2500, 12500, 'N', 0, 0, 'oejdf9090.img', '9999-12-31');

INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES ('fjhdmj555', 'djjgkk555!', '정릉동핵주먹', '최다은', '12345', '서울특별시 서대문구 통일로', '97', '010-4893-7777', '19880520', 'SILVER', 3000, 3000, 'Y', 0, 0, 'fjhdmj555.img', '9999-12-31');


-- 회원등급
SELECT mem_grade
FROM tb_mem
WHERE mem_id='gjdjj888' AND mem_pw='kkeioh45@' AND mem_grade IN ('Vip', 'Gold', 'Silver', 'Bronze', 'New');

SELECT mem_grade
FROM tb_mem
WHERE mem_id='oejdf9090' AND mem_pw='dkhofk777!!@@' AND mem_grade IN ('Vip', 'Gold', 'Silver', 'Bronze', 'New');

SELECT mem_grade
FROM tb_mem
WHERE mem_id='fjhdmj555' AND mem_pw='djjgkk555!' AND mem_grade IN ('Vip', 'Gold', 'Silver', 'Bronze', 'New');

commit;


-- 회원가입
INSERT INTO tb_mem (mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_grade, upoint, apoint, mem_receive, good, buyer_bad, mem_pic, mem_joindate)
VALUES(?,?,?,?,?,?,?,?,?,'new',?,?,?,?,?,?,--);

INSERT INTO tb_mem(mem_id, mem_pw, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_receive)
VALUES ('newbee', '1234', '방화범', '김주완', '05853', '경기도 평택시', '커닝시티', '010-0000-0000', '19980228', 1);


select mem_id
from tb_mem;


<select id="">
    select mem_id
    from tb_mem
</select>
