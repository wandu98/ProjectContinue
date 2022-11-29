<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-28
  Time: 오전 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- ======= Footer ======= -->
<footer id="footer">

  <div class="footer-top">
    <div class="container">
      <div class="row">

        <div class="col-lg-3 col-md-6 footer-contact">
          <h3>Continue?</h3>
          <p>
            서울특별시 강남구 <br>
            테헤란로1길 16 <br>
            삼원빌딩 <br><br>
            <strong>Phone:</strong> +82 010-8814-8233<br>
            <strong>Email:</strong> koochunwoo@gmail.com<br>
          </p>
        </div>

        <div class="col-lg-2 col-md-6 footer-links">
          <h4>메뉴</h4>
          <ul>
            <li><i class="bx bx-chevron-right"></i> <a href="/minigame/">미니 게임</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/mem/login">로그인</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/mem/signup">회원가입</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/mem/basket">장바구니</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/mem/mypage">마이페이지</a></li>
          </ul>
        </div>

        <div class="col-lg-3 col-md-6 footer-links">
          <h4>바로가기</h4>
          <ul>
            <li><i class="bx bx-chevron-right"></i> <a href="/">오픈 마켓</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/">모집 게시판</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/notice">공지사항</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/event">이벤트</a></li>
            <li><i class="bx bx-chevron-right"></i> <a href="/question">1:1문의</a></li>
          </ul>
        </div>

        <div id="map" style="width:33%;height:300px;"></div>

        <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=144798bad24d7732eac232e66bd7ffbd"></script>
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

  <div class="container d-md-flex py-4">
    <p>Continue?는 통신판매중개자이며 통신판매의 당사자가 아닙니다. 따라서 Continue?는 상품·거래 정보 및 가격에 대하여 책임을 지지 않습니다.<br>
      본 사이트의 모든 정보, 콘텐츠, UI 등에 대한 무단 복제, 전송, 배포, 스크래핑 등의 행위는 관련 법령에 의하여 엄격히 금지됩니다.</p>
  </div>

  <div class="container d-md-flex py-4">

    <div class="me-md-auto text-center text-md-start">
      <div class="copyright">
        &copy; Copyright <strong><span>Continue?</span></strong>. All Rights Reserved
      </div>
      <div class="credits">
      </div>
    </div>
    <div class="social-links text-center text-md-right pt-3 pt-md-0">
      <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
      <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
      <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
      <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
      <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
    </div>
  </div>
</footer><!-- End Footer -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

</body>

</html>
