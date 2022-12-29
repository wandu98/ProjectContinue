select cp_code
from tb_couponlist
where mem_id = 'fjhdmj555';

select  *
from tb_coupon
where cp_code = 'A0002' or cp_code = 'A0001';


select cl_num, cl.cp_code, mem_id, cp_name, cp_speriod, cp_eperiod, cp_percent
from tb_couponlist cl join tb_coupon cp
    on cl.cp_code = cp.cp_code
    where mem_id = 'fjhdmj555';



select cp.cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent
from tb_couponlist cl join tb_coupon cp
                           on cl.cp_code = cp.cp_code
where mem_id = 'fjhdmj555';


select cp.cp_code, cp_name, cp_speriod, cp_eperiod, cp_percent
from tb_couponlist cl join tb_coupon cp
                           on cl.cp_code = cp.cp_code
where mem_id = 'gjdjj888';

select count(mem_dvnick)
from tb_memdv
where mem_dvnick = '친구집' and mem_id = 'gjdjj888';


select od.od_num, od_date, pmileage, ss_name
from tb_order od join tb_detail dt
    on od.od_num = dt.od_num join tb_sales ts
    on dt.ss_num = ts.ss_num
where dt_prog = 'J06' and mem_id = 'fjhdmj555';

insert into tb_couponlist (cp_code, mem_id)
values ('A0001', '12345');