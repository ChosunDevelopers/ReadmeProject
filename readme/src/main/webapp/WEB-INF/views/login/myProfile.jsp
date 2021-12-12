<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/myProfile.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function doing() {
		const test = document.getElementById("profieImgTest");
		test.innerHTML = "${myProfile.profileImg}";

		var path = "../../resources" + "${myProfile.profileImg}";
		var target = document.getElementById("profileImg");
		target.src = path;
	}
</script>
</head>
<body>
	<h1>This is MyProfile Page</h1>

	<div class="wrapper">

		<div class="profilePartOne">
			<table>
			<tr>
				<td>
					<img id="profileImg"
					src="<spring:url value = '${myProfile.profileThumbImg}'/>" />
				</td>
				
				<td class="partOneText">
					<table>
						<tr>
							<td class="tableLeft">이름</td>
							<td>${myProfile.name}</td>
						</tr>
						<tr>
							<td class="tableLeft">생년월일</td>
							<td>${myProfile.jumin}</td>
						</tr>
						<tr>
							<td class="tableLeft">핸드폰 번호</td>
							<td>${myProfile.phowne}</td>
						</tr>
						<tr>
							<td class="tableLeft">지역</td>
							<td>${myProfile.region}</td>
						</tr>
						<tr>
							<td class="tableLeft"></td>
							<td><a href="/login/updateMemberPage">회원정보수정</a></td>
						</tr>
					</table>
				</td>
			</tr>
			</table>
		</div>

		<div class="profilePartTwo">

			comment : ${myProfile.comment}
			</p>
			<p>
				url : <a href=${myProfile.url }>${myProfile.url }</a>
			</p>
			<p>portfolio_name : ${myProfile.portfolio_name}</p>


			<a href="/login/insertMemberDetailPage">추가정보 수정</a>
		</div>
	</div>
</body>
</html>