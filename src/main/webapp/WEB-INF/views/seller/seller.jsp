<%--
  Created by IntelliJ IDEA.
  User: wandu
  Date: 2022/12/01
  Time: 10:54 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="sellerheader.jsp" %>

<main id="main" class="main">

    <div class="pagetitle">
        <h1>Home</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="admin_index.jsp">Home</a></li>
                <li class="breadcrumb-item active">Dashboard</li>
            </ol>
        </nav>
    </div><!-- End Page Title -->
    <hr>

    <section class="section dashboard">
        <div class="row">

            <!-- Left side columns -->
            <div class="col-lg-8">
                <div class="row">

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">결제완료 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[0].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[0].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">출고준비중 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[1].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[1].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">출고완료 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[2].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[2].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">배송중 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[3].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[3].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">배송완료 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-cart"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[4].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[4].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card sales-card">
                            <div class="card-body">
                                <h5 class="card-title">구매확정 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[5].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[5].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card customers-card">
                            <div class="card-body">
                                <h5 class="card-title">교환요청 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[6].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[6].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->

                    <!-- Sales Card -->
                    <div class="col-xxl-4 col-md-6">
                        <div class="card info-card customers-card">
                            <div class="card-body">
                                <h5 class="card-title">반품요청 <span>| product</span></h5>

                                <div class="d-flex align-items-center">
                                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                                        <i class="bi bi-people"></i>
                                    </div>
                                    <div class="ps-3">
                                        <h6>${progCountDay[7].ct}건</h6>
                                        <span class="text-success small pt-1 fw-bold">총${progCountAll[7].ct}건</span> <span
                                            class="text-muted small pt-2 ps-1"></span>

                                    </div>
                                </div>
                            </div>


                        </div>
                    </div><!-- End Sales Card -->


                    <!-- Recent Sales -->
                    <div class="col-12">
                        <div class="card recent-sales overflow-auto">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="recentSales('Today')">Today</a></li>
                                    <li><a class="dropdown-item" onclick="recentSales('Month')">This Month</a></li>
                                    <li><a class="dropdown-item" onclick="recentSales('Year')">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body">
                                <h5 class="card-title">최근 판매 <span id="TMY3">| Today</span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">Order Number</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                    </thead>
                                    <tbody id="recentsales">
                                    <c:forEach var="row" items="${rsd}" varStatus="vs">
                                    <tr>
                                        <th scope="row"><a href="#">${row.od_num}</a></th>
                                        <td>${row.mem_name}</td>
                                        <td><a href="#" class="text-primary">${row.ss_name}</a></td>
                                        <td>${row.ss_price}</td>
                                        <c:choose>
                                            <c:when test="${row.dt_prog=='결제완료' or row.dt_prog=='출고준비중' or row.dt_prog=='출고완료' or row.dt_prog=='배송중' or row.dt_prog=='배송완료'}">
                                                <td><span class="badge bg-warning">${row.dt_prog}</span></td>
                                            </c:when>
                                            <c:when test="${row.dt_prog=='구매확정'}">
                                                <td><span class="badge bg-success">${row.dt_prog}</span></td>
                                            </c:when>
                                            <c:otherwise>
                                                <td><span class="badge bg-danger">${row.dt_prog}</span></td>
                                            </c:otherwise>
                                        </c:choose>
                                    </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div><!-- End Recent Sales -->

                    <!-- Top Selling -->
                    <div class="col-12">
                        <div class="card top-selling overflow-auto">

                            <div class="filter">
                                <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                                <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                                    <li class="dropdown-header text-start">
                                        <h6>Filter</h6>
                                    </li>

                                    <li><a class="dropdown-item" onclick="topSelling('Today')">Today</a></li>
                                    <li><a class="dropdown-item" onclick="topSelling('Month')">This Month</a></li>
                                    <li><a class="dropdown-item" onclick="topSelling('Year')">This Year</a></li>
                                </ul>
                            </div>

                            <div class="card-body pb-0">
                                <h5 class="card-title">판매 순위 <span id="TMY2">| Today</span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">Preview</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Sold</th>
                                        <th scope="col">Revenue</th>
                                    </tr>
                                    </thead>
                                    <tbody id="topselling">
                                    <c:forEach var="row" items="${tsd}" varStatus="vs">
                                        <tr>
                                            <th scope="row"><a href="#"><img src="/images/product/sales_main/${row.ss_img}"></a></th>
                                            <td><a href="#" class="text-primary fw-bold">${row.ss_name}</a></td>
                                            <td>${row.ss_price}</td>
                                            <td class="fw-bold">${row.cnt}</td>
                                            <td>${row.sales}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>

                            </div>

                        </div>
                    </div><!-- End Top Selling -->
                </div>
            </div><!-- End Left side columns -->

            <!-- Right side columns -->
            <div class="col-lg-4">


                <!-- Budget Report -->
                <div class="card">
                    <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li class="dropdown-header text-start">
                                <h6>Filter</h6>
                            </li>

                            <li><a class="dropdown-item" onclick="budgetReport('Today')">Today</a></li>
                            <li><a class="dropdown-item" onclick="budgetReport('Month')">This Month</a></li>
                            <li><a class="dropdown-item" onclick="budgetReport('Year')">This Year</a></li>
                        </ul>
                    </div>

                    <div class="card-body pb-0">
                        <h5 class="card-title">매출 비교 <span id="TMY4">| Today</span></h5>

                        <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                                    legend: {
                                        data: ['어제', '오늘']
                                    },
                                    radar: {
                                        // shape: 'circle',
                                        indicator: [{
                                            name: '본체',
                                            max: 30000
                                        },
                                            {
                                                name: '타이틀(패키지)',
                                                max: 30000
                                            },
                                            {
                                                name: '타이틀(다운로드)',
                                                max: 30000
                                            },
                                            {
                                                name: '다운로드 추가 컨텐츠',
                                                max: 30000
                                            },
                                            {
                                                name: '온라인 이용권',
                                                max: 30000
                                            },
                                            {
                                                name: '선불번호',
                                                max: 30000
                                            },
                                            {
                                                name: '무료컨텐츠',
                                                max: 30000
                                            },
                                            {
                                                name: '아미보',
                                                max: 30000
                                            },
                                            {
                                                name: '프로컨트롤러',
                                                max: 30000
                                            },
                                            {
                                                name: '조이콘',
                                                max: 30000
                                            },
                                            {
                                                name: '주변기기',
                                                max: 30000
                                            }
                                        ]
                                    },
                                    series: [{
                                        name: 'Budget vs spending',
                                        type: 'radar',
                                        data: [{
                                            value: [${sryd[0]}, ${sryd[1]}, ${sryd[2]}, ${sryd[3]}, ${sryd[4]}, ${sryd[5]}, ${sryd[6]}, ${sryd[7]}, ${sryd[8]}, ${sryd[9]}, ${sryd[10]}],
                                            name: '어제'
                                        },
                                            {
                                                value: [${srd[0]}, ${srd[1]}, ${srd[2]}, ${srd[3]}, ${srd[4]}, ${srd[5]}, ${srd[6]}, ${srd[7]}, ${srd[8]}, ${srd[9]}, ${srd[10]}],
                                                name: '오늘'
                                            }
                                        ]
                                    }]
                                });
                            });
                        </script>

                    </div>
                </div><!-- End Budget Report -->

                <!-- Website Traffic -->
                <div class="card">
                    <div class="filter">
                        <a class="icon" href="#" data-bs-toggle="dropdown"><i class="bi bi-three-dots"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow">
                            <li class="dropdown-header text-start">
                                <h6>Filter</h6>
                            </li>

                            <li><a class="dropdown-item" onclick="sales('Today')">Today</a></li>
                            <li><a class="dropdown-item" onclick="sales('Month')">This Month</a></li>
                            <li><a class="dropdown-item" onclick="sales('Year')">This Year</a></li>
                        </ul>
                    </div>

                    <div class="card-body pb-0">
                        <h5 class="card-title">판매량 <span id="tmy">| Today</span></h5>

                        <div id="trafficChart" style="min-height: 400px;" class="echart"></div>

                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                echarts.init(document.querySelector("#trafficChart")).setOption({
                                    tooltip: {
                                        trigger: 'item'
                                    },
                                    legend: {
                                        top: '5%',
                                        left: 'center'
                                    },
                                    series: [{
                                        name: 'Access From',
                                        type: 'pie',
                                        radius: ['40%', '70%'],
                                        avoidLabelOverlap: false,
                                        label: {
                                            show: false,
                                            position: 'center'
                                        },
                                        emphasis: {
                                            label: {
                                                show: true,
                                                fontSize: '18',
                                                fontWeight: 'bold'
                                            }
                                        },
                                        labelLine: {
                                            show: false,
                                        },
                                        data: [{
                                            value: ${saleAmountDay[0]},
                                            name: '본체'
                                        },
                                            {
                                                value: ${saleAmountDay[1]},
                                                name: '타이틀(패키지)'
                                            },
                                            {
                                                value: ${saleAmountDay[2]},
                                                name: '타이틀(다운로드)'
                                            },
                                            {
                                                value: ${saleAmountDay[3]},
                                                name: '다운로드 추가 컨텐츠'
                                            },
                                            {
                                                value: ${saleAmountDay[4]},
                                                name: '온라인 이용권'
                                            },
                                            {
                                                value: ${saleAmountDay[5]},
                                                name: '선불번호'
                                            },
                                            {
                                                value: ${saleAmountDay[6]},
                                                name: '무료컨텐츠'
                                            },
                                            {
                                                value: ${saleAmountDay[7]},
                                                name: '아미보'
                                            },
                                            {
                                                value: ${saleAmountDay[8]},
                                                name: '프로컨트롤러'
                                            },
                                            {
                                                value: ${saleAmountDay[9]},
                                                name: '조이콘'
                                            },
                                            {
                                                value: ${saleAmountDay[10]},
                                                name: '주변기기'
                                            }
                                        ]
                                    }]
                                });
                            });
                        </script>

                    </div>
                </div><!-- End Website Traffic -->


            </div><!-- End Right side columns -->

        </div>
    </section>

