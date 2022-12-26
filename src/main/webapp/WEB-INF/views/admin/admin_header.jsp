<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



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
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="/js/memmodify.js"></script>
    <script src="/CKEDITOR/CKEDITOR.js"></script>

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
            <a class="nav-link" data-bs-target="#icons-nav" data-bs-toggle="collapse" href="#" aria-expanded="true">
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
    </ul>
    <%--<li class="nav-heading">Pages</li>--%>


</aside><!-- End Sidebar-->

<script>
    function gameCrawling() {
        let num = prompt('게임 자동 등록', '게임 시작 번호를 입력해주세요');
        let start = 1;
        if (isNaN(num.trim()) == false && num.trim() != null && num.trim() != "") {
            start = parseInt(num.trim());
        } else {
            alert('숫자를 입력해주세요');
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
