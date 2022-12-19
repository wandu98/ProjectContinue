<%--
  Created by IntelliJ IDEA.
  User: user
  Date: 2022-12-08
  Time: 오후 5:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ include file="../admin/admin_header.jsp" %>
<main id="main" class="main">

    <div class="pagetitle">
        <h1>글쓰기</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin_index.jsp">홈</a></li>
                <li class="breadcrumb-item active">글쓰기</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->

    <section class="section">
        <div class="row">
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">글쓰기</h5>
                        <form action="/event/evtUpdateProc" method="post">



                            <!-- General Form Elements -->

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">제목</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="evt_title" name="evt_title" value="${evtdetail.evt_title}">
                                </div>
                            </div>

                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">시작일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="evt_start" name="evt_start" value="${evtdetail.evt_start}">
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">종료일</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control" id="evt_end" name="evt_end" value="${evtdetail.evt_end}">
                                </div>
                            </div>


                            <div class="row mb-3">
                                <label class="col-sm-2 col-form-label">내용</label>
                                <div class="col-sm-10">
                                    <textarea id="evt_desc" name="evt_desc">${evtdetail.evt_desc}</textarea>
                                    <script type="text/javascript">CKEDITOR.replace('evt_desc', {
                                        width: '100%',
                                        height: '500'
                                    })
                                    </script>
                                </div>
                            </div>


                            <div class="checkout__input__checkbox" style="text-align: center">
                                <label for="acc">
                                    등록 하시겠습니까?
                                    <input type="checkbox" id="acc">
                                    <span class="checkmark"></span>
                                </label>
                            </div>
                            <br>
                            <!-- End General Form Elements -->
                            <input type="hidden" id="evt_num" name="evt_num" value="${evtdetail.evt_num}">
                            <button type="submit" class="btn btn-info" >등록</button>
                            <input type="reset" class="btn btn-outline-danger" disabled="disabled">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

</main>

<script>

    /*버튼 클릭*/
        $('#acc').click(function () {
        if ($('#acc').is(':checked')) {
        $('#NTbutton').css('background-color', 'skyblue');
        $('#NTbutton').attr("disabled", false);
    } else {
        $('#NTbutton').css('background-color', 'gray');
        $('#NTbutton').attr("disabled", true);
    }
    });



</script>
<%@ include file="../admin/admin_footer.jsp" %>