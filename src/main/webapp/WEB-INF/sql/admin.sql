
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


select sum(total)
from tb_order;

select sum(total)
from tb_order
where date_format(od_date, '%Y') = date_format(now(), '%Y');


-- 이용자수
select distinct(mem_id)
from tb_order;

-- 전체 구매고객
select count(*) as cnt
from (
         select distinct(mem_id)
         from tb_order
     ) AA;


select distinct (mem_id)
from tb_order
where date_format(od_date, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d');

-- 하루 구매고객
select ifnull(count(*),0) as cnt
from (
        select distinct (mem_id)
        from tb_order
        where date_format(od_date, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d')
    ) AA;


select *
from tb_seller;