<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/11/29
  Time: 11:54 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="../header.jsp" %>

<%--별점 사진--%>
<script src="/js/jquery.min.js"></script>
<script src="/js/jquery.dd.min.js"></script>


<style>

    table.type04 {
        border-collapse: separate;
        border-spacing: 1px;
        text-align: left;
        line-height: 1.5;
        border-top: 1px solid #ccc;
        margin: 20px 10px;
    }

    table.type04 th {
        width: 150px;
        padding: 10px;
        font-weight: bold;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }

    table.type04 td {
        width: 350px;
        padding: 10px;
        vertical-align: top;
        border-bottom: 1px solid #ccc;
    }

    .wrap {
        width: 500px;
    }

    .wrap textarea {
        width: 100%;
        resize: none;
        overflow-y: hidden; /* prevents scroll bar flash */
        padding: 1.1em; /* prevents text jump on Enter keypress */
        padding-bottom: 0.2em;
        line-height: 1.6;
    }

    /*!* The Modal (background) *!*/
    /*.modal {*/
    /*    display: none; !* Hidden by default *!*/
    /*    position: fixed; !* Stay in place *!*/
    /*    z-index: 1; !* Sit on top *!*/
    /*    padding-top: 100px; !* Location of the box *!*/
    /*    left: 0;*/
    /*    top: 0;*/
    /*    width: 100%; !* Full width *!*/
    /*    height: 100%; !* Full height *!*/
    /*    overflow: auto; !* Enable scroll if needed *!*/
    /*    background-color: rgb(0, 0, 0); !* Fallback color *!*/
    /*    background-color: rgba(0, 0, 0, 0.4); !* Black w/ opacity *!*/
    /*}*/

    /*!* Modal Content *!*/
    /*.modal-content {*/
    /*    background-color: #fefefe;*/
    /*    margin: auto;*/
    /*    padding: 20px;*/
    /*    border: 1px solid #888;*/
    /*    width: 20%;*/
    /*}*/

    /*!* The Close Button *!*/
    /*.close {*/
    /*    color: #aaaaaa;*/
    /*    float: right;*/
    /*    font-size: 28px;*/
    /*    font-weight: bold;*/
    /*}*/

    /*.close:hover,*/
    /*.close:focus {*/
    /*    color: #000;*/
    /*    text-decoration: none;*/
    /*    cursor: pointer;*/
    /*}*/


    .count-wrap {
        width: 140px;
        height: 50px;
        display: inline-block;
        position: relative;
        text-align: center;
        background: #f5f5f5;
        margin-bottom: 5px;
    }

    .count-wrap > button {
        width: 35px;
        font-size: 16px;
        color: #6f6f6f;
        cursor: pointer;
        display: inline-block;
        border: none;
    }

    .count-wrap .inp {
        height: 100%;
        width: 100%;
        font-size: 16px;
        color: #6f6f6f;
        width: 50px;
        border: none;
        background: #f5f5f5;
        text-align: center;
    }

</style>

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg" data-setbg="/images/recruit_banner.png">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="breadcrumb__text">
                    <h2>마켓 상세보기</h2>
                    <div class="breadcrumb__option">
                        <a href="/">Home</a>
                        <a href="/sales">Sales</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Details Section Begin -->
