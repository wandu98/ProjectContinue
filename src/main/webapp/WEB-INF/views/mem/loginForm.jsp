

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




<!--본문시작 loginForm.jsp-->

<div class="container">
    <h3>로그인</h3>
    <form name="Loginfrm" id="Loginfrm" action="/mem/login" method="post"><!-- myscript.js -->
        <table class="table">
            <div class="checkout__input">
                <input type="text" id="mem_id" name="mem_id">
            </div>
            <div class="checkout__input">
                <p>비밀번호</p>
                <input type="text" id="mem_pw" name="mem_pw">
            </div>
            <input type="submit" class="site-btn" value="로그인">
            &nbsp;&nbsp;&nbsp;
            <button type="button" onclick="location.href='/mem/signup'" class="site-btn">회원 가입하기</button>
        </table>
    </form>
</div>

    <jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>