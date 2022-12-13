<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

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

    input:focus, input:not(:placeholder-shown) {
        border-bottom: solid 1px #8aa1a1;
        outline: none;
    }
</style>


<div class="container" id="form">
    <br><br>
    <div class="row">
    <div class="col-lg-3 col-md-3"></div>
    <div class="col-lg-6 col-md-6" style="font-weight: bold">
        <span style="cursor: pointer">관리자 로그인</span>
    </div>
    <div class="col-lg-3 col-md-3"></div>
    </div>
    <hr>
    <form name="Loginfrm" id="Loginfrm" action="/admin/login" method="post">
        <!-- myscript.js -->
        <div class="row">
            <div class="col-lg-3 col-md-3">
            </div>
            <div class="col-lg-6 col-md-6">
                <br>
                <div class="checkout__input">
                    <label for="mem_id">아이디</label>
                    <br>
                    <input type="text" id="mem_id" name="mem_id" class="col-lg-10 col-md-10" style="letter-spacing: 10px">
                </div>
                <br>
                <div class="checkout__input">
                    <label for="mem_pw">비밀번호</label>
                    <br>
                    <input type="password" id="mem_pw" name="mem_pw" class="col-lg-10 col-md-10" style="letter-spacing: 15px">
                </div>
                <br>
                    <br>
                    <div class="checkout__input login float-left" style="padding-left: 3%">
                        <button type="submit" class="site-btn">로그인</button>
                    </div>
                    <div class="checkout__input float-left" id="logout" style="padding-left: 3%">
                        <button type="button" class="site-btn" onclick="location.href='/admin/logout'">로그아웃</button>
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

    function adminLogin() {
        if ($('mem_id'))
    }

</script>