<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт студента GeekBrains</title>
	<link rel="stylesheet" href="style.css"> 
</head>
<body>

<div class="content">
<?php
	include "menu.php";
?>

	<h1>Личный сайт студента GeekBrains</h1>

	<div class="center">
	<img src="img/photo001.jpg">
		<div class="box_text">
			<p><b>Добрый день</b>. Меня зовут <i>Мария Сысоева</i>.  не люблю о себе писать, поэтому в этом разделе будет совсем мало текста. <p>

				<p>Я не волшебница, я только учусь, однако уже написал свой первый сайт.</p>

			<p>В этом мне помог IT-портал <a href="https://geekbrains.ru">GeekBrains</a></p>

			<p>На этом сайте вы сможете сыграть в несколько игр, которые я написала: <br></p>
			<div class = "menu">
				<img src="img/pazzle.png" style="text-align: left; margin-left: -40px;">
				<img src="img/guess.png" style="text-align: center;">		
				<img src="img/generator.png" style="text-align: right; margin-right: -5px;">	
		<br>
				<a href="puzzle.php">Загадки</a>
				<a href="guess.php" style="text-align: center;">Угадайка</a>
				<a href="generator.php" style="text-align: right; margin-right: 0px;">Генератор</a>	
			</div>
			
		</div>
	</div>	
</div>
<div class="footer">
	Copyright &copy; Sysoeva Maria
<div>


</body>
</html>