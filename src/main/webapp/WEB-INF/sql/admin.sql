
-- 하루 주문 수
select count(*)
from tb_detail;

select dt_num
from tb_detail as dt join tb_order as od
on dt.od_num = od.od_num
where DATE_FORMAT(od_date, '%Y-%m-%d') = DATE_FORMAT(now(), '%Y-%m-%d')