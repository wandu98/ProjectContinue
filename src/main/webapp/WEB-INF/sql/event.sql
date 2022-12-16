create table tb_evt
(
    evt_num     int AUTO_INCREMENT primary key  -- 게시번호
    ,
    evt_title   varchar(255)           not null -- 제목
    ,
    evt_start   datetime default now() not null -- 이벤트시작일
    ,
    evt_end     datetime default now() not null -- 이벤트종료일
    ,
    evt_views   int                    not null -- 조회수
    ,
    evt_desc    text(5000)             not null -- 이벤트설명
    ,
    evt_regdate datetime default now() not null -- 작성일
);

INSERT INTO tb_evt(evt_title, evt_start, evt_end, evt_views, evt_desc, evt_regdate)
values ('닌텐도 2022 추석 세일', '20220101', '20220130', 40451, '252m.jpg', '20221123')
     ,('추석 맞이 넨텐도 Switch 다운로드 스토어 10% 할인![종료]', '20220205', '20220305', 39000, '250m.jpg', '20221124')
     ,('닌텐도 6월 프로모션![종료]', '20211207', '20211231', 72376, '243m.jpg', '20221125');