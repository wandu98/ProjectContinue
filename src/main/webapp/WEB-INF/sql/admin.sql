
-- 하루 주문 수
select count(*)
from tb_detail;

select dt_num
from tb_detail as dt join tb_order as od
on dt.od_num = od.od_num
where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')


--
SELECT gm_code
FROM tb_game
WHERE gm_code LIKE 'PT%'
ORDER BY gm_code DESC
LIMIT 1;

SELECT gm_code, gm_name, gm_price, gm_category, gm_level
FROM tb_game
WHERE gm_code LIKE '%dt%'
ORDER BY gm_code ASC;