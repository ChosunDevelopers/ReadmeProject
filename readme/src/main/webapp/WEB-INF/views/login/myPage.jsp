<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/myPage.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<h1>This is MyPage</h1>



	
<table>
	<tr>
		<td>
			<form action = "/member/myProfile" method = "GET">
				<input type = "hidden" name = "id" value = "${loginID }" />
				<input type = "submit" value = "���� ������">
			</form>		
		</td>
	</tr>
	
	<tr>
		<td>
			<a href = "/login/applicationNotice">�����������</a>
		</td>	
	</tr>
	<tr>
		<td>
			<a href = "/login/favoNotice">���ɰ������</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/favoMember">���ɻ���ڰ���</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/memberDeleteView">ȸ��Ż��</a>
			
		</td>
	</tr>
</table>




</body>
</html>