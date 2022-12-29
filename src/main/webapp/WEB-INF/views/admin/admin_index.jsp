<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-27
  Time: 오후 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta name="robots" content="noindex">

    <title>Continue? Admin</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="/admin_assets/img/favicon.png" rel="icon">
    <link href="/admin_assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.gstatic.com" rel="preconnect">
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

    <!-- Vendor CSS Files -->
    <link href="/admin_assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin_assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
    <link href="/admin_assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
    <link href="/admin_assets/vendor/quill/quill.snow.css" rel="stylesheet">
    <link href="/admin_assets/vendor/quill/quill.bubble.css" rel="stylesheet">
    <link href="/admin_assets/vendor/remixicon/remixicon.css" rel="stylesheet">
    <link href="/admin_assets/vendor/simple-datatables/style.css" rel="stylesheet">

    <!-- Template Main CSS File -->
    <link href="/admin_assets/css/style.css" rel="stylesheet">

    <%-- Script --%>
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="/js/memmodify.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>

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
</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="/admin" class="logo d-flex align-items-center">
            <img src="/admin_assets/img/logo.png" alt="">
            <span class="d-none d-lg-block">ontinue? Admin</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item dropdown">
                <a class="nav-link nav-icon" href="/">
                    <i class="bi-house"></i>
                </a><!-- End Messages Icon -->
            </li>

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->

            <li class="nav-item dropdown">

                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow notifications">
                    <li class="dropdown-header">
                        You have 4 new notifications
                        <a href="#"><span class="badge rounded-pill bg-primary p-2 ms-2">View all</span></a>
                    </li>
                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-exclamation-circle text-warning"></i>
                        <div>
                            <h4>Lorem Ipsum</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>30 min. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-x-circle text-danger"></i>
                        <div>
                            <h4>Atque rerum nesciunt</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>1 hr. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-check-circle text-success"></i>
                        <div>
                            <h4>Sit rerum fuga</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>2 hrs. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>

                    <li class="notification-item">
                        <i class="bi bi-info-circle text-primary"></i>
                        <div>
                            <h4>Dicta reprehenderit</h4>
                            <p>Quae dolorem earum veritatis oditseno</p>
                            <p>4 hrs. ago</p>
                        </div>
                    </li>

                    <li>
                        <hr class="dropdown-divider">
                    </li>
                    <li class="dropdown-footer">
                        <a href="#">Show all notifications</a>
                    </li>

                </ul><!-- End Notification Dropdown Items -->

            </li><!-- End Notification Nav -->


            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <span class="d-none d-md-block ps-2">Admin</span>
                </a><!-- End Profile Iamge Icon -->

            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="/admin">
                <i class="bi bi-grid"></i>
                <span>대시보드</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>공지사항</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/admin/noticeWrite">
                        <i class="bi bi-circle"></i><span>글쓰기</span>
                    </a>
                </li>

                <li>
                    <a href="/notice/noticeList">
                        <i class="bi bi-circle"></i><span>공지사항 목록</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#" aria-expanded="true">
                <i class="bi bi-gem"></i><span>이벤트</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="icons-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/admin/eventWrite">
                        <i class="bi bi-circle"></i><span>글쓰기</span>
                    </a>
                </li>

                <li>
                    <a href="/event/event">
                        <i class="bi bi-circle"></i><span>이벤트 목록</span>
                    </a>
                </li>
            </ul>
        </li><!-- End icons Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>품목 등록</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/admin/gameWrite">
                        <i class="bi bi-circle"></i><span>품목 등록</span>
                    </a>
                </li>
                <li>
                    <a onclick="gameCrawling()" style="cursor: pointer">
                        <i class="bi bi-circle"></i><span>품목 자동 등록</span>
                    </a>
                </li>
                <li>
                    <a href="/admin/gameList">
                        <i class="bi bi-circle"></i><span>품목 목록</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#member-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>회원 관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="member-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/admin/memList">
                        <i class="bi bi-circle"></i><span>회원 목록(등급 수정)</span>
                    </a>
                </li>

            </ul>
        </li><!-- End Components Nav -->




        <%--<li class="nav-heading">Pages</li>--%>

    </ul>

