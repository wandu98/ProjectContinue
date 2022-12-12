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
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_pw" class="form-label">비밀번호</label>
                                            <input type="password" name="sl_pw" class="form-control" id="sl_pw" required>
                                            <div class="invalid-feedback">비밀번호를 입력 해주세요.</div>
                                            <div id="panel"></div>
                                            <input type="button" value="중복확인" id="pwcheck">
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

<%--                                        <div class="checkout__input">--%>
<%--                                            <p>주소 검색<span>*</span></p>--%>
<%--                                            <input type="text" id="zipcode" style="margin-left: auto; width: 50%" readonly>&nbsp;--%>
<%--                                            <button type="button" onclick="DaumPostcode()" class="btn btn-danger">검색</button>--%>
<%--                                        </div>--%>
<%--                                        <div id="wrap"--%>
<%--                                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative">--%>
<%--                                            <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap"--%>
<%--                                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"--%>
<%--                                                 onclick="foldDaumPostcode()" alt="접기 버튼">--%>
<%--                                        </div>--%>

                                        <div class="col-12">
                                            <label for="sl_zip" class="form-label">우편번호</label>
                                            <input type="text" name="sl_zip" class="form-control"
                                                   id="sl_zip" required>
                                            <div class="invalid-feedback">사업자주소를 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_adr1" class="form-label">주소</label>
                                            <input type="text" name="sl_adr1" class="form-control"
                                                   id="sl_adr1" required>
                                            <div class="invalid-feedback">사업자주소를 입력 해주세요.</div>
                                        </div>

                                        <div class="col-12">
                                            <label for="sl_adr2" class="form-label">상세주소</label>
                                            <input type="text" name="sl_adr2" class="form-control"
                                                   id="sl_adr2" required>
                                            <div class="invalid-feedback">사업자주소를 입력 해주세요.</div>
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
                                            <button class="btn btn-primary w-100" type="submit">Create Account</button>
                                        </div>
                                        <div class="col-12">
                                            <p class="small mb-0">Already have an account? <a href="pages-login.html">Log
                                                in</a></p>
                                        </div>
                                    </form>

                                </div>
                            </div>


                        </div>
                    </div>


            </section>

    </div>

<script>


    $(function () {
        $.removeCookie("checkselPW");
    })

    $('#pwcheck').click(function () {
        let params = "sl_pw=" + $('#sl_pw').val().trim();
        $.post("checkselPWproc.do", params, checkselPW, "json")
    })

    function checkselPW(result) {
        let count = eval(result.count);
        if (count == 0) {
            alert("사용가능한 비밀번호 입니다");
            $.cookie("checkselPW", "PASS");
        } else {
            alert("중복된 비밀번호 입니다");
            $("#sl_pw").focus;
        }//if end
    }//checkselPW() end

    function sendsel() {
        let checkselPW = $.cookie("checkselPW");
        if (checkselPW == "PASS") {
            return true;
        } else {
            alert("비밀번호 중복확인 해주세요");
            $("#sl_pw").focus;
        }//if end
    }//sendsel() end





</script>

<%@ include file="../seller/sellerfooter.jsp" %>


