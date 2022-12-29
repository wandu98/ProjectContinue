<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="auth.jsp" %>
<!DOCTYPE html>
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
        .nice-select {
            border: none;
        }
        #ranking {
            font-weight: 700;
        }
        #ranking > ol {
            width: 400px;
        }
        #ranking > ol > li {
            overflow:hidden;
            text-overflow:ellipsis;
            white-space:nowrap;
        }
        .product__item__pic__hover li:hover a {
            background: #fd1c1c;
            border-color: #fd1c1c;
        }
        .owl-carousel .owl-item img {
            width: 110px;
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
            <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>${idxBasketCount}</span></a></li>
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
            <li><a class="active" onclick="miniGame()">미니게임</a></li>
            <li><a href="#">고객센터</a>
                <ul class="header__menu__dropdown">
                    <li><a href="/notice/noticeList">공지사항</a></li>
                    <li><a href="/event/event">이벤트</a></li>
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
                            <a href="/seller/seller">판매자 모드</a>
                            <% } else if (session.getAttribute("admin_id") != null) { %>
                            <a href="/admin">관리자 모드</a>
                            <% } %>
                            <c:choose>
                                <c:when test="${mem_id == null and sl_id == null}"><a href="/mem/login">로그인</a></c:when>
                                <c:when test="${mem_id != null and sl_id == null}"><a href="/mem/logout">로그아웃</a></c:when>
                                <c:when test="${mem_id == null and sl_id != null}"><a href="/seller/logout">로그아웃</a></c:when>
                                <c:when test="${mem_id != null and sl_id != null}"><a href="/seller/masterLogout">로그아웃</a></c:when>
                            </c:choose>
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
                        <li class="active" style="cursor: pointer"><a onclick="miniGame()">미니게임</a></li>
                        <li><a href="#">고객센터</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="/notice/noticeList">공지사항</a></li>
                                <li><a href="/event/event">이벤트</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3">
                <div class="header__cart">
                    <ul>
                        <li><a href="/mypage/wishlist"><i class="fa fa-heart"></i> <span id="idxWishCount">${idxWishCount}</span></a></li>
                        <li><a href="/mypage/cart"><i class="fa fa-shopping-bag"></i> <span id="idxBasketCount">${idxBasketCount}</span></a></li>
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
                        <li><a href="/sales/search?ctg=mn&sc_where=sales&keyword=">본체</a></li>
                        <li><a href="/sales/search?ctg=pt&sc_where=sales&keyword=">타이틀 (패키지)</a></li>
                        <li><a href="/sales/search?ctg=dt&sc_where=sales&keyword=">타이틀 (다운로드)</a></li>
                        <li><a href="/sales/search?ctg=dl&sc_where=sales&keyword=">다운로드 추가 컨텐츠 (DLC)</a></li>
                        <li><a href="/sales/search?ctg=ol&sc_where=sales&keyword=">온라인 이용권</a></li>
                        <li><a href="/sales/search?ctg=pn&sc_where=sales&keyword=">선불 번호</a></li>
                        <li><a href="/sales/search?ctg=fc&sc_where=sales&keyword=">무료 컨텐츠</a></li>
                        <li><a href="/sales/search?ctg=am&sc_where=sales&keyword=">아미보</a></li>
                        <li><a href="/sales/search?ctg=pc&sc_where=sales&keyword=">프로컨트롤러</a></li>
                        <li><a href="/sales/search?ctg=jc&sc_where=sales&keyword=">조이콘</a></li>
                        <li><a href="/sales/search?ctg=ac&sc_where=sales&keyword=">주변 기기</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-9">
                <div>
                    <div class="search_form">
                        <form action="/sales/search">
                            <select id="ctg" name="ctg">
                                <option value="ALL" selected>모든 카테고리</option>
                                <option value="mn">본체</option>
                                <option value="pt">타이틀(패키지)</option>
                                <option value="dt">타이틀(다운로드)</option>
                                <option value="dl">다운로드 추가 컨텐츠 (DLC)</option>
                                <option value="ol">온라인 이용권</option>
                                <option value="pn">선불 번호</option>
                                <option value="fc">무료 컨텐츠</option>
                                <option value="am">아미보</option>
                                <option value="pc">프로컨트롤러</option>
                                <option value="jc">조이콘</option>
                                <option value="ac">주변 기기</option>
                            </select>
                            <input type="hidden" id="sc_where" name="sc_where" value="sales">
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

<section class="hero">
    <div class="container">
        <div class="hero__item set-bg" data-setbg="/images/banner.png" style="">
            <div class="hero__text" style="text-align: center; position: absolute">
