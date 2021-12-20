<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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
#mainNav {
	position: sticky;
}

.container form {
	margin: 20px 0;
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
</style>
</head>
<body>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

	<div class="container">
		<div class="table">

			<div class="col-md-12">
				<div class="page-header" style="padding: 40px 10px 10px 10px;">
					<h1>${ data.title }</h1>
				</div>
				<span style="font-size: 1.0em;">모집인원 : ${data.maxteam }</span><br>
				<span style="font-size: 1.0em;"> 입력일 : <fmt:formatDate
						value="${data.regDate}" pattern="yyyy.MM.dd HH:mm:ss" />
				</span>

				<h3>${ data.comment }</h3>
				<div style="float: right">
					<blockquote class="pull-right">

						<!-- 게시글 좋아요 -->
						<div class="col" id="divLikeButton">
							<img alt="dislike" src="../../../resources/images/dislike.png"
								id="likeButton">
						</div>
						<p>
							<a class="btn btn-sm btn-primary" href="/list">목록으로</a>
						</p>
						<p>
							<a class="btn btn-sm btn-warning"
								href="/update?teamboardBno=${teamboardBno}">수정</a>
						</p>

						<form method="POST" action="/delete">
							<input type="hidden" name="teamboardBno" value="${teamboardBno}" />
							<input class="btn btn-sm btn-danger" type="submit" value="삭제" />
						</form>


					</blockquote>
				</div>

			</div>
		</div>

		<!-- 댓글 시작 -->

		<c:forEach items="${reply}" var="reply">

			<div>
				<p>${reply.id}

					<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
				</p>

				<p>${reply.comment }</p>
				<form method="POST" action="/reply/delete?rno=${reply.rno}">

					<input type="hidden" name="bno" value="${teamboardBno}">

					<p>
						<c:if test="${reply.id == loginID}">
							<button type="submit">삭제</button>
						</c:if>
					</p>
					<p>
						<c:if test="${reply.id != loginID}">
						</c:if>
					</p>
				</form>
				<%--<a href="/reply/delete?rno=${reply.rno}">댓글 삭제</a> --%>

			</div>


		</c:forEach>
		<c:if test="${loginID != null}">
			<div>

				<form method="post" action="/reply/write">

					<p>ID : ${loginID }</p>
					<p>
						<!-- <label>댓글 작성자</label> <input type="text" name="id"> -->
						<input type="hidden" name="id" value="${loginID}">
					</p>
					<p>
						<textarea rows="5" cols="50" name="comment"></textarea>
					</p>
					<input type="hidden" name="bno" value="${teamboardBno}">
					<p>
						<button type="submit">댓글 작성</button>
					</p>
				</form>

			</div>
		</c:if>
		<input type="hidden" value="${yourId }" id="sessionId"> <input
			type="hidden" value="${teamboardBno }" id="BoardBno">
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
</body>
</html>
