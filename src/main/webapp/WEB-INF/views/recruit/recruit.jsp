<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<script src="/js/jquery.nicescroll.min.js"></script>

<style>
    #panel {
        display: none;
        z-index: 3;
        position: absolute;
        background-color: #f7f7f7;
        overflow-y: auto;
        max-height:500px;
        border-radius: 2%;
        box-shadow: 1px 1px 1px #bfbab9;
    }

    .blog__item__text > p {
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }

    .blog__item__text > h5 {
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;
        overflow: hidden;
    }
</style>

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

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12" style="text-align: center; margin: 3%;">
                <div class="dropdown" style="float: left; margin: 1%">
                    <button type="button" class="btn btn-danger dropdown-toggle"
                            data-toggle="dropdown"> 지역 선택
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Link 1
                        </a>
                        <a class="dropdown-item" href="#">Link 2</a>
                        <a class="dropdown-item" href="#">Link 3</a>
                    </div>
                </div>
                <div style="float: right; margin: 1%">
                    <button type="button" class="btn btn-outline-danger" onclick="location.href = '/recruit/form'"> 모집글 등록
                    </button>
                </div>
            </div>

            <div class="col-lg-3 col-md-4">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search" style="position: relative">
                        <form action="/recruit/searchWord">
                            <input type="text" id="gs_keyword" name="gs_keyword" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                        <div id="panel"></div>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>정렬</h4>
                        <ul>
                            <li><a href='javascript:void(0)' onclick='listAgain("rcrbrd_num")'>최신순</a></li>
                            <li><a href='javascript:void(0)' onclick='listAgain("rcrbrd_views")'>인기순</a></li>
                            <li><a href='javascript:void(0)' onclick='listAgain("cnt")'>참가인원 많은 순</a></li>
                        </ul>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>이번달 모집왕</h4>
                        <div class="blog__sidebar__recent">
                            <div class="blog__sidebar__recent__item__text">
                                <div style="margin: 7%">
                                    <ol>
                                        <c:forEach var="king" items="${rcrKing}" varStatus="vs2">
                                            <li id="king${vs2.count}">${king.mem_nick}(${king.mem_id})</li>
                                            <br>
                                        </c:forEach>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>최근 검색어</h4>
                        <div class="blog__sidebar__item__tags">
                            <a href="#">포켓몬</a>
                            <a href="#">스플래툰</a>
                            <a href="#">1+1은귀요미</a>
                            <a href="#">짱구</a>
                            <a href="#">동물의숲</a>
                            <a href="#">김tothe홍tothe승</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-8 col-md-7">
                <input type="hidden" id="startCount" name="startCount" value=9>
                <input type="hidden" id="endCount" name="endCount" value=17>
                <div class="row" id="board">
                    <c:forEach var="row" items="${list}" varStatus="vs">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <a href="/recruit/detail/${row.rcrbrd_num}">
                                <div class="blog__item"
                                     style="box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%">
                                    <div class="blog__item__pic">
                                        <img src="/images/thumb/${row.gm_code}/thumb.jpg" alt="">
                                    </div>
                                    <div class="blog__item__text">
                                        <ul>
                                            <li><i class="fa fa-calendar-o"></i> ${row.rcrbrd_edate}</li>
                                            <li><i class="fa fa-comment-o"></i> 댓글 수</li>
                                        </ul>
                                        <h5>${row.rcrbrd_subject}</h5>
                                        <p>${game[vs.index]}</p>
                                        <span id="list${vs.count}"
                                               name="list${vs.count}" style="color: #7796dc">(${attendCount.get(vs.index)} / ${row.rcrbrd_max})</span>

                                    </div>
                                </div>
                            </a>
                        </div>
                        <%-- 한줄에 3칸씩 --%>
                        <c:if test="${vs.count mod 3==0}">
                            <br>
                        </c:if>
                    </c:forEach>

                </div>
            </div>

            <div style="margin: auto" id="more_div">
                <input type="hidden" id="more_order" name="more_order" value="rcrbrd_num">
                <button type="button" id="more" class="btn btn-outline-danger"
                        onclick="more($('#startCount').val(), $('#endCount').val(), $('#more_order').val())">더보기 (more)
                </button>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<script>
    document.addEventListener("DOMContentLoaded", () => {
        $('#panel').niceScroll();
    });

    // 더보기 기능
    function more(startCount, endCount, order) {
        console.log("시작 번호 : " + startCount);
        console.log("마지막 번호 : " + endCount);

        $.ajax({
            type: "post",
            url: "/recruit/getMoreContents",
            data: {
                "startCount": startCount,
                "endCount": endCount,
                "order": order
            },
            success: function (result) {

                let message = "";

                $.each(result, function (index, value) {
                    // alert(index);
                    // alert(value);
                    startCount = parseInt(startCount);

                    message += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                    message += "<a href='/recruit/detail/" + value.rcrbrd_num + "'>";
                    message += "<div class='blog__item' style='box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%'>";
                    message += "<div class='blog__item__pic'>";
                    message += "<img src='/images/thumb/" + value.gm_code + "/thumb.jpg' alt=''>";
                    message += "</div>";
                    message += "<div class='blog__item__text'>";
                    message += "<ul>";
                    message += "<li><i class='fa fa-calendar-o'></i> " + value.rcrbrd_edate + "</li>";
                    message += "<li><i class='fa fa-comment-o'></i> 댓글 수</li>";
                    message += "</ul>";
                    message += "<h5>" + value.rcrbrd_subject + "</h5>";
                    message += "<p>" + value.gm_name + "</p>";
                    message += "<span id='list" + (index + startCount + 1) + "' name='list" + (index + startCount + 1) + "' style='color: #7796dc'>" + "(" + value.count + " / " + value.rcrbrd_max + ")</span>";
                    message += "</div>";
                    message += "</div>";
                    message += "</a>";
                    message += "</div>";

                    if ((index % 3) == 0) {
                        message += "<br>"
                    }

                });

                let listSize =
                ${list[0].rcrbrd_num}

                if ($('#endCount').val() >= listSize) {
                    $('#more_div').css("display", "none");
                } else {
                    $('#startCount').val((parseInt($('#startCount').val())) + 9);
                    $('#endCount').val((parseInt($('#endCount').val())) + 9);
                }

                $('#board').append(message);
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })

    } // more() end


    /*
    function more(id, cnt) {
    let list_length = ${list.size()};
        let aname = id + "_btn";
        let callLength = list_length;

        $('#startCount').val(callLength);
        $('#viewCount').val(cnt);

        $.ajax({
            type: "post",
            url: "/recruit/getMoreContents"
            data: $('#recruitMain').serialize(),
            dataType: "json",
            success: function (data) {
                if (data.resultCnt > 0) {
                    let list = data.resultlist;
                    if(row.rcrbrd_subject != '') {
                        $('#'+aname).attr('href', "javascript:moreContent('"+id+"', "+cnt+");");
                        getMoreList(list);
                    } else {
                        $("#"+id).remove();
                    }
                }
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function getMoreList(list) {
        let content = "";
        let length = list.length;
        for (let i = 0; i < list.length; i++) {
            let row = list[i];
            if (row.rcrbrd_subject != '') {
                content += '<div class="col-lg-4 col-md-4 col-sm-4">';
                content += '<div class=\"<a href="/recruit/detail/' + row.rcrbrd_num+ '">\"';
                content += '<div class="blog__item" style="box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%">';
                content += '<div class="blog__item__pic">';
                content += '<img src="/images/thumb/' + row.gm_code + '/thumb.jpg" alt="">';
                content += '</div>';
                content += '<div class="blog__item__text">';
                content += '</div>';
                content += '</div>';
                content += '</a>';
                content += '</div>';
            }
        }
        $("#more_list div:last").after(content);
    }
    */

    function listAgain(order) {

        console.log("order : " + order);

        $.ajax({
            type: "post",
            url: "/recruit",
            data: {
                "order": order
            },
            success: function (result) {

                let message = "";
                let listSize = ${list[0].rcrbrd_num};
                $('#startCount').val(9);
                $('#endCount').val(17);

                $.each(result, function (index, value) {
                    // alert(index);
                    // alert(value);
                    message += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                    message += "<a href='/recruit/detail/" + value.rcrbrd_num + "'>";
                    message += "<div class='blog__item' style='box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%'>";
                    message += "<div class='blog__item__pic'>";
                    message += "<img src='/images/thumb/" + value.gm_code + "/thumb.jpg' alt=''>";
                    message += "</div>";
                    message += "<div class='blog__item__text'>";
                    message += "<ul>";
                    message += "<li><i class='fa fa-calendar-o'></i> " + value.rcrbrd_edate + "</li>";
                    message += "<li><i class='fa fa-comment-o'></i> 댓글 수</li>";
                    message += "</ul>";
                    message += "<h5>" + value.rcrbrd_subject + "</h5>";
                    message += "<p>" + value.gm_name + "</p>";
                    message += "<span id='list" + (index + 1) + "' name='list" + (index + 1) + "' style='color: #7796dc'>" + "(" + value.count + " / " + value.rcrbrd_max + ")</span>";
                    message += "</div>";
                    message += "</div>";
                    message += "</a>";
                    message += "</div>";

                    if ((index % 3) == 0) {
                        message += "<br>"
                    }
                });

                $('#board').html(message);
                $('#more_order').val(order);

                if (8 < listSize) {
                    $('#more_div').show();
                }
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    }

    $("#gs_keyword").keyup(function () {

        // 검색어가 존재하지 않으면 출력결과 숨기기
        if ($("#gs_keyword").val() == "") {
            $("#panel").hide();
        } // if end

        // 모달창의 검색창에 검색어 추출
        let params = $("#gs_keyword").serialize();

        // ajax로 searchProc 실행
        $.post("/recruit/searchProc", params, responseProc);
    }); // keyup() end

    function responseProc(data) {
        // alert(data)

        if (data.length > 0) {
            let result = data.split("^^^"); // | 기호를 기준으로 문자열 분리
            // alert(result[0]); // 검색 결과 수
            // alert(result[1]); // 검색 결과 내용

            let title = result[1].split(","); // , 기호를 기준으로 문자열 분리
            let code = result[2].split(",");

            console.log(code);

            let str = ""; // 검색 결과를 저장할 변수
            $.each(title, function (index, key) {
                let codenum = code[index];
                //alert(codenum);

                str += "<div style='margin: 2%'>"
                str += "<hr>";
                str += "<img src='/images/thumb/" + codenum + "/thumb.jpg' style='width: 20%'>&nbsp;"
                str += "<span id='title_key' style='cursor: pointer' onclick='panelClick()'>" + key + "</span>";
                str += "<hr>";
                str += "</div>";
            }); // each() end

            $("#panel").html(str);
            $("#panel").show();

        } else {
            $("#panel").hide();
        } // if end


    } // responseProc() end

    function panelClick() {
        // 타겟의 내부 텍스트 추출
        let title = event.target.innerText;

        // 추출한 텍스트를 모달창의 검색창에 입력
        $("#gs_keyword").val(title);
        $("#panel").hide();
    }

</script>

<%@ include file="../footer.jsp" %>
