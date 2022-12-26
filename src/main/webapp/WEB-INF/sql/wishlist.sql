select ws_num, ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
from tb_wish wi join tb_sales sa
    on wi.ss_num = sa.ss_num join tb_delivery de
    on sa.dv_num = de.dv_num
where mem_id = 'fjhdmj555';

update tb_sales
set ss_img = 'switch.png'
where ss_num = 9;


delete from tb_wish
where mem_id = 'gjdjj888';

insert into tb_wish(mem_id, ss_num)
values ('gjdjj888' , 5);



-- 아이디가 fjhdmj555인 사람의 위시리스트
select ws_num, ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
from tb_wish wi join tb_sales sa
                     on wi.ss_num = sa.ss_num join tb_delivery de
                                                   on sa.dv_num = de.dv_num
where mem_id = 'fjhdmj555';




-- 아이디가 fjhdmj555인 사람의 위시리스트에서 rno 적용
select ws_num, ss_price, ss_img, ss_name, dv_fee, total, @rno := @rno + 1
from (
        select ws_num, ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
        from tb_wish wi join tb_sales sa
                             on wi.ss_num = sa.ss_num join tb_delivery de
                                                           on sa.dv_num = de.dv_num
        where mem_id = 'fjhdmj555'
    ) AA, (select @rno := 0) BB;


-- 아이디가 fjhdmj555인 사람의 위시리스트 페이징 완료
select *
from (
        select ws_num, ss_price, ss_img, ss_name, dv_fee, total, @rno := @rno + 1 as r
        from (
            select ws_num, ss_price, ss_img, ss_name, dv_fee, ss_price+dv_fee as total
            from tb_wish wi join tb_sales sa
                                 on wi.ss_num = sa.ss_num join tb_delivery de
                                                               on sa.dv_num = de.dv_num
            where mem_id = 'fjhdmj555'
        ) AA, (select @rno := 0) BB
    ) CC
where r>=6 and r <=10;



select count(*) from tb_wish where mem_id = 'fjhdmj555';

select count(*)
from tb_wish
where mem_id = 'fjhdmj555'
group by mem_id;