<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp" %>


<main id="main" class="main">

    <div class="pagetitle">
        <h1>상품등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">홈</a></li>
                <li class="breadcrumb-item">상품등록/변경</li>
                <li class="breadcrumb-item active">상품등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상품입력</h5>

                        <!-- General Form Elements -->
                        <form>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">카테고리</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="category" name="category"
                                           data-bs-toggle="modal"
                                           data-bs-target="#scrollingModal" readonly placeholder="Search...">

                                    <%-- 모달창 --%>
                                    <div class="modal fade" id="scrollingModal" tabindex="-1">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <%-- 모달창 헤더 --%>
                                                <div class="modal-header">
                                                    <h5 class="modal-title">카테고리 찾기</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                            aria-label="Close"></button>
                                                </div>

                                                <%--모달창 본문--%>
                                                <div class="card">
                                                    <div class="card-body" style="box-sizing: initial">
                                                        <h5 class="card-title">단어를 입력해주세요</h5>
                                                    </div>
                                                    <div class="modal-body" id="gs_main">
                                                        <input type="text" placeholder="Search..."
                                                               id="gs_keyword"
                                                               name="gs_keyword"
                                                               style="width: 100%;
                                                              border-radius: 10px;
                                                              border-style: solid">
                                                        <div id="panel" style="display: none"></div>
                                                    </div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </form><!-- End floating Labels Form -->

                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label"></label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label">상품명</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label">가격</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control">
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label">판매시작</label>
                            <div class="col-sm-10">
                                <input type="Date" class="form-control" id="currentDate" readonly>
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputDate" class="col-sm-2 col-form-label">판매종료</label>
                            <div class="col-sm-10">
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="row mb-3">
                            <label for="inputText" class="col-sm-2 col-form-label">상품내용</label>
                            <div class="col-sm-10">
                                <!-- Quill Editor Full -->
                                <div class="quill-editor-full" style="min-height: 400px"></div>
                                <!-- End Quill Editor Full -->

                            </div>
                        </div>

                        <div class="row mb-3" style="margin-top: 80px; margin-right: -35px">
                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">수량</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="row mb-3">
                            <label for="inputNumber" class="col-sm-2 col-form-label">썸네일 사진 업로드</label>
                            <div class="col-sm-10">
                                <input class="form-control" type="file" id="image" accept="image/*"
                                       onchange="setThumbnail(event);" multiple/>
                                <br>


                                <br>
                                <div id="image_container"></div>
                                <script>
                                    function setThumbnail(event) {
                                        for (var image of event.target.files) {
                                            var reader = new FileReader();

                                            reader.onload = function (event) {
                                                var img = document.createElement("img");
                                                img.setAttribute("src", event.target.result);
                                                document.querySelector("div#image_container").appendChild(img);
                                            };

                                            console.log(image);
                                            reader.readAsDataURL(image);
                                        }
                                    }
                                </script>
                            </div>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-outline-primary">확인</button>
                            <button type="submit" class="btn btn-outline-danger">초기화</button>
                        </div>

                        </form><!-- End General Form Elements -->

                    </div>
                </div>

            </div>
        </div>
    </section>

</main>
<!-- End #main -->


<script>
    <%--현재 날짜 가져오기--%>
    document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);

    $("#gs_keyword").keyup(function () {

        // 검색어가 존재하지 않으면 출력결과 숨기기
        if ($("#gs_keyword").val() == "") {
            $("#panel").hide();
        } // if end

        // 모달창의 검색창에 검색어 추출
        let params = $("#gs_keyword").serialize();

        // ajax로 searchProc 실행
        $.post("searchProc", params, responseProc);
    }); // keyup() end

    function responseProc(data) {
        // alert(data)

        if (data.length > 0) {
            let result = data.split("|"); // | 기호를 기준으로 문자열 분리
            // alert(result[0]); // 검색 결과 수
            // alert(result[1]); // 검색 결과 내용

            let title = result[1].split(","); // , 기호를 기준으로 문자열 분리
            let code = result[2].split(",");

            console.log(code);

            let str = ""; // 검색 결과를 저장할 변수
            $.each(title, function (index, key) {
                str += "<hr>";
                str += "<img src='/images/thumb/" + code[index] + "/thumb.jpg' style='width: 10%'>&nbsp;"
                str += "<span id='title_key' style='cursor: pointer' onclick='panelClick(" + code[index] + ")'>" + key + "</span>";
                str += "<hr>";
            }); // each() end

            $("#panel").html(str);
            $("#panel").show();

        } else {
            $("#panel").hide();
        } // if end
    }//responseProc() end

</script>


<%@ include file="sellerfooter.jsp" %>