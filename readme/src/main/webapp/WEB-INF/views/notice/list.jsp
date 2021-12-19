<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
	 	<title>공지사항</title>
	</head>
	<body>
		<div id="root">
			<header>
				<h1>공지사항</h1>
			</header>
			<hr />
			 
				
			<section id="container">
				<form role="form" method="post" action="/notice/write">
					<table>
						<tr><th>번호</th><th>제목</th><!-- <th>내용</th> --><th>작성자</th><th>등록일</th></tr>
						
						<c:forEach items="${list}" var = "list">
							<tr>
								<td><c:out value="${list.bno}" /></td>
								<td>
									<a href="noticedetail.do?bno=${list.bno }">
									<c:out value="${list.title}" />
									</a>
								</td>
								<%-- <td><c:out value="${list.content}" /></td> --%>
								<td><c:out value='${loginID }' /></td>
								<td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
							</tr>
						</c:forEach>
						
					</table>
				</form>
			</section>
			<hr />
			<a href = "./writeView">작성</a>	
		</div>
	</body>
</html>