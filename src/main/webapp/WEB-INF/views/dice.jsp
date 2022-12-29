<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-21
  Time: 오후 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/dice.css"/>
<link rel="stylesheet" href="/css/miniGameAnimate.css"/>

<div class="diceModal">
    <!-- The Modal -->
    <div class="modal" id="dice">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">다이스 포커 (Dice Poker)</h4>
                </div>

                <!-- Modal body user -->
                <div class="modal-bodys" style="height: 100%; width: auto">
                    <div class="dice" id="userModalBody" style="position: relative; height: 500px">
                        <ol class="die-list even-roll" data-roll="1" id="die-1">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <ol class="die-list odd-roll" data-roll="1" id="die-2">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <ol class="die-list odd-roll" data-roll="1" id="die-3">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <div class="item2">
                            <button class="buttons" type="button" id="roll-button" style="position: relative">주사위 굴리기
                                (<span id="diceCount2"></span>)
                            </button>
                        </div>
                    </div>

                    <!-- Modal body AI-->
                    <div class="dice" id="aiModalBody" style="display: none; position: relative; height: 500px">
                        <ol class="aidie-list even-roll" data-roll="1" id="aidie-1">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <ol class="aidie-list odd-roll" data-roll="1" id="aidie-2">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <ol class="aidie-list odd-roll" data-roll="1" id="aidie-3">
                            <li class="die-item" data-side="1">
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="2">
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="3">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="4">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="5">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                            <li class="die-item" data-side="6">
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                                <span class="dot"></span>
                            </li>
                        </ol>
                        <div class="item2">
                            <button class="buttons" type="button" id="roll-button2"
                                    style="position: relative; background-color: grey" disabled>주사위 굴리기 (<span
                                    id="diceCount3"></span>)
                            </button>
                        </div>
                        <div style="position: absolute" id="imghere">
                            <img class="" id="mario" src="/images/mariodice.png"
                                 style="display: table-cell; vertical-align: middle">
                        </div>
                    </div>

                    <div style="background-color: whitesmoke; text-align: center">
                        <p style="margin: 2%">[ 주사위 결과 ]</p>
                        <div>
                            <input type="text" id="diceResult1" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%">
                            <input type="text" id="diceResult2" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%">
                            <input type="text" id="diceResult3" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%"><br>
                            <input type="text" id="pointValue1" class="whiteLabel" readonly
                                   style="margin-right: 2%; margin-left: 2%; margin-bottom: 2%; background-color: whitesmoke; border: none; cursor: default">
                            <input type="text" id="pointValue2" class="whiteLabel" readonly
                                   style="margin-right: 2%; margin-left: 2%; margin-bottom: 2%; background-color: whitesmoke; border: none; cursor: default">
                            <input type="text" id="pointValue3" class="whiteLabel" readonly
                                   style="margin-right: 2%; margin-left: 2%; margin-bottom: 2%; background-color: whitesmoke; border: none; cursor: default">
                        </div>
                        <div id="aiDiceResult">
                            <p style="margin: 2%">[ Continue? 주사위 결과 ]</p>
                            <input type="text" id="aidiceResult1" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%">
                            <input type="text" id="aidiceResult2" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%">
                            <input type="text" id="aidiceResult3" name="diceResult" class="whiteLabel" readonly
                                   style="margin: 2%"><br>
                            <input type="text" id="aipointValue1" class="whiteLabel" readonly
                                   style="margin-right: 2%;margin-left: 2%;margin-bottom: 2%;background-color: whitesmoke;border: none;cursor: default">
                            <input type="text" id="aipointValue2" class="whiteLabel" readonly
                                   style="margin-right: 2%;margin-left: 2%;margin-bottom: 2%;background-color: whitesmoke;border: none;cursor: default">
                            <input type="text" id="aipointValue3" class="whiteLabel" readonly
                                   style="margin-right: 2%;margin-left: 2%;margin-bottom: 2%;background-color: whitesmoke;border: none;cursor: default">
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button class="buttons" id="closeBtn" type="button" class="btn btn-danger" data-dismiss="modal">
                        Close
                    </button>
                </div>

            </div>
        </div>
    </div>
</div>


