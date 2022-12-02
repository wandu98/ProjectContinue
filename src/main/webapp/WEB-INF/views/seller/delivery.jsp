<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/02
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<jsp:include page="sellerheader.jsp"></jsp:include>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>배송정책</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/seller">Home</a></li>
                <li class="breadcrumb-item">주문관리</li>
                <li class="breadcrumb-item active">배송정책</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">My delivery Policy </h5>나만의 배송정책을 추가하실려면 <code> "추가" 버튼을
                        눌러주십시오!</code></p>

                        <!-- Scrolling Modal -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal"
                                data-bs-target="#scrollingModal">
                            추가
                        </button>
                        <div class="modal fade" id="scrollingModal" tabindex="-1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title">배송정책 추가하기</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"
                                                aria-label="Close"></button>
                                    </div>


                                    <div class="card">
                                        <div class="card-body" style="box-sizing: initial">
                                            <h5 class="card-title">나만의 배송정책을 만들어봅시다</h5>

                                            <!-- Horizontal Form -->
                                            <form>
                                                <div class="row mb-3">
                                                    <label for="inputEmail3"
                                                           class="col-sm-2 col-form-label">이름</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>

                                                <div class="row-md-3">
                                                    <label for="inputEmail3"
                                                           class="col-sm-2 col-form-label">업체</label>
                                                    <div class="col-sm-6">
                                                        <select id="inputState" class="form-select">
                                                            <option selected>------</option>
                                                            <option>CJ택배</option>
                                                            <option>우체국</option>
                                                            <option>로젠</option>
                                                            <option>한진택배</option>
                                                        </select>
                                                    </div>
                                                </div>
                                                <br>
                                                <div class="row mb-3">
                                                    <label for="inputEmail3"
                                                           class="col-sm-2 col-form-label">배송메모</label>
                                                    <div class="col-sm-10">
                                                        <input type="text" class="form-control">
                                                    </div>
                                                </div>
                                                <fieldset class="row mb-3">
                                                    <legend class="col-form-label col-sm-2 pt-0">
                                                        Radios
                                                    </legend>
                                                    <div class="col-sm-10">
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="gridRadios" id="gridRadios1"
                                                                   value="option1" checked>
                                                            <label class="form-check-label"
                                                                   for="gridRadios1">
                                                                First radio
                                                            </label>
                                                        </div>
                                                        <div class="form-check">
                                                            <input class="form-check-input" type="radio"
                                                                   name="gridRadios" id="gridRadios2"
                                                                   value="option2">
                                                            <label class="form-check-label"
                                                                   for="gridRadios2">
                                                                Second radio
                                                            </label>
                                                        </div>
                                                        <div class="form-check disabled">
                                                            <input class="form-check-input" type="radio"
                                                                   name="gridRadios" id="gridRadios3"
                                                                   value="option3" disabled>
                                                            <label class="form-check-label"
                                                                   for="gridRadios3">
                                                                Third disabled radio
                                                            </label>
                                                        </div>
                                                    </div>
                                                </fieldset>
                                                <div class="row mb-3">
                                                    <div class="col-sm-10 offset-sm-2">
                                                        <div class="form-check">
                                                            <input class="form-check-input"
                                                                   type="checkbox" id="gridCheck1">
                                                            <label class="form-check-label"
                                                                   for="gridCheck1">
                                                                Example checkbox
                                                            </label>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="text-center">
                                                    <button type="submit" class="btn btn-primary">
                                                        Submit
                                                    </button>
                                                    <button type="reset" class="btn btn-secondary">
                                                        Reset
                                                    </button>
                                                </div>
                                            </form><!-- End Horizontal Form -->

                                        </div>
                                    </div>

                                    </form><!-- End floating Labels Form -->

                                </div>
                            </div>

                        </div>
                    </div>
    </section>

</main>
<!-- End #main -->

<div class="modal-footer">
    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
    <button type="button" class="btn btn-primary">Save changes</button>
</div>
</div>
</div>
</div><!-- End Scrolling Modal-->

</div>
</div>

</div>
</div>
</section>

</main><!-- End #main -->
<jsp:include page="sellerfooter.jsp"></jsp:include>