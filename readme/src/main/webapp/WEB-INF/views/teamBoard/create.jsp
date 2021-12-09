<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
		.h1{
			position: absolute;
			left: 50%;
			top: 50%;
			transform: translate(-50%, -50%)
		}
</style>
</head>
<body>

	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<div class="container">
		<h1>팀 찾기 생성하기</h1>
		<form method="POST">
			
			
			<p class= "form-group">
				<label for="subject">제목</label>
				<input type="text" class="form-control" name="title" placeholder="제목을 입력하세요." />
			</p>
			<p class = "from-group">
				<label for="subject">모집인원</label> 
				<input type="text" class="form-control" name="maxteam" />
			</p>
			
			<p class = "from-group ">
				<textarea class="form-control" rows="20" type="text" class="form-control"name="comment" 
				placeholder="내용을 입력하세요.(시간, 장소, 진행 방식 등)" ></textarea>
			</p>
			
			<p>
				<input type="submit" class="btn btn-primary pull-right" value="저장" />
		</form>
	</div>
</body>
</html>