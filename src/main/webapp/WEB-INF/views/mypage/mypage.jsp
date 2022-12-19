<%@ page import="java.io.File" %>
<%@ page import="org.springframework.util.ResourceUtils" %>
<%@ page import="com.cafe24.nonchrono.dto.MemDTO" %>
<%@ page import="com.cafe24.nonchrono.dao.MemDAO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="../header.jsp"></jsp:include>

<style>
    .product__item__pic {
        height: 380px;
        left: 50px;
    }
    #infotable {
        padding-left: 10%;
    }
    .gm_img {
        max-width: 50%;
    }
    .shoping__cart__table table tbody tr td.shoping__cart__quantity {
        width: 200px;
    }
    .shoping__cart__table table tbody tr td.shoping__cart__price {
        width: 200px;
    }
    #close {
        width: 50px;
    }
</style>

<!-- Checkout Section Begin -->
<section class="checkout spad">
    <div class="container">
        <div class="checkout__form">
            <h4>Profile</h4>
            <form action="#">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="row">
                            <div class="col-lg-4 set-bg product__item__pic" id="nomalimg" data-setbg="/images/profile/ProfilePicture.png">
                                <c:if test="${YN eq true}"><img id="profile_img" src="/images/profile/${meminfo.mem_id}/${meminfo.mem_pic}" style="height: 100%; overflow: hidden"></c:if>
                            </div>
                            <div class="col-lg-8" id="infotable">
                                <table style="width: 100%; height: 100%">
                                    <tr>
                                        <th>닉네임(회원 ID)</th>
                                        <td>${meminfo.mem_nick}(${meminfo.mem_id})<a style="float: right" href="/mypage/memmodify">회원 정보 수정</a></td>
                                    </tr>
                                    <tr>
                                        <th>회원등급</th>
                                        <td>${meminfo.mem_grade}</td>
                                    </tr>
                                    <tr>
                                        <th>가입일</th>
                                        <td>${meminfo.mem_joindate}</td>
                                    </tr>
                                    <tr>
                                        <th>1:1 문의 수</th>
                                        <td>${qslist}</td>
                                    </tr>
                                    <tr>
                                        <th>구매평 수</th>
                                        <td>${revlist}</td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <br><br>

                        <section class="contact spad">
                            <div class="checkout__input">
                                <h4>온도</h4>
                                <div class="progress" style="width: 50%; height:30px; margin-left: 25%">
                                    <div class="progress-bar" style="width:${temp}%;height:30px; background-color: red">${temp}&deg;C</div>
                                </div>
                            </div>
                        </section>

                        <!-- 주문처리현황 Section Begin -->
                        <section class="contact spad">
                            <div class="checkout__input">
                                <h4>주문 처리 현황</h4>
                            </div>
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/card-approve-icon.png" style="width: 25%">
                                            <h5>결제완료</h5>
                                            <p>${detailcount[0]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/goods-contents-icon.png" style="width: 20%">
                                            <h5>출고준비중</h5>
                                            <p>${detailcount[1]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-package-delivered-icon.png" style="width: 25%">
                                            <h5>출고완료</h5>
                                            <p>${detailcount[2]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/logistic-truck-icon.png" style="width: 45%">
                                            <h5>배송중</h5>
                                            <p>${detailcount[3]}</p>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/door-service-icon.png" style="width: 25%">
                                            <h5>배송완료</h5>
                                            <p>${detailcount[4]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/purchase2.png" style="width:25%">
                                            <h5>구매확정</h5>
                                            <p>${detailcount[5]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/product-replacement-icon.png" style="width: 25%">
                                            <h5>교환</h5>
                                            <p>${detailcount[6]}</p>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-md-3 col-sm-6 text-center">
                                        <div class="contact__widget">
                                            <img src="/images/return.png" style="width: 25%">
                                            <h5>반품</h5>
                                            <p>${detailcount[7]}</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <!-- 주문처리현황 Section End -->

                        <!-- 모집현황 Section Begin -->
                        <section class="shoping-cart spad">
                            <h4>등록한 모집글</h4>
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
                                                <tbody id="rcrbrdlist">
                                                <c:choose>
                                                    <c:when test="${recruitlist.size()==0}">
                                                        <tr><td colspan="5"><h5><c:out value="없음"></c:out></h5></td></tr>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:forEach var="row" items="${recruitlist}" varStatus="vs">
                                                        <tr>
                                                            <td class="shoping__cart__item">
                                                                <img class="gm_img" src="/images/thumb/${row.gm_code}/thumb.jpg">
                                                                <h5 style="font-weight: 700">${row.rcrbrd_subject}</h5>
                                                            </td>
                                                            <td class="shoping__cart__price gm_name">
                                                                ${row.gm_name}
                                                            </td>
                                                            <td class="shoping__cart__quantity people_cnt">
                                                                <h5 style="font-weight: 700">${row.cnt}</h5>
                                                            </td>
                                                            <td class="shoping__cart__total">
                                                                ${row.rcrbrd_edate}
                                                            </td>
                                                            <td class="shoping__cart__item__close" id="close">
                                                                <span class="icon_close" onclick="rcrDelete(${row.rcrbrd_num})"></span>
                                                            </td>
                                                        </tr>
                                                        </c:forEach>
                                                    </c:otherwise>
                                                </c:choose>
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
                                                <h5><a href="/mypage/purchaseHistory">구매 기록<p>고객님께서 구매하신 상품의 내역을 확인하실 수 있습니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fastfood">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/wishlist">위시리스트<p>관심상품으로 등록하신 상품의 목록을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix vegetables fresh-meat">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/coupon">쿠폰 및 적립금 내역<p>고객님이 보유하고 계신 쿠폰내역 및 적립금을 보여드립니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fastfood oranges">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/review">후기 관리<p>고객님께서 작성하신 상품 후기를 관리하는 공간입니다.</p></a></h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-12 mix fresh-meat vegetables">
                                        <div class="featured__item">
                                            <div class="featured__item__text">
                                                <h5><a href="/mypage/memdv">배송 주소록<p>자주 사용하는 배송지를 등록하고 관리하실 수 있습니다.</p></a></h5>
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

<script>
    function rcrDelete(rcrbrd_num) {
        if (confirm("모집 게시글을 삭제하시겠습니까?")) {
            $.ajax({
                url : "/recruit/myDelete"
                ,type : "post"
                ,data : "rcrbrd_num=" + rcrbrd_num
                ,success : function (result) {
                    $("#rcrbrdlist").html(result);
                }
                ,error : function (request, status, error) {
                    console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                }
            });
        }
    }

    //프로필 사진 업로드 시 기본 이미지 안나오도록
    <c:if test="${YN eq true}">
        $("#nomalimg").attr("data-setbg", "");
    </c:if>

</script>

<jsp:include page="../footer.jsp"></jsp:include>
