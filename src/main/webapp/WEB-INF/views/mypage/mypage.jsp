<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
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
            <a href="#"><i class="fa fa-user"></i> 로그인</a>
        </div>
    </div>
    <nav class="humberger__menu__nav mobile-menu">
        <ul>
            <li><a href="/">마켓 플레이스</a></li>
            <li><a href="/">모집 게시판</a></li>
            <li><a href="/" class="active">미니 게임</a></li>
            <li><a href="#">고객센터</a>
                <ul class="header__menu__dropdown">
                    <li><a href="/">공지사항</a></li>
                    <li><a href="/">이벤트</a></li>
                    <li><a href="/">1:1문의</a></li>
                </ul>
            </li>
            <li><a href="/mypage">마이페이지</a>
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
                            <a href="/admin">관리자 모드</a>
                            <a href="/mem/login">로그인</a>
                            <a href="/mem/signup">회원가입</a>
                        </div>
                        <div class="header__top__right__auth">
                            <a href="/mypage"><i class="fa fa-user"></i> 마이페이지</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-lg-3">
                <div class="header__logo">
                    <a href="/"><img src="/images/logo.png" alt="" style="width: 70%"></a>
                </div>
            </div>
            <div class="col-lg-6">
                <nav class="header__menu">
                    <ul>
                        <li><a href="/">마켓 플레이스</a></li>
                        <li><a href="/">모집 게시판</a></li>
                        <li class="active"><a href="/">미니게임</a></li>
                        <li><a href="#">고객센터</a>
                            <ul class="header__menu__dropdown">
                                <li><a href="./shop-details.html">공지사항</a></li>
                                <li><a href="./shoping-cart.html">이벤트</a></li>
                                <li><a href="./checkout.html">1:1문의</a></li>
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
            </div>
        </div>
    </div>
</section>
<!-- 카테고리 & 배너 끝 -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Profile</h4>
            <form action="#">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="row">
                            <div class="col-lg-4">
                                <img src="/images/ProfilePicture.png">
                            </div>
                            <div class="col-lg-8">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <td>닉네임(회원 ID)</td>
                                        <td>루이지</td>
                                    </tr>
                                    <tr>
                                        <td>회원등급</td>
                                        <td>gold</td>
                                    </tr>
                                    <tr>
                                        <td>가입일</td>
                                        <td>2022.11.30</td>
                                    </tr>
                                    <tr>
                                        <td>게시물수</td>
                                        <td>3</td>
                                    </tr>
                                    <tr>
                                        <td>구매평 수</td>
                                        <td>2</td>
                                    </tr>
                                    <tr>
                                        <td>문의수</td>
                                        <td>1</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <br><br>


                        <div class="checkout__input">
                            <p>온도</p>
                            <div class="progress">
                                <div class="progress-bar" style="width:70%">70%</div>
                            </div>
                        </div>

                        <!-- 주문처리현황 Section Begin -->
                        <section class="contact spad">
                            <div class="checkout__input">
                                <h5>주문 처리 현황</h5>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/card-approve-icon.png" style="width: 25%">
                                            <h5>결제완료</h5>
                                            <p>1</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/goods-contents-icon.png" style="width: 20%">
                                            <h5>출고준비중</h5>
                                            <p>0</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-package-delivered-icon.png" style="width: 25%">
                                            <h5>출고완료</h5>
                                            <p>2</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/logistic-truck-icon.png" style="width: 45%">
                                            <h5>배송중</h5>
                                            <p>2</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/door-service-icon.png" style="width: 25%">
                                            <h5>배송완료</h5>
                                            <p>1</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/purchase2.png" style="width:25%">
                                            <h5>구매확정</h5>
                                            <p>6</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-replacement-icon.png" style="width: 25%">
                                            <h5>교환</h5>
                                            <p>1</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/return.png" style="width: 25%">
                                            <h5>반품</h5>
                                            <p>0</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- 주문처리현황 Section End -->

                        <!-- 모집현황 Section Begin -->
                        <section class="shoping-cart spad">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-12">
                                        <div class="shoping__cart__table">
                                            <table>
                                                <thead>
                                                <tr>
                                                    <th class="shoping__product">방 제목</th>
                                                    <th>게임명</th>
                                                    <th>참여인원수</th>
                                                    <th>종료일</th>
                                                    <th></th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <img src="img/cart/cart-1.jpg" alt="">
                                                        <h5>동숲 같이 하실분</h5>
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        모여봐요 동물의 숲
                                                    </td>
                                                    <td class="shoping__cart__quantity">
                                                        <h5>3</h5>
                                                    </td>
                                                    <td class="shoping__cart__total">
                                                        2022.12.13
                                                    </td>
                                                    <td class="shoping__cart__item__close">
                                                        <span class="icon_close"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <img src="img/cart/cart-2.jpg" alt="">
                                                        <h5>스플래툰3 하실 분</h5>
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        스플래툰3
                                                    </td>
                                                    <td class="shoping__cart__quantity">
                                                        <h5>4</h5>
                                                    </td>
                                                    <td class="shoping__cart__total">
                                                        2022.12.31
                                                    </td>
                                                    <td class="shoping__cart__item__close">
                                                        <span class="icon_close"></span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="shoping__cart__item">
                                                        <img src="img/cart/cart-3.jpg" alt="">
                                                        <h5>피파하자</h5>
                                                    </td>
                                                    <td class="shoping__cart__price">
                                                        EA SPORTS™《FIFA 23》Nintendo Switch™ Legacy Edition
                                                    </td>
                                                    <td class="shoping__cart__quantity">
                                                        <h5>1</h5>
                                                    </td>
                                                    <td class="shoping__cart__total">
                                                        2022.12.09
                                                    </td>
                                                    <td class="shoping__cart__item__close">
                                                        <span class="icon_close"></span>
                                                    </td>
                                                </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- 모집현황 Section End -->

                        <!-- Featured Section Begin -->
                        <section class="featured spad">
                            <div class="container">
                                <div class="row featured__filter">
                                    <div class="col-lg-12 mix oranges fresh-meat">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="#">구매 기록<p>고객님께서 구매하신 상품의 내역을 확인하실 수 있습니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fastfood">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="mypage/wishlist">위시리스트<p>관심상품으로 등록하신 상품의 목록을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fresh-meat">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="mypage/coupon">쿠폰 및 적립금 내역<p>고객님이 보유하고 계신 쿠폰내역 및 적립금을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fastfood oranges">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="mypage/review">후기 관리<p>고객님께서 작성하신 상품 후기를 관리하는 공간입니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fresh-meat vegetables">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="mypage/memdv">배송 주소록<p>자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- Featured Section End -->
                    </div>
                </div>
            </form>
        </div>
    </div>
</section>
<!-- Checkout Section End -->

<jsp:include page="../footer.jsp"></jsp:include>
