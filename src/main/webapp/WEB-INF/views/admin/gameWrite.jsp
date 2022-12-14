<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-08
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="admin_header.jsp" %>

<style>
    .filebox .upload-name {
        display: inline-block;
        height: 40px;
        padding: 0 10px;
        vertical-align: middle;
        border: 1px solid #dddddd;
        width: 78%;
        color: #999999;
    }

    .filebox label {
        display: inline-block;
        padding: 10px 20px;
        color: #fff;
        vertical-align: middle;
        background-color: #7796dc;
        cursor: pointer;
        height: 40px;
        margin-left: 10px;
    }

    .filebox input[type="file"] {
        position: absolute;
        width: 0;
        height: 0;
        padding: 0;
        overflow: hidden;
        border: 0;
    }
</style>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>품목 등록</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">홈</a></li>
                <li class="breadcrumb-item active">품목 등록</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="col-12">
                    <div class="card overflow-auto">

                        <div class="card-body pb-0">
                            <h5 class="card-title">품목 관리 <span>| 등록</span></h5>

                            <form action="/admin/gameWrite" method="post" enctype="multipart/form-data">
                                <div class="form-floating mb-3">
                                    <input type="hidden" id="gm_code" name="gm_code" value="mn">
                                    <select class="form-select" id="gm_code2" name="gm_code2"
                                            onchange="codeFinder(this.value)">
                                        <option value="mn">본체</option>
                                        <option value="pt">타이틀 (패키지)</option>
                                        <option value="dt">타이틀 (다운로드)</option>
                                        <option value="dl">다운로드 추가 컨텐츠</option>
                                        <option value="ol">온라인 이용권</option>
                                        <option value="pn">선불 번호</option>
                                        <option value="fc">무료 컨텐츠</option>
                                        <option value="am">아미보</option>
                                        <option value="pc">프로컨트롤러</option>
                                        <option value="jc">조이콘</option>
                                        <option value="ac">주변기기</option>
                                    </select>
                                    <label for="gm_code2">품목 종류</label>
                                </div>

                                <div class="form-floating mb-3">
                                        <textarea class="form-control" placeholder="품목명을 작성해주세요" id="gm_name" name="gm_name"
                                                  style="height: 100px;"></textarea>
                                    <label for="gm_name">품목명</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <input type="number" class="form-control" id="gm_price" name="gm_price">
                                    <label for="gm_price">가격</label>
                                </div>

                                <div class="form-floating mb-3">
                                    <select class="form-select" id="gm_level" name="gm_level">
                                        <option value="all" selected>전체이용가</option>
                                        <option value="12">12세 이용가</option>
                                        <option value="15">15세 이용가</option>
                                        <option value="19">19세 이용가</option>
                                    </select>
                                    <label for="gm_level">이용등급</label>
                                </div>
                                <br>
                                <div class="row mb-3">
                                    <legend class="col-form-label col-sm-2 pt-0">카테고리</legend>
                                    <div class="col-sm-10">
                                        <input type="hidden" id="gm_category" name="gm_category" value="" readonly>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_action" value="액션">
                                            <label class="form-check-label" for="cate_action">
                                                액션
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_adventure" value="어드벤처">
                                            <label class="form-check-label" for="cate_adventure">
                                                어드벤처
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 34%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_rpg" value="RPG">
                                            <label class="form-check-label" for="cate_rpg">
                                                RPG
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_strategy" value="전략">
                                            <label class="form-check-label" for="cate_strategy">
                                                전략
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_fight" value="격투">
                                            <label class="form-check-label" for="cate_fight">
                                                격투
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 34%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_puzzle" value="퍼즐">
                                            <label class="form-check-label" for="cate_puzzle">
                                                퍼즐
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_party" value="파티">
                                            <label class="form-check-label" for="cate_party">
                                                파티
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_simulation" value="시뮬레이션">
                                            <label class="form-check-label" for="cate_simulation">
                                                시뮬레이션
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 34%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_racing" value="레이싱">
                                            <label class="form-check-label" for="cate_racing">
                                                레이싱
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_sports" value="스포츠">
                                            <label class="form-check-label" for="cate_sports">
                                                스포츠
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_arcade" value="아케이드">
                                            <label class="form-check-label" for="cate_arcade">
                                                아케이드
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 34%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_utility" value="실용">
                                            <label class="form-check-label" for="cate_utility">
                                                실용
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_training" value="트레이닝">
                                            <label class="form-check-label" for="cate_training">
                                                트레이닝
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_study" value="학습">
                                            <label class="form-check-label" for="cate_study">
                                                학습
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 34%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_shooting" value="슈팅">
                                            <label class="form-check-label" for="cate_shooting">
                                                슈팅
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_board" value="보드">
                                            <label class="form-check-label" for="cate_board">
                                                보드
                                            </label>
                                        </div>

                                        <div class="form-check" style="float: left; width: 33%;">
                                            <input class="form-check-input" name="inputCate" type="checkbox"
                                                   id="cate_extra" value="기타">
                                            <label class="form-check-label" for="cate_extra">
                                                기타
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <div class="row mb-3">
                                    <div class="check__input filebox">
                                        <input class="upload-name" value="첨부파일" placeholder="첨부파일" readonly>
                                        <label for="gm_img">이미지 선택</label>
                                        <input type="file" id="gm_img" name="gm_img" style="display: none">
                                        <div id="imgView" class="set-bg product__item__pic"><img id="pic_view"
                                                                                                 src="/images/thumb/${mem.mem_id}/${mem.mem_pic}"
                                                                                                 style="height: 100%; overflow: hidden">
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <hr>
                                <div style="text-align: center; margin: 5%">
                                    <button type="submit" class="btn btn-outline-dark">등록</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 품목 등록 END -->

            </div>
        </div>

    </section>

</main>
<!-- End #main -->
<script>

    // 카테고리 편집
    $(document).ready(function () {
        $(".form-check-input").click(function () {
            // alert($("input[type=checkbox][name=inputCate]:checked").val());
            let tmp_arr = [];
            $(".form-check-input:checked").each(function () {
                let tmp = $(this).val();
                tmp_arr.push(tmp);
            })
            // alert(tmp_arr);

            let result = "";

            for (let i = 0; i < tmp_arr.length; i++) {
                if (i == tmp_arr.length - 1) {
                    result += tmp_arr[i];
                } else {
                    result += tmp_arr[i];
                    result += " ";
                }
            }
            $('#gm_category').val(result);

        })
    })

    // 파일 이름 출력
    $("#gm_img").on('change', function () {
        let fileName = $("#gm_img").val(); // 파일 경로
        let splitPoint = fileName.lastIndexOf('\\'); // 경로를 \로 나눔
        let filenameSplit = fileName.substring(splitPoint+1, fileName.length);
        $(".upload-name").val(filenameSplit);
    });

    function codeFinder(value) {
        $("#gm_code").val(value);
        // alert($("#gm_code").val());
    }

</script>
<%@ include file="admin_footer.jsp" %>