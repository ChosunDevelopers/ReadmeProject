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

	<form name="loginForm" action="login.do">


		<p>id</p>
		<input type = "text" name = "id"/>
		<p>password</p>
		<input type = "password" name = "password"/>
		<p>jumin</p>
		<input type = "text" name = "jumin"/>		
		<p>phone</p>
		<input type = "text" name = "phone" placeholder = "010-1111-2222"/>
		<p>legion</p>
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
		<input type="file" name="profileimg" accept="image/*">
		<p>signdate</p>
	</form>



</body>
</html>