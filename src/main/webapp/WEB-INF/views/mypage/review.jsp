<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-11-30
  Time: 오전 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="../header.jsp"></jsp:include>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/002.jpg">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>Review</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <span>Review</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->
<section class="shoping-cart spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="shoping__cart__table">
                    <table>
                        <thead>
                        <tr>
                            <th></th>
                            <th class="shoping__product" style="padding-left: 5%">내용</th>
                            <th>별점</th>
                            <th style="width: 10%">삭제</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach var="row" items="${rvlist}" varStatus="vs">
                            <tr>
                                <td class="shoping__cart__price">
                                    ${vs.index+1}
                                </td>
                                <td class="shoping__cart__item">
                                    <div onclick="rvList(${row.rv_num})">
                                        <img src="/images/review/${row.rv_filename}" style="max-width: 20%">
                                        <h5>${row.rv_content}</h5>
                                    </div>
                                </td>
                                <td class="shoping__cart__price">
                                    <div class="quantity">
                                            ${row.rv_star}
                                    </div>
                                </td>
                                <td colspan="2" class="shoping__cart__item__close" style="text-align: center">
                                    <span class="icon_close" onclick="rvDelete(${row.rv_num})"></span>
                                </td>
                            </tr>
                            <form name="form1" method="post" enctype="multipart/form-data" action="/review/modify">
                                <input id="rv_num" name="rv_num" type="hidden" value="${row.rv_num}">
                                <tr id="myrv_list${row.rv_num}" style="display: none">
                                    <td>
                                        <input type="file" id="rv_filename" name="rv_filename">
                                    </td>
                                    <td class="shoping__cart__item">
                                        <div class="row">
                                            <textarea id="rv_content" name="rv_content" rows="10" style="width: 90%; float: right">${row.rv_content}</textarea>
                                        </div>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <select name="rv_star">
                                            <option>별점을 선택해주세요</option>
                                            <option class="star_5 fa" value="10" <c:if test="${row.rv_star == 10}">selected</c:if>><span>★★★★★</span></option>
                                            <option class="star_4" value="8" <c:if test="${row.rv_star==8}">selected</c:if>><span>★★★★</span></option>
                                            <option class="star_3" value="6" <c:if test="${row.rv_star==6}">selected</c:if>><span>★★★</span></option>
                                            <option class="star_2" value="4" <c:if test="${row.rv_star==4}">selected</c:if>><span>★★</span></option>
                                            <option class="star_1" value="2" <c:if test="${row.rv_star==2}">selected</c:if>><span>★</span></option>
                                        </select>
                                    </td>
                                    <td colspan="2" class="shoping__cart__item__close" style="text-align: center">
                                        <button class="site-btn">수정</button>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <c:if test="${requestScope.count>0}">
            <c:set var="pageCount" value="${requestScope.totalPage}"></c:set>
            <c:set var="endPage" value="${requestScope.endPage}"></c:set>
            <div class="product__pagination" style="text-align: center">
                <c:if test="${endPage>pageCount}">
                    <c:set var="endPage" value="${pageCount+1}"></c:set>
                </c:if>
                <c:if test="${startPage>0}">
                    <a href="/mypage/review?pageNum=${startPage}"><i class="fa fa-long-arrow-left"></i></a>
                </c:if>
                <c:forEach var="i" begin="${startPage+1}" end="${endPage-1}">
                    <c:choose>
                        <c:when test="${pageNum==i}"><a>${i}</a></c:when>
                        <c:when test="${pageNum!=i}"><a href="/mypage/review?pageNum=${i}">${i}</a></c:when>
                    </c:choose>
                </c:forEach>
                <c:if test="${endPage<=pageCount}">
                    <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                </c:if>
            </div>
        </c:if>
    </div>
</section>
<!-- Shoping Cart Section End -->



<script>
    function rvDelete(rv_num) {
        if (confirm("해당 상품 리뷰를 삭제하시겠습니까?")) {
            location.replace("/review/delete/"+rv_num);
        }
    }

    function rvList(rv_num) {
        let status = $("#myrv_list"+rv_num).css("display")
        if (status == "none") {
            $("#myrv_list"+rv_num).css("display", "");
        } else {
            $("#myrv_list"+rv_num).css("display", "none");
        }
    }

    $("#rv_filename").change(function (event) {
        let file = event.target.files[0];
        let reader = new FileReader();
        reader.onload = function (e) {
            $("#rv_img").attr('src', e.target.result);
        }
        reader.readAsDataURL(file);
    });
</script>

<jsp:include page="../footer.jsp"></jsp:include>
