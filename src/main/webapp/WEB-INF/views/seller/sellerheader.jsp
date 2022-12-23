<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../seller/sellerauth.jsp" %>


<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <title>Continue? Seller_page</title>
    <meta content="" name="description">
    <meta content="" name="keywords">

    <!-- Favicons -->
    <link href="/admin_assets/img/favicon.png" rel="icon">
    <link href="/admin_assets/img/apple-touch-icon.png" rel="apple-touch-icon">

    <!-- Google Fonts -->
    <link href="/https://fonts.gstatic.com" rel="preconnect">


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

</head>

<body>

<!-- ======= Header ======= -->
<header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
        <a href="/seller/seller" class="logo d-flex align-items-center">
            <img src="/admin_assets/img/logo.png" alt="">
            <span class="d-none d-lg-block">ontinue? 판매자</span>
        </a>
        <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <nav class="header-nav ms-auto">
        <ul class="d-flex align-items-center">

            <li class="nav-item d-block d-lg-none">
                <a class="nav-link nav-icon search-bar-toggle " href="#">
                    <i class="bi bi-search"></i>
                </a>
            </li><!-- End Search Icon-->

            <li class="nav-item dropdown">
                <a class="nav-link nav-icon" href="/">
                    <i class="bi-house"></i>
                </a><!-- End Messages Icon -->
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link nav-icon" href="/mem/login">
                    <i class="ri-login-box-line"></i>
                </a><!-- login Icon -->
            </li>



            <li class="nav-item dropdown pe-3">

                <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
                    <img src="/images/001.jpg" class="rounded-circle">
                    <span class="d-none d-md-block dropdown-toggle ps-2">회원ID</span>
                </a><!-- End Profile Iamge Icon -->
            </li><!-- End Profile Nav -->

        </ul>
    </nav><!-- End Icons Navigation -->

</header><!-- End Header -->

<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

    <ul class="sidebar-nav" id="sidebar-nav">

        <li class="nav-item">
            <a class="nav-link " href="/seller">
                <i class="bi bi-grid"></i>
                <span>Home</span>
            </a>
        </li><!-- End Dashboard Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#components-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-menu-button-wide"></i><span>상품관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="components-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/seller/write">
                        <i class="bi bi-circle"></i><span>상품등록</span>
                    </a>
                </li>
                <li>
                    <a href="/seller/list">
                        <i class="bi bi-circle"></i><span>상품리스트</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Components Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-journal-text"></i><span>주문관리</span><i class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="forms-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/seller/order">
                        <i class="bi bi-circle"></i><span>전체주문목록</span>
                    </a>
                </li>
                <li>
                    <a href="/seller/delivery">
                        <i class="bi bi-circle"></i><span>배송정책</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Forms Nav -->

        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
                <i class="bi bi-question-circle"></i></i><span>문의관리</span><i
                    class="bi bi-chevron-down ms-auto"></i>
            </a>
            <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
                <li>
                    <a href="/seller/one_sentence">
                        <i class="bi bi-circle"></i><span>1:1문의</span>
                    </a>
                </li>
                <li>
                    <a href="/seller/review">
                        <i class="bi bi-circle"></i><span>Review</span>
                    </a>
                </li>
            </ul>
        </li><!-- End Tables Nav -->
    </ul>

</aside><!-- End Sidebar-->