</aside><!-- End Sidebar-->

<main id="main" class="main">

    <div class="pagetitle">
        <h1>대시보드</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/admin">Home</a></li>
                <li class="breadcrumb-item active">대시보드</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <hr>

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>일자별</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="sales('day')" id="sales_day">하루</a></li>
                                    <li><a class="dropdown-item" onclick="sales('month')" id="sales_month">한달</a></li>
                                    <li><a class="dropdown-item" onclick="sales('year')" id="sales_year">일년</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">판매 현황 <span id="sales_date">| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 id="sales_value">${sales}</h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Revenue Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card revenue-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>일자별</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="revenue('day')" id="revenue_day">하루</a></li>
                                    <li><a class="dropdown-item" onclick="revenue('month')" id="revenue_month">한달</a></li>
                                    <li><a class="dropdown-item" onclick="revenue('year')" id="revenue_year">일년</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">수익 <span id="revenue_date">| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-currency-dollar"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 id="revenue_value"><fmt:formatNumber type="currency" value="${revenue}" groupingUsed="true"></fmt:formatNumber></h6>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div><!-- End Revenue Card -->

                    <!-- Customers Card -->
                    <div class="col-xxl-4 col-xl-12">

                        <div class="card info-card customers-card">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>일자별</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="customer('day')" id="customer_day">하루</a></li>
                                    <li><a class="dropdown-item" onclick="customer('month')" id="customer_month">한달</a></li>
                                    <li><a class="dropdown-item" onclick="customer('year')" id="customer_year">일년</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">구매고객 <span id="customer_date">| Today</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6 id="customer_value">${customer}명</h6>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div><!-- End Customers Card -->


                    <!-- Recent Sales -->
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="seller('day')">Today</a></li>
                                    <li><a class="dropdown-item" onclick="seller('month')">This Month</a></li>
                                    <li><a class="dropdown-item" onclick="seller('year')">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">최근 가입 회원 <span id="mem_date">| Today</span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">회원 ID</th>
                                        <th scope="col">회원이름</th>
                                        <th scope="col">닉네임</th>
                                        <th scope="col">연락처</th>
                                        <th scope="col">가입일</th>
                                    </tr>
                                    </thead>
                                    <tbody id="mem_value">
                                    <c:forEach var="row" items="${mem}" varStatus="vs">
                                    <tr>
                                        <th scope="row">${row.mem_id}</th>
                                        <td>${row.mem_name}</td>
                                        <td>${row.mem_nick}</td>
                                        <td>${row.mem_phone}</td>
                                        <td><span>${row.mem_joindate}</span></td>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div><!-- End Recent Sales -->

                    <!-- 품목 등록 -->
                    <div class="col-12">
                        <div class="card overflow-auto">

                            <div class="card-body pb-0">
                                <h5 class="card-title">품목 관리 <span>| 등록</span></h5>

                                <form action="/admin/gameWrite" method="post" enctype="multipart/form-data">
                                    <div class="form-floating mb-3">
                                        <input type="hidden" id="gm_code" name="gm_code" value="mn">
                                        <select class="form-select" id="gm_code2" name="gm_code2"
                                                onchange="codeFinder(this.value)">
                                            <option value="mn" selected>본체</option>
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
                                                                                                     src=""
                                                                                                     style="max-width: 20%;">
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
            </div><!-- End Left side columns -->

            <!-- Right side columns -->
            <div class="col-lg-4">


                <!-- Budget Report -->
                <div class="card">
                    <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li class="dropdown-header text-start">
                                <h6>Filter</h6>
                            </li>

                            <li><a class="dropdown-item" onclick="budgetReport('day')">Today</a></li>
                            <li><a class="dropdown-item" onclick="budgetReport('month')">This Month</a></li>
                            <li><a class="dropdown-item" onclick="budgetReport('year')">This Year</a></li>
                        </ul>
                    </div>

                    <div class="card-body pb-0">
                        <h5 class="card-title">매출 현황 <span id="TMY">| day</span></h5>

                        <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                                    legend: {
                                        data: ['어제', '오늘']
                                    },
                                    radar: {
                                        // shape: 'circle',
                                        indicator: [{
                                            name: '본체',
                                            max: 100000
                                        },
                                            {
                                                name: '타이틀(패키지)',
                                                max: 100000
                                            },
                                            {
                                                name: '타이틀(다운로드)',
                                                max: 100000
                                            },
                                            {
                                                name: '다운로드 추가 컨텐츠',
                                                max: 100000
                                            },
                                            {
                                                name: '온라인 이용권',
                                                max: 100000
                                            },
                                            {
                                                name: '선불번호',
                                                max: 100000
                                            },
                                            {
                                                name: '무료컨텐츠',
                                                max: 100000
                                            },
                                            {
                                                name: '아미보',
                                                max: 100000
                                            },
                                            {
                                                name: '프로컨트롤러',
                                                max: 100000
                                            },
                                            {
                                                name: '조이콘',
                                                max: 100000
                                            },
                                            {
                                                name: '주변기기',
                                                max: 100000
                                            }
                                        ]
                                    },
                                    series: [{
                                        name: 'Budget vs spending',
                                        type: 'radar',
                                        data: [{
                                            value: [${report2[0]}, ${report2[1]}, ${report2[2]}, ${report2[3]}, ${report2[4]}, ${report2[5]}, ${report2[6]}, ${report2[7]}, ${report2[8]}, ${report2[9]}, ${report2[10]}],
                                            name: '어제'
                                        },
                                            {
                                                value: [${report[0]}, ${report[1]}, ${report[2]}, ${report[3]}, ${report[4]}, ${report[5]}, ${report[6]}, ${report[7]}, ${report[8]}, ${report[9]}, ${report[10]}],
                                                name: '오늘'
                                            }
                                        ]
                                    }]
                                });
                            });
                        </script>

                    </div>
                </div><!-- End Budget Report -->


            </div><!-- End Right side columns -->
        </div>
    </section>

