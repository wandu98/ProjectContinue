<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-30
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<head>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
</head>
<!-- 본문 시작 memmodify.jsp-->
    <form class="container">
        <div class="checkout__form">
            <h4>회원 정보 수정</h4>
            <form action="" method="post">
                <form class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="checkout__input">
                                    <p>아이디<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                            <div class="col-lg-5">
                                <div class="checkout__input">
                                    <p>이름<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="checkout__input" style="width: 70%; padding-left: 20%">
                                    <img src="/images/ProfilePicture.png">
                                    <a href="" style="text-align: center">사진 변경</a>
                                </div>
                            </div>
                        </div>
                    </div>
                        <div class="checkout__input">
                            <p>닉네임<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input">
                            <p>비밀번호<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input">
                            <p>비밀번호 확인<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="col-lg-8 col-md-6">
                            <div class="row">
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>우편번호<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                                <div class="col-lg-6">
                                    <div class="checkout__input">
                                        <p>주소<span>*</span></p>
                                        <input type="text">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>상세주소입력<span>*</span></p>
                            <input type="text" placeholder="동, 호수" class="checkout__input__add">
                        </div>
                        <div class="checkout__input">
                            <p>닉네임<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input">
                            <p>생년월일<span>*</span></p>
                            <input type="text">
                        </div>
                    <br>

                    <button type="submit" class="site-btn">수정하기</button>
                </form>
            </form>
        </div>
    </form>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>