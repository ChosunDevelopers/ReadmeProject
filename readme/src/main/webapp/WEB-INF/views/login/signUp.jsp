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

	<h1>This is signUp Page</h1>

	<form name="loginForm" action="/member/insertMember" method = "POST">


		<p>id</p>
		<input type = "text" name = "id"/>
		<p>password</p>
		<input type = "text" name = "password"/>
		<p>name</p>
		<input type = "text" name = "name"/>
		<p>jumin</p>
		<input type = "text" name = "jumin"/>		
		<p>phone</p>
		<input type = "text" name = "phone" placeholder = "010-1111-2222"/>
		<p>Region</p>
		<input type = "text" name = "region"/>
		
		<!--
			<select>
				<option>����Ư����</option>
				<option>�λ걤����</option>
				<option>��⵵</option>
				<option>��û��</option>
				<option>���</option>
				<option>����</option>
				<option>���ֵ�</option>
			</select>
		<p>profileimg</p>
		 <input type="file" name="profileimg" accept="image/*"> -->
		
		<input type = "submit" value = "signUp">
	</form>



</body>
</html>