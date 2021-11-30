<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/login.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<div class="wrapper">
		<div class="content">
			<center>
				<h1>This is login Page</h1>
			</center>

			<form name="loginForm" action="/member/loginMember" method="POST">


				<span class="loginLabel">id</span>
				<br/>
				<input class="loginBox" type="text" name="id" />
				<br/><br/>
				
				
				<span class="loginLabel">password</span>
				<br/>
				<input class="loginBox" type="password" name="password" /> 
				<br/><br/> 
				
				<input class="loginButton" type="submit" value="Login">
			</form>
         
			<br /> <a href="./signUp">SignUp</a>

		</div>
	</div>
</body>
</html>