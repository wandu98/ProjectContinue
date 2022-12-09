
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


SELECT rl_name
FROM tb_role
WHERE rcrbrd_num = 16;

select * from tb_role;

SELECT rl_name, rs_seat
FROM tb_roleseat
WHERE rcrbrd_num = 4;

SELECT rl_name
FROM tb_roleseat
WHERE rcrbrd_num = 4 and rs_seat = 1;

select * from tb_roleseat;