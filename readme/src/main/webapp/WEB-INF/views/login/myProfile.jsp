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
         <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/">Read Me</a>
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
	    <%-- <h4> '${loginID }'?????? ???????????????.</h4> --%>
<div class="container">
        	<div class="row gx-4 gx-lg-5 align-items-center my-5">
				<div class="col-lg-3">
					<img src = "<spring:url value = '/image/${myProfile.profileThumbImg }'/>"/>		
				</div>        
				<div class="col">
					<p>??????: <span>${myProfile.name}</span></p>
					<p>????????? : ${myProfile.id}</p>
					<p>?????? : ${myProfile.region}</p>
				</div>
				<div class="col">
					<p>???????????? : ${myProfile.jumin}</p>
					<p>??????????????? : ${myProfile.phone}</p>
				</div>		
				<div class = "col">
					<!-- <a href = "/login/updateMemberPage">???????????? ??????</a> -->
            
	          <!--   <a class="btn btn-xl btn-outline-dark" href="/login/updateMemberPage">
	                <i class="fas fa-download me-2"></i>
	               	 ???????????? ??????
	            </a> -->
	              <form action = "/login/updateProfilePage" method = "GET">
					<input type = "hidden" name = "id" value = "${loginID}" />
					<input type = "submit" class="btn btn-xl btn-outline-dark" value = "???????????? ??????">
			   </form>	
            
				</div>
        	</div>
        	<hr>
        	<div class="mySkill">
				<h3>?????? ??????</h3>
				<h6>${myProfile.skill}</h6>
				<br>
				
			</div>
			<hr>
			<div class="memberComment">
				<h3>????????????</h3>
				<textarea rows="20" class="form-control" name="comment" readonly>${myProfile.comment }</textarea>
				<%-- <p>${myProfile.comment }</p> --%>
			</div>
			<hr>
			<div class="memberPortfolio">
				<h3>???????????????</h3>
				<p>url : <a href = "${myProfile.url}">${myProfile.url}</a></p>
				<p>???????????? : ${myProfile.portfolio_name}</p>
<%-- 				<span>${myProfile.portfolio_path }</span><br/>
				<span>"<spring:url value = '/image/${myProfile.portfolio_path }'/>"</span> --%>
				<a href = "<spring:url value = '/image/${myProfile.portfolio_path}'/>" 
					download = "${myProfile.portfolio_name}">???????????? ????????????</a>
				<%-- <a href="<c:url value = '/image/${myProfile.portfolio_path}'/>"/>file download test</a> --%>
			</div>
			<hr>
			<div class = "memberUpdateDetail">
				<a href = "/login/insertMemberDetailPage" class="btn btn-xl btn-outline-dark">???????????? ??????</a>
			</div>
			<hr>
			   
        </div>

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