<section class="product-details spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6">
                <div class="product__details__pic">
                    <div class="product__details__pic__item">
                        <img class="product__details__pic__item--large"
                             src="/images/product/sales_main/${detail.ss_img}" style="width: 330px; height: 550px">
                    </div>
                </div>
            </div>
            <div class="col-lg-6 col-md-6">
                <div class="product__details__text">
                    <h3>${detail.ss_name}</h3>
                    <div class="product__details__rating">
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star"></i>
                        <i class="fa fa-star-half-o"></i>
                        <span>(${reviewCount} reviews)</span>
                    </div>
                    <div class="product__details__price">판매가 ₩<fmt:formatNumber value="${detail.ss_price}"
                                                                                pattern="#,###"/></div>
                    <ul>
                        <li><b>카테고리</b> <span>${detail.gm_category}</span></li>
                        <li><b>배송비</b> <span>${deliveryDetail.dv_fee}</span></li>
                        <li><b>재고</b> <span>${detail.ss_stock}개</span></li>
                        <li><b>플랫폼</b> <span>SWITCH</span></li>
                        <li><b>퍼블리셔</b> <span>닌텐도</span></li>
                        <li><b>언어</b> <span>제조국-중국</span></li>
                        <li><b>이용등급</b> <span>${gameDetail.gm_level}</span></li>
                        <li><b>상품코드</b> <span>${gameDetail.gm_code}</span></li>
                    </ul>
                    <hr>


                    <!-- 스크롤2 영역시작 -->
                    <div class="type04">
                        <!-- 참고 : 뉴상품관리 전용 변수가 포함되어 있습니다. 뉴상품관리 이외의 곳에서 사용하면 일부 변수가 정상동작하지 않을 수 있습니다. -->
                        <div id="totalProducts" class="">
                            <table>
                                <colgroup>
                                    <col style="width:300px"/>
                                    <col style="width:300px"/>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">상품명</th>
                                    <th scope="col">가격</th>
                                </tr>
                                </thead>
                                <tbody class="product__details__text">
                                <tr>
                                    <td>${detail.ss_name}</td>
                                    <td>
                                        <span class="quantity_price"><fmt:formatNumber value="${detail.ss_price}"
                                                                                       type="currency"/></span>
                                        <span class="mileage ">&nbsp;&nbsp;&nbsp;
                                        <img src="//img.echosting.cafe24.com/design/skin/admin/ko_KR/ico_product_point.gif"/>
                                        <span class="mileage_price">(<fmt:formatNumber value="${detail.ss_price * 0.01}"
                                                                                       pattern="#,###"/>원)</span></span>
                                    </td>
                                </tr>
                                </tbody>

                                </tbody>
                            </table>
                            <!-- //참고 -->
                        </div>
                        <!-- //참고 -->
                    </div>
                    <br>
                    <!-- //스크롤2 영역끝 -->


                    <div id="totalPrice" class="top_total_box">
                        <strong>총 상품금액</strong>(수량) :
                        <span class="total" id="il">
                            <strong>
                               <input type="text" value="${detail.ss_price}원" name="inputValue"
                                      style="border: none; text-align: center"
                                      readonly/>
                                <input type="text" value="1" id="inputCount" name="inputCount"
                                       style="border: none; text-align: left" readonly/>
                            </strong>
                        </span>
                    </div>
                    <br>

                    <div class="count-wrap _count">
                        <button type="button" class="minus">-</button>
                        <input type="text" class="inp" value="1"/>
                        <button type="button" class="plus">+</button>
                    </div>
                    <a onclick="purchase(${detail.ss_num})" class="primary-btn btn-outline-danger">바로구매</a>
                    <a onclick="cartModal(${detail.ss_num})" class="primary-btn btn-outline-danger">장바구니 추가</a>
                    <a onclick="wishheart(${detail.ss_num})" class="heart-icon"><span class="icon_heart_alt"></span></a>
                </div>

            </div>
            <div class="col-lg-12">
                <div class="product__details__tab">
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="nav-item">
                            <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                               aria-selected="true">상품상세</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                               aria-selected="false">배송/환불/반품 정책</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" data-toggle="tab" href="#tabs-3" role="tab"
                               aria-selected="false">상품리뷰 <span>(${reviewCount})</span></a>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <h6>상품상세정보</h6>
                                <p>${detail.ss_description}</p>

                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-2" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <div class="prd_info -section">
                                    <div class="titleArea">
                                        <h3>배송정보</h3>
                                        <hr>
                                    </div>
                                    <p class="info_text">
                                        출고 시간 : 평일 오후 4시 이전 주문건 당일 출고 (일부 품목 제외)<br/><br/>
                                        배송 방법 : 택배<br/>
                                        배송 지역 : 전국지역<br/>
                                        배송 비용 : 무료<br/>
                                        배송 기간 : 1일 ~ 3일<br/></p>
                                    <p>

                                        <br/>
                                    <p><strong>&lt;실물 택배 상품&gt;</strong></p>
                                    <p>-주문 제품은 입금 확인 후 배송이 진행됩니다.</p>
                                    <p>-일부 입고 지연 품목 또는 예약판매 제품에 한해 배송이 다소 지연될 수 있으며,</p>
                                    <p>&nbsp; 출고 지연 품목의 경우 상세페이지 내부 출고일정 공지 및 개별 안내가 진행됩니다.</p>
                                    <p>-택배 영업소 사정에 따라 일부 지역은 배송이 지연 될 수 있습니다.</p>
                                    <p>-도서산간 지역에 따라 추가 운임료 (해운료,항공료,산간료) 가 청구 될 수 있습니다.</p>
                                    <p>-도서산간 지역 추가 운임료는 상품별로 청구 될 수 있으며, 묶음배송으로 적용 시 추가 운임료는</p>
                                    <p>&nbsp;1회분을 제외 후 환불 처리(부분 취소 또는 부분 환불, 휴대폰결제는 처리 불가)를 진행드리오니 고객센터를 통해 문의를 남겨주시기
                                        바랍니다.</p>
                                    <p>&nbsp;자세한 내용은 공지사항 게시판의<strong> <a
                                            href="https://sofrano.com/article/공지사항/1/4813/"
                                            style="color: rgb(85, 85, 85);">[공지] 무료배송 상품 도서 산간지 묶음배송 추가 운임료 개별 청구, 부분 환불
                                        안내</a></strong> 를 참고 바랍니다.</p>
                                    <p>-상품 수령에 관한 문의는 CJ대한통운(1588-1255)으로 문의 바랍니다.</p>
                                    <p>-배송지 변경은 송장번호 등록 전(출고 전)에만 가능하며, 송장번호 등록(출고) 이후에는 변경이 불가한 점 참고 바랍니다.</p>
                                    <p>&nbsp;(변경하실 주소지와 함께 1:1 문의를 통해 접수가 가능합니다.)</p>
                                    <p><br></p>
                                    <p><strong>&lt;지금 다운로드 상품&gt;</strong></p>
                                    <p>-주문 제품은&nbsp;마이 닌텐도 (내 어카운트) 계정을 통해 내 스위치 기기에 바로 등록(다운로드) 됩니다.</p>
                                    <p>&nbsp; 경로 : 결제 확인 후, 마이샵 ▶ 주문 조회 ▶ 다운로드 활성화 ▶ 지금 다운로드 ▶ 마이 닌텐도(어카운트) 로그인 ▶ 교환<br>-회원가입
                                        시 등록하신 SMS 수신 동의 설정에 한하여, 주문서에 등록한 휴대폰 번호로 이용안내 메세지(1~5분 이내)가&nbsp;문자로 자동 발송됩니다.<br>&nbsp;(문자는
                                        회원 정보 설정의 SMS 수신 거부 설정 시 미발송, 휴대폰 내 스팸 자동 차단 및 기기 설정에 따라 발송되지 않을 수 있습니다.)</p>
                                    <p>&nbsp; 이용방법에 대한 자세한 내용은 공지사항 게시판의
                                        <ins><strong> [공지] 닌텐도 다운로드(디지털) 상품, ★★★[지금 다운로드] 이용 안내 ★★★</strong></ins>
                                        를 참고 바랍니다.<br>-결제 방법에 제한이 있을 수 있습니다. (네이버 페이, 카카오페이 불가)
                                    </p>
                                    </p>
                                    <br>
                                </div>
                                <!-- 교환 및 반품정보 -->
                                <div class="prd_info -section">
                                    <div class="titleArea">
                                        <h3>교환 및 반품정보</h3>
                                        <hr>
                                    </div>
                                    <p class="info_text">
                                    <p><strong>&lt;실물 택배 상품&gt;</strong></p>
                                    <p><strong>교환 및 반품 접수 방법<br></strong>1. 상품 수령 후 7일 이내 고객센터(070-4640-1229) 또는 1:1 게시판
                                        문의로 접수(필수)<br>- 교환 및 반품 접수 안내와 배송비 안내를 받으시기 바랍니다.<br>(임의로 반송하여 2,500원 이외의 추가 금액이
                                        발생할 경우 추가 금액은 고객님께 청구됩니다.)</p>
                                    <p><br>2. CJ대한통운 접수<br>- CJ대한통운(1588-1255 또는 홈페이지)로 반품 예약 진행 시 [운임 결제방식을 반드시 신용]으로
                                        발송 바랍니다.<br>*운임 결제방식을 신용 이외의 방법으로 반송하신 경우 추가 요금이 청구될 수 있습니다.</p>
                                    <p><br></p>
                                    <p><strong>교환 및 반품 배송지</strong><br>&nbsp; [지번: 경기도 안양시 만안구 석수동 860-10 게임피아(주)]<br>&nbsp;
                                        [도로명 : 경기도 안양시 만안구 일직로 94번길 35 게임피아(주)]</p>
                                    <p>- 입고된 상품 상태 및 배송비 확인 후 영업일 기준 1~2일 이내 처리됩니다.</p>
                                    <p><br></p>
                                    <p><br><strong>

                                        교환 및 반품이 불가능한 경우</strong></p>
                                    <p>- 청약철회 가능 기간 상품 수령 후 7일 이내(택배 도착일 기준)이 경과된 경우</p>
                                    <p>- 고객센터 및 게시판에 내용을 접수하지 않고 임의로 반송을 보낸 경우<br>- 고객님의 책임이 있는 사유로 상품이 멸실, 훼손, 가치가 하락된
                                        경우<br>&nbsp; ▷게임 타이틀 비닐 포장을 개봉하였거나 훼손되어 상품의 가치가 하락된 경우</p>
                                    <p>&nbsp; &nbsp; (타이틀의 경우 복제가 가능하며, 청약철회 기간 내 실질적인 사용이 가능하기에 단순 포장 훼손 시 상품 가치가
                                        하락(중고품) 됩니다.)<br>- 고객님의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우 </p>
                                    <p>&nbsp; ▷직접적인 사용(전자기기 전원 ON 및 연결, 사용 흔적 및 훼손, 구성물 누락 등)으로 인하여 상품의 가치가 상실된 경우<br>&nbsp;
                                        ▷고유 넘버링이 되어 있는 제품(본체 및 주변기기 등)의 포장재 누락 및 훼손으로 상품의 가치가 상실된 경우<br>
                                        <br><strong>
                                        </strong><strong>교환 및 반품 배송비 안내<br></strong>- 변심 반품 : 초기 배송비 지불 시 반송 배송비 2,500원
                                        / 무료배송 받으신 경우 왕복 배송비 5,000원</p>
                                    <p>- 교환 : 왕복 배송비 5,000원</p>
                                    <p>- 하자 교환 및 반품 : 무료</p>
                                    <p>- 추가비용 : 타택배 및 도서산간 추가비용 고객부담 (CJ택배를 이용바랍니다.)</p>
                                    <p><br></p>
                                    <p>&lt; 배송비 입금 계좌 : 국민은행 / 477401-01-067892 / 게임피아(주) &gt;</p>
                                    <p><br></p>
                                    <p><br></p>
                                    <p><strong>&lt;지금 다운로드 상품&gt;</strong></p>
                                    <p><strong>환불 기본 안내</strong></p>
                                    <p>※ [다운로드] 상품은 '디지털' 상품으로 다운로드 활성화를 진행&nbsp;하신 경우 해당 상품이 고객님의 본체로 바로 다운로드가 가능한 상태로
                                        전환되어</p>
                                    <p>&nbsp;&nbsp;&nbsp;&nbsp; 구매하신 주문서에 귀속되므로 다운로드 '활성화'를 진행하지 않은 '배송 대기' 주문 상태의 상품에
                                        한하여 환불만 가능합니다. (교환 및 반품 불가)</p>
                                    <p><br></p>
                                    <p><strong>환불 신청 경로</strong><br>- 마이샵 ▶ 주문 조회 ▶ 취소 신청<br>('취소 신청' 후 '취소 철회'를 진행하신 경우
                                        [다운로드] 재 진행이 불가하오니 환불을 받으신 후 재주문 바랍니다.)</p>
                                    <p><br></p>
                                    <p><strong>환불이 불가능한 경우</strong><br>- 청약철회(환불) 가능 기간인 결제 완료 후 7일이 경과된 경우<br>- [다운로드]
                                        활성화를 진행한 경우</p>
                                    <p><br></p>
                                    <p><strong>[다운로드 번호] 확인(활성화) 후 환불이 가능한 경우</strong><br>-아래에 해당하시는 경우 고객센터 또는 1:1문의를
                                        통하여 환불 신청이 가능합니다.<br>&nbsp; ▷무통장 입금 시 착오로 추가 입금한 차액<br>&nbsp; ▷무통장 입금 오류(입금자명 및
                                        금액 불일치)로 결제 완료 처리가 되지 않은 주문</p></p>
                                    <hr>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="tabs-3" role="tabpanel">
                            <div class="product__details__tab__desc">
                                <div class="container">
                                    <h6 class="card-title">리뷰</h6>
                                    <form id="commentInsertForm" name="commentInsertForm" method="post"
                                          enctype="multipart/form-data" action="/review/rv_insert"
                                          onsubmit="return review()">
                                        <div class="text-center">
                                            <input type="hidden" name="ss_num" id="ss_num"
                                                   value="${detail.ss_num}"><!-- 부모글 번호 -->
                                            <input type="hidden" id="rv_date" name="rv_date" readonly>
                                            <div class="text-center">
                                                <select id="rv_star" name="rv_star">
                                                    <option value="null">별점을 선택해주세요</option>
                                                    <option class="star_5 fa" value="10"><span>★★★★★</span></option>
                                                    <option class="star_4" value="8"><span>★★★★</span></option>
                                                    <option class="star_3" value="6"><span>★★★</span></option>
                                                    <option class="star_2" value="4"><span>★★</span></option>
                                                    <option class="star_1" value="2"><span>★</span></option>
                                                </select>
                                                <label for="rv_filename" class="col-sm-2 col-form-label"
                                                       style="float: left"><img
                                                        src="/images/pic.jpg" style="height: 50px;
                                                                           padding-bottom: 20px;float: inherit ">
                                                </label>
                                                <textarea id="rv_content" name="rv_content" placeholder="리뷰 작성란..."
                                                          style="width: 100%; height: 150px; font-size: 16px;
                                                           color: #6f6f6f; padding-left: 20px;
                                                           margin-bottom: 24px; border: 1px solid #ebebeb;
                                                           border-radius: 4px; padding-top: 12px; resize: none;"></textarea>
                                                <button type="submit" class="site-btn" style="float: right">리뷰 작성
                                                </button>
                                                <div>
                                                    <p align="left"/><img id="pic_view" style="width:20%">
                                                    <div class="col-sm-10">
                                                        <input class="form-control" type="file" id="rv_filename"
                                                               name="rv_filename" style="display: none; float: left">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </form>
                                    <br><br><br>
                                    <hr>
                                </div>
                                </form>
                                <div class="row" id="board">
                                    <c:forEach var="row" items="${reviewDetail}">
                                        <!-- 댓글 본문 -->
                                        <div class="col-lg-4 col-md-4 col-sm-4">
                                            <div class="blog__item"
                                                 style="box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%">
                                                <div class="blog__item__pic">
                                                    <c:if test="${row.rv_filename!=''}"><img src="/images/review/${row.rv_filename}" onerror="this.style.display='none';">></c:if>
                                                </div>
                                                <div class="blog__item__text">
                                                    <ul>
                                                        <li><i class="fa fa-calendar-o"></i> ${row.rv_date}</li>
                                                        <br>
                                                        <li><c:set var="star" value="${row.rv_star}"/>
                                                            <c:choose>
                                                                <c:when test="${star le 2}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:when test="${star le 4}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:when test="${star le 6}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:when test="${star le 8}">
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                    <i class="fa fa-star"></i>
                                                                </c:otherwise>
                                                            </c:choose></li>
                                                    </ul>
                                                    <h5>${row.mem_nick}</h5>
                                                    <h5>${row.rv_content}</h5>
                                                </div>
                                            </div>
                                            </a>
                                        </div>
                                        <%-- 한줄에 3칸씩 --%>
                                        <c:if test="${vs.count mod 3==0}">
                                            <br>
                                        </c:if>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