<%--                <h2 style="color: #f3f37b; font-size: 55px; text-shadow: -5px 0px black, 0px 5px black, 5px 0px black, 0px -5px black;">월간 <br/>타이틀 순위</h2>--%>
                <img src="/images/title_ranking.png" style="width: 40%">
                <br><br>
                <button type="button" class="btn btn-danger" onclick="rankingSales()">판매순</button>
                <button type="button" class="btn btn-primary" onclick="rankingRecruit()">모집순</button>
            </div>
            <div id="ranking" style="position: absolute; left: 57%;">
                <ol>
                    <c:forEach var="row" items="${idxRankingSales}" varStatus="vs">
                        <li>${vs.index+1}. ${row.gm_name}</li>
                    </c:forEach>
                </ol>
            </div>
        </div>
    </div>
</section>

<!-- Categories Section Begin -->
<section class="categories">
    <div class="container">
        <div class="row">
            <div class="categories__slider owl-carousel">
                <c:forEach var="row" items="${idxRankingSales}" varStatus="vs">
                    <div class="col-lg-3">
                        <div class="categories__item set-bg product__discount__item__pic" data-setbg="/images/thumb/${row.gm_code}/thumb.jpg">
                            <div class="product__discount__percent">${vs.index+1}위</div>
                        </div>
                    </div>
                </c:forEach>
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
            <h2>상품</h2>
        </div>
        <div class="row featured__filter">
            <c:forEach var="row" items="${idxFeaturedProduct}" varStatus="vs">
            <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                <div class="product__item">
                    <div class="product__item__pic">
                        <a href="/sales/detail/${row.ss_num}">
                            <img src="/images/product/sales_main/${row.ss_img}" style="height:100%" >
                        </a>
                        <ul class="product__item__pic__hover" >
                            <li><a style="padding-top: 0%;" class="wishlistModal" onclick="wishlistModal(${row.ss_num})"><i class="fa fa-heart"></i></a></li>
                            <li><a style="padding-top: 0%;" class="basketModal" onclick="basketModal(${row.ss_num})"><i class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>

                    <div class="product__discount__item__text">
                        <span>${row.gm_category}</span>
                        <h6><a href="/sales/detail/${idxFeaturedProduct[0].ss_num}">${row.ss_name}</a></h6>
                        <h5><a href="/sales/detail/${idxFeaturedProduct[0].ss_num}"><fmt:formatNumber
                                value="${row.ss_price}" type="currency"/></a></h5>
                    </div>
                </div>
            </div>
            </c:forEach>
        </div>
    </div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<%--<div class="banner">
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
</div>--%>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>최신 상품</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxLatestProduct[0].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[0].ss_name}</h6>
                                    <span>${idxLatestProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxLatestProduct[1].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[1].ss_name}</h6>
                                    <span>${idxLatestProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxLatestProduct[2].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[2].ss_name}</h6>
                                    <span>${idxLatestProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxLatestProduct[3].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[3].ss_name}</h6>
                                    <span>${idxLatestProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxLatestProduct[4].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxLatestProduct[4].ss_name}</h6>
                                    <span>${idxLatestProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxLatestProduct[5].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxLatestProduct[5].ss_img}" alt="">
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
                    <h4>인기 상품</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxTopProduct[0].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[0].ss_name}</h6>
                                    <span>${idxTopProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxTopProduct[1].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[1].ss_name}</h6>
                                    <span>${idxTopProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxTopProduct[2].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[2].ss_name}</h6>
                                    <span>${idxTopProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxTopProduct[3].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[3].ss_name}</h6>
                                    <span>${idxTopProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxTopProduct[4].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxTopProduct[4].ss_name}</h6>
                                    <span>${idxTopProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxTopProduct[5].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxTopProduct[5].ss_img}" alt="">
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
                    <h4>리뷰 많은 상품</h4>
                    <div class="latest-product__slider owl-carousel">
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxReviewProduct[0].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[0].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[0].ss_name}</h6>
                                    <span>${idxReviewProduct[0].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxReviewProduct[1].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[1].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[1].ss_name}</h6>
                                    <span>${idxReviewProduct[1].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxReviewProduct[2].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[2].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[2].ss_name}</h6>
                                    <span>${idxReviewProduct[2].ss_price}</span>
                                </div>
                            </a>
                        </div>
                        <div class="latest-prdouct__slider__item">
                            <a href="/sales/detail/${idxReviewProduct[3].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[3].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[3].ss_name}</h6>
                                    <span>${idxReviewProduct[3].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxReviewProduct[4].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[4].ss_img}" alt="">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${idxReviewProduct[4].ss_name}</h6>
                                    <span>${idxReviewProduct[4].ss_price}</span>
                                </div>
                            </a>
                            <a href="/sales/detail/${idxReviewProduct[5].ss_num}" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img class="productImg" src="/images/product/sales_main/${idxReviewProduct[5].ss_img}" alt="">
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
                    <div class="blog__item__pic"><a href="/recruit/detail/${idxrcrbrd[0].rcrbrd_num}">
                        <img src="/images/thumb/${idxrcrbrd[0].gm_code}/thumb.jpg" alt="">
                    </a></div>
                    <div class="blog__item__text"><a href="/recruit/detail/${idxrcrbrd[0].rcrbrd_num}">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[0].rcrbrd_edate}</li>
                            <li><i class="fa fa-user"></i> ${idxrcrbrdCount[0]}</li>
                        </ul>
                        <h5>${idxrcrbrd[0].rcrbrd_subject}</h5>
                    </a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic"><a href="/recruit/detail/${idxrcrbrd[1].rcrbrd_num}">
                        <img src="/images/thumb/${idxrcrbrd[1].gm_code}/thumb.jpg" alt="">
                    </a></div>
                    <div class="blog__item__text"><a href="/recruit/detail/${idxrcrbrd[1].rcrbrd_num}">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[1].rcrbrd_edate}</li>
                            <li><i class="fa fa-user"></i> ${idxrcrbrdCount[1]}</li>
                        </ul>
                        <h5>${idxrcrbrd[1].rcrbrd_subject}</h5>
                    </a></div>
                </div>
            </div>
            <div class="col-lg-4 col-md-4 col-sm-6">
                <div class="blog__item">
                    <div class="blog__item__pic"><a href="/recruit/detail/${idxrcrbrd[2].rcrbrd_num}">
                        <img src="images/thumb/${idxrcrbrd[2].gm_code}/thumb.jpg" alt="">
                    </a></div>
                    <div class="blog__item__text"><a href="/recruit/detail/${idxrcrbrd[2].rcrbrd_num}">
                        <ul>
                            <li><i class="fa fa-calendar-o"></i> ${idxrcrbrd[2].rcrbrd_edate}</li>
                            <li><i class="fa fa-user"></i> ${idxrcrbrdCount[2]}</li>
                        </ul>
                        <h5>${idxrcrbrd[2].rcrbrd_subject}</h5>
                    </a></div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Blog Section End -->


