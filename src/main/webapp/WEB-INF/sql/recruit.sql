
SET foreign_key_checks = 1;

show databases;

create database practice;

use practice;
use nonchrono;

drop table tb_rcrboard;

select * from tb_rcrboard;

select * from tb_mem;

select gm_name
from tb_game gm
left join tb_rcrboard rb on rb.gm_code = gm.gm_code
where rb.gm_code = 'DT1';

select rb.rcrbrd_num, rb.mem_id, rb.rcrbrd_subject, rb.rcrbrd_content, rb.rcrbrd_pw, rb.rcrbrd_views, rb.rcrbrd_date, rb.rcrbrd_edate, rb.rcrbrd_ip, rb.gm_code, rb.rcrbrd_status, rb.rcrbrd_adr, rb.rcrbrd_max, gm.gm_name
from tb_game as gm join tb_rcrboard as rb
on rb.gm_code = gm.gm_code;

truncate table tb_rcrboard;

select * from tb_game;


SELECT gm_code
FROM tb_game
WHERE gm_name = 'VOXEL PIRATES'

SELECT rb.rcrbrd_num, rb.mem_id, rb.rcrbrd_subject, rb.rcrbrd_content, rb.rcrbrd_pw, rb.rcrbrd_views, rb.rcrbrd_date, rb.rcrbrd_edate, rb.rcrbrd_ip, rb.gm_code, rb.rcrbrd_status, rb.rcrbrd_adr, rb.rcrbrd_max, gm.gm_name
FROM tb_rcrboard as rb join tb_game as gm
on rb.gm_code = gm.gm_code;

SELECT COUNT(*)
FROM tb_rcrboard
group by mem_id
having mem_id = 'fjhdmj555';

select mem_id
from tb_rcrboard
where rcrbrd_num = 1;

SELECT COUNT(*)
FROM tb_rcrboard
group by mem_id
having mem_id = (select mem_id
                 from tb_rcrboard
                 where rcrbrd_num = 5);


select *
from tb_rcrboard
where mem_id = 'fjhdmj555';


select ga.gm_img, rb.rcrbrd_subject, rb.rcrbrd_num, ri.rcrbrd_num, nvl(ri.rcrbrd_num, 0), count(ri.rcrbrd_num)
from tb_rcrboard rb left join tb_recruitinfo ri
on rb.rcrbrd_num = ri.rcrbrd_num join tb_game ga
on rb.gm_code = ga.gm_code
where rb.mem_id = 'fjhdmj555'
group by rb.rcrbrd_num;





select ga.gm_img, rb.rcrbrd_subject, ga.gm_name, count(ri.rcrbrd_num) as cnt, rb.rcrbrd_edate
from tb_rcrboard rb left join tb_recruitinfo ri
                              on rb.rcrbrd_num = ri.rcrbrd_num join tb_game ga
                                                                    on rb.gm_code = ga.gm_code
where rb.mem_id = 'fjhdmj555'
group by rb.rcrbrd_num;








select rcrbrd_subject, rcrbrd_edate, gm_code
from tb_rcrboard
where mem_id = 'fjhdmj555';

from tb_game
where


select rb.rcrbrd_num, rb.gm_code, gm_name, gm_img
from tb_rcrboard rb join tb_game ga
on rb.gm_code = ga.gm_code
where mem_id = 'fjhdmj555';

select rcrbrd_subject, rcrbrd_num, rcrbrd_edate
from tb_rcrboard
where mem_id = 'fjhdmj555';


select count(ri.rcrbrd_num) as cnt
from tb_rcrboard rb left join tb_recruitinfo ri
on rb.rcrbrd_num = ri.rcrbrd_num
where rb.mem_id = 'fjhdmj555'
group by rb.rcrbrd_num;


select * from tb_rcrboard;

SELECT rcrbrd_num
FROM tb_rcrboard
WHERE mem_id = 'gjdjj888' and rcrbrd_subject = '실험 1' and rcrbrd_pw = '1234' and rcrbrd_views = 0 and rcrbrd_date = '2022-12-07 16:08:14' and rcrbrd_edate = '2022-12-17 16:00:00' and rcrbrd_ip = '0:0:0:0:0:0:0:1' and gm_code = 'dt0051' and rcrbrd_status = '진행중' and rcrbrd_adr = '서울 강북구 삼양로123길 1 (수유동, 삼원빌딩)' and rcrbrd_max = 5;