</section>
<!-- Product Details Section End -->

<!-- Related Product Section Begin -->
<section class="related-product">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title related__product__title">
                    <h2>이 아이템만 있으면 나도 인기쟁이</h2>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg"
                         data-setbg="/images/product/sales_main/${idxTopProduct[0].ss_img}">
                        <ul class="product__item__pic__hover">
                            <li><a class="wishlistModal" onclick="wishlistModal(${idxTopProduct[0].ss_num})"><i
                                    class="fa fa-heart"></i></a></li>
                            <li><a class="basketModal" onclick="basketModal(${idxTopProduct[0].ss_num})"><i
                                    class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${idxTopProduct[0].ss_name}</a></h6>
                        <h5><fmt:formatNumber value="${idxTopProduct[0].ss_price}" type="currency"/></h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg"
                         data-setbg="/images/product/sales_main/${idxTopProduct[1].ss_img}">
                        <ul class="product__item__pic__hover">
                            <li><a class="wishlistModal" onclick="wishlistModal(${idxTopProduct[1].ss_num})"><i
                                    class="fa fa-heart"></i></a></li>
                            <li><a class="basketModal" onclick="basketModal(${idxTopProduct[1].ss_num})"><i
                                    class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${idxTopProduct[1].ss_name}</a></h6>
                        <h5><fmt:formatNumber value="${idxTopProduct[1].ss_price}" type="currency"/></h5>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg"
                         data-setbg="/images/product/sales_main/${idxTopProduct[2].ss_img}">
                        <ul class="product__item__pic__hover">
                            <li><a class="wishlistModal" onclick="wishlistModal(${idxTopProduct[2].ss_num})"><i
                                    class="fa fa-heart"></i></a></li>
                            <li><a class="basketModal" onclick="basketModal(${idxTopProduct[2].ss_num})"><i
                                    class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${idxTopProduct[2].ss_name}</a></h6>
                        <h5><fmt:formatNumber value="${idxTopProduct[2].ss_price}" type="currency"/></h5>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-4 col-sm-6">
                <div class="product__item">
                    <div class="product__item__pic set-bg"
                         data-setbg="/images/product/sales_main/${idxTopProduct[3].ss_img}">
                        <ul class="product__item__pic__hover">
                            <li><a class="wishlistModal" onclick="wishlistModal(${idxTopProduct[3].ss_num})"><i
                                    class="fa fa-heart"></i></a></li>
                            <li><a class="basketModal" onclick="basketModal(${idxTopProduct[3].ss_num})"><i
                                    class="fa fa-shopping-cart"></i></a></li>
                        </ul>
                    </div>
                    <div class="product__item__text">
                        <h6><a href="#">${idxTopProduct[3].ss_name}</a></h6>
                        <h5><fmt:formatNumber value="${idxTopProduct[3].ss_price}" type="currency"/></h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%-- 장바구니 모달 --%>
