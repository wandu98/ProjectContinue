<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-12
  Time: 오전 10:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../seller/sellerheader.jsp" %>


    <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">

                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4">
                                <a href="/seller" class="logo d-flex align-items-center w-auto">
                                    <img src="/admin_assets/img/logo.png" alt="">
                                    <span class="d-none d-lg-block">Seller</span>
                                </a>
                            </div><!-- End Logo -->

                            <div class="card mb-3">

                                <div class="card-body">

                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">회원가입</h5>
                                    </div>

                                    <form class="row g-3 needs-validation" novalidate name="selSignupfrm" id="selSignupfrm" action="/seller/signup" method="post" onsubmit="return sendsel()">
                                        <div class="col-12">
                                            <label for="sl_id" class="form-label">아이디</label>
                                            <input type="text" name="sl_id" class="form-control" id="sl_id" required>
                                            <div class="invalid-feedback">아이디를 입력 해주세요.</div>
                                            <div id="panel"></div>
                                            <input type="button" value="중복확인" id="idchecksel">
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_pw" class="form-label">비밀번호</label>
                                            <input type="password" name="sl_pw" class="form-control" id="sl_pw" required>
                                            <div class="invalid-feedback">비밀번호를 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_repw" class="form-label">비밀번호 확인</label>
                                            <div class="input-group has-validation">
                                                <input type="password" name="sl_repw" class="form-control" id="sl_repw" required>
                                                <div class="invalid-feedback">비밀번호가 일치하지 않습니다.</div>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_name" class="form-label">사업자명</label>
                                            <input type="text" name="sl_name" class="form-control"
                                                   id="sl_name" required>
                                            <div class="invalid-feedback">사업자명을 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <p>주소<span>*</span></p>
                                            <input type="text" name="sl_zip" class="form-control" id="sl_zip" style="margin-left: auto; width: 50%" readonly>
                                            <button type="button" onclick="DaumPostcode()" class="btn btn-danger">우편번호</button>
                                            <div class="invalid-feedback">우편번호 입력 필수 입니다.</div>
                                        </div>

                                        <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">
                                            <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap"
                                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                                 onclick="foldDaumPostcode()" alt="접기 버튼">
                                        </div>

                                        <div class="col-12" id="sl_adr" >
                                            <input type="text" id="sl_adr1" name="sl_adr1" readonly>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_adr2" class="form-label">상세주소</label>
                                            <input type="text" name="sl_adr2" class="form-control"
                                                   id="sl_adr2" required>
                                            <div class="invalid-feedback">사업자주소를 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_phone" class="form-label">휴대폰번호</label>
                                            <input type="text" name="sl_phone" class="form-control"
                                                   id="sl_phone" required>
                                            <div class="invalid-feedback">번호를 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_birth" class="form-label">생년월일</label>
                                            <input type="text" name="sl_birth" class="form-control"
                                                   id="sl_birth" required>
                                            <div class="invalid-feedback">생년월일 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_number" class="form-label">사업자번호</label>
                                            <input type="text" name="sl_number" class="form-control"
                                                   id="sl_number" required>
                                            <div class="invalid-feedback">사업자 번호 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_bank" class="form-label">계좌번호</label>
                                            <input type="text" name="sl_bank" class="form-control"
                                                   id="sl_bank" required>
                                            <div class="invalid-feedback">계좌 번호 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_bankcode" class="form-label">은행코드</label>
                                            <input type="text" name="sl_bankcode" class="form-control"
                                                   id="sl_bankcode" required>
                                            <div class="invalid-feedback">은행코드 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <div class="form-check">
                                                <input class="form-check-input" name="terms" type="checkbox" value=""
                                                       id="acceptTerms" required>
                                                <label class="form-check-label" for="acceptTerms">I agree and accept the
                                                    <a href="#">terms and conditions</a></label>
                                                <div class="invalid-feedback">You must agree before submitting.</div>
                                            </div>
                                        </div>
                                        <div class="col-12">
                                            <button class="btn btn-primary w-100" type="submit">회원가입 완료</button>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Already have an account? <a href="loginForm.jsp">Log
                                                in</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>


                        </div>
                    </div>


            </section>

    </div>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>


    $(function () {
        $.removeCookie("checkIDsel");
    })

    $('#idchecksel').click(function () {
        let params = "sl_id=" + $('#sl_id').val().trim();
        $.post("checkIDselproc.do", params, checkIDsel, "json")
    })

    function checkIDsel(result) {
        let count = eval(result.count);
        if (count == 0) {
            alert("사용가능한 아이디 입니다");
            $.cookie("checkIDsel", "PASS");
        } else {
            alert("중복된 아이디 입니다");
            $("#sl_id").focus;
        }//if end
    }//checkIDsel() end

    function sendsel() {
        let checkIDsel = $.cookie("checkIDsel");
        if (checkIDsel == "PASS") {
            return true;
        } else {
            alert("아이디 중복확인 해주세요");
            $("#sl_id").focus;
        }//if end
    }//sendsel() end

    <!-- ----- DAUM 우편번호 API 시작 ----- -->
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
                document.getElementById('sl_zip').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sl_adr1').value = fullAddr;
                //$('#rcrbrd_adr2').text(fullAddr);

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;


                $('#sl_adr').show();
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




</script>

<%@ include file="../seller/sellerfooter.jsp" %>


