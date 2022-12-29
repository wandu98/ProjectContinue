<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 푸터 시작 -->
<footer class="footer spad">
  <div class="container">
    <div class="row">
      <div class="col-lg-3 col-md-6 col-sm-6">
        <div class="footer__about">
          <div class="footer__about__logo">
            <a href="/"><img src="/images/logo.png" alt=""></a>
          </div>
          <ul>
            <li>서울특별시 강남구 테헤란로1길 16</li>
            <li>삼원빌딩</li>
            <li>Phone : +82 010-8814-8233</li>
            <li>Email : koochunwoo@gmail.com</li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
        <div class="footer__widget">
          <h6>메뉴</h6>
          <ul>
            <li><a href="#">미니 게임</a></li>
            <li><a href="/mem/login">로그인</a></li>
            <li><a href="/mem/signup">회원가입</a></li>
            <li><a href="/mypage/cart">장바구니</a></li>
            <li><a href="/mypage/mypage">마이페이지</a></li>
          </ul>
          <ul>
            <li><a href="/sales/sales">오픈 마켓</a></li>
            <li><a href="/recruit">모집 게시판</a></li>
            <li><a href="/notice/noticeList">공지사항</a></li>
            <li><a href="/event/event">이벤트</a></li>
          </ul>
        </div>
      </div>
      <div class="col-lg-4 col-md-12">
        <div class="footer__widget">
          <div id="map" style="width:100%;height:300px;"></div>

          <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb4067645ade38179f4d97dbebf1b6b0"></script>
          <script>
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div
                    mapOption = {
                      center: new kakao.maps.LatLng(37.4987846719974, 127.031703595662), // 지도의 중심좌표
                      level: 3 // 지도의 확대 레벨
                    };

            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 마커가 표시될 위치입니다
            var markerPosition  = new kakao.maps.LatLng(37.4987846719974, 127.031703595662);

            // 마커를 생성합니다
            var marker = new kakao.maps.Marker({
              position: markerPosition
            });

            // 마커가 지도 위에 표시되도록 설정합니다
            marker.setMap(map);

            // 아래 코드는 지도 위의 마커를 제거하는 코드입니다
            // marker.setMap(null);
          </script>
        </div>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-12">
        <div class="footer__copyright">
          <div class="footer__copyright__text"><p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | Continue?
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p></div>
          <div class="footer__copyright__payment"><img src="/images/payment-item.png" alt=""></div>
        </div>
      </div>
    </div>
  </div>
</footer>
<!-- 푸터 끝 -->

<!-- 자바스크립트 플러그인 -->

<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/mixitup.min.js"></script>
<script src="/js/owl.carousel.min.js"></script>
<script src="/js/main.js"></script>

</body>

</html>