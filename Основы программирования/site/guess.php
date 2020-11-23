<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт студента GeekBrains</title>
	<link rel="stylesheet" href="style.css"> 
	<script type="text/javascript">



		var answer = parseInt(Math.random() * 100);
		var tryCount = 0;
		var maxTryCount = 3;
		var check = false;

		// приведение к числу
		function readInt(id){
			var number = document.getElementById(id).value;
			return parseInt(number);
		}

		// вывод текста
		function write(text, id){
			document.getElementById(id).innerHTML = text;
		}

		// скрытие элемента
		function hide(id){
			document.getElementById(id).style.display = "none";
		}

		// проверяем ответы. Входные параметры: numGamer - номер игрока, userAnswer - ответ игрока
		function checkAnswer(numGamer, userAnswer) {

			
			// игрок угадал
			if(userAnswer == answer){
				write("Игрок  "+ numGamer + ", Поздравляю, вы угадали!</b>", "info1");
				check = true;
				hide("go");
				hide("usAnswer1");
				hide("usAnswer2");
				hide("info2");
			}  
			// не угадал
			else if(userAnswer > answer){
				write("Игрок "+ numGamer + ", Вы ввели слишком большое число<br>Попробуйте еще раз.", "info" + numGamer);
			} 
			else if(userAnswer < answer){
				write("Игрок "+ numGamer + ", Вы ввели слишком маленькое число<br>Попробуйте еще раз.", "info" + numGamer);				
			}
			// возвращаем результат проверки
			return check;
		}

		// игра
		function go(){

			tryCount++;	// попытки
			
			var userAnswer1 = readInt("usAnswer1");
			var userAnswer2 = readInt("usAnswer2");

			// результаты ответов
			var checkUser1 = checkAnswer(1, userAnswer1);
			var checkUser2 = checkAnswer(2, userAnswer2);

			// если попытки закончились и никто не угадал
			if(tryCount >= maxTryCount && checkUser1 == false && checkUser2 == false){
				write("Вы проиграли!<br>Правильный ответ: " + answer, "info1");
				hide("go");
				hide("usAnswer1");
				hide("usAnswer2");
				hide("info2");
			}
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

			<h1>Игра угадайка</h1>

			<div class="box">

				<p id="info1">Игрок 1, Угадайте число от 0 до 100</p>
				<input type="text" id="usAnswer1">
				<br>
				<p id="info2">Игрок 2, Угадайте число от 0 до 100.</p>
        		<input type="text" id="usAnswer2">
        		<br>
				<a href="#" onClick="go();" id="go">Начать</a> 
				  	
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