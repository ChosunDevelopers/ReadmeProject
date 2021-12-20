<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                    <a class="navbar-brand" href="/index">Read Me</a>
                    <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">팀 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/memberSearch/memberSearch">팀원 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">공지사항</a></li>
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

    <h1> '${loginID }' Profile</h1>
<div class="container">
        	<div class="row gx-4 gx-lg-5 align-items-center my-5">
				<div class="col-lg-3">
					<img src = "<spring:url value = '/image/${myProfile.profileThumbImg }'/>"/>		
				</div>        
				<div class="col">
					<p>이름: <span>${myProfile.name}</span></p>
					<p>이메일 : ${myProfile.id}</p>
					<p>지역 : ${myProfile.region}</p>
				</div>
				<div class="col">
					<p>생년월일 : ${myProfile.jumin}</p>
					<p>핸드폰번호 : ${myProfile.phone}</p>
				</div>		
				<div class = "col">
					<a href = "/login/updateMemberPage">회원정보 수정</a>
				</div>
        	</div>
        	<hr>
        	<div class="mySkill">
				<h3>보유 스킬</h3>
				<h6>${myProfile.skill}</h6>
				<br>
				
			</div>
			<hr>
			<div class="memberComment">
				<h3>자기소개</h3>
				<p>${myProfile.comment }</p>
			</div>
			<hr>
			<div class="memberPortfolio">
				<h3>프토폴리오</h3>
				<p>url : <a href = "${myProfile.url}">${myProfile.url}</a></p>
				<p>첨부파일 : ${myProfile.portfolio_name}</p>
				<span>${myProfile.portfolio_path }</span><br/>
				<span>"<spring:url value = '/image/${myProfile.portfolio_path }'/>"</span>
				<a href = "<spring:url value = '/image/${myProfile.portfolio_path }'/>" 
					download = "${myProfile.portfolio_name}">첨부파일 다운로드</a>
				<a href="<c:url value = '/image/${myProfile.portfolio_path}'/>"/>file download test</a>
			</div>
			<hr>
			<div class = "memberUpdateDetail">
				<a href = "/login/insertMemberDetailPage">추가정보 수정</a>
			</div>
			<hr>
			   
        </div>
	
</body>
</html>