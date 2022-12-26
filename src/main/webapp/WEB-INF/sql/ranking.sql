-- 판매순
select ga.gm_code, ga.gm_name, count(*)
from tb_detail dt join tb_sales sa
on dt.ss_num = sa.ss_num join tb_game ga
on sa.gm_code = ga.gm_code
group by ga.gm_code
order by count(*) desc;


select ga.gm_code, ga.gm_name, count(*)
from tb_rcrboard rb
         join tb_game ga
              on rb.gm_code = ga.gm_code
where date_format(rcrbrd_date, '%Y-%m')
group by ga.gm_code
order by count(*) desc;


select tg.gm_code, tg.gm_name, count(*) as cnt
from tb_rcrboard rb join tb_recruitinfo ri
on rb.rcrbrd_num = ri.rcrbrd_num join tb_game tg on rb.gm_code = tg.gm_code
where date_format(rcrbrd_date, '%Y-%m') = date_format(now(), '%Y-%m')
group by rb.rcrbrd_num
order by cnt desc;