<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<title>글 상세</title>
</head>
<body>
	<h1>글 상세</h1>
	<p>제목 : ${ data.title }</p>
	<p>작성글 : ${ data.comment }</p>
	<p>
		입력일 :
		<fmt:formatDate value="${data.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
	</p>

	<p>
		<a href="/update?teamboardBno=${teamboardBno}">수정</a>
	</p>
	<form method="POST" action="/delete">
		<input type="hidden" name="teamboardBno" value="${teamboardBno}" /> <input
			type="submit" value="삭제" />
	</form>
	<p>
		<a href="/list">목록으로</a>
	</p>

</body>
</html>