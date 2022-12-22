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
                <div class="modal-bodys">
                    <div class="dice" id="userModalBody" style="position: relative">
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
                    </div>

                    <!-- Modal body AI-->
                    <div class="dice" id="aiModalBody" style="display: none">
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
                        <div style="position: absolute" id="imghere">
                            <img class="" id="mario" src="/images/mariodice.png" style="display: table-cell; vertical-align: middle">
                        </div>
                    </div>

                    <button class="buttons" type="button" id="roll-button">주사위 굴리기 (<span id="diceCount2">3</span>)</button>
                    <div style="background-color: whitesmoke; text-align: center">
                        <p style="margin: 2%">[ 주사위 결과 ]</p>
                        <div>
                            <input type="text" id="diceResult1" class="whiteLabel" readonly style="margin: 2%">
                            <input type="text" id="diceResult2" class="whiteLabel" readonly style="margin: 2%">
                            <input type="text" id="diceResult3" class="whiteLabel" readonly style="margin: 2%">
                        </div>
                        <div id="aiDiceResult">
                            <p style="margin: 2%">[ Continue? 주사위 결과 ]</p>
                            <input type="text" id="aidiceResult1" class="whiteLabel" readonly style="margin: 2%">
                            <input type="text" id="aidiceResult2" class="whiteLabel" readonly style="margin: 2%">
                            <input type="text" id="aidiceResult3" class="whiteLabel" readonly style="margin: 2%">
                        </div>
                    </div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button class="buttons" type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</div>


<script>

    let result = [];
    let savepoint = [];

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
        if ($('#diceCount2').text() == '0') {
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

    function cal(x, y, z) {
        let point = 0;


        if (x == y && y == z) {
            // alert(x + '트리플');
            if (x != 1) {
                point += 300 * (x-1);
            } else {
                point += 1800;
            }
        } else if (x == y || z == x) {
            // alert(x + '원페어');
            if (x != 1) {
                point += 100 * (x-1);
            } else {
                point += 600;
            }

        } else if (y == z) {
            // alert(y + '원페어');
            if (y != 1) {
                point += 100 * (y-1);
            } else {
                point += 600;
            }
        }



        if (x + 1 == y && y + 1 == z) {
            // alert(x.toString() + y.toString() + z.toString() + '스트레이트');
            point += 500 * z;
        } else if (y + 1 == z && z + 1 == x) {
            // alert(y.toString() + z.toString() + x.toString() + '스트레이트');
            point += 500 * x
        } else if (z + 1 == x && x + 1 == y) {
            // alert(z.toString() + x.toString() + y.toString() + '스트레이트');
            point += 500 * y;
        } else if (x + 1 == z && z + 1 == y) {
            // alert(x.toString() + z.toString() + y.toString() + '스트레이트');
            point += 500 * y;
        } else if (y + 1 == x && x + 1 == z) {
            // alert(y.toString() + x.toString() + z.toString() + '스트레이트');
            point += 500 * z;
        } else if (z + 1 == y && y + 1 == x) {
            // alert(z.toString() + y.toString() + x.toString() + '스트레이트');
            point += 500 * x;
        }
        savePoint(point);
    }

    function savePoint(point) {
        savepoint.push(point)
        console.log(savepoint);
    }


// AI 주사위 턴
    function showAiModal() {
        $("#userModalBody").attr("style", "display:none");
        $("#aiModalBody").attr("style", "display:grid");
        $("#diceCount2").text('3');
        $("#mario").attr("class", "animate__animated animate__fadeInBottomRight");
        setTimeout(imgout, 3000);
        setTimeout(aiRollDice, 5000);
    }

    function imgout() {
        $("#mario").attr("class", "animate__animated animate__fadeOutTopRight");
    }

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

    }

    function showAiResult(result) {
        // 남은 횟수 3
        if ($('#diceCount2').text() == '3') {
            $('#aidiceResult1').val(result);
            setTimeout(aiRollDice, 3000);
            // 남은 횟수 2
        } else if ($('#diceCount2').text() == '2') {
            $('#aidiceResult2').val(result);
            setTimeout(aiRollDice, 3000);
            // 남은 횟수 1
        } else if ($('#diceCount2').text() == '1') {
            $('#aidiceResult3').val(result);
        }
        if (parseInt($('#diceCount2').text()) != 0) {
            $('#diceCount2').text(parseInt($('#diceCount2').text()) - 1);
        }
    }



</script>