<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-14
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<script src="/js/jquery.nicescroll.min.js"></script>


<div class="container">
    <div class="col-lg-12" style="background: #ff2222; text-align: center;">
        <br>
        <h2 style="color: #FFFFFF; font-weight: bold">이벤트</h2>
        <hr>
    </div>
</div>

<div class="container">
    <div class="col-lg-12 col-md-7" style="padding: 3%">
        <div class="row" id="evt">
            <c:forEach var="event" items="${eventlist}" varStatus="vs">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <a href="/event/Detail/${event.evt_num}">
                        <div class="blog__item"
                             style="box-shadow: 1px 1px 1px 1px #a69bae; padding: 7px; border-radius: 1%">
                            <div class="blog__item__pic">
                                <img src="" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul style="text-align: center">
                                    <li><i class="fa fa-calendar-o"></i>${event.evt_start}~</li>
                                    <li><i class="fa fa-comment-o"></i>${event.evt_end}</li>
                                </ul>
                                <h5 style="font-weight: bold; text-align: center">${event.evt_title}</h5>
                                <h6>조회수 : ${event.evt_views}</h6>
                            </div>
                        </div>
                    </a>
                </div>
            </c:forEach>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>