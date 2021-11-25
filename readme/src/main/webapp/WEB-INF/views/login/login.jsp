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

	<h1>This is login Page</h1>

	<form name="loginForm" action="/member/loginMember" method="POST">


		<p>id</p>
		<input type = "text" name = "id"/>
		<p>password</p>
		<input type = "password" name = "password"/>
		
		
		
		<input type = "submit" value = "Login">
	</form>



</body>
</html>