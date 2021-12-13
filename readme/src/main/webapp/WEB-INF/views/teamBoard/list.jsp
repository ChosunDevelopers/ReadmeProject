<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>부트스트랩 적용</title>
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
		<form class = "pull-right">
			<input type="text" placeholder="검색" name="keyword" value="${keyword}" />
			<input type="submit" class="btn" value="검색" />
		</form>
		<table class="table text-center table-bordered table-hover">
			<thead>
				<div>
					<tr>
						<td>번호</td>
						<td>제목</td>

						<td>게시날짜</td>


					</tr>
				</div>
			</thead>
			<tbody>
				<c:forEach var="row" items="${data}">
					<tr align="center" height="20">

						<td>${row.teamBoard_bno}</td>
						<td><a href="/detail?teamboardBno=${row.teamBoard_bno}">
								${row.title} </a></td>
						<%-- <td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${row.regdate}" /></td> --%>
						<td><fmt:formatDate value="${row.regDate}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="5" align="center" height="40">
						<%-- ${pageCode} --%>
					</td>
				</tr>

			</tbody>
		</table>

		<td>
			<p>
				<a href="/create" type="button" class="btn btn-primary pull-right">글쓰기</a>
			</p>
		</td>
	</div>
</body>
</html>
