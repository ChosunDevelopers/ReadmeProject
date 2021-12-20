<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
   <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
   <link rel="stylesheet" href="../../../resources/css/main_styles.css">
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>회원정보수정</title>
</head>
<script type="text/javascript">
	$(document).ready(function(){
		// 취소
		$(".cancel").on("click", function(){
			
			location.href = "/";
					    
		})
	
		$("#submit").on("click", function(){
			if($("#password").val()==""){
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			if($("#name").val()==""){
				alert("성명을 입력해주세요.");
				$("#name").focus();
				return false;
			}
		});
		
			
		
	})
</script>
<style>
       #mainNav {
           position: sticky;
       }
       .card-body{
       	display: flex;
       }
</style>
	
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
        
		<section id="container">
			<form action="/member/memberUpdate" method="post" enctype="multipart/form-data">
			
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${loginID}" readonly="readonly"/>	
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="name">이름</label>
					<input class="form-control" type="text" id="name" name="name" />
				</div>

				<div class="form-group has-feedback">
					<label class="control-label" for="name">생년월일</label>
					<input class="form-control" type="text" id="jumin" name="jumin" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="phone">핸드폰번호</label>
					<input class="form-control" type="text" id="phone" name="phone"/>
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="region">지역</label>
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
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="profileImg">프로필</label>
					<input class="form-control" type="file" id="profileImg" name="file"/>
					<br/>
					<div class="select_img"><img src="" /></div>
				</div>
				
				
				
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
 
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cancel btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
	</body>
	
</html>