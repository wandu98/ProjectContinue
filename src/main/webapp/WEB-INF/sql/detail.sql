select od.od_num, mem_id, dt_prog, count(dt_prog)
from tb_order od join tb_detail dt
on od.od_num = dt.od_num
where mem_id = 'fjhdmj555'
group by dt_prog
order by dt_prog;


select od.od_num, mem_id, dt_prog, count(dt_prog)
from tb_order od join tb_detail dt
                      on od.od_num = dt.od_num
where mem_id = 'fjhdmj555'
group by dt_prog;

select *
from (
        select 'J01' dt_prog from dual union all
        select 'J02' dt_prog from dual union all
        select 'J03' dt_prog from dual union all
        select 'J04' dt_prog from dual union all
        select 'J05' dt_prog from dual union all
        select 'J06' dt_prog from dual union all
        select 'J07' dt_prog from dual union all
        select 'J08' dt_prog from dual
     ) tb;



select *, count(dt.dt_prog)
from tb_order od join tb_detail dt
                      on od.od_num = dt.od_num right join (select *
from (
    select 'J01' dt_prog from dual union all
    select 'J02' dt_prog from dual union all
    select 'J03' dt_prog from dual union all
    select 'J04' dt_prog from dual union all
    select 'J05' dt_prog from dual union all
    select 'J06' dt_prog from dual union all
    select 'J07' dt_prog from dual union all
    select 'J08' dt_prog from dual
    ) tb) tbj on tbj.dt_prog = dt.dt_prog
where mem_id = 'fjhdmj555'
group by tbj.dt_prog
order by tbj.dt_prog;



select nvl(cnt, 0) as ct
from (
        select od.od_num, mem_id, dt_prog, count(dt_prog) as cnt
        from tb_order od join tb_detail dt
        on od.od_num = dt.od_num
        where mem_id = 'fjhdmj555'
        group by dt_prog
        order by dt_prog
    ) tba right join (select *
                        from (
                                select 'J01' dt_prog from dual union all
                                select 'J02' dt_prog from dual union all
                                select 'J03' dt_prog from dual union all
                                select 'J04' dt_prog from dual union all
                                select 'J05' dt_prog from dual union all
                                select 'J06' dt_prog from dual union all
                                select 'J07' dt_prog from dual union all
                                select 'J08' dt_prog from dual
                             ) tbb
                    ) tbc on tba.dt_prog = tbc.dt_prog;




from () left join ( select od.od_num, mem_id, dt_prog, count(dt_prog)
        from tb_order od join tb_detail dt
        on od.od_num = dt.od_num
        where mem_id = 'fjhdmj555'
        group by dt_prog
        order by dt_prog) tbb