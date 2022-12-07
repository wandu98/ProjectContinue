-- Latest Product (index)
select *
from tb_sales
where ss_status = 'S1'
order by ss_speriod desc;


-- Top Rated Product (index)
select sa.ss_num, ss_name, ss_price, ss_img
from tb_sales sa join tb_detail dt
on sa.ss_num = dt.ss_num
group by dt.ss_num
order by count(*) desc;


-- Review Product (index)
select sa.ss_num, ss_name, ss_price, ss_img
from tb_sales sa join tb_review rv
on sa.ss_num = rv.ss_num
group by sa.ss_num
order by count(*) desc;



-- Featured Product
-- All
select ss_num, ss_name, ss_price, ss_img
from tb_sales
order by ss_eperiod;