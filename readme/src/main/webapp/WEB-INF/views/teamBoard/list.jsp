<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



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
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">??? ??????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/memberSearch/memberSearch">?????? ??????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/notice/list">????????????</a></li>
                        
                        <c:if test = "${loginID == null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/login">?????????/????????????</a></li>
                        </c:if>
                        
                        <c:if test = "${loginID != null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/myPage">???????????????</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/member/logout">????????????</a></li>
                        </c:if>
                        
                    </ul>

				</div>
			</div>
		</nav>
	</div>

	<div class="container">
		<form>
			<div style="float:left">
				<c:if test="${loginID == null}">
					<p>
						<a onclick="alert('???????????? ???????????????.');" style="cursor: pointer"
							type="button" class="btn btn-primary pull-right">?????????</a>
					</p>
				</c:if>
				<c:if test="${loginID != null}">
					<p>
						<a href="/create" type="button" class="btn btn-primary pull-right">?????????</a>
					</p>
				</c:if>
			</div>
			<div style="float:right">
				<input type="text" placeholder="??????" name="keyword"
					value="${keyword}" /> <input type="submit" class="btn btn-primary"
					value="??????" />
			</div>
		</form>
		<table class="table text-center table-bordered table-hover">
			<thead>
				<div>
					<tr>
						<td>??????</td>
						<td>?????????</td>
						<td>??????</td>

						<td>????????????</td>


					</tr>
				</div>
			</thead>
			<tbody>
				<c:forEach var="row" items="${data}">
					<tr align="center" height="20">

						<td>${row.teamBoard_bno}</td>
						<td>${row.id }</td>
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




	</div>
<br><br><br>
        <!-- Footer-->
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            ?????? IT ??????????????????
                            <br />
                            ?????? ????????? ???????????? 27??? 15-5 ????????????
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <!-- Footer ?????? ?????? Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Read Me</h4>
                        <p class="lead mb-0">
                            ???????????? ?????? ?????? ?????? ????????? ??? ?????? ???????????? ????????? ?????? ??? ????????????.
                        </p>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">(???) Read Me</h4>
                        <p class="lead mb-0">
                            3?????? ??????????????????.
                        </p>
                    </div>
                </div>
            </div>
        </footer>	
</body>
</html>
