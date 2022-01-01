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
        .card-body{
        	display: flex;
        }
        #likeButton{
			cursor: pointer;
			width: 75px;
			height: 75px;        	
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
        	<div class="row gx-4 gx-lg-5 align-items-center my-5">
				<div class="col-lg-3">
					<!-- <img class="img-fluid rounded mb-4 mb-lg-0" src="../../../resources/images/cat.png" alt="profile"> -->
					<img src = "<spring:url value = '/image/${myProfile.profileThumbImg }'/>"/>	
				</div>        

				<c:forEach var="specificMember" items = "${specificMember}">
				<div class="col">
					<h6>이름: ${specificMember.name}</h6>
					<br>
					<h6>이메일 : ${wish_id }</h6>
					<br>
					<h6>지역 : ${specificMember.region }</h6>
				</div>
				<div class="col">
					<input type = "hidden" value="${specificMember.jumin }" id="jumin">
					<h6>나이 : ${age}세</h6>
					<br>
					<h6>핸드폰번호 : ${specificMember.phone }</h6>
				</div>
				</c:forEach>

				<div class="col" id="divLikeButton">
					<img alt="dislike" src="../../../resources/images/dislike.png" id="likeButton">
				</div>		
        	</div>
        	<hr>
        	<div class="mySkill">
				<h3>보유 스킬</h3>
				<h6>${memberSkill}</h6>
				<br>
			</div>
			<hr>
			<div class="memberComment">
				<h3>자기소개</h3>
				<textarea class="form-control" rows="20" cols="" readonly>${myProfile.comment}</textarea>
				<%-- <h6>${myProfile.comment}</h6> --%>
				<br>
			</div>
			<hr>
			<div class="memberPortfolio">
				<h3>포트폴리오 url</h3>
				<h6><a href=${myProfile.url }>${myProfile.url }</a></h6>
				<p>첨부파일 : ${myProfile.portfolio_name}</p> 
				<br>
				<a href = "<spring:url value = '/image/${myProfile.portfolio_path }'/>" 
					download = "${myProfile.portfolio_name}">첨부파일 다운로드</a>				
			</div>
			<hr>
 
        </div>
        <input type = "hidden" value="${yourId }" id="sessionId">
        <input type = "hidden" value="${wish_id }" id="pathId">
        
<script>

$(document).ready(function like_func(){
	var myId = $('#pathId').val();

	$.ajax({
		type:"GET",
		url:"/memberSearchRest/memberLike",
		
		data: {id : myId},
		success: function(data){
			go(data);
		},
		error: function(error){
			console.log("오류 : " + error);
		}
	})
})

function go(data){
	console.log(data);
	console.log("여기까지 옴!");
	if(data == 1){
		go1();
	}
	else {
		go2();
	}
}


function go1(){
	console.log("이미 좋아요상태");
	var str = "<img alt='like' src='../../../resources/images/like.png' id='likeButton'>";
	var divLikeButton = $("#divLikeButton");
	divLikeButton.html(str);
}

/*
function reFresh(){
	var str = "";
	var str += "<img alt='찜하기' src='../../../resources/images/like.png' id='likeButton'>";
	
}
*/

/*
$('#likeButton').click(function(e){
	alert("좋아요");
})
*/

$(document).on("click", "#likeButton", function(e){
	e.preventDefault();
	var uid = $("#sessionId").val();
	
	if(uid == ""){
		console.log("이게안탐?");
		alert("로그인 먼저");
		return false;
	}
	
	var likeDislike = 0;
	
	var status = $("#likeButton").attr("alt");
	if(status === 'like'){
		if(!confirm("좋아요를 취소하시겠습니까?")){
			console.log("ㄴㄴ 유지");
		} else {
			likeDislike = 1;
			go3(likeDislike);			
		}
	} else {
		if(!confirm("좋아요를 하시겠습니까?")){
			console.log("ㄴㄴ 유지");
		} else {
			likeDislike = 2;
			go3(likeDislike);			
		}		
	} 
})

function go2() {
	console.log("아직 어사");
	var str = "<img alt='dislike' src='../../../resources/images/dislike.png' id='likeButton'>";
	var divLikeButton = $("#divLikeButton");
	divLikeButton.html(str);
}

function go3(likeDislike){
	var myId = $('#pathId').val();
	if(likeDislike == 1){	
		$.ajax({
			type:"GET",
			url:"/memberSearchRest/nowDislike",
			
			data: {id : myId},
			success: function(data){
				go2();
			},
			error: function(error){
				console.log("오류 : " + error);
			}
		})
	} else {
		$.ajax({
			type:"GET",
			url:"/memberSearchRest/nowLike",
			
			data: {id : myId},
			success: function(data){
				go1();
			},
			error: function(error){
				console.log("오류 : " + error);
			}
		})		
	} 
}


</script>


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