-- 구천우
select *
from tb_game;


-- 상품 테이블
create table tb_sales
(
    ss_num         int AUTO_INCREMENT primary key        -- 판매 상품 번호
    ,
    gm_code        varchar(100)           not null       -- 품목 코드
    ,
    sl_id          varchar(20)            not null       -- 판매자 id
    ,
    ss_name        varchar(50)            not null       -- 상품이름
    ,
    ss_price       int      default 0     not null       -- 판매가
    ,
    ss_speriod     datetime default now() not null       -- 판매 시작일
    ,
    ss_eperiod     datetime default now() not null       -- 판매 종료일
    ,
    ss_stock       int      default 0     not null       -- 재고 수량
    ,
    ss_img         varchar(255)           not null       -- 대표 이미지명
    ,
    ss_status      varchar(20)            not null       -- 판매 상태
    ,
    ss_description text(5000)             not null       -- 상세 설명
    ,
    dv_num         int                    not null       -- 배송 정책 번호
    ,
    FOREIGN KEY (gm_code) REFERENCES tb_game (gm_code)   -- 게임기 / 게임 타이틀
    ,
    FOREIGN KEY (sl_id) REFERENCES tb_seller (sl_id)     -- 판매자
    ,
    FOREIGN KEY (dv_num) REFERENCES tb_delivery (dv_num) -- 배송 정책
);


-- 게임기 / 게임 타이틀
create table tb_game
(
    gm_code     varchar(100) primary key        -- 품목 코드
    ,
    gm_name     varchar(255) not null           -- 품목명
    ,
    gm_price    int          not null default 0 -- 가격
    ,
    gm_level    varchar(100) not null           -- 이용 등급
    ,
    gm_category varchar(100) not null           -- 카테고리
    ,
    gm_img      varchar(255) not null           -- 이미지
);


-- 포토 리뷰
create table tb_review
(
    rv_num      int AUTO_INCREMENT primary key        -- 리뷰 번호
    ,
    mem_id      varchar(20) not null                  -- 회원 id
    ,
    rv_content  text(5000)  not null                  -- 내용
    ,
    rv_star     int         not null                  -- 별점
    ,
    rv_filename varchar(255)                          -- 파일명
    ,
    ss_num      int         not null                  -- 판매 상품 번호
    ,
    rv_date     datetime    not null default CURRENT_TIMESTAMP,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)   -- 회원
    ,
    FOREIGN KEY (ss_num) REFERENCES tb_sales (ss_num) -- 상품
);


-- 1:1문의
create table tb_question
(
    qs_num      int AUTO_INCREMENT primary key      -- 문의 번호
    ,
    mem_id      varchar(20)            not null     -- 회원 id
    ,
    qs_content  text(5000)             not null     -- 작성 내용
    ,
    qs_date     datetime default now() not null     -- 작성일
    ,
    qs_category varchar(50)            not null     -- 문의 카테고리
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id) -- 회원
);

-- 문의 답변
create table tb_answer
(
    qs_num      int primary key                          -- 문의 번호
    ,
    ans_content text(5000)             not null          -- 답변 내용
    ,
    ans_date    datetime default now() not null          -- 작성일
    ,
    FOREIGN KEY (qs_num) REFERENCES tb_question (qs_num) -- 1:1문의
);


-- 김주완
-- 장바구니
CREATE table tb_basket
(                                                                -- 장바구니
    bk_num    int           not null AUTO_INCREMENT PRIMARY KEY, -- 장바구니 번호
    ss_num    int           not null,                            -- 판매 상품 번호
    bk_amount int default 1 not null,                            -- 수량
    mem_id    varchar(20)   not null,                            -- 회원ID
    FOREIGN KEY (ss_num) REFERENCES tb_sales (ss_num),           -- 판매상품 FK
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)              -- 회원 FK
);


