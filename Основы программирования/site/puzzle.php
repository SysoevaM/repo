<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт студента GeekBrains</title>
	<link rel="stylesheet" href="style.css"> 
	<script type="text/javascript">

		var score = 0;

		function checkAnswer(inputId, answers){
			var userAnswer = document.getElementById(inputId).value;
			userAnswer = userAnswer.toLowerCase();
			for(var i = 0; i < answers.length; i++){
				if(userAnswer == answers[i]){
					score++;
					break;
				}
			}
		}
		
		function checkAnswers() {

			checkAnswer("userAnswer1", ["молоко", "сливки"]);
			checkAnswer("userAnswer2", ["расческа", "расчёска", "щётка", "щетка"]);
			checkAnswer("userAnswer3", ["земляника", "клубника"]);

			alert("Игра окончена. Угадано загадок " + score + " из " + 3);

		}

	</script>
</head>
<body>

<div class="content">
<?php
	include "menu.php";
?>

<div class="contentWrap">
    <div class="content">
        <div class="center">

			<h1>Игра в загадки</h1>

			<div class="box">

				<p>"Не снег,<br> A белое вегда.<br> Хоть и течет,<br> Но не вода."</p>
				<input type="text" id="userAnswer1">

				<p>"Всех лохматых расчесать,<br> Кудри в косы заплетать,<br> Делать модную прическу<br> Помогает нам … ."</p>
				<input type="text" id="userAnswer2">

				<p>"Ягодку сорвать легко —<br> Ведь растет невысоко.<br> Под листочки загляни-ка —<br> Там созрела … ."</p>
				<input type="text" id="userAnswer3">

				<br>
				<a href="#" onClick="checkAnswers();">Ответить</a>

			</div>

        </div>
    </div>
</div>

	

</div>
<div class="footer">
	Copyright &copy; Sysoeva Maria
<div>


</body>
</html>