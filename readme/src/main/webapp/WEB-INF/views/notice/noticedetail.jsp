<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	<title>공지사항 상세페이지</title>
	</head>
	
		<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/notice/list";
			})
		})
		</script>
		
	<body>
	
		<div id="root">
			<header>
				<h1> ${read.bno}번 공지사항 상세페이지</h1>
			</header>
			<hr />
			
			<section id="container">
				<form action = "/notice/update" method = "post">
					<table>
						<tbody>
							<tr>
								<td>
									<label for="bno">글 번호</label><input type="text" id="bno" name="bno" value="${read.bno}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="title">제목</label><input type="text" id="title" name="title" value="${read.title}"/>
								</td>
							</tr>	
							<tr>
								<td>
									<label for="content">내용</label><textarea id="content" name="content"><c:out value="${read.content}" /></textarea>
								</td>
							</tr>
							<tr>
								<td>
									<label for="writer">작성자</label><input type="text" id="writer" name="writer" value="${read.writer}" />
								</td>
							</tr>
							<tr>
								<td>
									<label for="regdate">작성날짜</label>
									<fmt:formatDate value="${read.regdate}" pattern="yyyy-MM-dd"/>					
								</td>
							</tr>		
						</tbody>			
					</table>
						<button type="submit" class="">수정</button>
					</form>
					<div>
	
						<form action = "/notice/delete" method = "post">
							<input type="hidden" id="bno" name="bno" value="${read.bno}"/>
							<button type="submit" class="">삭제</button>
						</form>		
						
						
						<button type="submit" class="list_btn">목록</button>	
					</div>
				
			</section>
			<hr />
		</div>
	</body>
</html>