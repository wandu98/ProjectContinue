<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-04
  Time: 오후 2:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<!-- 모집 게시판 배너 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>모집 게시판</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>모집</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 모집 게시판 배너 끝 -->

<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="row">
                    <div class="col-lg-2">
                    </div>
                    <div class="col-lg-2">
                        <img alt="Bootstrap Image Preview" src="/images/ProfilePicture.png" class="img-thumbnail" style="width: 100%; height: auto" />
                        <br>
                        <br>
                        <div class="checkout__input" style="text-align: center">
                            <p>닉네임 &nbsp;|&nbsp; 회원등급</p>
                        </div>
                    </div>
                    <div class="col-lg-6" style="text-align: left">
                        <p><h2>
                            게임 타이틀
                        </h2></p>
                        <p>
                            최대 인원 : 최대 인원<br>
                            모집 지역 : 모집 지역
                        </p>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-8">
                        물음표 마크 | 등급 정책
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="../footer.jsp" %>
