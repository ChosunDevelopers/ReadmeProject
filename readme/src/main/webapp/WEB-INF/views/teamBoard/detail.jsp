<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html xmlns:th="http://www.thymeleaf.org">

<head>
<title>글 상세</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="../../../resources/css/main_styles.css">
<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>


<style>
@import
	url('https://fonts.googleapis.com/css2?family=Staatliches&display=swap')
	;

@import
	url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100&display=swap')
	;

#mainNav {
	position: sticky;
}

.container form button {
	margin-bottom: 4px;
	margin-left: 4px;
}

.form-check-label {
	font-size: 18px;
}

.skillName {
	margin-top: 10px;
}

.skillColor {
	font-size: 20px;
	color: midnightblue
}

.card-body {
	display: flex;
}

.content-img {
	width: 50px;
	height: 50px;
}

.content-img img {
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

#likeButton {
	cursor: pointer;
	width: 35px;
	height: 35px;
}

.text-box {
	font-family: 'Montserrat', sans-serif;
}

.box {
	float: right;
	padding: 5px 5px 5px 5px;
}

.textarea_test {
	resize: none;
	line-height: 30px;
	width: 100%;
	overflow-y: hidden;
	height: 130px;
	border: 1px solid #ddd;
}
textarea {
			width: 100%;
			height: 200px;
			box-sizing: border-box;
			border: solid 3px;
			border-radius: 5px;
			font-size: 16px;
		}
hr{
	border-top: 1px solid #bbb;
	border-bottom: 1px solid #fff;
	}		
	#wantRight{
		float: right;
	}
</style>
</head>
<body>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<div id="page-top">
		<!-- Navigation-->
		<nav
			class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
			id="mainNav">
			<div class="container">
				<a class="navbar-brand" href="/index">Read Me</a>
				<button
					class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
					type="button" data-bs-toggle="collapse"
					data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
					aria-expanded="false" aria-label="Toggle navigation">
					Menu <i class="fas fa-bars"></i>
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

		<div class="col-md-12">
			<div class="text-box" style="text-align: left;">
				<div class="page-header" style="padding: 40px 0px 0px 0px;">
					<h3>${ data.title }</h3>
				</div>
				<span style="font-size: 0.8em;">작성자 : ${data.id }</span><br> <span
					style="font-size: 0.8em;">모집인원 : ${data.maxteam }</span><br> <span
					style="font-size: 0.8em;"> 입력일 : <fmt:formatDate
						value="${data.regDate}" pattern="yyyy.MM.dd" /><br>
				</span>
				<br>
			</div>
			<textarea readonly>${data.comment }</textarea>


		</div>
	

		<blockquote class="pull-right">
			<div class="box">
				<c:if test="${data.id == loginID}">
					<form method="POST"  action="/delete">
						<input type="hidden" name="teamboardBno" value="${teamboardBno}" />
						<input class="btn btn-sm btn-danger" type="submit" value="삭제" />
					</form>
				</c:if>

<%-- 				<c:if test="${data.id != loginID}">
					<a onclick="alert('다른 이용자의 글은 삭제할 수 없습니다.');"
						style="cursor: pointer" class="btn btn-sm btn-danger">삭제</a>
				</c:if> --%>
			</div>
			
			<div class="box">
				<c:if test="${data.id == loginID}">
					<p>
						<a class="btn btn-sm btn-warning"
							href="/update?teamboardBno=${teamboardBno}">수정</a>
					</p>

				</c:if>
<%-- 				<c:if test="${data.id != loginID}">
					<a onclick="alert('다른 이용자의 글은 수정할 수 없습니다.');"
						style="cursor: pointer" class="btn btn-sm btn-warning">수정</a>
				</c:if> --%>
			</div>
			<div class="box">
				<p>
					<a class="btn btn-sm btn-primary" href="/list">목록으로</a>
				</p>
			</div>
			
			<!-- 게시글 좋아요 -->
			<div class="box" id="divLikeButton">
				<img alt="dislike" src="../../../resources/images/dislike.png"
					id="likeButton">
			</div>
		</blockquote>
		<br><br><br><br>
		<!-- 댓글 시작 -->
		<br>
		<c:forEach items="${reply}" var="reply">
			<hr>
			<div>
				<div class="forReply">
					<div class="forReplyId">
						<h6>${reply.id}</h6>
					</div>
					<div class="forReplyDate">
						<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />	
						
						<c:if test="${reply.id == loginID}">
							<form method="POST" action="/reply/delete?rno=${reply.rno}">		
								<input type="hidden" name="bno" value="${teamboardBno}">
								<button class="btn btn-sm btn-danger" id="wantRight" type="submit">삭제</button>
							</form>						
						</c:if>
																	
					</div>
				</div>

				<p>${reply.comment }</p>
