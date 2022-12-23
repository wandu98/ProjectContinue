<![CDATA[
select *
from (
         select ws_num, ss_price, ss_img, ss_name, dv_fee, total, @rno := @rno + 1 as r
         from (
                  select ws_num, ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
                  from tb_wish wi join tb_sales sa
                                       on wi.ss_num = sa.ss_num join tb_delivery de
                                                                     on sa.dv_num = de.dv_num
                  where mem_id = #{mem_id}
              ) AA, (select @rno := 0) BB
     ) CC
where r >= #{startRow} and r <= #{endRow}
    ]]>


select ss_img, ss_price, ss_name
from tb_sales
where sl_id = 'codingking';

select *
from(
    select ss_img, ss_price, ss_name
    from tb_sales
    where sl_id = 'codingking'
) AA,
    (select @rno :=0) BB;

select *
from(
        select *,  @rno := @rno +1 as r
        from(
                select ss_img, ss_price, ss_name
                from tb_sales

            ) AA,
            (select @rno :=0) BB
    )CC
where r >=1 and r<=16;

-- Featured Product
-- All
select ss_num, ss_name, ss_price, ss_img
from tb_sales
order by ss_eperiod;


-- index search
-- 카테고리 선택시
select *
from tb_sales
where gm_code = 'dt0009' and ss_name like '%D%';

-- 카테고리 미선택시
select *
from tb_sales
where ss_name like '%D%';



select  ss_num, gm_code, sl_id, ss_name, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_description, dv_num
from tb_sales
where ss_num = '19';


SELECT gm.gm_code,  gm.gm_name, gm.gm_price, gm.gm_level, gm.gm_category, gm.gm_img
FROM tb_sales as rb join tb_game as gm
                         on rb.gm_code = gm.gm_code
WHERE ss_num = '19';

select count(*)
from(
    select ss_num, count(*)
    from tb_review
    where ss_num = '4') aa;

select count(*)
from(
        select  rv_num, mem_id, rv_content, rv_star, rv_filename, ss_num
        from tb_review
        where ss_num = '15') aa;


select count(*)
from tb_review
where ss_num = '4'
group by ss_num;

select ifnull(count(*),0)
from(
    select count(*)
    from tb_review
    where ss_num = '3'
    group by ss_num
    ) aa;


select ss_price, ss_stock
from tb_sales;




select *, @rno := @rno + 1 as r
from (
        select ss_num, gm_code, sl_id, ss_name, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_description, dv_num
        from tb_sales
        where ss_name like '%마%'
     ) AA, (select @rno :=0) BB;

-- 검색
select *
from (
        select *, @rno := @rno + 1 as r
        from (
                select ss_num, gm_code, sl_id, ss_name, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_description, dv_num
                from tb_sales
                where ss_name like '%마%'
        ) AA, (select @rno :=0) BB
    ) CC;
where r >= 1 and r <= 5;


select *
from (
         select *, @rno := @rno + 1 as r
         from (
                  select ss_num, gm_code, sl_id, ss_name, ss_price, ss_speriod, ss_eperiod, ss_stock, ss_img, ss_status, ss_description, dv_num
                  from tb_sales
                  where ss_name like '%c%' and gm_code like '%dt%'
              ) AA, (select @rno :=0) BB
     ) CC
where r >= 1 and r <= 5;


select *
from tb_sales;

select *
from tb_detail;

select od_num, sl.ss_num, ss_price, dt_amount, sl_id
from tb_detail dt join tb_sales sl
on dt.ss_num = sl.ss_num
where sl_id = 'digj1908';

select ss_name, ss_price, count(*) as cnt
from tb_detail dt join tb_sales sl
                       on dt.ss_num = sl.ss_num
where sl_id = 'digj1908'
group by dt.ss_num
order by cnt desc
limit 5;


select *, ss_price*cnt as sales
from (
        select ss_name, ss_price, count(*) as cnt, ss_img
        from tb_detail dt join tb_sales sl
                               on dt.ss_num = sl.ss_num
        where sl_id = 'digj1908' and DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')
        group by dt.ss_num
    ) AA
order by cnt desc, sales desc
limit 5;



select ss_name, ss_price, count(*) as cnt, ss_img
from tb_order od join tb_detail dt
on od.od_num = dt.od_num join tb_sales ts
on dt.ss_num = ts.ss_num
where sl_id = 'digj1908' and DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')
group by dt.ss_num;

select *, ss_price * cnt as sales
from (
        select ss_name, ss_price, count(*) as cnt, ss_img
        from tb_order od join tb_detail dt
        on od.od_num = dt.od_num join tb_sales ts
        on dt.ss_num = ts.ss_num
        where sl_id = 'digj1908' and DATE_FORMAT(od_date, '%Y-%m') = DATE_FORMAT(now(), '%Y-%m')
        group by dt.ss_num
    ) AA
order by cnt desc, sales desc
limit 5;


update tb_sales
set gm_code = , sl_id = , ss_price = , ss_speriod = , ss_eperiod = , ss_stock = , ss_img = , ss_status = ,
    ss_description = , dv_num = , ss_name =
where ss_num =

update tb_mem
set upoint = #{upoint}, apoint = #{apoint}
where mem_id = #{mem_id}

