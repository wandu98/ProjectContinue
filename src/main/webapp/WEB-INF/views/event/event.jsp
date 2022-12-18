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
            <div class="row">
<%--                <c:forEach var="event" items="${eventlist}">--%>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="blog__item">
                            <div class="blog__item__pic">
                                <img src="/images/001.jpg" alt="">
                            </div>
                            <div class="blog__item__text">
                                <ul>
                                    <li><i class="fa fa-calendar-o"></i> ${event.evt_regdate}</li>
                                    <li><i class="fa fa-calendar-o"></i> 2022-12-23 00:00:00</li>
                                    <li><i class="fa fa-calendar-o"></i> 작성일</li>
                                </ul>
                                <h5><a href="#">제목</a></h5>
                                <p>조회수</p>
                                <a href="#" class="blog__btn">더보기 <span class="arrow_right"></span></a>
                            </div>
                        </div>
                    </div>
<%--                </c:forEach>--%>
                <div class="col-lg-6 col-md-6 col-sm-6">
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
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                quaerat </p>
                            <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
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
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                quaerat </p>
                            <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-4.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                quaerat </p>
                            <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-4.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">The Moment You Need To Remove Garlic From The Menu</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                quaerat </p>
                            <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic">
                            <img src="img/blog/blog-6.jpg" alt="">
                        </div>
                        <div class="blog__item__text">
                            <ul>
                                <li><i class="fa fa-calendar-o"></i> May 4,2019</li>
                                <li><i class="fa fa-comment-o"></i> 5</li>
                            </ul>
                            <h5><a href="#">Cooking tips make cooking simple</a></h5>
                            <p>Sed quia non numquam modi tempora indunt ut labore et dolore magnam aliquam
                                quaerat </p>
                            <a href="#" class="blog__btn">READ MORE <span class="arrow_right"></span></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__pagination blog__pagination">
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">3</a>
                        <a href="#"><i class="fa fa-long-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>