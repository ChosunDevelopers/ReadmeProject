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
	    <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <center>
	 	<title>공지사항</title>
	 	
	 	<style>
        #mainNav {
            position: sticky;
        }
        .container form {
            margin: 20px 0;
        }
        .container form button{
            margin-bottom: 4px;
            margin-left: 4px;
        }
        .form-check-label {
            font-size: 18px;
        }
        .skillName{
            margin-top: 10px;
        }
        .skillColor{
            font-size: 20px;
            color: midnightblue
        }
        .card-body{
            display: flex;
        }
        .content-img{
            width: 50px;
            height: 50px;
        }
        .content-img img{
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
        
		<div id="root">
			<header>
				<h1>공지사항</h1>
			</header>
			<hr />
			 
				
			<section id="container">
				<form name="noticelist" method="post" action="/notice/write">
					<table>
						<tr><th>번호</th><th>제목</th><!-- <th>내용</th> --><th>작성자</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="noticedetail.do?bno=${list.bno }">
									<c:out value="${list.title}" />
									</a>
								</td>
								<%-- <td><c:out value="${list.content}" /></td> --%>
								<td><c:out value='${loginID }' /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
			<hr />
			<a href = "./writeView">작성</a>	
		</div>
	</body>
	</center>
	
</html>