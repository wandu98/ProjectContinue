# Continue? 
ITWILL 교육기관에서 진행한 팀 프로젝트 입니다. <br>
콘솔게임 오픈마켓 및 모집사이트입니다.


 개발 기간 : 22.11.16 ~ 22.12.26 <br>
 참여 인원 : 4명 <br>
 담당 구현 파트  
  - 상품 메인페이지 (인기 검색어, 최근 검색어, 인기상품, 판매완료 상품, 페이징, 정렬기능)
  - 상품 상세페이지 (수량 변동 시 가격변동, 상품 리뷰)
  - 판매자 (상품등록, 상품리스트, 주문조회, 배송정책, 리뷰)
  - 주문 상세보기
  - 결제기능 (iamport 이용한 kakaopay 구현)
  - 미니게임
  
##### 배포주소

Project Hosting : http://wnadu98.cafe24.com/


##### 임시 관리자 계정

+ 아이디 : admin <br>
+ 비밀번호 : admin <br>
http://wnadu98.cafe24.com/admin/login

##### 일반 계정

+ 아이디 : 12345 <br>
+ 비밀번호 : 12345 <br>
http://wnadu98.cafe24.com/mem/login

##### 판매자 계정

+ 아이디 : admin <br>
+ 비밀번호 : 12345


## 사용기술

 #### Back-End
+ Java 1.8
+ Spring Boot 2.7.5
+ Maven 3.1.0
+ MyBatis 2.2.2
+ MariaDB 3.0.6


#### front-End
+ Html
+ CSS
+ JavaScript
+ JQuery 3.6.1


#### Deploy
+ CAFE24

## 기능구현

### 메인 페이지

<img width="700" src="https://user-images.githubusercontent.com/110227551/220277987-42616d01-668d-43e4-98fc-365a584f44e7.gif"/>


+ swiper slide를 이용하여 메인페이지 이미지 슬라이드 효과 적용.

+ model.addAttribute를 이용해 name으로 지정한 값을 view 단에서 c태그를 이용해 메인페이지 출력.

---

### 미니게임

<img width="700" src="https://user-images.githubusercontent.com/110227551/220279361-69337f1e-f732-465c-893b-8e7cfd0f2eb2.gif"/>



### 페이징




### 이미지 업로드




### 상품 검색
<img width="700" src="https://user-images.githubusercontent.com/103232761/219443030-ebd73594-66a9-432b-82c1-7dc2e6e5c09d.gif"/>

+ LIKE CONCAT('%','','%')를 이용해 상품 검색 기능 적용.



### 장바구니 추가

<img width="700" src="https://user-images.githubusercontent.com/103232761/219446949-9ef0d24d-c48f-48b7-ac9e-977f56c23b82.gif"/>

+ ajax를 이용해 상품을 장바구니로 담을 수 있고 구매수량에 따른 합계 계산을 해주며 상품 수량에 따른 구매수량을 제한했습니다.

<img width="400" alt="장바구니1" src="https://user-images.githubusercontent.com/103232761/219496366-81213087-d118-4a18-b1ab-2b0ebe2841c4.png"><img width="400" alt="장바구니2" src="https://user-images.githubusercontent.com/103232761/219496381-8e5e8b66-ed1b-482e-8a55-e529367f22be.png">

+ 상품을 장바구니에 담는 과정에서 result의 값에 따라 결과를 다르게 구현했습니다.




### 관리자 페이지





### 판매자 페이지




### 모집 페이지




### 마이페이지



### 주문-결제(카카오페이)

<img width="700" height="500" src="https://user-images.githubusercontent.com/103232761/219449296-7437749e-fac1-467a-b004-39fbdabf0313.gif"/>

<img width="400" height="700" src="https://user-images.githubusercontent.com/103232761/219449702-c1cb9e47-d4e5-42e8-a861-6615c80483a9.jpeg"><img width="400" height="700" src="https://user-images.githubusercontent.com/103232761/219501319-8c3cc0d7-a5ad-45b6-8ae9-e4b063d15c73.jpeg">


+ 모바일로 QR코드 스캔 or 핸드폰 번호와 생년월일을 입력 시 TEST결제할 수 있게 구현하였다.

+ ajax를 이용해 상품 개별삭제 , 상품 전체삭제 
+ 또한 주문을 누르면 카카오페이를(아임포트 API) 이용해 결제를 구현했습니다.

---

## Query Log 설정

<img width="600" alt="쿼리로그3" src="https://user-images.githubusercontent.com/103232761/219489670-a4a5d5ef-cfbd-45fa-8985-0eadfd95cd75.png">

<img width="523" alt="쿼리로그2" src="https://user-images.githubusercontent.com/103232761/219489483-bd58183b-c685-4d0b-887d-ecb1a28eb511.png">

<img width="1106" alt="쿼리로그" src="https://user-images.githubusercontent.com/103232761/219489422-5c298e94-9f1c-45d5-a001-c969b2765399.png">


