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

</style>

<!-- 본문 시작 signupForm.jsp-->
<div class="container">
    <div class="row">
    </div>
    <div class="checkout__form">
        <br><br>
        <h4 style="font-weight: bold; margin-left: auto">회원가입</h4>

        <form name="Signupfrm" id="Signupfrm" action="/mem/signup" method="post" onsubmit="return memberCheck()">
            <div class="row" style="padding: 5%">
                <div class="col-lg-12 col-md-6">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>이름<span>*</span></p>
                                <input type="text" name="mem_name" id="mem_name" required>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>닉네임<span>*</span></p>
                                <input type="text" name="mem_nick" id="mem_nick" required>
                            </div>
                            <input type="button" value="중복확인" id="nickcheck"
                                   style="color : #FFFFFF; background-color: #FF0000;">
                        </div>

                    </div>

                    <div class="checkout__input" onsubmit="return checkID()">
                        <p>아이디 <span>*</span></p>
                        <input type="text" name="mem_id" id="mem_id" required>
                    </div>
                    <div id="panel"></div>
                    <input type="button" value="중복확인" id="idcheck"
                           style="color : #FFFFFF; background-color: #FF0000;">
                    <br><br>

                    <div class="row">
                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" name="mem_pw" id="mem_pw" required>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="checkout__input">
                                <p>비밀번호 확인<span>*</span></p>
                                <input type="password" name="mem_repw" id="mem_repw" required>
                            </div>
                        </div>
                    </div>

                    <div class="checkout__input">
                        <p>주소<span>*</span></p>
                        <input type="text" name="mem_zip" class="checkout__input__add" id="mem_zip" readonly>
                        <button type="button" onclick="DaumPostcode()" class="btn btn-danger">우편번호</button>
                        <div class="invalid-feedback">우편번호 입력 필수 입니다.</div>

                        <div id="wrap"
                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                            <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
                                 id="btnFoldWrap"
                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                 onclick="foldDaumPostcode()" alt="접기 버튼">
                        </div>
                    </div>

                    <div class="checkout__input" id="mem_adr">
                        <input type="text" placeholder="우편번호를 입력 해주세요" name="mem_adr1" id="mem_adr1" required>
                    </div>
                    <div class="checkout__input">
                        <input type="text" placeholder="상세 주소(선택 입력 가능)" class="checkout__input__add"
                               name="mem_adr2"
                               id="mem_adr2">
                    </div>

                    <div class="checkout__input">
                        <p>이메일<span>*</span></p>
                        <input type="email" placeholder="이메일 작성" class="checkout__input__add" name="mem_email"
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
                    <br>
                    <button type="submit" class="site-btn">회원 가입하기</button>
                </div>
            </div>
        </form>
    </div>
</div>


<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    /*DAUM 우편번호 API 시작*/
    // 우편번호 찾기 화면을 넣을 element

    let element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        let currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function (data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 기본 주소가 도로명 타입일때 조합한다.
                if (data.addressType === 'R') {
                    //법정동명이 있을 경우 추가한다.
                    if (data.bname !== '') {
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if (data.buildingName !== '') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('mem_adr1').value = fullAddr;
                //$('#rcrbrd_adr2').text(fullAddr);

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;


                $('#mem_adr').show();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize: function (size) {
                element_wrap.style.height = size.height + 'px';
            },
            width: '100%',
            height: '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }

    <!-- ----- DAUM 우편번호 API 종료 ----- -->

    $('#receive').click(function () {
        if ($('#receive').is(':checked')) {
            $('#mem_receive').val('Y');
        } else {
            $('#mem_receive').val('N');
        }
    });

    $(function () {
        $.removeCookie("checkID");
        $.removeCookie("checkNick");
    });

    $('#idcheck').click(function () {
        let params = "mem_id=" + $('#mem_id').val().trim();
        $.post("idcheckcookieproc", params, checkID, "json");
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



    //닉네임 중복 체크
    $('#nickcheck').click(function () {
        let params = "mem_nick=" + $('#mem_nick').val().trim();
        $.post("/mem/nickcheckproc", params, checkNick, "json");
    });

    function checkNick(result) {
        let count = eval(result.count);
        if (count == 0) { //1 중복 0 사용가능
            alert("사용가능한 닉네임 입니다");
            $.cookie("checkNick", "PASS"); //중복확인을 했다는 증거
        } else {
            alert("중복된 닉네임 입니다");
            $("#mem_nick").focus;
        }//if end


    }



    function memberCheck() { //회원가입 유효성 검사
        //1)아이디 5~10글자 인지?
        let mem_id = document.getElementById("mem_id").value;
        mem_id = mem_id.trim();
        if (!(mem_id.length >= 5 && mem_id.length <= 10)) {
            alert("아아디 5~20글자이내 입력해 주세요");
            document.getElementById("mem_id").focus();
            return false;
        }//if end

        let checkID = $.cookie("checkID");
        if (checkID != "PASS") {
            alert("아이디 중복확인 해주세요");
            $("#mem_id").focus;
            return false;
        }

        //닉네임 입력했는지
        let mem_nick = document.getElementById("mem_nick").value;
        mem_nick = mem_nick.trim();
        if (!(mem_nick.length >= 1)) {
            alert("닉네임을 입력해 주세요");
            document.getElementById("mem_nick").focus();
            return false;
        }//if end

        let checkNick = $.cookie("checkNick");
        if (checkNick != "PASS") {
            alert("닉네임 중복확인 해주세요");
            $("#mem_nick").focus;
            return false;
        }

        //2)비밀번호 5~10글자 인지?
        let mem_pw = document.getElementById("mem_pw").value;
        mem_pw = mem_pw.trim();
        if (!(mem_pw.length >= 5 && mem_pw.length <= 10)) {
            alert("비밀번호 5~10글자이내 입력해 주세요");
            document.getElementById("mem_pw").focus();
            return false;
        }//if end

        //3)비밀번호와 비밀번호확인이 서로 일치하는지?
        let mem_repw = document.getElementById("mem_repw").value;
        mem_repw = mem_repw.trim();
        if (mem_pw != mem_repw) {
            alert("비밀번호가 일치하지 않습니다.");
            document.getElementById("mem_repw").focus();
            return false;
        }//if end

        //4)이름 두글자 이상 인지?
        let mem_name = document.getElementById("mem_name").value;
        mem_name = mem_name.trim();
        if (mem_name.length <= 1) {
            alert("이름 두글자 이상 입력해 주세요");
            document.getElementById("mem_name").focus();
            return false;
        }//if end

        //5)이메일 5글자 인지?
        let mem_email = document.getElementById("mem_email").value;
        mem_email = mem_email.trim();
        if (mem_email.length < 5) {
            alert("이메일 5글자 이상 입력해 주세요");
            document.getElementById("mem_email").focus();
            return false;
        }//if end

        //6)핸드폰 번호 11글자 이상
        let mem_phone = document.getElementById("mem_phone").value;
        mem_phone = mem_phone.trim();
        if (mem_phone.length < 11) {
            alert("핸드폰 번호11글자 이상 입력해 주세요");
            document.getElementById("mem_phone").focus();
            return false;
        }//if end

        //7)생년월일 8글자 이상
        let mem_birth = document.getElementById("mem_birth").value;
        mem_birth = mem_birth.trim();
        if (mem_birth.length < 8) {
            alert("생년월일 8글자 이상 입력해 주세요");
            document.getElementById("mem_birth").focus();
            return false;
        }//if end

        return true;//서버로 전송
    }





</script>

<%@ include file="../footer.jsp" %>
