<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-11-30
  Time: 오전 11:07
  To change this template use File | Settings | File Templates.
--%>
<style>
    .checkout__input2 {
        position: relative;
        margin: 10px 0;
    }

    .checkout__input2 > input {
        background: transparent;
        border: none;
        border-bottom: solid 1px #ccc;
        padding: 20px 0px 5px 0px;
        font-size: 14pt;
        width: 100%;
    }
</style>

<!-- 본문 시작 signupForm.jsp-->
<div class="container">
    <br><br>
    <h4 style="font-weight: bold; margin-left: 5%">회원가입</h4>
    <hr>
    <form name="Signupfrm" id="Signupfrm" action="/mem/signup" method="post" onsubmit="return send()">
        <div class="col-lg-8 col-md-8">
            <div class="row">
                <div class="col-lg-12 col-md-12">
                </div>
                <div class="col-lg-12 col-md-12">
                    <br>
                    <div class="checkout__input2">
                        <label for="mem_id">아이디<span>*</span></label>
                        <br>
                        <input type="text" name="mem_id" id="mem_id" class="col-lg-9 col-md-9"
                               style="letter-spacing: 10px" required>
                    </div>
                    <div id="panel"></div>
                    <input type="button" value="중복확인" id="idcheck">
                </div>
                <br>

                <div class="checkout__input2">
                    <label for="mem_name">이름<span>*</span></label>
                    <br>
                    <input type="text" name="mem_name" id="mem_name" class="col-lg-9 col-md-9" style="letter-spacing: 15px"
                           required>
                </div>
                <br>

                <div class="checkout__input2">
                    <label for="mem_nick">닉네임<span>*</span></label>
                    <br>
                    <input type="text" name="mem_nick" id="mem_nick" class="col-lg-9 col-md-9" style="letter-spacing: 15px" required>
                </div>
                <br>

                <div class="checkout__input2">
                    <label for="mem_pw">비밀번호<span>*</span></label>
                    <br>
                    <input type="password" name="mem_pw" id="mem_pw" class="col-lg-9 col-md-9" style="letter-spacing: 15px" required>
                </div>
                <br>

                <div class="checkout__input2">
                    <label for="repw">비밀번호 확인<span>*</span></label>
                    <br>
                    <input type="password" name="repw" id="repw" class="col-lg-9 col-md-9" style="letter-spacing: 15px" required>
                </div>
                <br>

            <div class="col-lg-8 col-md-6">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="checkout__input">
                            <p>우편번호<span>*</span></p>
                            <input type="text" name="mem_zip" id="mem_zip" required>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="checkout__input">
                            <p>주소<span>*</span></p>
                            <input type="text" placeholder="기본주소" name="mem_adr1" id="mem_adr1" required>
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
                       id="mem_email" required>
            </div>
            <div class="checkout__input">
                <p>생년월일<span>*</span></p>
                <input type="text" name="mem_birth" id="mem_birth" required>
            </div>
            <div class="checkout__input">
                <p>휴대전화<span>*</span></p>
                <input type="text" name="mem_phone" id="mem_phone" required>
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
