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
    <style>
        #mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
    </style>
<title>Insert title here</title>
<link rel="stylesheet" href="../../resources/css/login.css">
<script>
 function validate() {
	 var email = document.getElementById("email");
	 
	 if(!chk(/^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/, email, "이메일 형식에 어긋납니다."))
         return false;
 }
 
 function chk(re, e, msg) {

	 if (re.test(e.value)) {
             return true;
     }

     alert(msg);
     e.value = "";
     e.focus();
     return false;
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

        
	<div class="wrapper">
		<div class="content">
			<center>
				<h1 class = "pageTitle">LOGIN</h1>
			</center>

			<form onsubmit = "return validate();"  role = "form" action="/member/loginMember" method="POST">


				<span class="loginLabel" style = "font-size:25px">ID</span>
				<br/>
				<input id = "email" class="loginBox" type="text" name="id" placeholder="email@gmail.com"/>
				<br/><br/>
				
				
				<span class="loginLabel" style = "font-size:25px">password</span>
				<br/>
				<input class="loginBox" type="password" name="password" /> 
				<br/><br/> 
				
				<input class="loginButton" type="submit" value="Login">
			</form>
         
			<br /> 
			<button class = "signUpButton"><a  href="./signUp">SignUp</a></button>

		</div>
	</div>
</body>
</html>