<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-30
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<head>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ include file="../header.jsp" %>
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
<!-- 본문 시작 signupForm.jsp-->
<div class="container">
    <form name="Signupfrm" id="Signupfrm" action="/mem/signup" method="post" onsubmit="return send()">
        <div class="checkout__form">
            <h4>회원가입</h4>
            <div class="row">
                <div class="col-lg-12 col-md-12">
                    <div class="row">
                        <div class="col-lg-4">
                            <div class="checkout__input">
                                <p>아이디<span>*</span></p>
                                <input type="text" name="mem_id" id="mem_id">
                            </div>
                            <div id="panel"></div>
                            <input type="button" value="중복확인" id="idcheck">
                        </div>
                    </div>
                    <div class="col-lg-5">
                        <div class="checkout__input">
                            <p>이름<span>*</span></p>
                            <input type="text" name="mem_name" id="mem_name">
                        </div>
                    </div>
                </div>
                <div class="checkout__input">
                    <p>닉네임<span>*</span></p>
                    <input type="text" name="mem_nick" id="mem_nick">
                </div>
                <div class="checkout__input">
                    <p>비밀번호<span>*</span></p>
                    <input type="password" name="mem_pw" id="mem_pw">
                </div>
                <div class="checkout__input">
                    <p>비밀번호 확인<span>*</span></p>
                    <input type="password" name="repw" id="repw">
                </div>
                <div class="col-lg-8 col-md-6">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>우편번호<span>*</span></p>
                                <input type="text" name="mem_zip" id="mem_zip">
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <input type="text" placeholder="기본주소" name="mem_adr1" id="mem_adr1">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="checkout__input">
                    <p>상세주소입력<span>*</span></p>
                    <input type="text" placeholder="나머지 주소(선택 입력 가능)" class="checkout__input__add" name="mem_adr2"
                           id="mem_adr2">
                </div>
                <div class="checkout__input">
                    <p>이메일<span>*</span></p>
                    <input type="text" placeholder="이메일 작성" class="checkout__input__add" name="mem_email"
                           id="mem_email">
                </div>
                <div class="checkout__input">
                    <p>생년월일<span>*</span></p>
                    <input type="text" name="mem_birth" id="mem_birth">
                </div>
                <div class="checkout__input">
                    <p>휴대전화<span>*</span></p>
                    <input type="text" name="mem_phone" id="mem_phone">
                </div>
                <div class="checkout__input__checkbox">
                    <p>수신여부(선택)</p>
                    e-mail 수신동의
                    <input type="hidden" id="mem_receive" name="mem_receive" value="N">
                    <input type="checkbox" name="receive" id="receive">
                    <span class="checkmark"></span>
                </div>
                <%--<div class="checkout__input__checkbox">
                    <label for="recieve2">
                        SMS 수신동의
                        <input type="checkbox" name="recieve2" id="recieve2">
                        <span class="checkmark"></span>
                    </label>
                </div>--%>
                <button type="submit" class="site-btn">회원 가입하기</button>
            </div>
        </div>
    </form>
</div>

<script>
    $('#receive').click(function () {
        if ($('#receive').is(':checked')) {
            $('#mem_receive').val('Y');
        } else {
            $('#mem_receive').val('N');
        }
    });

    $(function () {
        $.removeCookie("checkID");
    });

    $('#idcheck').click(function () {
        let params = "mem_id=" + $('#mem_id').val().trim();
        $.post("idcheckcookieproc.do", params, checkID, "json");
    });

    function checkID(result) {
        let count = eval(result.count);
        if (count == 0) { //1 중복 0 사용가능
            alert("사용가능한 아이디 입니다");
            $.cookie("checkID", "PASS"); //중복확인을 했다는 증거
        } else {
            alert("중복된 아이디 입니다");
            $("#mem_id").focus;
        }//if end
    }//checkID() end


    function send() {
        let checkID = $.cookie("checkID");
        if (checkID == "PASS") {
            return true;
        } else {
            alert("아이디 중복확인 해주세요");
            $("#mem_id").focus;
        }//if() end
    }//send() end


</script>

<%@ include file="../footer.jsp" %>
