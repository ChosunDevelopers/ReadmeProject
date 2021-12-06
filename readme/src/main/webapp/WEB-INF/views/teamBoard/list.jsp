<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<title>팀 목록</title>

<style>
	.container {
		display: flex;
		justify-content: center;
		align-items:center;
	}
</style>
</head>
<body>
	<h1>팀 목록</h1>

	<table>
		<thead>
		<div class="container">
			<tr>
				<td width="50">제목</td>
				<td width="50">내용</td>

				<td width="100">게시날짜</td>
				<td>
					<p>
						<a href="/create">생성</a>
					</p>
				</td>
			</tr>
			<tr>
				<p>
				<form>
					<input type="text" placeholder="검색" name="keyword"
						value="${keyword}" /> <input type="submit" value="검색" />
				</form>
				</p>

			</tr>
			</div>
		</thead>
		<tbody>
			<c:forEach var="row" items="${data}">
				<tr align="center" height="20">
					<td><a href="/detail?teamboardBno=${row.teamBoard_bno}">
							${row.title} </a></td>
					<td>${row.comment}</td>
					<%-- <td><fmt:formatNumber type="number" maxFractionDigits="3"
							value="${row.regdate}" /></td> --%>
					<td><fmt:formatDate value="${row.regDate}" pattern="yyyy-MM-dd"/></td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center" height="40">
					<%-- ${pageCode} --%>
				</td>
			</tr>

		</tbody>
	</table>

</body>
</html>
