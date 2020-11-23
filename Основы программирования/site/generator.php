<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Личный сайт студента GeekBrains</title>
	<link rel="stylesheet" href="style.css"> 
	<script type="text/javascript">

		// приведение к числу
		function readInt(id) {
			var number = document.getElementById(id).value;
			return parseInt(number);
		}

		// вывод текста
		function write(text) {
			document.getElementById("info").innerHTML = text;
		}

		// скрытие элемента
		function hide(id) {
			document.getElementById(id).style.display = "none";
		}

		// генерация пароля с заданной длинной
		function gen_password(len) {
   			var password = "";
   		 	var symbols = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    		for (var i = 0; i < len; i++){
        		password += symbols.charAt(Math.floor(Math.random() * symbols.length));     
    		}
    		return password;
		}

		// функция показа сгенерированного пароля
		function go() {
			
			var length = readInt("userLength");
			var password = gen_password(length);

			write("Ваш пароль: " + password);
			hide("go");
			hide("userLength");
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

			<h1>Генератор случайных паролей</h1>

			<div class="box">
				
				<p id="info">Введите длину пароля</p>
				<input type="text" id="userLength">
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