<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../../../resources/css/main_styles.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>

	<style>
#mainNav {
	position: sticky;
}

.container form {
	margin: 20px 0;
}

.container form button {
	margin-bottom: 4px;
	margin-left: 4px;
}

.form-check-label {
	font-size: 18px;
}

.skillName {
	margin-top: 10px;
}

.skillColor {
	font-size: 20px;
	color: midnightblue
}

.card-body {
	display: flex;
}

.content-img {
	width: 50px;
	height: 50px;
}

.content-img img {
	width: 100%;
}

.content-text {
	margin-left: 10px;
}

.card-text {
	padding: 0 15px;
}

.card {
	margin: 20px;
}

.skill_lan_image {
	cursor: pointer;
	width: 75px;
	height: 75px;
	margin: 5px 10px;
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
			<input type="hidden" name="id" value="${loginID}">
			<p class = "from-group ">
				<textarea class="form-control" rows="20" type="text" class="form-control" name="comment" 
				placeholder="내용을 입력하세요.(시간, 장소, 진행 방식 등)" ></textarea>
			</p>
			
			<p style= "text-align: right;">
				<input type="submit" class="btn btn-primary pull-right"  value="저장" />
		</form>
	</div>
</body>
</html>