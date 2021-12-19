
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
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<style>
        #mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
    </style>
<link rel="stylesheet" href="../../resources/css/signUp.css">
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

        

<div class = "wrapper">
	<div class = "content">
	<center>
		<h1 class = "pageTitle">Sign Up</h1>
	</center>
	
	<form role="form" method="post" action = "/member/insertMember" autocomplete="off" enctype="multipart/form-data">

	<span class = "loginLabel">ID</span>
		<br/>
		<input class="loginBox" type="text" name="id" placeholder="email@gmail.com"/>
		<br/><br/>
		
	<span class = "loginLabel">비밀번호</span>
		<br/>
		<input class="loginBox" type="password" name="password"/>
		<br/><br/>
		
	<span class = "loginLabel">이름</span>
		<br/>
		<input class="loginBox" type="text" name="name" placeholder = "홍길동"/>
		<br/><br/>
		
	<span class = "loginLabel">생년월일</span>
		<br/>
		<input class="loginBox" type="text" name="jumin" placeholder = "YYYYMMDD"/>
		<br/><br/>
		
	<span class = "loginLabel">핸드폰번호</span>
		<br/>
		<input class="loginBox" type="text" name="phone" />
		<br/><br/>
		
	<span class = "loginLabel">지역</span>
	 <br/>
	 <select class = "loginBox" name = "region" id = "region">
	 	<option value = "서울특별시">서울특별시</option>
	 	<option value = "경기도">경기도</option>
	 	<option value = "대전광역시">대전광역시</option>
	 	<option value = "세종특별자치시">세종특별자치시</option>
	 	<option value = "광주광역시">광주광역시</option>
	 	<option value = "부산광역시">부산광역시</option>
	 	<option value = "대구광역시">대구광역시</option>
	 	<option value = "울산광역시">울산광역시</option>
	 	<option value = "제주특별자치도">제주특별자치도</option>
	 	<option value = "강원도">강원도</option>
	 	<option value = "충청도">충청도</option>
	 	<option value = "경상도">경상도</option>
	 	<option value = "전라도">전라도</option>
	 </select>
		<br/><br/>
		
	<span class = "loginLabel">프로필</span>
		<br/>
		<input class = "signUpButton" type="file" id="profileImg" name="file" />
		<br/>
		<div class="select_img"><img src="" /></div>
 
 
 
 
	 <script>
	  $("#profileImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
	 </script>
 
  	
	

	<div class="inputArea">
	 <button type="submit" id="register_Btn" class="btn btn-primary">Register</button>
	</div>

	</form>
	</div>
</div>


</body>
</html>