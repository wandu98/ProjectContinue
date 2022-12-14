<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%@ include file="auth.jsp" %>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Favicons -->
    <link href="/images/favicon.png" rel="icon">
    <link href="/images/apple-touch-icon.png" rel="apple-touch-icon">

    <title>Continue? | 마켓 & 모집</title>

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/css/style.css" type="text/css">

    <script src="/js/memmodify.js"></script>
    <script src="/js/jquery-3.6.1.min.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script src="/ckeditor/ckeditor.js"></script>

    <style>

        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            padding-top: 100px; /* Location of the box */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content */
        .modal-content {
            background-color: #fefefe;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 20%;
        }

        /* The Close Button */
        .close {
            color: #aaaaaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }




    </style>
</head>

<body>
<!-- Page Preloder -->
<div id="preloder">
    <div class="loader"></div>
</div>

<!-- 모바일 사이드 메뉴 시작 -->
<div class="humberger__menu__overlay"></div>
<div class="humberger__menu__wrapper">
    <div class="humberger__menu__logo">
        <a href="/"><img src="/images/logo.png" alt="" style="width: 70%"></a>
    </div>
    <div class="humberger__menu__cart">
        <ul>
            <li><a href="#"><i class="fa fa-heart"></i> <span>${idxWishCount}</span></a></li>
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
        </ul>
    </div>
    <div class="humberger__menu__widget">
        <div class="header__top__right__auth">
            <a href="/mem/login"><i class="fa fa-user"></i> 로그인</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li><a href="/sales/sales">마켓 플레이스</a></li>
            <li><a href="/recruit">모집 게시판</a></li>
            <li><a href="/" class="active">미니 게임</a></li>
            <li><a href="#">고객센터</a>
                <ul class="header__menu__dropdown">
                    <li><a href="/notice/noticeList">공지사항</a></li>
                    <li><a href="/">이벤트</a></li>
                    <li><a href="/">1:1문의</a></li>
                </ul>
            </li>
            <li><a href="/mypage/mypage">마이페이지</a>
        </ul>
    </nav>
    <div id="mobile-menu-wrap"></div>
</div>
<!-- 모바일 사이드 메뉴 끝 -->

<!-- 헤더 시작 -->
<header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__left">
                        <ul>
                            <li><a href="/admin/login" style="text-decoration: none; color: black; cursor: default"> Continue?</a></li>
                            <li>같이 놀자, 우리</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <% if (session.getAttribute("sl_id") != null) { %>
                            <a href="/seller">판매자 모드</a>
                            <% } else if (session.getAttribute("admin_id") != null) { %>
                            <a href="/admin">관리자 모드</a>
                            <% } %>
                            <a href="/mem/login">로그인</a>
                            <a href="/mem/signup">회원가입</a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="/mypage/mypage"><i class="fa fa-user"></i> 마이페이지</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo" style="padding: 10%; text-align: center">
                    <a href="/"><img src="/images/logo.png" alt="" style="width: 100%"></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="/sales/sales">마켓 플레이스</a></li>
                        <li><a href="/recruit">모집 게시판</a></li>
                        <li class="active"><a href="/">미니게임</a></li>
                        <li><a href="#">고객센터</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="/notice/noticeList">공지사항</a></li>
                                <li><a href="/">이벤트</a></li>
                                <li><a href="/">1:1문의</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="/mypage/wishlist"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="/mypage/cart"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="humberger__open">
            <i class="fa fa-bars"></i>
        </div>
    </div>
</header>
<!-- 헤더 끝 -->

<!-- 카테고리 & 배너 시작 -->
<section class="hero hero-normal">
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="hero__categories">
                    <div class="hero__categories__all">
                        <i class="fa fa-bars"></i>
                        <span>카테고리</span>
                    </div>
                    <ul>
                        <li><a href="#">본체</a></li>
                        <li><a href="#">타이틀 (패키지)</a></li>
                        <li><a href="#">타이틀 (다운로드)</a></li>
                        <li><a href="#">다운로드 추가 컨텐츠 (DLC)</a></li>
                        <li><a href="#">온라인 이용권</a></li>
                        <li><a href="#">선불 번호</a></li>
                        <li><a href="#">무료 컨텐츠</a></li>
                        <li><a href="#">아미보</a></li>
                        <li><a href="#">프로컨트롤러</a></li>
                        <li><a href="#">조이콘</a></li>
                        <li><a href="#">주변 기기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div>
                    <div class="search_form">
                        <form action="/sales/search">
                            <select id="ctg" name="ctg">
                                <option value="ALL" selected>모든 카테고리</option>
                                <option value="MN">본체</option>
                                <option value="PT">타이틀(패키지)</option>
                                <option value="DT">타이틀(다운로드)</option>
                                <option value="DL">다운로드 추가 컨텐츠 (DLC)</option>
                                <option value="OL">온라인 이용권</option>
                                <option value="PN">선불 번호</option>
                                <option value="FC">무료 컨텐츠</option>
                                <option value="AM">아미보</option>
                                <option value="PC">프로컨트롤러</option>
                                <option value="JC">조이콘</option>
                                <option value="AC">주변 기기</option>
                            </select>
                            <input class="search_keyword" type="text" id="keyword" name="keyword">
                            <button type="submit" class="site-btn-search">검색</button>
                        </form>
                    </div>
                    <div class="hero__search__phone">
                        <div class="hero__search__phone__icon">
                            <img src="/images/coupon.png">
                        </div>
                        <div class="hero__search__phone__text">
                            <h5>첫 구매 쿠폰 코드</h5>
                            <span>A0002</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- 카테고리 & 배너 끝 -->

<section>
    <div class="hero__item set-bg" data-setbg="images/banner.jpg">
        <div class="hero__text" style="text-align: center; left: 25%; position: absolute">
            <h2>월간 <br/>타이틀 순위</h2>
            <a href="/sales" class="success-btn">SHOP NOW</a>
            <br><br>
            <button type="button" class="btn btn-outline-warning" onclick="rankingSales()">판매순</button>
            <button type="button" class="btn btn-outline-warning" onclick="rankingRecruit()">모집순</button>
        </div>
        <div id="ranking" style="position: absolute; left: 50%">
            <ol>
                <c:forEach var="row" items="${idxRankingSales}" varStatus="vs">
                    <li>${row.gm_name}</li>
                </c:forEach>
            </ol>
        </div>
    </div>
</section>

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="/images/soft1.jpeg">
                        <h5><a href="#">아빠몰래 팜 선착순</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="/images/001.jpg">
                        <h5><a href="#">엄마 몰래 팜 선착순</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="/images/003.jpg">
                        <h5><a href="#">오빠몰래 진짜 빠르게 팜</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="/images/004.jpg">
                        <h5><a href="#">누나몰래 팜 네고사절</a></h5>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="categories__item set-bg" data-setbg="/images/switch2.jpeg">
                        <h5><a href="#">삼촌몰래 팜 네고사절</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Categories Section End -->

<br>

<!-- Featured Section Begin -->
<section class="featured spad">
    <div class="container">
        <div class="section-title">
            <h2>Featured Product</h2>
        </div>
        <div class="row featured__filter">
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[0].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[0].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[0].ss_num}">${idxFeaturedProduct[0].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[0].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[1].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[1].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[1].ss_num}">${idxFeaturedProduct[1].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[1].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[2].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[2].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[2].ss_num}">${idxFeaturedProduct[2].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[2].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[3].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[3].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[3].ss_num}">${idxFeaturedProduct[3].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[3].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[4].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[4].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[4].ss_num}">${idxFeaturedProduct[4].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[4].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[5].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[5].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[5].ss_num}">${idxFeaturedProduct[5].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[5].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/saels_main/${idxFeaturedProduct[6].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[6].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[6].ss_num}">${idxFeaturedProduct[6].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[6].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                <div class="featured__item">
                 <div class="featured__item__pic set-bg"  data-setbg="/images/product/sales_main/${idxFeaturedProduct[7].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a onclick="wishlistModal(${idxFeaturedProduct[7].ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="/sales/detail/${idxFeaturedProduct[7].ss_num}">${idxFeaturedProduct[7].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[7].ss_price}</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-1.jpg" alt="">
                </div>
            </div>
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="banner__pic">
                    <img src="img/banner/banner-2.jpg" alt="">
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Latest Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[0].ss_name}</h6>
                                    <span>${idxLatestProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[1].ss_name}</h6>
                                    <span>${idxLatestProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[2].ss_name}</h6>
                                    <span>${idxLatestProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[3].ss_name}</h6>
                                    <span>${idxLatestProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[4].ss_name}</h6>
                                    <span>${idxLatestProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxLatestProduct[5].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[5].ss_name}</h6>
                                    <span>${idxLatestProduct[5].ss_price}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Top Rated Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[0].ss_name}</h6>
                                    <span>${idxTopProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[1].ss_name}</h6>
                                    <span>${idxTopProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[2].ss_name}</h6>
                                    <span>${idxTopProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[3].ss_name}</h6>
                                    <span>${idxTopProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[4].ss_name}</h6>
                                    <span>${idxTopProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxTopProduct[5].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[5].ss_name}</h6>
                                    <span>${idxTopProduct[5].ss_price}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>Review Products</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[0].ss_name}</h6>
                                    <span>${idxReviewProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[1].ss_name}</h6>
                                    <span>${idxReviewProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[2].ss_name}</h6>
                                    <span>${idxReviewProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[3].ss_name}</h6>
                                    <span>${idxReviewProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[4].ss_name}</h6>
                                    <span>${idxReviewProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="/images/product/${idxReviewProduct[5].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[5].ss_name}</h6>
                                    <span>${idxReviewProduct[5].ss_price}</span>
                                </div>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title from-blog__title">
                    <h2>같이 게임 할래?</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="/images/thumb/${idxrcrbrd[0].gm_code}/thumb.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[0].rcrbrd_edate}</li>
                            <li><i class="fa fa-comment-o"></i> ${idxrcrbrdCount[0]}</li>
                        </ul>
                        <h5><a href="/recruit/detail/${idxrcrbrd[0].rcrbrd_num}">${idxrcrbrd[0].rcrbrd_subject}</a></h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="/images/thumb/${idxrcrbrd[1].gm_code}/thumb.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[1].rcrbrd_edate}</li>
                            <li><i class="fa fa-comment-o"></i> ${idxrcrbrdCount[1]}</li>
                        </ul>
                        <h5><a href="/recruit/detail/${idxrcrbrd[1].rcrbrd_num}">${idxrcrbrd[1].rcrbrd_subject}</a></h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="images/thumb/${idxrcrbrd[2].gm_code}/thumb.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[2].rcrbrd_edate}</li>
                            <li><i class="fa fa-comment-o"></i> ${idxrcrbrdCount[2]}</li>
                        </ul>
                        <h5><a href="/recruit/detail/${idxrcrbrd[2].rcrbrd_num}">${idxrcrbrd[2].rcrbrd_subject}</a></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->

<!-- The Modal -->
<div id="myModal" class="modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close" onclick="modalClose()">&times;</span>
        <p>선택하신 상품을 위시리스트에 담았습니다.<br>지금 위시리스트를 확인하시겠습니까?</p>
        <div>
            <a onclick="modalClose()" style="margin: 8px;">쇼핑 계속하기</a><a onclick="goWishlist()">위시리스트 확인</a>
        </div>

    </div>

</div>


<script>
    // 판매순 랭킹
    function rankingSales() {
        $.get("rankingSales.do", responseSales);
    }

    function responseSales(result) {
        $("#ranking").html(result);
    }
    
    // 모집순 랭킹
    function rankingRecruit() {
        $.get("rankingRecruit.do", responseRecruit);
    }

    function responseRecruit(result) {
        $("#ranking").html(result);
    }

    // Get the modal
    var modal = document.getElementById("myModal");

    function wishlistModal(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let params = "ss_num=" + ss_num;

        if (mem_id != 'null') {
            // location.href = "/wishlist/insert/" + ss_num;
            $.get("/wishlist/insert", params, openModal());

        } else {
            alert("로그인 후 이용해주세요");
        }
    }

    // Get the <span> element that closes the modal
    // var span = document.getElementsByClassName("close")[0];

    // When the user clicks on <span> (x), close the modal
    // span.onclick = function() {
    //     modal.style.display = "none";
    // }

    function modalClose() {
        modal.style.display = "none";
    }

    function openModal() {
        modal.style.display = "block";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function goWishlist() {
        location.href = "/mypage/wishlist";
    }
</script>

<jsp:include page="footer.jsp"></jsp:include>
