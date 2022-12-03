<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-01
  Time: 오전 11:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ include file="../header.jsp" %>

<!-- 모집 게시판 배너 시작 -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>모집 게시판</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>모집</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 모집 게시판 배너 끝 -->

<!-- 등록 폼 시작 -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>모집글 등록</h4>
            <form action="#">
                <div class="row">
                    <div class="col-lg-8 col-md-6">
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input" style="margin-left: auto">
                                    <p>게임 타이틀 검색<span>*</span></p>
                                    <input type="text" placeholder="Search..." class="col-lg-12" id="game_search" name="game_search" readonly onclick="game_search()">&nbsp;

                                    <!-- 모달창 -->
                                    <div class="modal fade" id="gs_modal">
                                        <div class="modal-dialog">
                                            <div class="modal-content">

                                                <!-- 모달 헤더 -->
                                                <div class="modal-header" style="border-bottom: none">
                                                    <h4 class="modal-title">게임 타이틀 검색</h4>
                                                    <button type="button" class="close" data-dismiss="modal">×</button>
                                                </div>

                                                <!-- 모달 본문 -->
                                                <div class="modal-body" id="gs_main">
                                                    <input type="text" placeholder="Search..."id="gs_keyword" name="gs_keyword">
                                                    <div id="panel" style="display: none"></div>
                                                </div>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="checkout__input col-lg-6">
                                <p>모집 인원 (본인 포함)<span>*</span></p>
                                <select id="rcrbrd_max" name="rcrbrd_max">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                    <option value="6">6</option>
                                    <option value="7">7</option>
                                    <option value="8">8</option>
                                    <option value="9">9</option>
                                    <option value="10">10</option>
                                </select>
                                <br>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>닉네임<span>*</span></p>
                                    <input type="text" value="닉네임" readonly>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>패스워드<span>*</span></p>
                                    <input type="text" placeholder="password">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input">
                            <p>제목<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input">
                            <p>내용<span>*</span></p>
                            <textarea name="description" id="description"></textarea>
                            <script type="text/javascript">	// 글쓰기 editor 및 사진 업로드 기능
                            CKEDITOR.replace('description',
                                {filebrowserUploadUrl:'/recruit/imageUpload'
                                });
                            </script>
                        </div>

                        <div class="checkout__input">
                            <p>Country/State<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input">
                            <p>Postcode / ZIP<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="row">
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Phone<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="checkout__input">
                                    <p>Email<span>*</span></p>
                                    <input type="text">
                                </div>
                            </div>
                        </div>
                        <div class="checkout__input__checkbox">
                            <label for="acc">
                                Create an account?
                                <input type="checkbox" id="acc">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <p>Create an account by entering the information below. If you are a returning customer
                            please login at the top of the page</p>
                        <div class="checkout__input">
                            <p>Account Password<span>*</span></p>
                            <input type="text">
                        </div>
                        <div class="checkout__input__checkbox">
                            <label for="diff-acc">
                                Ship to a different address?
                                <input type="checkbox" id="diff-acc">
                                <span class="checkmark"></span>
                            </label>
                        </div>
                        <div class="checkout__input">
                            <p>Order notes<span>*</span></p>
                            <input type="text"
                                   placeholder="Notes about your order, e.g. special notes for delivery.">
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="checkout__order">
                            <h4>모집 요약</h4>
                            <ul>
                                <li>타이틀명 <span>$75.99</span></li>
                                <li>모집 인원 <span id="rcrbrd_max2" name="rcrbrd_max2"></span></li>
                                <li>모집 장소 <span id="rcrbrd_adr2" name="rcrbrd_adr2">$151.99</span></li>
                                <li>종료일 <span id="rcrbrd_edate2" name="rcrbrd_edate2">$53.99</span></li>
                            </ul>
                            <div class="checkout__order__subtotal">사용 마일리지 <span style="color: red">-100</span></div>
                            <div class="checkout__input__checkbox">
                                <label for="acc-or">
                                    위에 적힌 정보가 맞나요?
                                    <input type="checkbox" id="acc-or">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <button type="submit" class="site-btn">등록</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- 등록 폼 끝 -->

<script>

    /* 클릭하면 모달창 보이기 */
    $(document).ready(function(){
        $("#game_search").click(function(){
            // 모달창의 검색창 초기화
            $("#gs_keyword").val("");
            // 모달창 보이기
            $("#gs_modal").modal({backdrop: 'static', keyboard: false});
        });
    });

    $("#gs_keyword").keyup(function (){

        // 검색어가 존재하지 않으면 출력결과 숨기기
        if($("#gs_keyword").val() == "") {
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
                str += "<br>";
                str += "<img src='/images/thumb/" + code[index] + "/thumb.jpg' style='width: 10%'>&nbsp;"
                str += "<span>" + key + "</span>";
                str += "<br>";
            }); // each() end

            $("#panel").html(str);
            $("#panel").show();

        } else {
            $("#panel").hide();
        } // if end


    } // responseProc() end

    $(document).ready(function(){
        $("#rcrbrd_max").on("change", function(){
            //selected value
            $("#rcrbrd_max2").text($("#rcrbrd_max option:selected").text());
        });
    });


</script>

<%@ include file="../footer.jsp" %>