<%--<div class="container">
    <!-- The Modal -->
    <div class="modal" id="myModal2">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">장바구니</h4>
                    <button type="button" class="close" data-dismiss="modal" onclick="modalClose()">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    선택하신 상품을 장바구니에 담았습니다.<br>지금 장바구니를 확인하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modalClose()">쇼핑 계속하기</button>
                    <button type="button" class="btn btn-success" onclick="goBasket()">장바구니 확인</button>
                </div>

            </div>
        </div>
    </div>
</div>--%>


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
                    <button type="button" class="close" data-dismiss="modal" onclick="modalClose()">&times;</button>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    선택하신 상품을 장바구니에 담았습니다.<br>지금 장바구니를 확인하시겠습니까?
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="modalClose()">쇼핑 계속하기
                    </button>
                    <button type="button" class="btn btn-success" onclick="goBasket()">장바구니 확인</button>
                </div>

            </div>
        </div>
    </div>
</div>


<script>
    //상품이미지에서 하트(위시리스트) 클릭했을 때
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

    //상품이미지에서 카트(장바구니) 클릭했을 때
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

    //위시리스트 이동
    function goWishlist() {
        location.replace("/mypage/wishlist");
    }

    //마이페이지 이동
    function goBasket() {
        location.replace("/mypage/cart");
    }


    <%--$(document).ready(function () {--%>
    <%--    $('#count2 span').on('click', function () {--%>
    <%--        let count = $('#count').val();--%>
    <%--        let tot2 = (parseInt(count) *${detail.ss_price});--%>
    <%--        let price = tot2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');--%>

    <%--        if (count <= ${detail.ss_stock}) {--%>
    <%--            $('input[name=inputCount]').attr('value', count+"개")--%>
    <%--            $('input[name=inputValue]').attr('value', price+"원")--%>

    <%--        } else {--%>
    <%--            alert("재고가 부족합니다")--%>
    <%--            return false;--%>
    <%--        }--%>
    <%--        ;--%>
    <%--    });--%>
    <%--});--%>

    $('._count :button').on({
        'click': function (e) {
            e.preventDefault();
            let $count = $(this).parent('._count').find('.inp');
            let now = parseInt($count.val());
            let min = 1;
            let max = ${detail.ss_stock};
            let num = now;
            let tot2 = ((num + 1) * ${detail.ss_price});
            let tot3 = ((num - 1) * ${detail.ss_price});
            let m_price = tot3.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            let p_price = tot2.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
            // alert(num)
            // alert(p_price)
            if ($(this).hasClass('minus')) {
                var type = 'm';
            } else {
                var type = 'p';
            }
            if (type == 'm') {
                if (now > min) {
                    num = now - 1;
                    $('input[name=inputCount]').attr('value', num + "개");
                    $('input[name=inputValue]').attr('value', m_price + "원");

                }
            } else {
                if (now < max) {
                    num = now + 1;
                    $('input[name=inputCount]').attr('value', num + "개");
                    $('input[name=inputValue]').attr('value', p_price + "원");
                } else {
                    alert("수량을 확인해주세요");
                }
            }
            if (num != now) {
                $count.val(num);
            }
        }
    });


    // Get the modal
    var modal = document.getElementById("myModal2");

    function cartModal(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let bk_amount2 = $("#inputCount").val();
        let bk_amount = bk_amount2.substr(0, 1);
        console.log(mem_id);
        console.log(bk_amount);
        if (mem_id != 'null' && bk_amount > 0) {
            $.ajax({
                url: "/cart/insert"
                , data: {"ss_num": ss_num, "bk_amount": bk_amount}
                , type: "get"
                , success: openModal()
            });
        } else if (mem_id != 'null' && bk_amount == 0) {
            alert("수량을 선택해주세요")
        } else {
            alert("로그인 후 이용해주세요")
        }


    }

    function purchase(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let bk_amount2 = $("#inputCount").val();
        let bk_amount = bk_amount2.substr(0, 1);
        console.log(mem_id);
        console.log(bk_amount);
        if (mem_id != 'null' && bk_amount > 0) {
            $.ajax({
                url: "/cart/insert"
                , data: {"ss_num": ss_num, "bk_amount": bk_amount}
                , type: "get"
            });
            location.href = "/sales/checkout";
        } else if (mem_id != 'null' && bk_amount == 0) {
            alert("수량을 선택해주세요")
        } else {
            alert("로그인 후 이용해주세요")
        }


    }

    function wishheart(ss_num) {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';
        let params = "ss_num=" + ss_num;
        if (mem_id == 'null') {
            alert("로그인 후 이용해주세요");
        } else {
            $("#myModal1").modal('show');
            if ($("#myModal1").on("DOMSubtreeModified")) {  // #myModal1의 변화 감지. 여기서는 변화가 3번이라 3번 insert가 되어 1번만 insert 시키기 위해 if의 조건으로 주었다.
                $.get("/wishlist/insert", params);


            }
        }
    }


    function modalClose() {
        modal.style.display = "none";
    }

    function openModal() {
        modal.style.display = "block";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    function goCart() {
        location.href = "/mypage/cart";
    }

    //사진 미리보기
    <%-- 올린 이미지 미리보기 --%>
    $("#rv_filename").change(function (event) {
        // alert("테스트");
        let file = event.target.files[0];
        // alert(file);    //[object File]
        let reader = new FileReader();
        reader.onload = function (e) {
            $("#pic_view").attr('src', e.target.result);
        }
        reader.readAsDataURL(file);
    });

    function review() {
        let mem_id = '<%=(String) session.getAttribute("mem_id")%>';

        if (mem_id == 'null') {
            alert("로그인 후 이용해주세요")
            location.href = "/mem/login"
            return false;
        }

        let size = $('#rv_content').val();
        if (size.length < 2) {
            alert("두글자 이상 입력해주세요");
            return false;
        }

        let star = $("#rv_star").val();
        if (star=="null") {
            alert("별점을 입력해주세요");
            return false;
        }

        return true;
    }


</script>

<!-- End #main -->

<%@include file="../footer.jsp" %>