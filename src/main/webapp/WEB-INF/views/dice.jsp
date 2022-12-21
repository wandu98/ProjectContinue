<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 2022-12-21
  Time: 오후 5:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/dice.css" />


<!-- The Modal -->
<div class="modal" id="dice">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="dice">
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
        </div>
        <button type="button" id="roll-button">Roll Dice</button>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>





<script>
  function rollDice() {
    const dice = [...document.querySelectorAll(".die-list")];
    dice.forEach(die => {
      toggleClasses(die);
      die.dataset.roll = getRandomNumber(1, 6);
    });
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

</script>