-- 주문
CREATE table tb_order
(                                                                -- 주문서
    od_num    varchar(50)                  not null PRIMARY KEY, -- 주문번호
    od_date   datetime     default now()   not null,             -- 주문일자
    mem_id    varchar(20)                  not null,             -- 회원ID
    # dv_num    int                          not null,             -- 배송정책
    mem_dvnum int                          not null,             -- 회원 배송지 번호
    cp_code   varchar(100) default 'A0000' not null,             -- 쿠폰 코드
    umileage  int          default 0       not null,             -- 사용 적립금
    pmileage  int          default 0       not null,             -- 예정 적립금
    total     int          default 0       not null,             -- 총결제금액
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id),             -- 회원 FK
    # FOREIGN KEY (dv_num) REFERENCES tb_delivery (dv_num),        -- 배송 FK
    FOREIGN KEY (mem_dvnum) REFERENCES tb_memdv (mem_dvnum),     -- 회원배송지 정보 FK
    FOREIGN KEY (cp_code) REFERENCES tb_coupon (cp_code)         -- 쿠폰 FK
);


-- 주문상세보기
CREATE table tb_detail
(                                                              -- 상세보기
    dt_num    int         not null AUTO_INCREMENT PRIMARY KEY, -- 상세보기번호
    od_num    varchar(50) not null,                            -- 주문번호
    dv_num    int         not null,                            -- 배송정책
    dt_prog   varchar(10) not null,                            -- 진행상태
    dt_odstts varchar(10) not null,                            -- 주문상태
    dt_refund char(1)     not null,                            -- 환불가능여부
    dt_amount int         not null,                            -- 주문수량
    ss_num    int         not null,                            -- 판매상품번호
    dt_paymnt varchar(50) not null,                            -- 결제수단
    dt_msg    varchar(255),                                    -- 배송메세지
    FOREIGN KEY (od_num) REFERENCES tb_order (od_num),         -- 주문 FK
    FOREIGN KEY (dv_num) REFERENCES tb_delivery (dv_num),      -- 배송 FK
    FOREIGN KEY (ss_num) REFERENCES tb_sales (ss_num)          -- 판매상품 FK
);


-- 교환반품
CREATE table tb_er
(                                                      -- 교환/반품
    er_num   int          not null AUTO_INCREMENT PRIMARY KEY,
    dt_num   int          not null,
    er_cause varchar(255) not null,
    er_img   varchar(255),
    er_email varchar(100) not null,
    FOREIGN KEY (dt_num) REFERENCES tb_detail (dt_num) -- 상세보기 FK
);


-- 쿠폰
create table tb_coupon
(
    cp_code    varchar(100) default 'A0000' not null PRIMARY KEY,
    cp_name    varchar(50)                  not null,
    cp_speriod datetime     default now()   not null,
    cp_eperiod datetime     default now()   not null,
    cp_percent int                          not null
);


-- 쿠폰리스트
create table tb_couponlist
(
    cl_num  int not null AUTO_INCREMENT PRIMARY KEY,
    cp_code varchar(100),
    mem_id  varchar(20),
    FOREIGN KEY (cp_code) REFERENCES tb_coupon (cp_code),
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)
);


-- 김홍승
-- 판매자
CREATE TABLE tb_seller
(
    sl_id       varchar(20)  NOT NULL PRIMARY KEY    -- 판매자ID
    ,
    sl_pw       varchar(20)  NOT NULL                -- 판매자PW
    ,
    sl_name     varchar(30)  NOT NULL                -- 사업자명
    ,
    sl_zip      varchar(6)   NOT NULL                -- 우편번호
    ,
    sl_adr1     varchar(255) NOT NULL                -- 주소1
    ,
    sl_adr2     varchar(255) NOT NULL                -- 주소2
    ,
    sl_phone    varchar(20)  NOT NULL                -- 연락처
    ,
    sl_birth    date         NOT NULL                -- 생년월일
    ,
    sl_grade    varchar(20)  NOT NULL default 'snew' -- 회원등급
    ,
    sl_receive  char(1)      NOT NULL default 'N'    -- 수신여부
    ,
    sl_number   varchar(12)  NOT NULL                -- 사업자번호
    ,
    sl_bank     varchar(30)  NOT NULL                -- 계좌번호
    ,
    sl_bankcode int          NOT NULL                -- 은행코드
);


