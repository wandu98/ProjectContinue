<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 1:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>

<jsp:include page="sellerheader.jsp"></jsp:include>


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
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">상품입력</h5>

                        <!-- General Form Elements -->
                        <form>
                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">카테고리</label>
                                <div class="col-sm-10">
                                    <select class="form-select" aria-label="Default select example">
                                        <option selected>--------------</option>
                                        <option value="1">본체</option>
                                        <option value="2">타이틀(패키지)</option>
                                        <option value="3">타이틀(다운로드)</option>
                                        <option value="4">다운로드 추가 컨텐츠</option>
                                        <option value="5">온라인 이용권</option>
                                        <option value="6">선불 번호</option>
                                        <option value="7">무료 컨텐츠</option>
                                        <option value="8">프로컨트롤러</option>
                                        <option value="9">조이콘</option>
                                        <option value="10">주변 기기</option>

                                    </select>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputText" class="col-sm-2 col-form-label">제목</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputEmail" class="col-sm-2 col-form-label">가격</label>
                                <div class="col-sm-10">
                                    <input type="email" class="form-control">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputDate" class="col-sm-2 col-form-label">판매기간 해당날짜로 only read</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputDate" class="col-sm-2 col-form-label">판매종료</label>
                                <div class="col-sm-10">
                                    <input type="date" class="form-control">
                                </div>
                            </div>
                            <div class="row mb-3">
                                <label for="inputPassword" class="col-sm-2 col-form-label">상품내용</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" style="height: 100px"></textarea>
                                </div>
                            </div>
                            <div class="row mb-3">
                                <div class="row mb-3">
                                    <label for="inputEmail" class="col-sm-2 col-form-label">수량</label>
                                    <div class="col-sm-10">
                                        <input type="email" class="form-control">
                                    </div>
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label for="inputNumber" class="col-sm-2 col-form-label">사진 업로드</label>
                                <div class="col-sm-10">
                                    <input class="form-control" type="file" id="image" accept="image/*" onchange="setThumbnail(event);" multiple/>
                                    <br>
                                    <input class="form-control" type="reset" style="width: 10%">
                                    <br>
                                    <div id="image_container"></div>
                                    <script>
                                        function setThumbnail(event) {
                                            for (var image of event.target.files) {
                                                var reader = new FileReader();

                                                reader.onload = function(event) {
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



                        </form><!-- End General Form Elements -->

                    </div>
                </div>

            </div>
        </div>
    </section>

</main><!-- End #main -->

<jsp:include page="sellerfooter.jsp"></jsp:include>