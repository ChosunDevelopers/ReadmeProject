<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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



	<div id="page-top">
		<!-- Navigation-->
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand" href="/index">Read Me</a>
				<button
					class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					Menu <i class="fas fa-bars"></i>
				</button>
				<div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">팀 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/memberSearch/memberSearch">팀원 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/notice/list">공지사항</a></li>
                        
                        <c:if test = "${loginID == null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/login">로그인/회원가입</a></li>
                        </c:if>
                        
                        <c:if test = "${loginID != null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/myPage">마이페이지</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/member/logout">로그아웃</a></li>
                        </c:if>
                        
                    </ul>


				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<form method="POST">
			<p class="form-group">
				<label for="subject">제목</label> <input type="text"
					class="form-control" name="title" placeholder="제목을 입력하세요." />
			</p>
			<p class="from-group">
				<label for="subject">모집인원</label> <input type="number"
					class="form-control" name="maxteam" />
			</p>
			<input type="hidden" name="id" value="${loginID}">
			<p class="from-group ">
				<textarea class="form-control" rows="20" type="text"
					name="comment"
					placeholder="내용을 입력하세요.(시간, 장소, 진행 방식 등)"></textarea>
			</p>

			<p style="text-align: right;">
				<input type="submit" class="btn btn-primary pull-right" value="저장" />
		</form>
	</div>
	
	
        <!-- Footer-->
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            한국 IT 직업전문학교
                            <br />
                            서울 서초구 강남대로 27길 15-5 성경빌딩
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <!-- Footer 팀원 찾기 Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Read Me</h4>
                        <p class="lead mb-0">
                            참가하고 싶은 팀에 쉽게 지원할 수 있고 능력있는 팀원을 찾을 수 있습니다.
                        </p>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">(주) Read Me</h4>
                        <p class="lead mb-0">
                            3조가 만들었습니다.
                        </p>
                    </div>
                </div>
            </div>
        </footer>	
</body>
</html>