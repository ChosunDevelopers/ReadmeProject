<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>글 상세</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
#likeButton {
	cursor: pointer;
	width: 75px;
	height: 75px;
}
</style>
</head>
<body>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<h1>팀 목록</h1>

	<div class="container">
		<div class="row">

			<div class="col-md-12">
				<div class="page-header">
					<h1>${ data.title }</h1>
					<h1>ID ${loginID }</h1>
				</div>

				<h3>${ data.comment }</h3>
				<p>
					입력일 :
					<fmt:formatDate value="${data.regDate}"
						pattern="yyyy.MM.dd HH:mm:ss" />
				</p>
				<p>모집인원 : ${data.maxteam }</p>

				<!-- 게시글 좋아요 -->
				<div class="col" id="divLikeButton">
					<img alt="dislike" src="../../../resources/images/dislike.png"
						id="likeButton">
				</div>

				<blockquote class="pull-right">
					<p>
						<a class="btn btn-sm btn-primary"
							href="/update?teamboardBno=${teamboardBno}">수정</a>
					</p>

					<form method="POST" action="/delete">
						<input type="hidden" name="teamboardBno" value="${teamboardBno}" />
						<input class="btn btn-sm btn-primary" type="submit" value="삭제" />
					</form>

					<p>
						<a class="btn btn-sm btn-primary" href="/list">목록으로</a>
					</p>

				</blockquote>


			</div>
		</div>

		<!-- 댓글 시작 -->



		<c:forEach items="${reply}" var="reply">
			<li>
				<div>
					<p>${reply.id}

						<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
					</p>

					<p>${reply.comment }</p>
					<form method="POST" action="/reply/delete?rno=${reply.rno}">

						<input type="hidden" name="bno" value="${teamboardBno}">
								
						<p>
							<button type="submit">삭제</button>
						</p>
					</form>
					<%--<a href="/reply/delete?rno=${reply.rno}">댓글 삭제</a> --%>

				</div>

			</li>
		</c:forEach>

		<div>

			<form method="post" action="/reply/write">

				<p>
					<label>댓글 작성자</label> <input type="text" name="id">
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
		<input type="hidden" value="${yourId }" id="sessionId"> <input
			type="hidden" value="${teamboardBno }" id="BoardBno">

		<script>
$(document).ready(function like_func(){
	var myId = $('#sessionId').val();
	var bno = $("#BoardBno").val();
	$.ajax({
		type:"GET",
		url:"/teamBoardRest/boardLike",
		data : {
				id: myId,
				bno : bno
			   },
		success : function(data){
			go(data);
		},
		error: function(error){
			console.log("오류 : " + error);
		}
	})
})

function go(data){
	console.log(data);
	if(data == 1){
		go1();
	} else {
		go2();
	}
}

function go1(){
	var str = "<img alt='like' src='../../../resources/images/like.png' id='likeButton'>";
	var divLikeButton = $("#divLikeButton");
	divLikeButton.html(str);	
}

function go2(){
	var str = "<img alt='dislike' src='../../../resources/images/dislike.png' id='likeButton'>";
	var divLikeButton = $("#divLikeButton");
	divLikeButton.html(str);	
}

$(document).on("click", "#likeButton", function(e){
	e.preventDefault();
	var uid = $("#sessionId").val();
	
	if(uid == ""){
		alert("로그인이 필요한 기능입니다.");
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

function go3(likeDislike){
	var myId = $('#sessionId').val();
	var bno = $("#BoardBno").val();
	
	if(likeDislike == 1){	
		$.ajax({
			type:"GET",
			url:"/teamBoardRest/nowDislike",
			data : {
				id: myId,
				bno : bno
			   },
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
			url:"/teamBoardRest/nowLike",
			data : {
				id: myId,
				bno : bno
			   },
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
</body>
</html>
