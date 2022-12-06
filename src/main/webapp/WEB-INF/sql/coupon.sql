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