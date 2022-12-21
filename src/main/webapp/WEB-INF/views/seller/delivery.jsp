Created by IntelliJ IDEA.
User: wandu
Date: 2022/12/02
Time: 3:02 PM
To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp"%>

<main id="main" class="main">

    <div class="pagetitle">
        <h1><i class="bi bi-truck"></i> 배송정책</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">Home</a></li>
                <li class="breadcrumb-item">주문관리</li>
                <li class="breadcrumb-item active">배송정책</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">My delivery Policy </h5>
                        나만의 배송정책을 추가하실려면 <code> "추가" </code> 버튼을 눌러주십시오!
                        <p></p>

                        <!-- Scrolling Modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#scrollingModal">
                            추가
                        </button>
                        <div class="modal fade" id="scrollingModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">배송정책 추가하기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>


                                    <div class="card">
                                        <div class="card-body" style="box-sizing: initial">
                                            <h5 class="card-title">나만의 배송정책을 만들어봅시다</h5>

                                            <!-- Horizontal Form -->
                                            <form action="/seller/dv_insert" method="post">
                                                <div class="row md-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">택배사</label>
                                                    <div class="col-sm-10">
                                                        <select id="inputState" class="form-select" name="dv_courier">
                                                            <option selected>택배회사를 선택해주세요</option>
                                                            <option value="CJ택배">CJ택배</option>
                                                            <option value="우체국">우체국</option>
                                                            <option value="로젠">로젠</option>
                                                            <option value="한진택배">한진택배</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br>
                                                <fieldset class="row mb-3">
                                                    <legend class="col-form-label col-sm-2 pt-0">
                                                        배송방법
                                                    </legend>
                                                    <div class="col-sm-10">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="dv_how" id="dv_how"
                                                                   value="택배" checked>
                                                            <label class="form-check-label"
                                                                   for="dv_how">
                                                                택배
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="dv_how" id="dv_how2"
                                                                   value="화물">
                                                            <label class="form-check-label"
                                                                   for="dv_how2">
                                                                화물
                                                            </label>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <div class="row mb-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">배송비용</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="dv_fee">
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">교환비용</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="dv_exfee"
                                                               placeholder="왕복 1회 가격">
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">반품비용</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control" name="dv_rffee"
                                                               placeholder="편도 1회 가격">
                                                    </div>
                                                </div>

                                                <fieldset class="row mb-3">
                                                    <legend class="col-form-label col-sm-2 pt-0">
                                                        산간지역
                                                    </legend>
                                                    <div class="col-sm-10">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="dv_extrafee" id="gridRadios3"
                                                                   value=2500 checked>
                                                            <label class="form-check-label"
                                                                   for="gridRadios3">
                                                                사용(+2500)
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="dv_extrafee" id="gridRadios4"
                                                                   value="0">
                                                            <label class="form-check-label"
                                                                   for="gridRadios4">
                                                                사용안함
                                                            </label>
                                                        </div>
                                                    </div>
                                                </fieldset>

                                                <div class="row mb-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">출고지역</label>
                                                    <div class="col-sm-10">
                                                        <div style="width: 100%">
                                                            <div style="float: left">
                                                                <input type="text" id="sample3_postcode"
                                                                       class="form-control" placeholder="우편번호"
                                                                       style="width: 50%">
                                                            </div>
                                                            <div style="float: right; margin-bottom: 10px">
                                                                <input type="button"
                                                                       onclick="sample3_execDaumPostcode()"
                                                                       class="form-control" value="우편번호 찾기"
                                                                       style="float: right"></div>
                                                        </div>
                                                        <input type="text" id="sample3_address" name="dv_adr1"
                                                               class="form-control"
                                                               placeholder="주소" style="margin-bottom: 10px">
                                                        <input type="text" id="sample3_detailAddress" name="dv_adr2"
                                                               class="form-control" style="margin-bottom: 10px"
                                                               placeholder="상세주소">
                                                        <input type="text" id="sample3_extraAddress"
                                                               class="form-control" placeholder="참고항목">

                                                        <div id="wrap"
                                                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                                                                 id="btnFoldWrap"
                                                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                                                 onclick="foldDaumPostcode()" alt="접기 버튼">
                                                        </div>

                                                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                                        <script>
                                                            // 우편번호 찾기 찾기 화면을 넣을 element
                                                            let element_wrap = document.getElementById('wrap');

                                                            function foldDaumPostcode() {
                                                                // iframe을 넣은 element를 안보이게 한다.
                                                                element_wrap.style.display = 'none';
                                                            }

                                                            function sample3_execDaumPostcode() {
                                                                // 현재 scroll 위치를 저장해놓는다.
                                                                let currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                                                                new daum.Postcode({
                                                                    oncomplete: function (data) {
                                                                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                                                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                                        let addr = ''; // 주소 변수
                                                                        let extraAddr = ''; // 참고항목 변수

                                                                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                                                        if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                                                            addr = data.roadAddress;
                                                                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                                                            addr = data.jibunAddress;
                                                                        }

                                                                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                                                        if (data.userSelectedType === 'R') {
                                                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                                                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                                                            if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                                                                extraAddr += data.bname;
                                                                            }
                                                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                                                            if (data.buildingName !== '' && data.apartment === 'Y') {
                                                                                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                                                            }
                                                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                                                            if (extraAddr !== '') {
                                                                                extraAddr = ' (' + extraAddr + ')';
                                                                            }
                                                                            // 조합된 참고항목을 해당 필드에 넣는다.
                                                                            document.getElementById("sample3_extraAddress").value = extraAddr;

                                                                        } else {
                                                                            document.getElementById("sample3_extraAddress").value = '';
                                                                        }

                                                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                                        document.getElementById('sample3_postcode').value = data.zonecode;
                                                                        document.getElementById("sample3_address").value = addr;
                                                                        // 커서를 상세주소 필드로 이동한다.
                                                                        document.getElementById("sample3_detailAddress").focus();

                                                                        // iframe을 넣은 element를 안보이게 한다.
                                                                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                                                        element_wrap.style.display = 'none';

                                                                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                                                        document.body.scrollTop = currentScroll;
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
                                                        </script>
                                                    </div>
                                                </div>

                                                <div class="row mb-3">
                                                    <label
                                                            class="col-sm-2 col-form-label">반품지역</label>
                                                    <div class="col-sm-10">
                                                        <div style="width: 100%">
                                                            <div style="float: left">
                                                                <input type="text" id="sample4_postcode"
                                                                       class="form-control" placeholder="우편번호"
                                                                       style="width: 50%">
                                                            </div>
                                                            <div style="float: right; margin-bottom: 10px">
                                                                <input type="button"
                                                                       onclick="sample4_execDaumPostcode()"
                                                                       class="form-control" value="우편번호 찾기"
                                                                       style="float: right"></div>
                                                        </div>
                                                        <input type="text" id="sample4_address2" class="form-control"
                                                               name="dv_exadr1"
                                                               placeholder="주소" style="margin-bottom: 10px">
                                                        <input type="text" id="sample4_detailAddress2" name="dv_exadr2"
                                                               class="form-control" style="margin-bottom: 10px"
                                                               placeholder="상세주소">
                                                        <input type="text" id="sample4_extraAddress2"
                                                               class="form-control" placeholder="참고항목">

                                                        <div id="wrap2"
                                                             style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative">
                                                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png"
                                                                 id="btnFoldWrap2"
                                                                 style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1"
                                                                 onclick="foldDaumPostcode2()" alt="접기 버튼">
                                                        </div>

                                                        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                                                        <script>
                                                            // 우편번호 찾기 찾기 화면을 넣을 element
                                                            let element_wrap2 = document.getElementById('wrap2');

                                                            function foldDaumPostcode2() {
                                                                // iframe을 넣은 element를 안보이게 한다.
                                                                element_wrap2.style.display = 'none';
                                                            }

                                                            function sample4_execDaumPostcode() {
                                                                // 현재 scroll 위치를 저장해놓는다.
                                                                let currentScroll2 = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
                                                                new daum.Postcode({
                                                                    oncomplete: function (data2) {
                                                                        // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                                                                        // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                                                                        // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                                                                        let addr2 = ''; // 주소 변수
                                                                        let extraAddr2 = ''; // 참고항목 변수

                                                                        //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                                                                        if (data2.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                                                                            addr2 = data2.roadAddress;
                                                                        } else { // 사용자가 지번 주소를 선택했을 경우(J)
                                                                            addr2 = data2.jibunAddress;
                                                                        }

                                                                        // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                                                                        if (data2.userSelectedType === 'R') {
                                                                            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                                                                            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                                                                            if (data2.bname !== '' && /[동|로|가]$/g.test(data2.bname)) {
                                                                                extraAddr2 += data2.bname;
                                                                            }
                                                                            // 건물명이 있고, 공동주택일 경우 추가한다.
                                                                            if (data2.buildingName !== '' && data2.apartment === 'Y') {
                                                                                extraAddr2 += (extraAddr2 !== '' ? ', ' + data2.buildingName : data2.buildingName);
                                                                            }
                                                                            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                                                                            if (extraAddr2 !== '') {
                                                                                extraAddr2 = ' (' + extraAddr2 + ')';
                                                                            }
                                                                            // 조합된 참고항목을 해당 필드에 넣는다.
                                                                            document.getElementById("sample4_extraAddress2").value = extraAddr2;

                                                                        } else {
                                                                            document.getElementById("sample4_extraAddress2").value = '';
                                                                        }

                                                                        // 우편번호와 주소 정보를 해당 필드에 넣는다.
                                                                        document.getElementById('sample4_postcode').value = data2.zonecode;
                                                                        document.getElementById("sample4_address2").value = addr2;
                                                                        // 커서를 상세주소 필드로 이동한다.
                                                                        document.getElementById("sample4_detailAddress2").focus();

                                                                        // iframe을 넣은 element를 안보이게 한다.
                                                                        // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                                                                        element_wrap2.style.display = 'none';

                                                                        // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                                                                        document.body.scrollTop = currentScroll2;
                                                                    },
                                                                    // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
                                                                    onresize: function (size) {
                                                                        element_wrap2.style.height = size.height + 'px';
                                                                    },
                                                                    width: '100%',
                                                                    height: '100%'
                                                                }).embed(element_wrap2);

                                                                // iframe을 넣은 element를 보이게 한다.
                                                                element_wrap2.style.display = 'block';
                                                            }
                                                        </script>

                                                    </div>
                                                </div>

                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-primary">
                                                        적용
                                                    </button>
                                                    <button type="reset" class="btn btn-secondary">
                                                        취소
                                                    </button>
                                                </div>
                                            </form><!-- End Horizontal Form -->

                                        </div>
                                    </div>

                                    </form><!-- End floating Labels Form -->

                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <!-- Active Table -->
                        <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">
                                    <input class="form-check-input" id="checkAll" name="checkAll" type="checkbox">
                                </th>
                                <th scope="col">NO.</th>
                                <th scope="col">택배사</th>
                                <th scope="col">배송방법</th>
                                <th scope="col">기본배송비용</th>
                                <th scope="col">반품비용</th>
                                <th scope="col">교환비용</th>
                                <th scope="col">섬/도서산간지역</th>
                                <th scope="col">출고지역</th>
                                <th scope="col">반품지역</th>

                            </tr>
                            </thead>

                            <tbody>
                            <c:forEach var="row" items="${dv_list}" varStatus="vs">
                                <tr>
                                    <th scope="col">
                                        <input class="form-check-input" id="dv_num" name="dv_num" type="checkbox" value="${row.dv_num}">
                                    </th>
                                    <th scope="row">${row.dv_num}</th>
                                    <td>${row.dv_courier}</td>
                                    <td>${row.dv_how}</td>
                                    <td>${row.dv_fee}</td>
                                    <td>${row.dv_rffee}</td>
                                    <td>${row.dv_exfee}</td>
                                    <td>${row.dv_extrafee}</td>
                                    <td>${row.dv_adr1}</td>
                                    <td>${row.dv_exadr1}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger" onclick="dvdelete()">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>


