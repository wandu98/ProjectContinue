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
                                <h5 class="card-title">Recent Sales <span>| Today</span></h5>

                                <table class="table table-borderless">
                                    <thead>
                                    <tr>
                                        <th scope="col">#</th>
                                        <th scope="col">Customer</th>
                                        <th scope="col">Product</th>
                                        <th scope="col">Price</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <tr>
                                        <th scope="row"><a href="#">#2457</a></th>
                                        <td>Brandon Jacob</td>
                                        <td><a href="#" class="text-primary">At praesentium minu</a></td>
                                        <td>$64</td>
                                        <td><span class="badge bg-success">Approved</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><a href="#">#2147</a></th>
                                        <td>Bridie Kessler</td>
                                        <td><a href="#" class="text-primary">Blanditiis dolor omnis similique</a></td>
                                        <td>$47</td>
                                        <td><span class="badge bg-warning">Pending</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><a href="#">#2049</a></th>
                                        <td>Ashleigh Langosh</td>
                                        <td><a href="#" class="text-primary">At recusandae consectetur</a></td>
                                        <td>$147</td>
                                        <td><span class="badge bg-success">Approved</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><a href="#">#2644</a></th>
                                        <td>Angus Grady</td>
                                        <td><a href="#" class="text-primar">Ut voluptatem id earum et</a></td>
                                        <td>$67</td>
                                        <td><span class="badge bg-danger">Rejected</span></td>
                                    </tr>
                                    <tr>
                                        <th scope="row"><a href="#">#2644</a></th>
                                        <td>Raheem Lehner</td>
                                        <td><a href="#" class="text-primary">Sunt similique distinctio</a></td>
                                        <td>$165</td>
                                        <td><span class="badge bg-success">Approved</span></td>
                                    </tr>
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
                                <h5 class="card-title">Top Selling <span id="TMY2">| Today</span></h5>

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
                                            <th scope="row"><a href="#"><img src="/imagese/product/sales_main/${row.ss_img}"></a></th>
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

                            <li><a class="dropdown-item" href="#">Today</a></li>
                            <li><a class="dropdown-item" href="#">This Month</a></li>
                            <li><a class="dropdown-item" href="#">This Year</a></li>
                        </ul>
                    </div>

                    <div class="card-body pb-0">
                        <h5 class="card-title">Budget Report <span>| This Month</span></h5>

                        <div id="budgetChart" style="min-height: 400px;" class="echart"></div>

                        <script>
                            document.addEventListener("DOMContentLoaded", () => {
                                var budgetChart = echarts.init(document.querySelector("#budgetChart")).setOption({
                                    legend: {
                                        data: ['Allocated Budget', 'Actual Spending']
                                    },
                                    radar: {
                                        // shape: 'circle',
                                        indicator: [{
                                            name: 'Sales',
                                            max: 6500
                                        },
                                            {
                                                name: 'Administration',
                                                max: 16000
                                            },
                                            {
                                                name: 'Information Technology',
                                                max: 30000
                                            },
                                            {
                                                name: 'Customer Support',
                                                max: 38000
                                            },
                                            {
                                                name: 'Development',
                                                max: 52000
                                            },
                                            {
                                                name: 'Marketing',
                                                max: 25000
                                            }
                                        ]
                                    },
                                    series: [{
                                        name: 'Budget vs spending',
                                        type: 'radar',
                                        data: [{
                                            value: [4200, 3000, 20000, 35000, 50000, 18000],
                                            name: 'Allocated Budget'
                                        },
                                            {
                                                value: [5000, 14000, 28000, 26000, 42000, 21000],
                                                name: 'Actual Spending'
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
                                            show: false
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

            }
            ,error : function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }

        })
    }
</script>

<%@ include file="sellerfooter.jsp" %>