<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
</head>
<body>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<div class="container">
		<h1>팀 수정</h1>
		<form method="POST">
			<p class="form-group">
				<label for="subject">제목</label> <input type="text"
					class="form-control" name="title" value="${ data.title }" />
			</p>
			<p class="from-group ">
				<label for="subject">내용</label>
				<textarea class="form-control" rows="20" 
					class="form-control" name="comment" >${data.comment }</textarea>
			</p>
			<input type="submit" class="btn btn-primary pull-right" value="저장" />
		</form>
	</div>
</body>
</html>