<%-- 위시리스트 모달 --%>
<div class="container">
    <!-- The Modal -->
    <div class="modal" id="myModal1">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">위시리스트</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    선택하신 상품을 위시리스트에 담았습니다.<br>지금 위시리스트를 확인하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="renewal()">쇼핑 계속하기</button>
                    <button type="button" class="btn btn-success" onclick="goWishlist()">위시리스트 확인</button>
                </div>

            </div>
        </div>
    </div>
</div>

<%-- 장바구니 모달 --%>
<div class="container">
    <!-- The Modal -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">장바구니</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    선택하신 상품을 장바구니에 담았습니다.<br>지금 장바구니를 확인하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="renewal()">쇼핑 계속하기</button>
                    <button type="button" class="btn btn-success" onclick="goBasket()">장바구니 확인</button>
                </div>

            </div>
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

    function wishlistModal(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let params = "ss_num=" + ss_num;
        if (mem_id == 'null') {
            alert("로그인 후 이용해주세요");
        } else {
            $(".wishlistModal").attr("data-toggle", "modal");
            $(".wishlistModal").attr("data-target", "#myModal1");
            if ($("#myModal1").on("DOMSubtreeModified")) {  // #myModal1의 변화 감지. 여기서는 변화가 3번이라 3번 insert가 되어 1번만 insert 시키기 위해 if의 조건으로 주었다.
                $.get("/wishlist/insert", params);
            }
        }
    }

    function basketModal(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let params = "ss_num=" + ss_num;
        if (mem_id == 'null') {
            alert("로그인 후 이용해주세요");
        } else {
            console.log("false");
            $(".basketModal").attr("data-toggle", "modal");
            $(".basketModal").attr("data-target", "#myModal2");
            if ($("#myModal2").on("DOMSubtreeModified")) {
                $.get("/cart/idxinsert", params);
            }
        }
    }

    function goWishlist() {
        location.replace("/mypage/wishlist");
    }

    function goBasket() {
        location.replace("/mypage/cart");
    }

    function renewal() {
        $.ajax({
            url : "/renewal"
            ,type : "get"
            ,success : function (list) {
                let idxWishCount = list[0];
                let idxBasketCount = list[1];
                $("#idxWishCount").text(idxWishCount);
                $("#idxBasketCount").text(idxBasketCount);
            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function miniGame() {
        if ('${mem_id}'!="") {
            $("#dice").modal({backdrop: 'static', keyboard: false});
        } else {
            alert("로그인 후 이용해주세요");
        }

    }

</script>
<jsp:include page="dice.jsp"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>