<script>

    let result = [];
    let savepoint = [];
    let userpoint = [];
    let botpoint = [];
    let aiCount = 3;
    let attendenceCheck = 0;

    $(document).ready(function () {

        // 주사위 굴리는 횟수 가져오기
        $.ajax({
            url: "/rollCount",
            type: "GET",
            data: {"mem_id": '<%=session.getAttribute("mem_id")%>'},
            success: function (result) {
                $('#diceCount2').text(3 - result.length);

                // 유저 주사위 횟수가 0이면 버튼 막기
                if ((3 - result.length) == 0) {
                    $('#roll-button').attr('disabled', true);
                    $('#roll-button').css('background-color', 'gray');
                    $('#roll-button').css('pointer-events', 'none');
                }

                // 유저 결과창에 주사위 결과 넣기
                $.each(result, function (index, value) {
                    $('#diceResult' + (index + 1)).val(value);
                });
            }
        });

        // ai 주사위 굴릴 횟수 가져오기
        $.ajax({
            url: "/rollCount",
            type: "GET",
            data: {"mem_id": 'ai_' + '<%=session.getAttribute("mem_id")%>'},
            success: function (result) {
                aiCount = 3 - result.length;
                $('#diceCount3').text(aiCount);

                if (aiCount == 0) {
                    $('#roll-button').text("오늘 횟수를 모두 사용하셨습니다.");
                }

                $.each(result, function (index, value) {
                    $('#aidiceResult' + (index + 1)).val(value);
                });
            }
        });

        $.ajax({
            url: "/attendenceCheck",
            type: "post",
            data: {"mem_id": '<%=session.getAttribute("mem_id")%>'},
            success: function (result) {
                console.log("result : " + result);

                if (result != 0) {
                    attendenceCheck = 1;
                }
            }
        })

    })

    // 유저와 ai의 주사위 결과 분석해서 포인트와 족보를 결과창에 넣기
    function count() {

        let arrDiceResult1 = [];
        let arrDiceResult2 = [];
        let arrDiceResult3 = [];

        let diceResult1 = $("#diceResult1").val();
        arrDiceResult1 = diceResult1.split(",");

        if ($("#diceResult2").val() != "" && $("#diceResult2").val() != null) {
            let diceResult2 = $("#diceResult2").val();
            arrDiceResult2 = diceResult2.split(",");

            if ($("#diceResult3").val() != "" && $("#diceResult3").val() != null) {
                let diceResult3 = $("#diceResult3").val();
                arrDiceResult3 = diceResult3.split(",");
            }
        }

        cal(arrDiceResult1[0], arrDiceResult1[1], arrDiceResult1[2]);

        if (arrDiceResult2[0] != "" && arrDiceResult2[0] != null) {
            cal(arrDiceResult2[0], arrDiceResult2[1], arrDiceResult2[2]);

            if (arrDiceResult3[0] != "" && arrDiceResult3[0] != null) {
                cal(arrDiceResult3[0], arrDiceResult3[1], arrDiceResult3[2]);
            }
        }

        let aiarrDiceResult1 = [];
        let aiarrDiceResult2 = [];
        let aiarrDiceResult3 = [];

        if ($("#aidiceResult1").val() != "" && $("#aidiceResult1").val() != null) {
            let aidiceResult1 = $("#aidiceResult1").val();
            aiarrDiceResult1 = aidiceResult1.split(",");

            if ($("#aidiceResult2").val() != "" && $("#aidiceResult2").val() != null) {
                let aidiceResult2 = $("#aidiceResult2").val();
                aiarrDiceResult2 = aidiceResult2.split(",");

                if ($("#aidiceResult3").val() != "" && $("#aidiceResult3").val() != null) {
                    let aidiceResult3 = $("#aidiceResult3").val();
                    aiarrDiceResult3 = aidiceResult3.split(",");
                }
            }

            cal(aiarrDiceResult1[0], aiarrDiceResult1[1], aiarrDiceResult1[2]);

            if (aiarrDiceResult2[0] != "" && aiarrDiceResult2[0] != null) {
                cal(aiarrDiceResult2[0], aiarrDiceResult2[1], aiarrDiceResult2[2]);

                if (aiarrDiceResult3[0] != "" && aiarrDiceResult3[0] != null) {
                    cal(aiarrDiceResult3[0], aiarrDiceResult3[1], aiarrDiceResult3[2]);
                }
            }
        }
    }

    // 모달을 켰을 때
    $('#dice').on('show.bs.modal', function (e) {

        // 유저가 돌린 기록에 따라서 족보를 계산
        count();

        // 돌릴 횟수가 남아있지 않을 때 ai 턴으로 넘어간다
        if ($("#diceCount2").text() == '0' && aiCount != 0) {
            setTimeout(showAiModal, 4000);

            let size = $("input[name=diceResult]").length;
            let arr = new Array(size);
            for (let i = 0; i < size; i++) {
                arr[i] = $("input[name=diceResult]").eq(i).val();

            }
        }
    });

    // 주사위 굴리기
    function rollDice() {

        const dice = [...document.querySelectorAll(".die-list")];
        dice.forEach(die => {
            toggleClasses(die);
            die.dataset.roll = getRandomNumber(1, 6);
        });
        result = dice.map(die => die.dataset.roll);
        let timer = setTimeout(open, 4000, result);
        $('#roll-button').css('background-color', 'gray');
        $('#roll-button').attr('disabled', true);
        $('#roll-button').css('cursor', 'default');
        let timer2 = setTimeout(cal, 4000, result[0], result[1], result[2]);

        $.ajax({
            url: "/rollDice",
            type: "POST",
            data: {
                "mem_id": '<%=session.getAttribute("mem_id")%>',
                "dice1": result[0],
                "dice2": result[1],
                "dice3": result[2]
            },
            success: function (data) {

            }
        });
    }

    function open(result) {

        // 남은 횟수 3
        if ($('#diceCount2').text() == '3') {
            $('#diceResult1').val(result);
            // 남은 횟수 2
        } else if ($('#diceCount2').text() == '2') {
            $('#diceResult2').val(result);
            // 남은 횟수 1
        } else if ($('#diceCount2').text() == '1') {
            $('#diceResult3').val(result);
            $('#roll-button').attr('disabled', true);
            $('#roll-button').css('background-color', 'gray');
            $('#roll-button').css('pointer-events', 'none');
        }
        if ($('#diceCount2').text() != '1') {
            $('#roll-button').css('background-color', 'white');
            $('#roll-button').attr('disabled', false);
            $('#roll-button').css('cursor', 'pointer');
        }
        if (parseInt($('#diceCount2').text()) != 0) {
            $('#diceCount2').text(parseInt($('#diceCount2').text()) - 1);
        }
        if ($('#diceCount2').text() == '0' && aiCount != 0) {
            setTimeout(showAiModal, 2000);
        }
    }

    function toggleClasses(die) {
        die.classList.toggle("odd-roll");
        die.classList.toggle("even-roll");
    }

    function getRandomNumber(min, max) {
        min = Math.ceil(min);
        max = Math.floor(max);
        return Math.floor(Math.random() * (max - min + 1)) + min;
    }

    document.getElementById("roll-button").addEventListener("click", rollDice);

    function cal(x2, y2, z2) {
        let point = 0;
        let result = "";
        x = parseInt(x2);
        y = parseInt(y2);
        z = parseInt(z2);

        if (x == y && y == z) {
            // alert(x + '트리플');
            result = x + "트리플";
            if (x != 1) {
                point += 300 * (x - 1);
            } else {
                point += 1800;
            }
        } else if (x == y || z == x) {
            // alert(x + '원페어');
            result = x + "원페어";
            if (x != 1) {
                point += 100 * (x - 1);
            } else {
                point += 600;
            }

        } else if (y == z) {
            // alert(y + '원페어');
            result = y + "원페어";
            if (y != 1) {
                point += 100 * (y - 1);
            } else {
                point += 600;
            }
        }

        if (x + 1 == y && y + 1 == z) {
            // alert(x.toString() + y.toString() + z.toString() + '스트레이트');
            point += 500 * z;
            result = x.toString() + y.toString() + z.toString() + '스트레이트';
        } else if (y + 1 == z && z + 1 == x) {
            // alert(y.toString() + z.toString() + x.toString() + '스트레이트');
            point += 500 * x
            result = y.toString() + z.toString() + x.toString() + '스트레이트';
        } else if (z + 1 == x && x + 1 == y) {
            // alert(z.toString() + x.toString() + y.toString() + '스트레이트');
            point += 500 * y;
            result = z.toString() + x.toString() + y.toString() + '스트레이트';
        } else if (x + 1 == z && z + 1 == y) {
            // alert(x.toString() + z.toString() + y.toString() + '스트레이트');
            result = x.toString() + z.toString() + y.toString() + '스트레이트';
            point += 500 * y;
        } else if (y + 1 == x && x + 1 == z) {
            // alert(y.toString() + x.toString() + z.toString() + '스트레이트');
            point += 500 * z;
            result = y.toString() + x.toString() + z.toString() + '스트레이트';
        } else if (z + 1 == y && y + 1 == x) {
            // alert(z.toString() + y.toString() + x.toString() + '스트레이트');
            point += 500 * x;
            result = z.toString() + y.toString() + x.toString() + '스트레이트';
        }

        if (result == "") {
            result = "꽝";
        }

        // 주사위를 1번 굴렸지만 족보창이 비어있을 때
        if ($('#pointValue1').val() == "" && $('#diceResult1').val() != "") {
            $('#pointValue1').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);

            // 주사위를 2번 굴렸지만 2번째 족보창이 비어있을 때
        } else if ($('#pointValue2').val() == "" && $('#diceResult2').val() != "") {
            $('#pointValue2').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);

            // 주사위를 3번 굴렸지만 3번째 족보창이 비어있을 때
        } else if ($('#pointValue3').val() == "" && $('#diceResult3').val() != "") {
            $('#pointValue3').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);

            // ai가 주사위를 1번 굴렸지만 ai의 족보창이 비어있을 때
        } else if ($('#aipointValue1').val() == "" && $('#aidiceResult1').val() != "") {
            $('#aipointValue1').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);

            // ai가 주사위를 2번 굴렸지만 ai의 2번째 족보창이 비어있을 때
        } else if ($('#aipointValue2').val() == "" && $('#aidiceResult2').val() != "") {
            $('#aipointValue2').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);

            // ai가 주사위를 3번 굴렸지만 ai의 3번째 족보창이 비어있을 때
        } else if ($('#aipointValue3').val() == "" && $('#aidiceResult3').val() != "") {
            $('#aipointValue3').val(result);
            // 실제 마일리지를 플레이어에게 지급
            savePoint(point);
        }
    }


    // 마일리지 지급
    function savePoint(point) {
        savepoint.push(point)
        console.log("savepoint : " + savepoint);

        if (savepoint.length == 6) {
            for (let i = 0; i < 3; i++) {
                userpoint.push(savepoint[i]);
            }
            for (let j = 3; j < 6; j++) {
                botpoint.push(savepoint[j]);
            }
            console.log("userpoint" + userpoint);
            console.log("botpoint" + botpoint);
            let userMax = Math.max(...userpoint);
            let botMax = Math.max(...botpoint);
            console.log("usermax : " + userMax);
            console.log("botmax : " + botMax);
            console.log("attendenceCheck : " + attendenceCheck);
            if (attendenceCheck == 0) {

                // attendence 테이블에 오늘 참가한 이력이 있나 체크
                attendence(userMax, botMax);

                $.ajax({
                    url: "/minigame"
                    , type: "get"
                    , data: "userMax=" + userMax
                    , success: function () {
                        attendenceCheck = 1;
                    }
                    , error: function (request, status, error) {
                        console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
                    }
                })
            }
        }
    }

    function attendence(userMax, botMax) {
        $('#closeBtn').attr('disabled', false);
        $.ajax({
            url: "/attendence",
            type: "post",
            data: {
                "mem_id": '<%=session.getAttribute("mem_id")%>'
            },
            success: function () {
                if (userMax > botMax) {
                    alert("출석완료!! " + userMax + "포인트 획득");
                } else if (userMax <= botMax) {
                    alert("꽝!!! 내일 다시 도전해주세요");
                } else {
                    alert("이미 참가하셨습니다");
                }
            },
            error: function (request, status, error) {
                console.log("code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:" + error);
            }
        })
    }


    // AI 주사위 턴
    function showAiModal() {
        $("#userModalBody").hide();
        $("#aiModalBody").show();
        // $("#imghere").attr("style", "display:");

        if (aiCount != 0) {
            // $("#mario").attr("class", "animate__animated animate__fadeInBottomRight");
            setTimeout(imgout, 3000);
            setTimeout(aiRollDice, 5000);

            // close 버튼 못 누르게 처리
            $("#closeBtn").attr("disabled", true);
        }
    }

    // 애니메이션 추가
    function imgout() {
        $("#mario").attr("class", "animate__animated animate__fadeOutTopRight");
    }

    // ai 주사위 굴리기
    function aiRollDice() {
        // $("#aiDiceResult").attr("style", "display:");
        const dice = [...document.querySelectorAll(".aidie-list")];
        dice.forEach(die => {
            toggleClasses(die);
            die.dataset.roll = getRandomNumber(1, 6);
        });
        result = dice.map(die => die.dataset.roll);
        setTimeout(showAiResult, 4000, result);
        setTimeout(cal, 4000, result[0], result[1], result[2]);

        $.ajax({
            url: "/rollDice",
            type: "POST",
            data: {
                "mem_id": 'ai_' + '<%=session.getAttribute("mem_id")%>',
                "dice1": result[0],
                "dice2": result[1],
                "dice3": result[2]
            },
            success: function (data) {
                aiCount -= 1;
            },
            error: function (error) {
                console.log("에러 : " + error)
            }
        });

    }

    function showAiResult(result) {

        // 남은 횟수 3
        if (aiCount == 2 && $('#aipointValue1').val() == "") {
            $('#aidiceResult1').val(result);
            setTimeout(aiRollDice, 3000);

            // 남은 횟수 2
        } else if (aiCount == 1 && $('#aipointValue2').val() == "") {
            $('#aidiceResult2').val(result);
            setTimeout(aiRollDice, 3000);

            // 남은 횟수 1
        } else if (aiCount == 0 && $('#aipointValue3').val() == "") {
            $('#aidiceResult3').val(result);
            $('#roll-button').text("오늘 횟수를 모두 사용하셨습니다.");
        }
        if (parseInt($('#diceCount3').text()) != 0) {
            $('#diceCount3').text(parseInt($('#diceCount3').text()) - 1);
        }
    }


</script>