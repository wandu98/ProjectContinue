<%@ page import="java.net.URLClassLoader" %>
<%@ page import="org.springframework.util.ResourceUtils" %>
<%@ page import="javax.annotation.Resource" %>
<%@ page import="org.apache.commons.io.IOUtils" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<style>
    .padding_input {
        padding-left: 10%;
    }
</style>

<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>회원 정보 수정</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>My Page</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <form action="/mypage/memmodify/update" method="post" enctype="multipart/form-data" onsubmit="return updateCheck()">
                <div class="row">
                    <div class="col-lg-8">
                        <div class="row">
                            <div class="col-lg-8 col-md-8">
                                <div class="row">
                                    <div class="checkout__input">
                                        <p>아이디<span>*</span></p>
                                        <input type="text" value="${mem.mem_id}" id="mem_id" name="mem_id" readonly>
                                    </div>
                                    <div class="checkout__input padding_input">
                                        <p>이름<span>*</span></p>
                                        <input type="text" value="${mem.mem_name}" id="mem_name" name="mem_name">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="checkout__input">
                                <p>닉네임<span>*</span></p>
                                <input type="text" value="${mem.mem_nick}" id="mem_nick" name="mem_nick">
                            </div>

                        </div>
                        <div class="row">
                            <div class="checkout__input">
                                <p>비밀번호<span>*</span></p>
                                <input type="password" value="${mem.mem_pw}" id="mem_pw" name="mem_pw">
                            </div>
                            <div class="checkout__input padding_input">
                                <p>비밀번호 확인<span>*</span></p>
                                <input type="password" value="${mem.mem_pw}" id="mem_pwcheck" name="mem_pwcheck">
                            </div>
                        </div>
                        <div class="row">
                            <div class="checkout__input">
                                <p>주소<span>*</span></p>
                                <div class="checkout__input">
                                    <input type="text" id="mem_zip" name="mem_zip" value="${mem.mem_zip}" style="width: 30%" readonly>
                                    <button class="site-btn" type="button" onclick="sample3_execDaumPostcode(); clearVal()" style="float: right">주소 찾기</button>
                                </div>
                                <input type="text" id="mem_adr1" name="mem_adr1" value="${mem.mem_adr1}" readonly>
                                <span id="guide" style="color:#999;display:none"></span>
                                <input type="text" id="mem_adr2" name="mem_adr2" value="${mem.mem_adr2}">
<%--                                <input type="text" id="sample3_extraAddress" placeholder="참고항목">--%>
                            </div>
                            <div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
                            </div>

                            <div class="checkout__input padding_input">
                                <p>생년월일<span>*</span></p>
                                <input type="date" value="${mem.mem_birth}" id="mem_birth" name="mem_birth">
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div>
                            <div class="checkout__input" style="width: 70%;">
                                <div id="pic_view2" class="set-bg product__item__pic" data-setbg="/images/profile/ProfilePicture.png"><c:if test="${YN eq true}"><img id="pic_view" src="/images/profile/${mem.mem_id}/${mem.mem_pic}" style="height: 100%; overflow: hidden"></c:if></div>
                                <label for="mem_pic">사진 선택</label>
                                <input type="file" id="mem_pic" name="mem_pic" style="display: none; height: 100%; overflow: hidden">
                            </div>
                        </div>
                    </div>
                    <button type="submit" class="site-btn">수정하기</button>
                </div>
            </form>
        </div>
    </div>
</section>

<script>
    // 우편번호 찾기 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');

    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }

    function sample3_execDaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    // document.getElementById("sample3_extraAddress").value = extraAddr;

                } else {
                    // document.getElementById("sample3_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('mem_zip').value = data.zonecode;
                document.getElementById("mem_adr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("mem_adr2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';

                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);

        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
</script>


<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    // function sample4_execDaumPostcode() {
    //     new daum.Postcode({
    //         oncomplete: function(data) {
    //             // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
    //             // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
    //             // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
    //             var roadAddr = data.roadAddress; // 도로명 주소 변수
    //             var extraRoadAddr = ''; // 참고 항목 변수
    //             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
    //             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
    //             if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    //                 extraRoadAddr += data.bname;
    //             }
    //             // 건물명이 있고, 공동주택일 경우 추가한다.
    //             if(data.buildingName !== '' && data.apartment === 'Y'){
    //                 extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    //             }
    //             // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
    //             if(extraRoadAddr !== ''){
    //                 extraRoadAddr = ' (' + extraRoadAddr + ')';
    //             }
    //             // 우편번호와 주소 정보를 해당 필드에 넣는다.
    //             document.getElementById('mem_zip').value = data.zonecode;
    //             document.getElementById("mem_adr1").value = roadAddr;
    //             document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
    //             // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
    //             if(roadAddr !== ''){
    //                 document.getElementById("sample4_extraAddress").value = extraRoadAddr;
    //             } else {
    //                 document.getElementById("sample4_extraAddress").value = '';
    //             }
    //             var guideTextBox = document.getElementById("guide");
    //             // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
    //             if(data.autoRoadAddress) {
    //                 var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
    //                 guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
    //                 guideTextBox.style.display = 'block';
    //             } else if(data.autoJibunAddress) {
    //                 var expJibunAddr = data.autoJibunAddress;
    //                 guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
    //                 guideTextBox.style.display = 'block';
    //             } else {
    //                 guideTextBox.innerHTML = '';
    //                 guideTextBox.style.display = 'none';
    //             }
    //         }
    //     }).open();
    // }

    <%-- 올린 이미지 미리보기 --%>
    $("#mem_pic").change(function (event) {
        // alert("테스트");
        let file = event.target.files[0];
        // alert(file);    //[object File]
        let reader = new FileReader();
        if (${YN eq true}) {
            reader.onload = function (e) {
                $("#pic_view").attr('src', e.target.result);
            }
        } else {
            $("#pic_view2").append('<img id="pic_view" src="" style="height: 100%; overflow: hidden"></<img>');
            reader.onload = function (e) {
                $("#pic_view").attr('src', e.target.result);
            }
            $("#pic_view2").attr("style", "");
        }
        reader.readAsDataURL(file);
    });

    <c:if test="${YN eq true}">
        $("#pic_view2").attr("data-setbg", "");
    </c:if>

    function clearVal() {
        $("#mem_zip").attr("value", null);
        $("#mem_adr1").attr("value", null);
        $("#mem_adr2").attr("value", null);
    }


</script>



<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>