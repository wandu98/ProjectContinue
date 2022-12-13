CREATE TABLE tb_seller
(
    sl_id       varchar(20)  NOT NULL PRIMARY KEY    -- 판매자ID
    ,
    sl_pw       varchar(20)  NOT NULL                -- 판매자PW
    ,
    sl_name     varchar(30)  NOT NULL                -- 사업자명
    ,
    sl_zip      varchar(6)   NOT NULL                -- 우편번호
    ,
    sl_adr1     varchar(255) NOT NULL                -- 주소1
    ,
    sl_adr2     varchar(255) NOT NULL                -- 주소2
    ,
    sl_phone    varchar(20)  NOT NULL                -- 연락처
    ,
    sl_birth    date         NOT NULL                -- 생년월일
    ,
    sl_grade    varchar(20)  NOT NULL default 'snew' -- 회원등급
    ,
    sl_receive  char(1)      NOT NULL default 'N'    -- 수신여부
    ,
    sl_number   varchar(12)  NOT NULL                -- 사업자번호
    ,
    sl_bank     varchar(30)  NOT NULL                -- 계좌번호
    ,
    sl_bankcode int          NOT NULL                -- 은행코드
);

ALTER TABLE tb_seller CHANGE sl_receive sl_receive  char(1) NOT NULL default 'N';

INSERT INTO tb_seller (sl_id, sl_pw, sl_name, sl_zip, sl_adr1, sl_adr2, sl_phone, sl_birth, sl_grade, sl_receive, sl_number, sl_bank, sl_bankcode)
VALUES ('ekdm1234', '1q2w3e4r!', '닌텐돌', '09876', '경기도 성남시 분당구 정자일로', '95', '031-1111-2222', '19801002', 'SVIP', 'Y', '123-12-12345', '110-36-2345-474', 4)
     ,('pogjj777', 'qwerty33!!', '닝텐도', '54321', '서울특별시 강남구 테헤란로', '124 4층', '02-5566-3344', '19900428', 'SGOLD', 'Y', '392-48-38727', '396-4804-9385-11', 11)
     ,('digj1908', 'dkanrjsk33', '닌텡도', '76543', '경기도 성남시 분당구 판교역로241번길', '20', '010-9977-4567', '19750530', 'SGOLD', 'N', '698-29-28744', '3454-334-583492', 88)
     ,('itwill', 'dkdk123', '닝텡동', '43210', '강원도 양구군 남면 삼팔선로', '112', '010-0101-2222', '19990202', 'SSILVER', 'Y', '123-16-45645', '110-462-057303', 4)
     ,('codingking', 'dodomk159', '링딩동', '06547', '경기도 평택시 세교3로 8', '102-702', '010-0225-1475', '19950626', 'SGREEN', 'N', '456-45-78978', '110-568-159456', 4);


drop table tb_seller;

select * from tb_seller;

-- 회원등급
SELECT sl_grade
FROM tb_seller
WHERE sl_id='itwill' AND sl_pw='dkdk123' AND sl_grade IN ('SVip', 'SGold', 'SSilver', 'SBronze', 'SNew');

INSERT INTO tb_seller(sl_id, sl_pw, sl_name, sl_zip, sl_adr1, sl_adr2, sl_phone, sl_birth, sl_receive, sl_number, sl_bank, sl_bankcode)
VALUES ('dddd', '1234', 'cd', '12345', '12345', '12345', '123456789', '19990408', '1212', 1, '1234', '1234');


select dt_prog, count(*) as cnt, dt.ss_num, sl.sl_id
from tb_detail dt join tb_sales sl
on dt.ss_num = sl.ss_num
where sl_id = 'codingking'
group by dt_prog
order by dt_prog;


select *
from (
         select 'J01' dt_prog from dual union all
         select 'J02' dt_prog from dual union all
         select 'J03' dt_prog from dual union all
         select 'J04' dt_prog from dual union all
         select 'J05' dt_prog from dual union all
         select 'J06' dt_prog from dual union all
         select 'J07' dt_prog from dual union all
         select 'J08' dt_prog from dual
     ) tbb;


