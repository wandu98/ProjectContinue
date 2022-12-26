<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<!--본문시작 loginForm.jsp-->
<%--<%if(mem_id.equals("guest") || mem_pw.equals("guest") || mem_grade.equals("guest")) {
    //아이디저장 쿠키 확인----------------------------------
    Cookie[] cookies=request.getCookies(); //사용자 PC에 저장된 모든 쿠키값 가져오기
    String c_id="";
    if(cookies!=null){ //쿠키가 존재하는지?
        for(int i=0; i<cookies.length; i++){ //모든 쿠기값을 검색
            Cookie cookie=cookies[i]; //쿠키 하나씩 가져오기
            if(cookie.getName().equals("c_id")==true){
                c_id=cookie.getValue(); //쿠키변수값 가져오기
            }//if end
        }//for end
    }//if end
    //--------------------------------------------------
%>--%>
<style>
    .checkout__input {
        position: relative;
        margin: 10px 0;
    }

    .checkout__input > input {
        background: transparent;
        border: none;
        border-bottom: solid 1px #ccc;
        padding: 20px 0px 5px 0px;
        font-size: 14pt;
        width: 100%;
    }

    input::placeholder {
        color: transparent;
    }

    input:placeholder-shown + label {
        color: #aaa;
        font-size: 14pt;
        top: 15px;
    }

    input:focus + label, label {
        color: #8aa1a1;
        font-size: 10pt;
        pointer-events: none;
        position: absolute;
        left: 0px;
        top: 0px;
        transition: all 0.2s ease;
        -webkit-transition: all 0.2s ease;
        -moz-transition: all 0.2s ease;
        -o-transition: all 0.2s ease;
    }

    /*input:focus, input:not(:placeholder-shown) {*/
    /*    border-bottom: solid 1px #8aa1a1;*/
    /*    outline: none;*/
    /*}*/
</style>


<div class="container" id="form">
    <br><br>
    <div class="row">
        <div class="col-lg-3 col-md-3"></div>
        <div class="col-lg-6 col-md-6" style="font-weight: bold">
            <table style="width: 100%">
                <tr>
                    <td style="text-align: left; border-right: solid 1px #bfbab9"><span style="cursor: pointer; color: #979392" onclick="memBtn()">회원 로그인</span></td>
                    <td style="text-align: center"><span onclick="sellerBtn()" style="cursor: pointer">판매자 로그인</span></td>
                </tr>
            </table>
        </div>
        <div class="col-lg-3 col-md-3"></div>
    </div>
    <hr>
    <form name="Loginfrm" id="Loginfrm" action="/seller/login" method="post" onsubmit="return memberCheck()">
        <!-- myscript.js -->
        <div class="row">
            <div class="col-lg-3 col-md-3">
            </div>
            <div class="col-lg-6 col-md-6">
                <br>
                <div class="checkout__input">
                    <label for="sl_id">아이디</label>
                    <br>
                    <%--<input type="text" id="mem_id" value="<%=c_id%>" name="mem_id">--%>
                    <input type="text" id="sl_id" name="sl_id" class="col-lg-9 col-md-9" style="letter-spacing: 10px">
                </div>
                <br>
                <div class="checkout__input">
                    <label for="sl_pw">비밀번호</label>
                    <br>
                    <input type="password" id="sl_pw" name="sl_pw" class="col-lg-9 col-md-9" style="letter-spacing: 15px">
                </div>
                <br>
                <span class="checkmark"></span>
                <div>
                    <br>
                    <div class="checkout__input login float-left" style="padding-left: 3%">
                        <button type="submit" class="site-btn">로그인</button>
                    </div>
                    <div class="checkout__input float-left" style="padding-left: 3%">
                        <button type="button" onclick="location.href='/seller/signup'" class="site-btn">회원 가입하기</button>
                    </div>
                    <div class="checkout__input float-left" id="logout" style="padding-left: 3%">
                        <c:if test="${sl_id}!=null"><button type="button" class="site-btn" onclick="location.href='/seller/logout'">로그아웃</button></c:if>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3">
            </div>
        </div>
    </form>
</div>

<br>
<br>
<br>
<br>
<%@ include file="../footer.jsp" %>

<script>

    function sellerBtn() {

        $.ajax({
            type: "get",
            url: "/mem/sellerLogin",
            dataType: "text",
            success: function (result) {
                $("#form").html(result);
            }
        })

    }

    function memBtn() {

        $.ajax({
            type: "get",
            url: "/seller/memLogin",
            dataType: "text",
            success: function (result) {
                $("#form").html(result);
                console.log('멤버 로그인으로 이동..');
            }
        })

    }

</script>