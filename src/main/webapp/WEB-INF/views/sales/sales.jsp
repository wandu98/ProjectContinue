<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/11/29
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../header.jsp" %>

<style>
    #sidebar {
        position: sticky;
        top: 0;
    }

    #sort > a {
        text-decoration: none;
        color: darkgray;
    }

    .product__item__pic__hover li:hover a {
        background: #fd1c1c;
        border-color: #fd1c1c;
    }


</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>마켓 플레이스</h2>
                    <div class="breadcrumb__option">
                        <a href="">Home</a>
                        <span>마켓 플레이스</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-5">
                <div class="sidebar" id="sidebar">
                    <div class="sidebar__item">
                        <h4>최근 검색어</h4>
                        <ul>
                            <c:forEach var="row" items="${last_search}" end="6">
                                <li>
                                    <a href="/sales/search?&ctg=ALL&sc_where=sales&keyword=${row.sc_word}">${row.sc_word}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar__item">
                        <h4>인기 검색어</h4>
                        <ul>
                            <c:forEach var="row" items="${top_keyword}" end="2">
                                <li>
                                    <a href="/sales/search?&ctg=ALL&sc_where=sales&keyword=${row.sc_word}">${row.sc_word}</a>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>

                    <div class="sidebar__item">
                        <div class="latest-product__text">
                            <h4>판매완료</h4>
                            <div class="latest-product__slider owl-carousel">
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="row" items="${sold_out}" begin="0" end="2">
                                        <a href="/sales/detail/${row.ss_num}" class="latest-product__item">
                                            <div class="latest-product__item__pic" style="width: 50%;">
                                                <img src="/images/product/sales_main/${row.ss_img}" alt="">
                                            </div>
                                            <div class="product__discount__item__text" style="font-size: revert">
                                                <span>${row.gm_category}</span>
                                                <h6>${row.ss_name}</h6>
                                                <span><fmt:formatNumber value="${row.ss_price}" type="currency"/></span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="latest-prdouct__slider__item">
                                    <c:forEach var="row" items="${sold_out}" begin="3" end="5">
                                        <a href="/sales/detail/${row.ss_num}" class="latest-product__item">
                                            <div class="latest-product__item__pic" style="width: 50%;">
                                                <img src="/images/product/sales_main/${row.ss_img}" alt="">
                                            </div>
                                            <div class="product__discount__item__text" style="font-size: revert">
                                                <span>${row.gm_category}</span>
                                                <h6>${row.ss_name}</h6>
                                                <span><fmt:formatNumber value="${row.ss_price}" type="currency"/></span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                                <div class="latest-prdouct__slider">
                                    <c:forEach var="row" items="${sold_out}" begin="6" end="8">
                                        <a href="/sales/detail/${row.ss_num}" class="latest-product__item">
                                            <div class="latest-product__item__pic" style="width: 50%;">
                                                <img src="/images/product/sales_main/${row.ss_img}" alt="">
                                            </div>
                                            <div class="product__discount__item__text" style="font-size: revert">
                                                <span>${row.gm_category}</span>
                                                <h6>${row.ss_name}</h6>
                                                <span><fmt:formatNumber value="${row.ss_price}" type="currency"/></span>
                                            </div>
                                        </a>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            <div class="col-lg-9 col-md-7">
                <div class="product__discount">
                    <div class="section-title product__discount__title">
                        <h2>인기상품</h2>
                    </div>
                    <div class="row">
                        <div class="product__discount__slider owl-carousel">
                            <c:forEach var="row" items="${idxTopProduct}" varStatus="vs" begin="0" end="5">
                                <div class="col-lg-4">
                                    <div class="product__discount__item">
                                        <div class="product__discount__item__pic">
                                            <a href="/sales/detail/${row.ss_num}">
                                                <img src="/images/product/sales_main/${row.ss_img}" style="height:100%">
                                            </a>
                                            <div class="product__discount__percent">${vs.count}위</div>
                                            <ul class="product__item__pic__hover">
                                                <li><a class="wishlistModal" onclick="wishlistModal(${row.ss_num})"><i
                                                        class="fa fa-heart"></i></a></li>
                                                <li><a class="basketModal" onclick="basketModal(${row.ss_num})"><i
                                                        class="fa fa-shopping-cart"></i></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__discount__item__text">
                                            <span>${row.gm_category}</span>
                                            <h6><a href="/sales/detail/${row.ss_num}">${row.ss_name}</a></h6>
                                            <h5><a href="/sales/detail/${row.ss_num}"><fmt:formatNumber
                                                    value="${row.ss_price}" type="currency"/></a></h5>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="filter__item">
                    <div class="row">
                        <div class="col-lg-4 col-md-5">
                            <div class="filter__sort" id="sort">
                                    <span><a href='javascript:void(0)'
                                             onclick="listAgain('ss_num', ${totalPage}, ${startPage}, ${endPage}, ${count}, ${pageNum}, '${keyword}')">최신순</a>
                                    <a href='javascript:void(0)'
                                       onclick="listAgain('ss_price', ${totalPage}, ${startPage}, ${endPage}, ${count}, ${pageNum}, '${keyword}')">높은가격</a></span>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-4">
                            <div class="filter__found">
                                <h6><span>${totalRowCount}</span> Products</h6>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="board">
                    <div class="row featured__filter">
                        <c:forEach var="row" items="${list3}" varStatus="vs">
                            <div class="col-lg-4 col-md-6 col-sm-6">
                                <div class="product__item">
                                    <div class="product__item__pic">
                                        <a href="/sales/detail/${row.ss_num}">
                                            <img src="/images/product/sales_main/${row.ss_img}" style="height:100%">
                                        </a>
                                        <ul class="product__item__pic__hover">
                                            <li><a class="wishlistModal" onclick="wishlistModal(${row.ss_num})"><i
                                                    class="fa fa-heart"></i></a></li>
                                            <li><a class="basketModal" onclick="basketModal(${row.ss_num})"><i
                                                    class="fa fa-shopping-cart"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__discount__item__text">
                                        <span>${row.gm_category}</span>
                                        <h6><a href="/sales/detail/${row.ss_num}">${row.ss_name}</a></h6>
                                        <h5><a href="/sales/detail/${row.ss_num}"><fmt:formatNumber
                                                value="${row.ss_price}" type="currency"/></a></h5>
                                    </div>
                                </div>
                            </div>

                            <%-- 한줄에 3칸씩 --%>
                            <c:if test="${vs.count mod 3==0}">
                                <br>
                            </c:if>
                        </c:forEach>
                    </div>
                    <div class="product__pagination blog__pagination" style="text-align: center">
                        <!-- 페이지 리스트 -->
                        <c:if test="${requestScope.count>0}">
                            <!-- 전체 페이지 수 -->
                            <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>
                            <!-- 현재 보고 있는 페이지의 페이지 묶음 시작 페이지 -->
                            <c:set var="startPage" value="${requestScope.startPage}"></c:set>
                            <!-- 현재 보고 있는 페이지의 페이지 묶음 마지막 페이지 -->
                            <c:set var="endPage" value="${requestScope.endPage}"></c:set>
                            <!-- endPage조정 -->
                            <!-- 전체 페이지가 22라면 세번째 페이지 묶음은 21, 22만 나오면 됨. -->
                            <c:if test="${endPage>pageCount}">
                                <c:set var="endPage" value="${pageCount+1}"></c:set>
                            </c:if>

                            <c:if test="${startPage>0}"> <!-- 첫번째 페이지 묶음이 아니라면 -->
                                <a href="/sales/sales?pageNum=${startPage}"><i class="fa fa-long-arrow-left"></i></a>
                            </c:if>

                            <!-- 페이지 표시 -->
                            <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                                <c:choose>
                                    <c:when test="${pageNum==i}"><a
                                            style="font-weight: bold; background: #e03e2d; color: white">${i}</a></c:when>
                                    <c:when test="${pageNum!=i}"><a
                                            href="/sales/sales?pageNum=${i}&order3=${order}">${i}</a></c:when>
                                </c:choose>
                            </c:forEach>

                            <!-- 현재 페이지 묶음의 마지막 페이지보다 페이지가 더 존재하면 -->
                            <c:if test="${endPage<=pageCount}">
                                <a href="/sales/sales?pageNum=${startPage+11}"><i
                                        class="fa fa-long-arrow-right"></i></a>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Product Section End -->


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
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="renewal()">쇼핑 계속하기
                    </button>
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
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="renewal()">쇼핑 계속하기
                    </button>
                    <button type="button" class="btn btn-success" onclick="goBasket()">장바구니 확인</button>
                </div>

            </div>
        </div>
    </div>