</main>
<!-- End #main -->


<!-- checkbox All Select -->
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        //전체박스 클릭
        $("#checkAll").click(function () {
            if ($("#checkAll").prop("checked")) {
                $(".form-check-input").prop("checked", true);
            } else {
                $(".form-check-input").prop("checked", false);
            }
        });
        //전체 체크박스 선택중 체크박스 하나를 풀었을때 "전체" 체크해제
        $(".form-check-input").click(function () {
            if ($("input[name='check']:checked").length == 5) {
                $("#checkAll").prop("checked", true);
            } else {
                $("#checkAll").prop("checked", false);
            }
        });
    });

    function dvdelete() {
        let dv_num = [];
        $("input[name=dv_num]:checked").each(function (index) {
            console.log($(this).val());
            dv_num[index] = $(this).val();
        })
        console.log(dv_num);
        $.ajax({
            url : "/delivery/delete"
            ,type : "post"
            ,data : "dv_num=" + dv_num
            ,success : function () {
                console.log("삭제 성공");
                location.href="/seller/delivery"
            }
            ,error : function (request, status, error) {
                alert("기존에 사용된 배송정책이므로 삭제할 수 없습니다.");
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
</script>
<!-- checkbox All Select end -->
<%@ include file="sellerfooter.jsp"%>
