
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

<!--본문시작 loginForm.jsp-->

<div class="container">
    <h3>로그인</h3>
    <form name="Loginfrm" id="Loginfrm" action="loginForm.jsp" method="post"><!-- myscript.js -->
        <table class="table">
            <div class="checkout__input">
                <p>아이디</p>
                <input type="text">
            </div>
            <div class="checkout__input">
                <p>비밀번호</p>
                <input type="text">
            </div>
            <button type="submit" class="site-btn">로그인</button>
            &nbsp;&nbsp;&nbsp;
            <button type="button" onclick="location.href='/mem/signup'" class="site-btn">회원 가입하기</button>
        </table>
    </form>
</div>
<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>