select tbc.dt_prog, ifnull(cnt, 0) as ct
from (
        select dt_prog, count(*) as cnt, dt.ss_num, sl.sl_id
        from tb_detail dt join tb_sales sl
        on dt.ss_num = sl.ss_num join tb_order od
        on dt.od_num = od.od_num
        where sl_id = 'codingking' and od_date = ''
        group by dt_prog
        order by dt_prog
    ) tba right join (select *
                               from (
                                        select 'J01' dt_prog from dual union all
                                        select 'J02' dt_prog from dual union all
                                        select 'J03' dt_prog from dual union all
                                        select 'J04' dt_prog from dual union all
                                        select 'J05' dt_prog from dual union all
                                        select 'J06' dt_prog from dual union all
                                        select 'J07' dt_prog from dual union all
                                        select 'J08' dt_prog from dual
                                    ) tbb
     ) tbc on tba.dt_prog = tbc.dt_prog;



select dt.dt_prog, dt.ss_num, sl_id, count(*) as cnt
from tb_order od join tb_detail dt
on od.od_num = dt.od_num join tb_sales sl
on dt.ss_num = sl.ss_num
where od_date between '20221201' and '20221231' and sl_id = 'codingking'
group by dt_prog;



select tbc.dt_prog, ifnull(cnt, 0)
from (
        select dt.dt_prog, dt.ss_num, sl_id, count(*) as cnt
        from tb_order od join tb_detail dt
        on od.od_num = dt.od_num join tb_sales sl
        on dt.ss_num = sl.ss_num
        where DATE_FORMAT(od_date, '%Y-%m') = DATE_FORMAT(now(), '%Y-%m') and sl_id = 'codingking'
        group by dt_prog
    ) tba right join (select *
                               from (
                                        select 'J01' dt_prog from dual union all
                                        select 'J02' dt_prog from dual union all
                                        select 'J03' dt_prog from dual union all
                                        select 'J04' dt_prog from dual union all
                                        select 'J05' dt_prog from dual union all
                                        select 'J06' dt_prog from dual union all
                                        select 'J07' dt_prog from dual union all
                                        select 'J08' dt_prog from dual
                                    ) tbb
    ) tbc on tba.dt_prog = tbc.dt_prog;


select dt.dt_prog, dt.ss_num, sl_id, count(*) as cnt, od_date
from tb_order od join tb_detail dt
                      on od.od_num = dt.od_num join tb_sales sl
                                                    on dt.ss_num = sl.ss_num
where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d') and sl_id = 'codingking'
group by dt_prog;


-- dt_progCountDay
select tbc.dt_prog, ifnull(cnt, 0)
from (
        select dt.dt_prog, dt.ss_num, sl_id, count(*) as cnt, od_date
        from tb_order od join tb_detail dt
        on od.od_num = dt.od_num join tb_sales sl
        on dt.ss_num = sl.ss_num
        where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d') and sl_id = 'codingking'
        group by dt_prog
    ) tba right join (select *
                               from (
                                        select 'J01' dt_prog from dual union all
                                        select 'J02' dt_prog from dual union all
                                        select 'J03' dt_prog from dual union all
                                        select 'J04' dt_prog from dual union all
                                        select 'J05' dt_prog from dual union all
                                        select 'J06' dt_prog from dual union all
                                        select 'J07' dt_prog from dual union all
                                        select 'J08' dt_prog from dual
                                    ) tbb
    ) tbc on tba.dt_prog = tbc.dt_prog;


-- dt_progCountAll
select tbc.dt_prog, ifnull(cnt, 0) as ct
from (
         select dt_prog, count(*) as cnt, dt.ss_num, sl.sl_id
         from tb_detail dt join tb_sales sl
                                on dt.ss_num = sl.ss_num join tb_order od
                                                              on dt.od_num = od.od_num
         where sl_id = 'codingking'
         group by dt_prog
         order by dt_prog
     ) tba right join (select *
                       from (
                                select 'J01' dt_prog from dual union all
                                select 'J02' dt_prog from dual union all
                                select 'J03' dt_prog from dual union all
                                select 'J04' dt_prog from dual union all
                                select 'J05' dt_prog from dual union all
                                select 'J06' dt_prog from dual union all
                                select 'J07' dt_prog from dual union all
                                select 'J08' dt_prog from dual
                            ) tbb
) tbc on tba.dt_prog = tbc.dt_prog;


select od.od_num ,od_date, dt.ss_num, dt_amount, sl_id, ss_price, substr(gm_code,1,2) as gm_code, dt_amount*sl.ss_price as sales
from tb_detail dt join tb_sales sl
on dt.ss_num = sl.ss_num join tb_order od
on dt.od_num = od.od_num
where sl_id = 'digj1908' and DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d');
