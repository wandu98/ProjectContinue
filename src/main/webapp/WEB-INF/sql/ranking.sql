-- 판매순
select ga.gm_code, ga.gm_name, count(*)
from tb_detail dt join tb_sales sa
on dt.ss_num = sa.ss_num join tb_game ga
on sa.gm_code = ga.gm_c
ode
group by ga.gm_code
order by count(*) desc;