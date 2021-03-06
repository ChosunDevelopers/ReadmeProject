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
    </style>
<title>Insert title here</title>
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
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">??? ??????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/memberSearch/memberSearch">?????? ??????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/notice/list">????????????</a></li>
                        
                        <c:if test = "${loginID == null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/login">?????????/????????????</a></li>
                        </c:if>
                        
                        <c:if test = "${loginID != null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/myPage">???????????????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/member/logout">????????????</a></li>
                        </c:if>
                        
                    </ul>

                    </div>
                </div>
            </nav>    
</div>
<br>
<h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">?????? ??????</h2>
<!-- Icon Divider-->
<div class="divider-custom">
    <div class="divider-custom-line"></div>
    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
    <div class="divider-custom-line"></div>
</div>
<div class="container">
    <div class="row search-card">                 
	<c:forEach var = "pickBoard" items="${pickBoard}">
        <div class="card" style="width: 18rem;">
            <div class="card-body">
                <div class="content-img">
                    <img src="../../../resources/images/noImage.png" alt="?????????">
                </div>
                <div class="content-text">
                    <h5 class="card-title">${pickBoard.title}</h5>
                    <h6 class="card-subtitle mb-2">${pickBoard.id }</h6>
                </div>
            </div>
            <p class="card-text">${pickBoard.comment }</p>
            <div class="more">
                <a href="/detail?teamboardBno=${pickBoard.teamBoard_bno }" class="card-link" style="float:right">?????????</a>
            </div>                    
        </div>
    </c:forEach>    
    </div>
</div>

<br><br><br><br><br><br><br><br>
<br><br><br><br>
        <!-- Footer-->
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            ?????? IT ??????????????????
                            <br />
                            ?????? ????????? ???????????? 27??? 15-5 ????????????
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <!-- Footer ?????? ?????? Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Read Me</h4>
                        <p class="lead mb-0">
                            ???????????? ?????? ?????? ?????? ????????? ??? ?????? ???????????? ????????? ?????? ??? ????????????.
                        </p>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">(???) Read Me</h4>
                        <p class="lead mb-0">
                            3?????? ??????????????????.
                        </p>
                    </div>
                </div>
            </div>
        </footer>
</body>
</html>