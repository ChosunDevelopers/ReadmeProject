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
				<input type = "submit" value = "나의 프로필">
			</form>		
		</td>
	</tr>
	
	<tr>
		<td>
			<a href = "/login/applicationNotice">지원공고관리</a>
		</td>	
	</tr>
	<tr>
		<td>
			<a href = "/login/favoNotice">관심공고관리</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/favoMember">관심사용자관리</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/memberDeleteView">회원탈퇴</a>
			
		</td>
	</tr>
</table>




</body>
</html>