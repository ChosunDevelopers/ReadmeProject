<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/myPage.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
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
        
<h1>This is MyPage</h1>



	
<table>
	<tr>
		<td>
			<form action = "/member/myProfile" method = "GET">
				<input type = "hidden" name = "id" value = "${loginID }" />
				<input type = "submit" value = "나의 프로필">
			</form>		
		</td>
	</tr>
	
	<tr>
		<td>
			<a href = "/login/applicationNotice">지원공고관리</a>
		</td>	
	</tr>
	<tr>
		<td>
			<a href = "/login/favoNotice">관심공고관리</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/favoMember">관심사용자관리</a>
			
		</td>
	</tr>
	<tr>
		<td>
			<a href = "/login/memberDeleteView">회원탈퇴</a>
			
		</td>
	</tr>
</table>




</body>
</html>