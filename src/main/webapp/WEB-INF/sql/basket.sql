select dv_fee + dv_extrafee as dv_sum, sl.dv_num
from tb_basket bk join tb_sales sl
                       on bk.ss_num = sl.ss_num
                  join tb_delivery dv on sl.dv_num = dv.dv_num
where mem_id = 'gjdjj888'
group by sl.dv_num


select rv_num, rv.mem_id, rv_content, rv_star, rv_filename, ss_num, mem_nick
from tb_review rv join tb_mem mb
                       on rv.mem_id = mb.mem_id
where rv_num = 1
order by rv_num desc;

select bk_num, bk_amount, mem_id, ss_name, ss_img, ss_price, sl.ss_num, dv_fee
from tb_basket bk join tb_sales sl
                       on bk.ss_num = sl.ss_num
                  join tb_delivery dv on sl.dv_num = dv.dv_num
where mem_id = 'gjdjj888';

select receiptNo
from (select concat(cast(d.receiptDate as char), right(concat('00000', rowCount + 1), 6)) as receiptNo,
             count(e.od_num) + 1                                                          as od_num,
             rowCount + 1                                                                 as rowCount
      from tb_order as e,
           (select concat(substr(date_format(now(), '%Y%m%d%H%i%s'), 1, 8))       as receiptDate,
                   (select od_num as cnt from tb_order order by cnt desc limit 1) as rowCount
            from dual) d) c;

INSERT INTO tb_order(od_num, od_date, mem_id, mem_dvnum, cp_code, umileage, pmileage, total)
VALUES ((select receiptNo
         from (select concat(cast(d.receiptDate as char), right(concat('00000', rowCount + 1), 6)) as receiptNo,
                      count(e.od_num) + 1                                                          as od_num,
                      rowCount + 1                                                                 as rowCount
               from tb_order as e,
                    (select concat(substr(date_format(now(), '%Y%m%d%H%i%s'), 1, 8))       as receiptDate,
                            (select od_num as cnt from tb_order order by cnt desc limit 1) as rowCount
                     from dual) d) c),
        now(), 'koochunwoo', 1, 'A0000', 0, 0, 149000);
