<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>글 상세</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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

				<!--  댓글 -->
				<div id="reply">
					<ol class="replyList">
						<c:forEach  var="replyList" items="${replyList}">
						
						<p>작성자: ${replyList.id }</p>
						<p>작성 날짜 :<fmt:formatDate value="${replyList.regdate}" pattern="yyyy-MM-dd" /></p>
						<p>작성내용 :${replyList.comment }</p>
						</c:forEach>
					</ol>
				</div> 

			</div>
		</div>
	</div>
</body>
</html>