-- 배송정책
CREATE TABLE tb_delivery
(
    dv_num      int          NOT NULL AUTO_INCREMENT PRIMARY KEY -- 배송정책번호
    ,
    sl_id       varchar(20)  NOT NULL                            -- 판매자ID
    ,
    dv_exist    CHAR(1)      NOT NULL                            -- 배송유무
    ,
    dv_how      varchar(10)  NOT NULL                            -- 배송방법
    ,
    dv_courier  varchar(50)  NOT NULL                            -- 택배사
    ,
    dv_fee      int          NOT NULL                            -- 상품별 배송비
    ,
    dv_extrafee int          NOT NULL default 0                  -- 제주/도서산간 추가배송비
    ,
    dv_adr1     varchar(255) NOT NULL                            -- 출고지주소1
    ,
    dv_adr2     varchar(255) NOT NULL                            -- 출고지주소2
    ,
    dv_rffee    int          NOT NULL                            -- 반품배송비(편도)
    ,
    dv_exfee    int          NOT NULL                            -- 교환배송비(왕복)
    ,
    dv_exadr1   varchar(255) NOT NULL                            -- 반품교환지 주소1
    ,
    dv_exadr2   varchar(255) NOT NULL                            -- 반품교환지 주소2
    ,
    FOREIGN KEY (sl_id) REFERENCES tb_seller (sl_id)
);


-- 회원
CREATE TABLE tb_mem
(
    mem_id       varchar(20)  NOT NULL PRIMARY KEY                  -- 회원ID
    ,
    mem_pw       varchar(20)  NOT NULL                              -- 회원PW
    ,
    mem_nick     varchar(20)  NOT NULL UNIQUE                       -- 닉네임
    ,
    mem_name     varchar(20)  NOT NULL                              -- 이름
    ,
    mem_zip      varchar(6)   NOT NULL                              -- 우편번호
    ,
    mem_adr1     varchar(255) NOT NULL                              -- 주소1
    ,
    mem_adr2     varchar(255) NOT NULL                              -- 주소2
    ,
    mem_phone    varchar(20)  NOT NULL                              -- 연락처
    ,
    mem_email    varchar(255) not null                              -- 이메일
    ,
    mem_birth    date         NOT NULL                              -- 생년월일
    ,
    mem_grade    varchar(20)  NOT NULL default 'new'                -- 회원등급
    ,
    upoint       int          NOT NULL default 0                    -- 가용적립금
    ,
    apoint       int          NOT NULL default 0                    -- 누적적립금
    ,
    mem_receive  char(1)      NOT NULL default 'N'                  -- 수신여부
    ,
    good         int          NOT NULL default 0                    -- 좋아요
    ,
    buyer_bad    int          NOT NULL default 0                    -- 누적신고횟수
    ,
    mem_pic      varchar(255) NOT NULL default 'ProfilePicture.png' -- 프로필사진
    ,
    mem_joindate datetime     NOT NULL default now()                -- 가입일
);


-- 회원 배송지 정보
CREATE TABLE tb_memdv
(
    mem_dvnum   int          NOT NULL AUTO_INCREMENT PRIMARY KEY -- 배송지정보번호
    ,
    mem_id      varchar(20)  NOT NULL                            -- 회원ID
    ,
    mem_dvinfo  varchar(20)  NOT NULL                            -- 받으시는분
    ,
    mem_dvzip   varchar(6)   NOT NULL                            -- 우편번호
    ,
    mem_dvadr1  varchar(255) NOT NULL                            -- 주소1
    ,
    mem_dvadr2  varchar(255) NOT NULL                            -- 주소2
    ,
    mem_dvphone varchar(20)  NOT NULL                            -- 핸드폰
    ,
    mem_dvnick  varchar(10)  NOT NULL                            -- 별칭
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)
);