</div>


<script>


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


    function listAgain(order, pageCount, startPage, endPage, count, pageNum, keyword) {

        $.ajax({
            type: "post",
            url: "/sales",
            data: {
                "order": order,
                "pageCount": pageCount,
                "startpage": startPage,
                "endPage": endPage,
                "count": count,
                "pageNum": pageNum,
                "keyword": keyword
            },
            success: function (result) {
                //alert(result)
                // alert(order);
                // alert(pageCount);
                // alert(startPage);
                // alert(endPage);
                // alert(count);
                //alert(pageNum);
                let message = "";
                message += "<div class='row'>";
                $.each(result, function (index, value) {
                    // alert(index);
                    // alert(value);
                    let price = value.ss_price.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")
                    message += "<div class='col-lg-4 col-md-6 col-sm-6'>";
                    message += "<div class='product__item'>";
                    message += "<div class='product__item__pic'>";
                    message += "<a href='/sales/detail/" + value.ss_num + "'>";
                    message += "<img src='/images/product/sales_main/" + value.ss_img + "' style='height:100%''>";
                    message += "</a>";
                    message += "<ul class='product__item__pic__hover'>";
                    message += "<li>";
                    message += "<a class='wishlistModal' onclick='wishlistModal(" + value.ss_num + ")'>";
                    message += "<i class='fa fa-heart'></i>";
                    message += "</a>";
                    message += "</li>";
                    message += "<li>";
                    message += "<a class='basketModal' onclick='basketModal(" + value.ss_num + "'>";
                    message += "<i class='fa fa-shopping-cart'></i>";
                    message += "</a>";
                    message += "</li>";
                    message += "</ul>";
                    message += "</div>";
                    message += "<div class='product__discount__item__text'>";
                    message += "<span>" + value.gm_category + "</span>";
                    message += "<h6><a href='/sales/detail/" + value.ss_num + "'>" + value.ss_name + "</a></h6>";
                    message += "<h5><a href='/sales/detail/" + value.ss_num + "'>" + "₩" + price + "</a></h5>";
                    message += "</div>";
                    message += "</div>";
                    message += "</div>";

                    if ((index % 3) == 0) {
                        message += "<br>"
                    }

                });
                message += "</div>"
                message += "<div class='product__pagination blog__pagination' style='text-align: center'>"
                if (count > 0) {
                    if (endPage > pageCount) {
                        endPage = pageCount + 1
                    }
                    if (startPage > 0) {
                        message += "<a href='/sales/sales?pageNum=" + startPage + "&order3=" + order + "'><i class='fa fa-long-arrow-left'></i></a>"
                    }
                    for (let j = startPage + 1; j <= endPage - 1; j++) {
                        if (pageNum == j) {
                            message += "<a style='font-weight: bold; background: #e03e2d; color: white'>" + j + "</a>"
                        } else if (pageNum != j) {
                            message += "<a href='/sales/sales?pageNum=" + j + "&order3=" + order + "'>" + j + "</a>"
                        }
                    }


                    if (endPage <= pageCount) {
                        message += "<a href='/sales/sales?pageNum=" + startPage + 11 + "&order3=" + order + "'><i class='fa fa-long-arrow-right'></i></a>"
                    }
                }
                message += "</div>";
                $('#board').html(message);


            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    }

</script>


<%@ include file="../footer.jsp" %>