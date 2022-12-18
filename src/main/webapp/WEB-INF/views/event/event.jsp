<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-14
  Time: 오후 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-lg-4 col-md-5">
            <div class="blog__sidebar">
                <div class="blog__sidebar__search">
                    <form action="#">
                        <input type="text" placeholder="Search...">
                        <button type="submit"><span class="icon_search"></span></button>
                    </form>
                </div>
                <div class="blog__sidebar__item">
                    <h4>Categories</h4>
                    <ul>
                        <li><a href="#">All</a></li>
                        <li><a href="#">Beauty (20)</a></li>
                        <li><a href="#">Food (5)</a></li>
                        <li><a href="#">Life Style (9)</a></li>
                        <li><a href="#">Travel (10)</a></li>
                    </ul>
                </div>
                <div class="blog__sidebar__item">
                    <h4>Recent News</h4>
                    <div class="blog__sidebar__recent">
                        <a href="#" class="blog__sidebar__recent__item">
                            <div class="blog__sidebar__recent__item__pic">
                                <img src="img/blog/sidebar/sr-1.jpg" alt="">
                            </div>
                            <div class="blog__sidebar__recent__item__text">
                                <h6>09 Kinds Of Vegetables<br> Protect The Liver</h6>
                                <span>MAR 05, 2019</span>
                            </div>
                        </a>
                        <a href="#" class="blog__sidebar__recent__item">
                            <div class="blog__sidebar__recent__item__pic">
                                <img src="img/blog/sidebar/sr-2.jpg" alt="">
                            </div>
                            <div class="blog__sidebar__recent__item__text">
                                <h6>Tips You To Balance<br> Nutrition Meal Day</h6>
                                <span>MAR 05, 2019</span>
                            </div>
                        </a>
                        <a href="#" class="blog__sidebar__recent__item">
                            <div class="blog__sidebar__recent__item__pic">
                                <img src="img/blog/sidebar/sr-3.jpg" alt="">
                            </div>
                            <div class="blog__sidebar__recent__item__text">
                                <h6>4 Principles Help You Lose <br>Weight With Vegetables</h6>
                                <span>MAR 05, 2019</span>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="blog__sidebar__item">
                    <h4>Search By</h4>
                    <div class="blog__sidebar__item__tags">
                        <a href="#">Apple</a>
                        <a href="#">Beauty</a>
                        <a href="#">Vegetables</a>
                        <a href="#">Fruit</a>
                        <a href="#">Healthy Food</a>
                        <a href="#">Lifestyle</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-8 col-md-7">
            <h3>이벤트</h3>
            <br>
            <div name="evtlist" id="evtlist">
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>제목</th>
                        <th>시작일</th>
                        <th>종료일</th>
                        <th>작성일</th>
                        <th>조회수</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="event" items="${eventlist}">
                        <tr style="cursor: pointer" onclick="location.href='/event/Detail/${event.evt_num}'">
                            <td>${event.evt_num}</td>
                            <td>${event.evt_title}</td>
                            <td>${event.evt_start}</td>
                            <td>${event.evt_end}</td>
                            <td>${event.evt_regdate}</td>
                            <td>${event.evt_views}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>