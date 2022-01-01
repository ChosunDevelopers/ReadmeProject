<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>ReadMe</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="../../resources/images/favicon.ico" />
        <!-- Font Awesome icons (free version)-->        
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../../resources/css/main_styles.css" rel="stylesheet" />
        <script src="../../resources/js/main_confirm.js"></script>
   		<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    <style>
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
    </head>
    <body id="page-top">
    
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="#page-top">Read Me</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#board">팀 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#find">팀원 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/notice/list">공지사항</a></li>
                        
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
        <!-- Masthead-->
        <video width="100%" height="auto" autoplay loop muted controls>
					 <source src="../../resources/Commercial video for IT company ELEKS - How to Turn a Great Idea into a Software Product.mp4" type="video/mp4">
		 </video> 
        <header class="masthead bg-primary text-white text-center">
            <div class="container d-flex align-items-center flex-column">
            	<%-- <c:if test = "${loginID == null }">
            		로그인이 되지않은 상태
            	</c:if>
            	<c:if test = "${loginID != null }">
            	${loginID} 로그인상태
            	</c:if> --%>
            	<img src = "../../resources/images/ReadMeBackground.png">
            </div>
        </header>
        <!-- 팀 찾기 Section-->
        <section class="page-section board" id="board">
            <div class="container">
                <!-- 팀 찾기 Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">팀 찾기</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>

		<table class="table text-center table-bordered table-hover">
			<thead>
					<tr>
						<td>번호</td>
						<td>아이디</td>
						<td>제목</td>
						<td>게시날짜</td>
					</tr>
			</thead>
			<tbody>
				<c:forEach var="row" items="${data}" end="2">
					<tr align="center" height="20">
						<td>${row.teamBoard_bno}</td>
						<td>${row.id }</td>
						<td><a href="/detail?teamboardBno=${row.teamBoard_bno}">
								${row.title} </a></td>
						<%-- <td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${row.regdate}" /></td> --%>
						<td><fmt:formatDate value="${row.regDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>				
				</c:forEach>
			</tbody>
		</table>

                <div class="text-center mt-4">
                    <a class="btn btn-xl btn-outline-dark" href="/list">
                        <i class="fas fa-download me-2"></i>
                        자세히 보기
                    </a>
                </div>
            </div>

        </section>

        <!-- 팀원 찾기 Section-->
        
        
        <section class="page-section bg-primary text-white mb-0" id="find">
            <div class="container">
                <!-- 팀원 찾기 Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-white">팀원 찾기</h2>
                <!-- Icon Divider-->
                <div class="divider-custom divider-light">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                
                
                
                
            <div class="row search-card">                 
                <div class="card" style="width: 18rem;">
                    <div class="card-body">
                        <div class="content-img">
                            <img src="../../../resources/images/cat.png" alt="이미지">
                        </div>
                        <div class="content-text">
                            <h5 class="card-title">${member.name}123</h5>
                            <h6 class="card-subtitle mb-2 text-muted">사는곳</h6>
                        </div>
                    </div>
                    <p class="card-text">react, java, spring, Node, HTML, CSS, JavaScript</p>
                    <div class="more">
                        <a href="#" class="card-link" style="float:right">더보기</a>
                    </div>                    
                </div>
                
            </div>                
                
                
                
                <div class="text-center mt-4">
                    <a class="btn btn-xl btn-outline-light" href="/memberSearch/memberSearch">
                        <i class="fas fa-download me-2"></i>
                        자세히 보기
                    </a>
                </div>
            </div>
        </section>
        
        
<%--          
        <!-- 공지사항 Section-->
        <section class="page-section" id="notify">
            <div class="container">
                <!-- 공지사항 Section Heading-->
                <h2 class="page-section-heading text-center text-uppercase text-secondary mb-0">공지사항</h2>
                <!-- Icon Divider-->
                <div class="divider-custom">
                    <div class="divider-custom-line"></div>
                    <div class="divider-custom-icon"><i class="fas fa-star"></i></div>
                    <div class="divider-custom-line"></div>
                </div>
                <!-- 공지사항 Section Form-->
                <div class="row justify-content-center">
                    <div class="col-lg-8 col-xl-7">       
                    </div>                        
                    </div>
                </div>

                <div class="text-center mt-4">
                    <a class="btn btn-xl btn-outline-dark" href="./notice/notice">
                        <i class="fas fa-download me-2"></i>
                        자세히 보기
                    </a>
                </div>
                                
            </div>
        </section>
--%>
        
        <!-- Footer-->
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            한국 IT 직업전문학교
                            <br />
                            서울 서초구 강남대로 27길 15-5 성경빌딩
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <!-- Footer 팀원 찾기 Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Read Me</h4>
                        <p class="lead mb-0">
                            참가하고 싶은 팀에 쉽게 지원할 수 있고 능력있는 팀원을 찾을 수 있습니다.
                        </p>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">(주) Read Me</h4>
                        <p class="lead mb-0">
                            3조가 만들었습니다.
                        </p>
                    </div>
                </div>
            </div>
        </footer>




 	<script>
	$(document).ready(function(){
		$.ajax({
			type:"GET",
			url:"/memberSearchRest/skillSearch",
			success: function(data){
				go2(data)
			},
			error: function(error){
				console.log("오류 : " + error);
			}
		})
	})
	
	function go2(data){
		var cardList = $(".row.search-card");
		
		showList(data);
		
		function showList(data){
			var str = "";
			
			if(data.length == 0){
				cardList.html("");
				return;
			}
			for(var i = 0; i < 4; i++){
				str += "<div class='card' style='width: 18rem;'>";
				str += "<div class='card-body'>";
				str += "<div class='content-img'>";
				str += "<img src = '<spring:url value = '"+/image/+data[i].profileThumbImg+"'/>'/>";
				str += "</div>";
				str += "<div class='content-text'>";
				str += "<h5 class='card-title mb-2 text-muted'>"+data[i].name+"</h5>";
				str += "<h6 class='card-subtitle mb-2 text-muted'>"+data[i].id+"</h6>";
				str += "<input type='hidden' class='hiddenUserId' value='"+data[i].id+"'>";
				str += "</div>";
				str += "</div>";
				str += "<p class='card-text mb-2 text-muted'>"+data[i].skill+"</p>";
				str += "<div class='more'>";
				str += "<a href='/memberSearch/memberDetail/"+data[i].id+"' class='card-link' style='float:right'>더보기</a>";
				str += "</div>";
				str += "</div>";					
			}
			cardList.html(str);
		}
	}
	
	
	
 	</script>
        
    </body>
</html>
