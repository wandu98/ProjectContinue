select mem_id, mem_nick, mem_name, mem_zip, mem_adr1, mem_adr2, mem_phone, mem_birth, mem_receive, mem_pic
from tb_mem
where mem_id = 'oejdf9090';


update tb_mem
set mem_name = '구천우', mem_nick = '장지동십만우'
where mem_id = 'oejdf9090';

update tb_mem
set mem_pic = 'ProfilePicture.png'
where mem_id = 'oejdf9090';