-- 위시리스트
CREATE TABLE tb_wish
(
    ws_num int         NOT NULL AUTO_INCREMENT PRIMARY KEY -- 위시리스트 번호
    ,
    mem_id varchar(20) NOT NULL                            -- 회원ID
    ,
    ss_num int         NOT NULL                            -- 품목코드
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id),
    FOREIGN KEY (ss_num) REFERENCES tb_sales (ss_num)
);


-- 회원평가
/*CREATE TABLE tb_evaluation
(
    eval_num     int          NOT NULL AUTO_INCREMENT PRIMARY KEY -- 회원평가 게시판 번호
    ,
    mem_id       varchar(20)  NOT NULL                            -- 회원ID
    ,
    eval_content varchar(255) NOT NULL                            -- 내용
    ,
    eval_regdate datetime default now()                           -- 등록일
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)
);*/


-- 공지사항
CREATE TABLE tb_nt
(
    nt_num     int          NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nt_title   varchar(255) NOT NULL,
    nt_cmt     text(5000)   NOT NULL,
    nt_regdate datetime     NOT NULL default now(),
    nt_views   int          NOT NULL,
    rownum     int          not null
);


-- 최다은
-- 모집정보
create table tb_recruitinfo
(
    ri_num     INT AUTO_INCREMENT primary key                    -- 모집일련번호
    ,
    mem_id     varchar(20) not null                              -- 회원ID
    ,
    rcrbrd_num int         not null                              -- 게시판 글번호
    ,
    ri_seat    int         not null                              -- 좌석번호
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)              -- 회원ID
    ,
    FOREIGN KEY (rcrbrd_num) REFERENCES tb_rcrboard (rcrbrd_num) -- 게시판 글번호
);


-- 모집게시판
create table tb_rcrboard
(
    rcrbrd_num     INT AUTO_INCREMENT primary key      -- 게시판 글번호
    ,
    mem_id         varchar(20)               not null  -- 회원ID
    ,
    rcrbrd_subject varchar(255)              not null  -- 글제목
    ,
    rcrbrd_content text(5000)                not null  -- 글내용
    ,
    rcrbrd_pw      varchar(20)               not null  -- 게시판PW
    ,
    rcrbrd_views   int         default 0     not null  -- 조회수
    ,
    rcrbrd_date    datetime    default now() not null  -- 등록일
    ,
    rcrbrd_ip      varchar(50)               not null  -- IP
    ,
    gm_code        varchar(100)              not null  -- 품목코드
    ,
    rcrbrd_status  varchar(20) default '진행중' not null  -- 모집 진행상태
    ,
    rcrbrd_edate   datetime    default now() not null  -- 모집 마감일
    ,
    rcrbrd_max     int                       not null  -- 모집 최대인원
    ,
    rcrbrd_adr     varchar(255)              not null  -- 모집 장소
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)    -- 회원ID
    ,
    FOREIGN KEY (gm_code) REFERENCES tb_game (gm_code) -- 품목코드
);

-- 이벤트신청자
create table tb_evtapl
(
    evtapl_num  int AUTO_INCREMENT primary key        -- 일련번호
    ,
    evt_num     int                    not null       -- 게시코드
    ,
    mem_id      varchar(20)            not null       -- 회원ID
    ,
    evtapl_date datetime default now() not null       -- 신청날짜
    ,
    FOREIGN KEY (evt_num) REFERENCES tb_evt (evt_num) -- 게시코드
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)   -- 회원ID
);


-- 이벤트게시판
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