</main><!-- End #main -->

<!-- ======= Footer ======= -->
<footer id="footer" class="footer">
    <div class="copyright">
        &copy; Copyright <strong><span>Continue?</span></strong>. All Rights Reserved
    </div>
</footer><!-- End Footer -->

<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="admin_assets/vendor/apexcharts/apexcharts.min.js"></script>
<script src="admin_assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="admin_assets/vendor/chart.js/chart.min.js"></script>
<script src="admin_assets/vendor/echarts/echarts.min.js"></script>
<script src="admin_assets/vendor/quill/quill.min.js"></script>
<script src="admin_assets/vendor/simple-datatables/simple-datatables.js"></script>
<script src="admin_assets/vendor/tinymce/tinymce.min.js"></script>
<script src="admin_assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/admin_assets/js/main.js"></script>
<script src="/js/jquery.nice-select.min.js"></script>
<script src="/js/jquery-ui.min.js"></script>
<script src="/js/jquery.slicknav.js"></script>
<script src="/js/main.js"></script>
<script src="/js/owl.carousel.min.js"></script>

</body>
</html>

<script>
    function sales(time) {
        $.ajax({
            url: "/admin/sales_" + time,
            type: "post",
            success: function (data) {
                $("#sales_value").text(data);

                if (time == "day") {
                    $('#sales_date').text("| TODAY");
                } else if (time == "month") {
                    $('#sales_date').text("| MONTH");
                } else if (time == "year") {
                    $('#sales_date').text("| YEAR");
                }

            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function revenue(time) {
        $.ajax({
            url: "/admin/revenue_" + time,
            type: "post",
            success: function (data) {
                data = "￦" + data.toLocaleString('ko-KR');

                $("#revenue_value").text(data);

                if (time == "day") {
                    $('#revenue_date').text("| TODAY");
                } else if (time == "month") {
                    $('#revenue_date').text("| MONTH");
                } else if (time == "year") {
                    $('#revenue_date').text("| YEAR");
                }

            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function customer(time) {
        $.ajax({
            url: "/admin/customer_" + time,
            type: "post",
            success: function (data) {
                data = data + "명"
                $("#customer_value").text(data);

                if (time == "day") {
                    $('#customer_date').text("| TODAY");
                } else if (time == "month") {
                    $('#customer_date').text("| MONTH");
                } else if (time == "year") {
                    $('#customer_date').text("| YEAR");
                }

            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function seller(time) {
        $.ajax({
            url: "/admin/mem_" + time,
            type: "post",
            success: function (data) {
                $("#mem_value").html(data);

                if (time == "day") {
                    $('#mem_date').text("| TODAY");
                } else if (time == "month") {
                    $('#mem_date').text("| MONTH");
                } else if (time == "year") {
                    $('#mem_date').text("| YEAR");
                }
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    $(document).ready(function() {
        $(".form-check-input").click(function() {
            // alert($("input[type=checkbox][name=inputCate]:checked").val());
            let tmp_arr = [];
             $(".form-check-input:checked").each(function() {
                 let tmp = $(this).val();
                 tmp_arr.push(tmp);
             })
            // alert(tmp_arr);
        })
    })

    function budgetReport(time) {
        $.ajax({
            url : "/admin/budgetreport_" + time
            ,type : "post"
            ,success : function (data) {
                // console.log(data.list);
                // console.log(data.list1)
                if (time == "day") {
                    $("#TMY").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['어제', '오늘']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 100000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 100000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 100000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 100000
                                },
                                {
                                    name: '선불번호',
                                    max: 100000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '아미보',
                                    max: 100000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 100000
                                },
                                {
                                    name: '조이콘',
                                    max: 100000
                                },
                                {
                                    name: '주변기기',
                                    max: 100000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '어제'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9], data.list[10]],
                                    name: '오늘'
                                }
                            ]
                        }]
                    });
                } else if (time == "Month") {
                    $("#TMY").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['지난달', '이번달']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 100000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 100000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 100000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 100000
                                },
                                {
                                    name: '선불번호',
                                    max: 100000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '아미보',
                                    max: 100000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 100000
                                },
                                {
                                    name: '조이콘',
                                    max: 100000
                                },
                                {
                                    name: '주변기기',
                                    max: 100000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '지난달'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9] ,data.list[10]],
                                    name: '이번달'
                                }
                            ]
                        }]
                    });
                } else {
                    $("#TMY").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['작년', '금년']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 100000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 100000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 100000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 100000
                                },
                                {
                                    name: '선불번호',
                                    max: 100000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 100000
                                },
                                {
                                    name: '아미보',
                                    max: 100000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 100000
                                },
                                {
                                    name: '조이콘',
                                    max: 100000
                                },
                                {
                                    name: '주변기기',
                                    max: 100000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '작년'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9] ,data.list[10]],
                                    name: '금년'
                                }
                            ]
                        }]
                    });
                }

            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
    
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

    <%-- 올린 이미지 미리보기 --%>
    $("#gm_img").change(function (event) {
        // console.log("테스트");
        let file = event.target.files[0];
        // console.log(file);    //[object File]
        let reader = new FileReader();
        reader.onload = function (e) {
            // console.log("t");
            $("#pic_view").attr('src', e.target.result);
        }
        reader.readAsDataURL(file);
    });

    function gameCrawling() {
        let num = prompt('게임 자동 등록', '게임 시작 번호를 입력해주세요');
        let start = 1;
        if (isNaN(num.trim()) == false && num.trim() != null && num.trim() != "") {
            start = parseInt(num.trim());
        } else {
            alert('유효한 숫자를 입력해주세요');
            return;
        }

        $.ajax({
            url: "/crawling",
            type: "POST",
            data: {
                "start" : start
            },
            success: function (data) {
                alert(data);
            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

</script>