select * from tb_role;


SELECT rcrbrd_num, @ROWNUM :=@ROWNUM +1 AS ROWNUM
FROM (SELECT rcrbrd_num
      FROM (SELECT rcrbrd_num
            FROM tb_rcrboard) AS AA
            ORDER BY rcrbrd_num DESC) AS BB, (SELECT @ROWNUM := 0) AS CC;

SELECT MAX(rcrbrd_num) FROM tb_rcrboard;

SELECT rcrbrd_num
FROM tb_rcrboard
WHERE rcrbrd_num = (SELECT MAX(rcrbrd_num) FROM tb_rcrboard);

-- 모집순 랭킹 (index)
select ga.gm_code, ga.gm_name, count(*)
from tb_rcrboard rb join tb_game ga
on rb.gm_code = ga.gm_code
group by ga.gm_code
order by count(*) desc;





select rcrbrd_num
from tb_rcrboard
order by rcrbrd_num;

select rcrbrd_num, @rno := @rno + 1 as r
from (
        select rcrbrd_num
        from tb_rcrboard
        order by rcrbrd_num
    ) AA, (select @rno := 0) BB;



select rcrbrd_num
from tb_rcrboard
order by rcrbrd_num;

select @rno := @rno + 1 as r
from (select @rno := 0) AA;


select *
from (select rcrbrd_num
      from tb_rcrboard
      order by rcrbrd_num) AA, (select @rno := 0) BB;

-- 인덱스 페이지 모집 현황 --------------------------
-- 모집 게시판 제목, 모집종료일자
select rcrbrd_num, rcrbrd_subject, rcrbrd_edate, gm_code
from tb_rcrboard
order by rcrbrd_edate;

-- 게임 타이틀 이미지
select rcrbrd_num, rb.gm_code, rcrbrd_edate
from tb_rcrboard rb join tb_game ga
on rb.gm_code = ga.gm_code
order by rcrbrd_edate;

-- 참여 인원 수
select rb.rcrbrd_num, count(*), nvl(count(*), 0)
from tb_rcrboard rb join tb_recruitinfo ri
on rb.rcrbrd_num = ri.rcrbrd_num
group by rb.rcrbrd_num;

select rb.rcrbrd_num, rcrbrd_subject, rcrbrd_edate, ga.gm_code, count(*)
from tb_rcrboard rb join tb_game ga
on rb.gm_code = ga.gm_code join tb_recruitinfo ri
on rb.rcrbrd_num = ri.rcrbrd_num
group by rb.rcrbrd_num
order by rcrbrd_edate;

-- 참여 인원수
select rb.rcrbrd_num, count(ri.rcrbrd_num)
from tb_recruitinfo ri right join tb_rcrboard rb
on ri.rcrbrd_num = rb.rcrbrd_num
where rb.rcrbrd_num = 5;


update tb_rcrboard
set gm_code = 'dt0004'
where rcrbrd_num = 3;


-- ------------------------------------------------


SELECT rl_name
FROM tb_role
WHERE rcrbrd_num = 16;

select * from tb_role;

SELECT rl_name, rs_seat
FROM tb_roleseat
WHERE rcrbrd_num = 5;

SELECT rl_name
FROM tb_roleseat
WHERE rcrbrd_num = 4 and rs_seat = 1;

select * from tb_roleseat;


select * from tb_roleseat
where rs_seat = 1 and rcrbrd_num = 4;

select gm.gm_name
from tb_rcrboard as rb join tb_game as gm
                            on rb.gm_code = gm.gm_code
where rb.rcrbrd_num = 7;

SELECT mem_id, ri_seat, ri_num
FROM tb_recruitinfo
WHERE rcrbrd_num = 7;

SELECT mem_id, ri_seat
FROM tb_recruitinfo
WHERE rcrbrd_num = 7;

SELECT mm.mem_nick
FROM tb_recruitinfo as ri JOIN tb_mem as mm
                               ON ri.mem_id = mm.mem_id
WHERE ri.rcrbrd_num = 7 AND ri.ri_seat = 3;

/* 이번달 모집왕 */
SELECT mm.mem_nick, mm.mem_id, count(*)
FROM tb_mem as mm JOIN tb_rcrboard as rb
on mm.mem_id = rb.mem_id
group by rb.mem_id
order by count(*) DESC;

