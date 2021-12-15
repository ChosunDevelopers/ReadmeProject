<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>글 상세</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
		$(document).ready(function(){
			$(".replyWriteBtn").on("click", function(){
				  var formObj = $("form[name='replyForm']");
				  formObj.attr("action", "/replyWrite");
				  formObj.submit();
				});
	</script>

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


			</div>
		</div>

		<!-- 댓글 시작 -->

		<!-- <ul>
			<li>
				<div>
					<p>첫번째 댓글 작성자</p>
					<p>첫번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>두번째 댓글 작성자</p>
					<p>두번째 댓글</p>
				</div>
			</li>
			<li>
				<div>
					<p>세번째 댓글 작성자</p>
					<p>세번째 댓글</p>
				</div>
			</li>
		</ul> -->


		<c:forEach items="${reply}" var="reply">
			<li>
				<div>
					<p>${reply.id}
						/
						<fmt:formatDate value="${reply.regDate}" pattern="yyyy-MM-dd" />
					</p>
					<p>${reply.comment }</p>
				</div>
				<p>
					<button type="button" class="replyUpdate" data-rno="${repList.rno}">수정</button>
					<button type="button" class="replyDelete" data-rno="${repList.rno}">삭제</button>

					<script>
					  $(".replyUpdate").click(function(){
					   	console.log('수정');
						  self.location = "/teamBoard/replyUpdate?bno=${teamboardBno}"
					    + "&page=${scri.page}"
					    + "&perPageNum=${scri.perPageNum}"
					    + "&searchType=${scri.searchType}"
					    + "&keyword=${scri.keyword}"
					    + "&rno=" +  $(this).attr("data-rno");      
					  });
					  
					  $(".replyDelete").click(function(){
						console.log('삭제');	  
					   self.location = "/teamBoard/replyDelete?bno=${teamboardBno}"
					    + "&page=${scri.page}"
					    + "&perPageNum=${scri.perPageNum}"
					    + "&searchType=${scri.searchType}"
					    + "&keyword=${scri.keyword}"
					    + "&rno=" + $(this).attr("data-rno"); 
					  });       
					 </script>
				</p>
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
</body>
</html>
