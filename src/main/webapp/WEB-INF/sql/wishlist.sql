select ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
from tb_wish wi join tb_sales sa
    on wi.ss_num = sa.ss_num join tb_delivery de
    on sa.dv_num = de.dv_num
where mem_id = 'fjhdmj555';