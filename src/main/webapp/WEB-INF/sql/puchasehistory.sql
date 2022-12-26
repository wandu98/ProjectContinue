select od.od_num, od_date, mem_id, total, ss_num,
from tb_order od join tb_detail dt
on od.od_num = dt.od_num
where mem_id = 'gjdjj888';


select *
from tb_order od join tb_detail dt
on od.od_num = dt.od_num join tb_sales sl
on dt.ss_num = sl.ss_num
where mem_id = 'fjhdmj555';


select *
from tb_order od join tb_detail dt
on od.od_num = dt.od_num;


-- tb_order DTO이용
select dt.od_num, total, od_date
from tb_order od join tb_detail dt
on od.od_num = dt.od_num
where mem_id = 'fjhdmj555'
group by dt.od_num;


select dt.od_num, dt.ss_num, ss_name
from tb_detail dt join tb_sales sl
on dt.ss_num = sl.ss_num
where od_num = '202210010903-001';


select dt.od_num, total, od_date, od.mem_dvnum
from tb_order od join tb_detail dt
                      on od.od_num = dt.od_num
where mem_id = 'fjhdmj555'
group by dt.od_num
order by od_date desc;