</main>
<!-- End #main -->

<script>
    function sales(time) {
        $.ajax({
            url : "/seller/sales_" + time
            ,type : "post"
            ,success : function (data) {
                $("#tmy").text("| " + time);
                echarts.init(document.querySelector("#trafficChart")).setOption({
                    tooltip: {
                        trigger: 'item'
                    },
                    legend: {
                        top: '5%',
                        left: 'center'
                    },
                    series: [{
                        name: 'Access From',
                        type: 'pie',
                        radius: ['40%', '70%'],
                        avoidLabelOverlap: false,
                        label: {
                            show: false,
                            position: 'center'
                        },
                        emphasis: {
                            label: {
                                show: true,
                                fontSize: '18',
                                fontWeight: 'bold'
                            }
                        },
                        labelLine: {
                            show: false
                        },
                        data: [{
                            value: data[0],
                            name: '본체'
                        },
                            {
                                value: data[1],
                                name: '타이틀(패키지)'
                            },
                            {
                                value: data[2],
                                name: '타이틀(다운로드)'
                            },
                            {
                                value: data[3],
                                name: '다운로드 추가 컨텐츠'
                            },
                            {
                                value: data[4],
                                name: '온라인 이용권'
                            },
                            {
                                value: data[5],
                                name: '선불번호'
                            },
                            {
                                value: data[6],
                                name: '무료컨텐츠'
                            },
                            {
                                value: data[7],
                                name: '아미보'
                            },
                            {
                                value: data[8],
                                name: '프로컨트롤러'
                            },
                            {
                                value: data[9],
                                name: '조이콘'
                            },
                            {
                                value: data[10],
                                name: '주변기기'
                            }
                        ]
                    }]
                });
            }
            ,error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function topSelling(time) {
        $.ajax({
           url : "/seller/topselling_" + time
           ,type : "post"
           ,success : function (data) {
                // console.log(data);
                $("#TMY2").text("| " + time);
                $("#topselling").html(data);
            }
           ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }

    function recentSales(time) {
        $.ajax({
            url : "/seller/recentsales_" + time
            ,type : "post"
            ,success : function (data) {
                $("#TMY3").text("| " + time)
                $("#recentsales").html(data);
            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        })
    }

    function budgetReport(time) {
        $.ajax({
            url : "/seller/budgetreport_" + time
            ,type : "post"
            ,success : function (data) {
                // console.log(data.list);
                // console.log(data.list1)
                if (time == "Today") {
                    $("#TMY4").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['어제', '오늘']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 30000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 30000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 30000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 30000
                                },
                                {
                                    name: '선불번호',
                                    max: 30000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '아미보',
                                    max: 30000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 30000
                                },
                                {
                                    name: '조이콘',
                                    max: 30000
                                },
                                {
                                    name: '주변기기',
                                    max: 30000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '어제'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9], data.list[10]],
                                    name: '오늘'
                                }
                            ]
                        }]
                    });
                } else if (time == "Month") {
                    $("#TMY4").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['지난달', '이번달']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 30000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 30000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 30000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 30000
                                },
                                {
                                    name: '선불번호',
                                    max: 30000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '아미보',
                                    max: 30000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 30000
                                },
                                {
                                    name: '조이콘',
                                    max: 30000
                                },
                                {
                                    name: '주변기기',
                                    max: 30000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '지난달'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9] ,data.list[10]],
                                    name: '이번달'
                                }
                            ]
                        }]
                    });
                } else {
                    $("#TMY4").text("| " + time);
                    var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                        legend: {
                            data: ['작년', '금년']
                        },
                        radar: {
                            // shape: 'circle',
                            indicator: [{
                                name: '본체',
                                max: 30000
                            },
                                {
                                    name: '타이틀(패키지)',
                                    max: 30000
                                },
                                {
                                    name: '타이틀(다운로드)',
                                    max: 30000
                                },
                                {
                                    name: '다운로드 추가 컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '온라인 이용권',
                                    max: 30000
                                },
                                {
                                    name: '선불번호',
                                    max: 30000
                                },
                                {
                                    name: '무료컨텐츠',
                                    max: 30000
                                },
                                {
                                    name: '아미보',
                                    max: 30000
                                },
                                {
                                    name: '프로컨트롤러',
                                    max: 30000
                                },
                                {
                                    name: '조이콘',
                                    max: 30000
                                },
                                {
                                    name: '주변기기',
                                    max: 30000
                                }
                            ]
                        },
                        series: [{
                            name: 'Budget vs spending',
                            type: 'radar',
                            data: [{
                                value: [data.list1[0], data.list1[1], data.list1[2], data.list1[3], data.list1[4], data.list1[5], data.list1[6], data.list1[7], data.list1[8], data.list1[9], data.list1[10]],
                                name: '작년'
                            },
                                {
                                    value: [data.list[0], data.list[1], data.list[2], data.list[3], data.list[4], data.list[5], data.list[6], data.list[7], data.list[8], data.list[9] ,data.list[10]],
                                    name: '금년'
                                }
                            ]
                        }]
                    });
                }

            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        });
    }
</script>

<%@ include file="sellerfooter.jsp" %>