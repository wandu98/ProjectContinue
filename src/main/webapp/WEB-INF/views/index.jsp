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
            <li><a href="#"><i class="fa fa-heart"></i> <span>1</span></a></li>
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
                    <li><a href="/">공지사항</a></li>
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
                            <li>Continue?</li>
                            <li>같이 놀자, 우리</li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="header__top__right">
                        <div class="header__top__right__social">
                            <a href="/seller">판매자 모드</a>
                            <a href="/admin">관리자 모드</a>
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
                                <li><a href="/">공지사항</a></li>
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
                        <li><a href="mypage/wishlist"><i class="fa fa-heart"></i> <span>1</span></a></li>
                        <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
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
                <div class="hero__search">
                    <div class="hero__search__form">
                        <form action="#">
                            <div class="hero__search__categories">
                                모든 카테고리
                                <span class="arrow_carrot-down"></span>
                            </div>
                            <input type="text">
                            <button type="submit" class="site-btn">검색</button>
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
                <div class="hero__item set-bg" data-setbg="images/banner.jpg">
                    <div class="hero__text" style="text-align: center;">
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
            </div>
        </div>
    </div>
</section>
<!-- 카테고리 & 배너 끝 -->

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
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[0].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[0].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[1].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[1].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[1].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix vegetables fresh-meat">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[2].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[2].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[2].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood oranges">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[3].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[3].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[3].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[4].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[4].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[4].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fastfood">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/sales_main/${idxFeaturedProduct[5].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[5].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[5].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fresh-meat vegetables">
                <div class="featured__item">
                    <div class="featured__item__pic set-bg" data-setbg="/images/product/saels_main/${idxFeaturedProduct[6].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[6].ss_name}</a></h6>
                        <h5>${idxFeaturedProduct[6].ss_price}</h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6 mix fastfood vegetables">
                <div class="featured__item">
                 <div class="featured__item__pic set-bg"  data-setbg="/images/product/sales_main/${idxFeaturedProduct[7].ss_img}">
                        <ul class="featured__item__pic__hover">
                            <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            <li><a href="#"><i class="fa fa-retweet"></i></a></li>
                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="featured__item__text">
                        <h6><a href="#">${idxFeaturedProduct[7].ss_name}</a></h6>
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
                    <h2>From The Blog</h2>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-1.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Cooking tips make cooking simple</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-2.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">6 ways to prepare breakfast for 30</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic">
                        <img src="img/blog/blog-3.jpg" alt="">
                    </div>
                    <div class="blog__item__text">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                            <li><i class="fa fa-comment-o"></i> 5</li>
                        </ul>
                        <h5><a href="#">Visit the clean farm in the US</a></h5>
                        <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam quaerat </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->


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
</script>

<jsp:include page="footer.jsp"></jsp:include>
