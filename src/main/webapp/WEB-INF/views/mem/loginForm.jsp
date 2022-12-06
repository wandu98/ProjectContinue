<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="../header.jsp"%>

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

<div class="container">
    <h4>로그인</h4>
    <form name="Loginfrm" id="Loginfrm" action="/mem/login" method="post" onsubmit="return memberCheck()">
        <!-- myscript.js -->
        <table class="table">
            <div class="col-lg-4 col-md-4">
                <div class="checkout__input">
                    <p>아이디</p>
                    <%--<input type="text" id="mem_id" value="<%=c_id%>" name="mem_id">--%>
                    <input type="text" id="mem_id" value="" name="mem_id">
                </div>
                <div class="checkout__input">
                    <p>비밀번호</p>
                    <input type="text" id="mem_pw" name="mem_pw">
                </div>
            </div>
            <div class="checkout__input__checkbox">
               <%-- <input type="checkbox" name="c_id" value="SAVE" <%if(!c_id.isEmpty()){out.print("checked");}%>>--%>
                로그인유지
                <span class="checkmark"></span>
            </div>
            <div class="checkout__inputlogin">
                <input type="submit" class="site-btn" value="로그인">
            </div>
            &nbsp;&nbsp;
            <div class="checkout__input">
                <button type="button" onclick="location.href='/mem/signup'" class="site-btn">회원 가입하기</button>
            </div>
        </table>
    </form>
</div>

<%@ include file="../footer.jsp"%>