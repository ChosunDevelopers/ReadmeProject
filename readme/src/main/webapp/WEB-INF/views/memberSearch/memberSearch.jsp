<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
</div>
        <div class="container">
            <div class="row">
                <div class="col-md-4 offset-md-10">
                    <form class="" action="">
                        <input class = "" id="userName" type="text" placeholder="Search" style="height:38px;">
                        <button class="btn btn-success" type="submit" id="nameSearch">검색</button>
                    </form>
                </div>
            </div>

           <div class="row">
               <div class="col align-self-start">
                    <div class="skillName"><label class="skillColor">FrontEnd</label></div>
                    <img src='../../../resources/images/languages/html.png' alt='html' class="skill_lan_image">
                    <img src='../../../resources/images/languages/css.png' alt='css' class="skill_lan_image">
                    <img src='../../../resources/images/languages/js.png' alt='javascript' class="skill_lan_image">
                    <img src='../../../resources/images/languages/react.png' alt='react' class="skill_lan_image">
                    <img src='../../../resources/images/languages/vue.png' alt='vue' class="skill_lan_image">
                    <img src='../../../resources/images/languages/angular.png' alt='angular' class="skill_lan_image">
                    <img src='../../../resources/images/languages/typescript.png' alt='typescript' class="skill_lan_image">
                    <img src='../../../resources/images/languages/webpack.png' alt='webpack' class="skill_lan_image">
                    <hr>
                    <div class="skillName"><label class="skillColor">BackEnd</label></div>
                    <img src='../../../resources/images/languages/java.png' alt='java' class="skill_lan_image">
                    <img src='../../../resources/images/languages/c.png' alt='c' class="skill_lan_image">
                    <img src='../../../resources/images/languages/cc.png' alt='c#' class="skill_lan_image">
                    <img src='../../../resources/images/languages/php.png' alt='php' class="skill_lan_image">
                    <img src='../../../resources/images/languages/nodejs.png' alt='nodejs' class="skill_lan_image">
                    <img src='../../../resources/images/languages/spring.png' alt='spring' class="skill_lan_image">
                    <img src='../../../resources/images/languages/python.jfif' alt='python' class="skill_lan_image">
                    <img src='../../../resources/images/languages/ruby.jfif' alt='ruby' class="skill_lan_image">
                    <hr>
                    <div class="skillName"><label class="skillColor">App</label></div>
                    <img src='../../../resources/images/languages/kotlin.jfif' alt='kotlin' class="skill_lan_image">
                    <img src='../../../resources/images/languages/swift.png' alt='swift' class="skill_lan_image">
                    <img src='../../../resources/images/languages/flutter.png' alt='flutter' class="skill_lan_image">
                    <img src='../../../resources/images/languages/reactnative.png' alt='reactnative' class="skill_lan_image">
                </div>

            </div>
            <hr>
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
        </div>
<script>
$('.skill_lan_image').click(function(){
	var skillIndex = $(".skill_lan_image").index(this);
	var language = $('.skill_lan_image').eq(skillIndex).attr("alt");
	console.log(language);
	$.ajax({
		type:"GET",
		url:"/memberSearchRest/skillList",
		data: {skill : language},
		success: function(data){
			go2(data);
		},
		error: function(error){
			console.log("오류 : " + error);
		}
	})
})

$('#nameSearch').click(function(e){
	e.preventDefault();
	var userName = $("#userName").val();
	console.log(userName);
	$.ajax({
		type:"GET",
		url:"/memberSearchRest/userName",
		data: {name : userName},
		success: function(data){
			go2(data);
		},
		error: function(error){
			console.log("오류 : " + error);
		}
	})
})


function go2(data){
	console.log(data);
	console.log("고투고투");
	var cardList = $(".row.search-card");
	
	showList(data);
	
	function showList(data){
		var str = "";
		if(data.length == 0){
			cardList.html("");
			return;
		}
		for(var i = 0; i < data.length; i++){
			str += "<div class='card' style='width: 18rem;'>";
			str += "<div class='card-body'>";
			str += "<div class='content-img'>";
			str += "<img alt = '' title = '이미지를 등록해주세요' src = '<spring:url value = '"+/image/+data[i].profileThumbImg+"'/>'/>";
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

/* str += "<input type='hidden' class='hiddenUserId' >"
$('.card-link').click(function(){
	console.log("클릭은됨");
})
*/

/*
$('.card-link').on('click', function(){
	alert("안되냐;");
	console.log("클릭클릭");
})
*/

/*이건 되는 코드인데 다른거 실험하러 갔다옴
$(document).on("click", ".card-link", function(e){
	e.preventDefault();
	var userName = $(".hiddenUserId").attr("value");
	console.log(userName);
	console.log("안되는건가");
})
*/
 </script>
 
<br><br> 
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
    </body>
</html>