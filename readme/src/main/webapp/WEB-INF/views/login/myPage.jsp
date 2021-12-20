<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/myPage.css">
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../../../resources/css/main_styles.css">
<style>
#mainNav {
	position: sticky;
}

.card-body {
	display: flex;
}
</style>
<title>Insert title here</title>
</head>
<body>
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
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">팀 찾기</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded"
							href="/memberSearch/memberSearch">팀원 찾기</a></li>
						<li class="nav-item mx-0 mx-lg-1"><a
							class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">공지사항</a></li>
						<c:if test="${loginID == null}">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/login">로그인/회원가입</a></li>
						</c:if>

						<c:if test="${loginID != null}">
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/myPage">마이페이지</a></li>
							<li class="nav-item mx-0 mx-lg-1"><a
								class="nav-link py-3 px-0 px-lg-3 rounded" href="/member/logout">로그아웃</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</nav>
	</div>





	<!-- 나의 프로필 Section-->
	<section class="page-section board" id="board">
		<div class="container">
			<!-- 팀 찾기 Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">나의
				프로필</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>


			<div class="text-center mt-4">
				<i class="fas fa-download me-2"></i>
				<form action="/member/myProfile" method="GET">
					<input type="hidden" name="id" value="${loginID }" /> <input
						type="submit" class="submitBtnBlack" value="자세히 보기">
				</form>
			</div>
		</div>
	</section>


	<!-- 관심 사용자 관리 Section-->
	<section class="page-section bg-primary text-white mb-0" id="find">
		<div class="container">
			<!-- 팀원 찾기 Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">찜한
				팀원</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="#"> <i
					class="fas fa-download me-2"></i> 자세히 보기
				</a>
			</div>
		</div>
	</section>


	<!-- 관심 공고  Section-->
	<section class="page-section board" id="board">
		<div class="container">
			<!-- 팀 찾기 Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">관심
				공고</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>


			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-dark" href="#"> <i
					class="fas fa-download me-2"></i> 자세히 보기
				</a>
			</div>
		</div>
	</section>


	<!-- 지원공고 관리 Section-->
	<section class="page-section bg-primary text-white mb-0" id="find">
		<div class="container">
			<!-- 팀원 찾기 Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-white">내가
				지원한 공고</h2>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<div class="text-center mt-4">
				<a class="btn btn-xl btn-outline-light" href="#"> <i
					class="fas fa-download me-2"></i> 자세히 보기
				</a>
			</div>
		</div>
	</section>






</body>
</html>