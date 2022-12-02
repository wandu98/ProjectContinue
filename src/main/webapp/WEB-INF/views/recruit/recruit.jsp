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
                                        <li></li>
                                        <br>
                                        <li></li>
                                        <br>
                                        <li></li>
                                        <br>
                                        <li></li>
                                        <br>
                                        <li></li>
                                        <br>
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
                <div class="row">


                    <c:forEach var="row" items="${list}" varStatus="vs">
                        <div class="col-lg-4 col-md-4 col-sm-4">
                            <a href="#">
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
                                        <p>${game[vs.index].gm_name} (N / ${row.rcrbrd_max})</p>
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

            <div style="margin: auto"><button id="more" class="btn btn-outline-danger">더보기 (more)</button></div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<script>
    function recruitForm() {
        location.href = "/recruit/form";
    }
</script>

<%@ include file="../footer.jsp" %>
