
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


select mem_id, mem_nick, mem_name, mem_phone, mem_joindate
from tb_mem
where date_format(mem_joindate, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d')
order by mem_joindate desc;

select *
from tb_mem;


select *
from tb_order;

-- 오늘 매출
select ifnull(sum(total), 0) as sum
from tb_order
where date_format(od_date, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d');

-- 어제 매출
select ifnull(sum(total), 0) as sum
from tb_order
where date_format(od_date, '%Y-%m-%d') = date_format(subdate(now(), interval 1 day), '%Y-%m-%d');


-- 타이틀별 판매액
select tbc.gc, ifnull(sale, 0) as sales
from (
         select substr(gm_code,1,2) as gc, dt_amount*ss_price as sale
         from tb_order od join tb_detail dt
                               on od.od_num = dt.od_num join tb_sales ts
                                                             on dt.ss_num = ts.ss_num
         where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')
         group by gc
     ) tba right join (select *
                       from (
                                select 'mn' gc from dual union all
                                select 'pt' gc from dual union all
                                select 'dt' gc from dual union all
                                select 'dl' gc from dual union all
                                select 'ol' gc from dual union all
                                select 'pn' gc from dual union all
                                select 'fc' gc from dual union all
                                select 'am' gc from dual union all
                                select 'pc' gc from dual union all
                                select 'jc' gc from dual union all
                                select 'ac' gc from dual
                            ) tbb
) tbc on tba.gc = tbc.gc;


-- 전일 타이틀별 판매액
select tbc.gc, ifnull(sale, 0) as sales
from (
         select substr(gm_code,1,2) as gc, dt_amount*ss_price as sale
         from tb_order od join tb_detail dt
                               on od.od_num = dt.od_num join tb_sales ts
                                                             on dt.ss_num = ts.ss_num
         where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(subdate(now(), interval 1 day), '%Y-%m-%d')
         group by gc
     ) tba right join (select *
                       from (
                                select 'mn' gc from dual union all
                                select 'pt' gc from dual union all
                                select 'dt' gc from dual union all
                                select 'dl' gc from dual union all
                                select 'ol' gc from dual union all
                                select 'pn' gc from dual union all
                                select 'fc' gc from dual union all
                                select 'am' gc from dual union all
                                select 'pc' gc from dual union all
                                select 'jc' gc from dual union all
                                select 'ac' gc from dual
                            ) tbb
) tbc on tba.gc = tbc.gc;
