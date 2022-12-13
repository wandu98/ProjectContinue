<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
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

<!-- Blog Section Begin -->
<section class="blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12" style="text-align: center; margin: 3%;">
                <div class="dropdown" style="float: left; margin: 1%">
                    <button type="button" class="btn btn-danger dropdown-toggle"
                            data-toggle="dropdown"> 타이틀 선택
                    </button>
                </div>
                <div class="dropdown" style="float: left; margin: 1%">
                    <button type="button" class="btn btn-danger dropdown-toggle"
                            data-toggle="dropdown"> 지역 선택
                    </button>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Link 1</a>
                        <a class="dropdown-item" href="#">Link 2</a>
                        <a class="dropdown-item" href="#">Link 3</a>
                    </div>
                </div>
                <div style="float: right; margin: 1%">
                    <button type="button" class="btn btn-outline-danger" onclick="recruitForm()"> 모집글 등록
                    </button>
                </div>
            </div>

            <div class="col-lg-3 col-md-4">
                <div class="blog__sidebar">
                    <div class="blog__sidebar__search">
                        <form action="#">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><span class="icon_search"></span></button>
                        </form>
                    </div>
                    <div class="blog__sidebar__item">
                        <h4>정렬</h4>
                        <ul>
                            <li><a href="#">최신순</a></li>
                            <li><a href="#">인기순</a></li>
                            <li><a href="#">모집인원 많은 순</a></li>
                            <li><a href="#"></a></li>
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
                <div class="row" id="board">
                    <input type="hidden" id="startCount" name="startCount" value=9>
                    <input type="hidden" id="endCount" name="endCount" value=17>
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
                                        <p>${game[vs.index]} (<span id="list${vs.count}" name="list${vs.count}">${attendCount.get(vs.index)}</span>
                                            / ${row.rcrbrd_max})</p>
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

            <div style="margin: auto">
                <button type="button" id="more" class="btn btn-outline-danger" onclick="more($('#startCount').val(), $('#endCount').val())">더보기 (more)</button>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<script>
    function recruitForm() {
        location.href = "/recruit/form";
    } // recruitForm() end


    function more(startCount, endCount) {
        console.log(startCount);
        console.log(endCount);

        $.ajax({
            type: "post",
            url: "/recruit/getMoreContents",
            data: {
                "startCount": startCount,
                "endCount": endCount
            },
            success: function (result) {

                let message = "";

                $.each(result, function (index, value) {
                    // alert(index);
                    // alert(value);
                    startCount = parseInt(startCount);

                    message += "<div class='col-lg-4 col-md-4 col-sm-4'>";
                    message += "<a href='/recruit/detail/" + value.rcrbrd_num +"'>";
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
                    message += "<p>" + value.gm_name + " (<span id='list" + (index + startCount + 1) + "' name='list" + (index + startCount + 1) + "'>" + value.count + "</span> / " + value.rcrbrd_max + ")</p>";
                    // message += "<p>${game[vs4.index]} (<span id='list${vs4.count}' name='list${vs4.count}'>${attendCount.get(vs4.index)}</span> / ${mo.rcrbrd_max})</p>";
                    message += "</div>";
                    message += "</div>";
                    message += "</a>";
                    message += "</div>";

                    if ((index % 3) == 0) {
                        message += "<br>"
                    }


                });

                $('#board').append(message);

                $('#startCount').val((parseInt($('#startCount').val()))+9);
                $('#endCount').val((parseInt($('#endCount').val()))+9);
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })

    } // more() end


/*    function more(id, cnt) {
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
    }*/

</script>

<%@ include file="../footer.jsp" %>