-- 모집댓글
create table tb_comment
(
    com_num     int AUTO_INCREMENT primary key                   -- 모집댓글번호
    ,
    rcrbrd_num  int                    not null                  -- 게시판 글번호
    ,
    mem_id      varchar(20)            not null                  -- 회원ID
    ,
    com_content varchar(255)           not null                  -- 내용
    ,
    com_date    datetime default now() not null                  -- 등록일
    ,
    com_grpno   int                    not null                  -- 그룹번호
    ,
    com_indent  int      default 0     not null                  -- 들여쓰기
    ,
    com_ansnum  int                    not null                  -- 댓글순서
    ,
    FOREIGN KEY (mem_id) REFERENCES tb_mem (mem_id)              -- 회원ID
    ,
    FOREIGN KEY (rcrbrd_num) REFERENCES tb_rcrboard (rcrbrd_num) -- 게시판글번호
);

-- 역할 테이블
create table tb_role
(
    rl_num     int AUTO_INCREMENT primary key, -- 역할 일련번호
    rl_name    varchar(255) not null,          -- 역할 이름
    rcrbrd_num int          not null,          -- 모집 게시판 글 번호
    FOREIGN KEY (rcrbrd_num) REFERENCES tb_rcrboard (rcrbrd_num)
);

-- 역할 배정 테이블
create table tb_roleseat
(
    rs_num     int AUTO_INCREMENT primary key, -- 역할 배정 일련번호
    rl_name    varchar(255) not null,          -- 역할 이름
    rcrbrd_num int          not null,          -- 모집 게시판 글 번호
    rs_seat    int          not null,          -- 좌석 코드
    FOREIGN KEY (rcrbrd_num) REFERENCES tb_rcrboard (rcrbrd_num)
);

create table tb_search
(
    sc_num   int AUTO_INCREMENT primary key,  -- 검색어 일련번호
    sc_word  varchar(255)           not null, -- 검색어 내용
    sc_date  datetime default now() not null, -- 단어 등록일
    sc_where varchar(255)           not null  -- 검색된 페이지 구분
);

-- 평점 테이블
create table tb_rating
(
    rt_num     int AUTO_INCREMENT primary key, -- 평점 일련번호
    rt_goodbad varchar(255) not null,          -- 좋아요/싫어요
    rt_content varchar(255) not null,          -- 평점 내용
    give_id    varchar(20)  not null,          -- 추천한 회원 아이디
    receive_id varchar(20)  not null,          -- 추천 받은 회원 아이디
    rcrbrd_num int          not null,          -- 추천한 모집 게시판 글 번호
    FOREIGN KEY (rcrbrd_num) REFERENCES tb_rcrboard (rcrbrd_num)
);

create table tb_minigame
(
    mg_num  int AUTO_INCREMENT primary key,  -- 미니게임 일련번호
    mem_id  varchar(20)            not null, -- 회원 아이디
    mg_dice varchar(30)            not null, -- 주사위 눈
    mg_date datetime default now() not null  -- 미니게임 날짜
);

create table tb_attendence
(
    at_num  int AUTO_INCREMENT primary key, -- 출석 일련번호
    mem_id  varchar(20) not null,           -- 회원 아이디
    at_date date        not null,           -- 출석 날짜
    foreign key (mem_id) references tb_mem (mem_id)
);

select *
from tb_role;

select *
from tb_roleseat;

drop table tb_roleseat;
drop table tb_role;
drop table tb_rcrboard;
drop table tb_answer;
drop table tb_basket;
drop table tb_comment;
drop table tb_coupon;
drop table tb_couponlist;
drop table tb_delivery;
drop table tb_detail;
drop table tb_er;
-- drop table tb_evaluation;
drop table tb_evt;
drop table tb_evtapl;
drop table tb_game;
drop table tb_mem;
drop table tb_memdv;
drop table tb_nt;
drop table tb_order;
drop table tb_question;
drop table tb_recruitinfo;
drop table tb_review;
drop table tb_sales;
drop table tb_seller;
drop table tb_wish;
drop table tb_rcrboard;
drop table tb_search;
drop table tb_rating;
drop table tb_minigame;
drop table tb_attendence;

SET foreign_key_checks = 0; -- 외래키 해제
SET foreign_key_checks = 1; -- 외래키 설정

truncate table tb_sales;

commit;