<%-- 				<form method="POST" action="/reply/delete?rno=${reply.rno}">

					<input type="hidden" name="bno" value="${teamboardBno}"> 

<%-- 					<p>
						<c:if test="${reply.id == loginID}">
							<button class="btn btn-sm btn-danger" id="wantRight" type="submit">삭제</button>
						</c:if>
					</p> --%>
<%-- 					<p>
						<c:if test="${reply.id != loginID}">
						</c:if>
					</p> 
				</form>--%>
				<%--<a href="/reply/delete?rno=${reply.rno}">댓글 삭제</a> --%>

			</div>


		</c:forEach>
		<c:if test="${loginID != null}">
			<div>

				<form method="post" action="/reply/write">
					<hr>
					<p>댓글 작성</p>
					<p>
						<!-- <label>댓글 작성자</label> <input type="text" name="id"> -->
						<input type="hidden" name="id" value="${loginID}">
					</p>
					<p>
						<textarea class="textarea_test" name="comment"></textarea>
					</p>
					<input type="hidden" name="bno" value="${teamboardBno}">
					<p>
						<button class="btn btn-sm btn-primary" type="submit">댓글 작성</button>
					</p>
				</form>

			</div>
		</c:if>
		<input type="hidden" value="${yourId }" id="sessionId"> <input
			type="hidden" value="${teamboardBno }" id="BoardBno">
</div>
			
		<script>
			$(document).ready(function like_func() {
				var myId = $('#sessionId').val();
				var bno = $("#BoardBno").val();
				$.ajax({
					type : "GET",
					url : "/teamBoardRest/boardLike",
					data : {
						id : myId,
						bno : bno
					},
					success : function(data) {
						go(data);
					},
					error : function(error) {
						console.log("오류 : " + error);
					}
				})
			})

			function go(data) {
				console.log(data);
				if (data == 1) {
					go1();
				} else {
					go2();
				}
			}

			function go1() {
				var str = "<img alt='like' src='../../../resources/images/like.png' id='likeButton'>";
				var divLikeButton = $("#divLikeButton");
				divLikeButton.html(str);
			}

			function go2() {
				var str = "<img alt='dislike' src='../../../resources/images/dislike.png' id='likeButton'>";
				var divLikeButton = $("#divLikeButton");
				divLikeButton.html(str);
			}

			$(document).on("click", "#likeButton", function(e) {
				e.preventDefault();
				var uid = $("#sessionId").val();

				if (uid == "") {
					alert("로그인이 필요한 기능입니다.");
					return false;
				}

				var likeDislike = 0;

				var status = $("#likeButton").attr("alt");
				if (status === 'like') {
					if (!confirm("좋아요를 취소하시겠습니까?")) {
						console.log("ㄴㄴ 유지");
					} else {
						likeDislike = 1;
						go3(likeDislike);
					}
				} else {
					if (!confirm("좋아요를 하시겠습니까?")) {
						console.log("ㄴㄴ 유지");
					} else {
						likeDislike = 2;
						go3(likeDislike);
					}
				}
			})

			function go3(likeDislike) {
				var myId = $('#sessionId').val();
				var bno = $("#BoardBno").val();

				if (likeDislike == 1) {
					$.ajax({
						type : "GET",
						url : "/teamBoardRest/nowDislike",
						data : {
							id : myId,
							bno : bno
						},
						success : function(data) {
							go2();
						},
						error : function(error) {
							console.log("오류 : " + error);
						}
					})
				} else {
					$.ajax({
						type : "GET",
						url : "/teamBoardRest/nowLike",
						data : {
							id : myId,
							bno : bno
						},
						success : function(data) {
							go1();
						},
						error : function(error) {
							console.log("오류 : " + error);
						}
					})
				}
			}
		</script>
<br><br><br><br>
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
