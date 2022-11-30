<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-29
  Time: 오후 1:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header_before.jsp"></jsp:include>

<main id="main">

    <!-- ======= 모집 게시판 요약 ======= -->
    <section class="breadcrumbs">
        <div class="container">

            <div class="d-flex justify-content-between align-items-center">
                <h2></h2>
                <ol>
                    <li><a href="/">Home</a></li>
                    <li>Recruit</li>
                </ol>
            </div>

        </div>
    </section><!-- End Breadcrumbs -->

    <%-- 모집 내용 --%>
    <section id="team" class="team section-bg">
        <nav class="container" data-aos="fade-up">

            <div class="section-title">
                <h2>모집 게시판</h2>
                <p>상세한 내용은 여기에</p>
            </div>

            <%-- 검색창 --%>
            <div class="search-bar search-bar-show">
                <form class="search-form d-flex align-items-center">
                    <div class="search-bar search-bar-show">
                        <select class="form-select">
                            <option value="0" selected>제목 + 내용</option>
                            <option value="1">제목</option>
                            <option value="2">내용</option>
                            <option value="3">작성자</option>
                        </select>
                        <input type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-primary" type="submit">Search</button>
                    </div>
                </form>
            </div>

            <div class="row">

                <div class="col-lg-3 col-md-6 d-flex align-items-stretch" data-aos="fade-up" data-aos-delay="100">
                    <div class="member">
                        <div class="member-img">
                            <img src="/images/001.jpg" class="img-fluid" alt="">
                            <a href="/">
                                <div class="social">
                                    <div>게임명<br><br>게임 설명</div>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>


            </div>

    </section>


</main>
<!-- End #main -->

<jsp:include page="../footer_before.jsp"></jsp:include>