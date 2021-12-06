<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>팀 수정</h1>
	<form method="POST">
		<p>
			제목 : <input type="text" name="title" value="${ data.title }" />
		</p>
		<p>
			내용 : <input type="text" name="comment" value="${ data.comment }" />
		</p>
		<p>
			입력일 :
			<fmt:formatDate value="${data.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
		</p>
		<p>
			<input type="submit" value="저장" />
	</form>
</body>
</html>