SELECT mem_id, count(*)
FROM tb_rcrboard
group by mem_id
order by count(*) DESC;

# more

SELECT rcrbrd_num,
       mem_id,
       rcrbrd_subject,
       rcrbrd_content,
       rcrbrd_pw,
       rcrbrd_views,
       rcrbrd_date,
       rcrbrd_edate,
       rcrbrd_ip,
       gm_code,
       rcrbrd_status,
       rcrbrd_adr,
       rcrbrd_max
FROM tb_rcrboard
ORDER BY rcrbrd_num DESC
Limit 17 OFFSET 9;

select gm.gm_name, rb.rcrbrd_num, rb.rcrbrd_subject, rb.rcrbrd_edate, rb.gm_code
from tb_rcrboard as rb
         join tb_game as gm
              on rb.gm_code = gm.gm_code
ORDER BY rcrbrd_num DESC
Limit 17 OFFSET 9;

select gm.gm_name, rb.rcrbrd_num, rb.rcrbrd_subject, rb.rcrbrd_edate, rb.gm_code, (SELECT count(mem_id)
                                                                                   FROM tb_recruitinfo
                                                                                   WHERE rcrbrd_num = rb.rcrbrd_num) as cnt
from tb_rcrboard as rb
         join tb_game as gm
              on rb.gm_code = gm.gm_code
ORDER BY cnt DESC;

SELECT count(mem_id)
FROM tb_recruitinfo
WHERE rcrbrd_num = 8;

select gm.gm_name, rb.rcrbrd_num, rb.rcrbrd_subject, rb.rcrbrd_edate, rb.gm_code, (SELECT count(mem_id)
                                                                                   FROM tb_recruitinfo
                                                                                   WHERE rcrbrd_num = rb.rcrbrd_num) as cnt
from tb_rcrboard as rb
         join tb_game as gm
              on rb.gm_code = gm.gm_code
ORDER BY cnt DESC;


SELECT rcrbrd_num,
        mem_id,
       rcrbrd_subject,
       rcrbrd_content,
       rcrbrd_pw,
       rcrbrd_views,
       rcrbrd_date,
       rcrbrd_edate,
       rcrbrd_ip,
       gm_code,
       rcrbrd_status,
       rcrbrd_adr,
       rcrbrd_max,
        (SELECT count(mem_id)
           FROM tb_recruitinfo
           where rcrbrd_num = rb.rcrbrd_num) as cnt
FROM tb_rcrboard rb
ORDER BY cnt DESC;

select gm.gm_name,
       rb.rcrbrd_num,
       rb.rcrbrd_subject,
       rb.rcrbrd_edate,
       rb.gm_code,
       rb.rcrbrd_max,
       (SELECT count(mem_id)
        FROM tb_recruitinfo
        WHERE rcrbrd_num = rb.rcrbrd_num) as cnt
from tb_rcrboard as rb
         join tb_game as gm
              on rb.gm_code = gm.gm_code
WHERE rcrbrd_status = '진행중' AND rcrbrd_edate >= now()
ORDER BY rcrbrd_num DESC
Limit 99 OFFSET 0

SELECT rcrbrd_num,
       mem_id,
       rcrbrd_subject,
       rcrbrd_content,
       rcrbrd_pw,
       rcrbrd_views,
       rcrbrd_date,
       rcrbrd_edate,
       rcrbrd_ip,
       gm_code,
       rcrbrd_status,
       rcrbrd_adr,
       rcrbrd_max,
       (SELECT count(mem_id)
        FROM tb_recruitinfo
        where rcrbrd_num = rb.rcrbrd_num) as cnt
FROM tb_rcrboard rb
WHERE rcrbrd_status = '진행중' AND rcrbrd_edate >= now()
ORDER BY rcrbrd_num DESC


# 1. 배송정보 인서트를 한다


# 2. max로 방금 인서트한 배송정보의 넘버를 알아온다
select max(mem_dvnum)
from tb_memdv
where mem_id = 'fjhdmj555';

#3. 방금 인서트한 배송정보의 넘버를 가지고 주문정보를 인서트를 한다

SELECT mem_id, ri_seat, ri_num
FROM tb_recruitinfo
WHERE rcrbrd_num = 1

SELECT count(*)
FROM tb_rating
WHERE rcrbrd_num = 5
  AND give_id = 'koochunwoo' AND receive_id = 'gjdjj888';