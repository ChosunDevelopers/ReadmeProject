<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/myProfile.css">
<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../../resources/css/main_styles.css">
    <style>
        #mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
    </style>
<title>Insert title here</title>
<script>
	function doing() {
		const test = document.getElementById("profieImgTest");
		test.innerHTML = "${myProfile.profileImg}";

		var path = "../../resources" + "${myProfile.profileImg}";
		var target = document.getElementById("profileImg");
		target.src = path;
	}
</script>
</head>
<body>
<div id="page-top">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
                <div class="container">
                    <a class="navbar-brand" href="#page-top">ReadMe</a>
                    <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#board">팀 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#find">팀원 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">공지사항</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">로그인/회원가입</a></li>
                        </ul>
                    </div>
                </div>
            </nav>    
        </div>
        
	<h1>This is MyProfile Page</h1>

	<div class="wrapper">

		<table class = "profilePartOne">
		<tr>
			<td class = "partOneLeft">
				<img id = "profileImg" src="<spring:url value = '${myProfile.profileThumbImg}'/>" />
			</td>
				
			<td class="partOneRight">
				<table>
					<tr>
						<td class="tableLeft">이름</td>
						<td>${myProfile.name}</td>
					</tr>
					<tr>
						<td class="tableLeft">생년월일</td>
						<td>${myProfile.jumin}</td>
					</tr>
					<tr>
						<td class="tableLeft">핸드폰 번호</td>
						<td>${myProfile.phone}</td>
					</tr>
					<tr>
						<td class="tableLeft">지역</td>
						<td>${myProfile.region}</td>
					</tr>
					<tr>
						<td class="tableLeft"></td>
						<td><a href="/login/updateMemberPage">회원정보수정</a></td>
					</tr>
				</table>
			</td>
		</tr>
		</table>
		

		<div class="profilePartTwo">
			<h4>자기소개</h4>
			 <span>${myProfile.comment}</span>
			
			<p>
				url : <a href=${myProfile.url }>${myProfile.url }</a>
			</p>
			<p>portfolio_name : ${myProfile.portfolio_name}</p>


			<a href="/login/insertMemberDetailPage">추가정보 수정</a>
		</div>
	</div>
</body>
</html>