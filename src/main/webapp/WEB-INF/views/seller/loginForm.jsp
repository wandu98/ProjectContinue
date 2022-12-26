<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<br><br>
<div class="row">
    <div class="col-lg-3 col-md-3"></div>
    <div class="col-lg-6 col-md-6" style="font-weight: bold">
        <table style="width: 100%">
            <tr>
                <td style="text-align: left; border-right: solid 1px #bfbab9"><span style="cursor: pointer; color: #979392" onclick="memBtn()">회원 로그인</span></td>
                <td style="text-align: center"><span style="cursor: pointer">판매자 로그인</span></td>
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
<%--                    <button type="button" class="site-btn" onclick="location.href='/seller/logout'">로그아웃</button>--%>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-3">
        </div>
    </div>
</form>

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
