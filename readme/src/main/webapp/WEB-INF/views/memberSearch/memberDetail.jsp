<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../../resources/css/main_styles.css">
    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <title>Document</title>
    <style>
        #mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
    </style>
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
        
        <div class="container">
        	<div class="row gx-4 gx-lg-5 align-items-center my-5">
				<div class="col-lg-3">
					<img class="img-fluid rounded mb-4 mb-lg-0" src="../../../resources/images/cat.png" alt="profile">
				</div>        
				<div class="col">
					<p>이름: <span>이순호</span></p>
					<p>이메일 : snow@gmail.com</p>
					<p>지역 : 인천</p>
				</div>
				<div class="col">
					<p>나이 : 27세</p>
					<p>핸드폰번호 : 010-4471-5330</p>
				</div>		
        	</div>
        	<hr>
        	<div class="mySkill">
				<h3>보유 스킬</h3>
				<h5>${memberSkill}</h5>
				<br>
				${id}
			</div>
			<hr>
			<div class="memberComment">
				<p>Comment</p>
				여기 커멘트 들어갈곳
			</div>
			<hr>
			<div class="memberPortfolio">
				<p>포트폴리오 url : snow@github.com</p>
				<p>첨부파일 : snow의 포트폴리오.pdf</p>
			</div>
			<hr>
			<div class="likeFunc">
			일단 찜하기 기능먼저
			</div>        
        </div>
<script>
$(document).ready(function like_func(){
	$.ajax({
		type:"GET",
		url:"/memberSearchRest/memberLike",
		success: function(data){
			go(data);
		},
		error: function(error){
			console.log("오류 : " + error);
		}
	})
})

function go(){
	console.log("여기까지 옴!");
}
</script>
</body>
</html>