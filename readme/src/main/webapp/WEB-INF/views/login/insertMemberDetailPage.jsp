<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../../resources/css/main_styles.css">
    
	<!-- 합쳐지고 최소화된 최신 CSS -->
	<!-- 부가적인 테마 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
 	
 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<title>추가정보입력</title>

	<style>
		.checkbox{
			display:inline;
		}
	
		label{
			width : 110px;
		}
	#mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
		#btnRight{
			float: right;
		}
		input[type=checkbox]{
		    margin: 0 5px;		
		}
		.form-group has-feedback{
			margin-bottom: 10px;
		}
		
	</style>
	
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancel").on("click", function(){
				
				location.href = "/";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#comment").val()==""){
					alert("자기소개를 입력해주세요.");
					$("#comment").focus();
					return false;
				}
				if($("#url").val()==""){
					alert("github의 url 입력해주세요.");
					$("#url").focus();
					return false;
				}
			});
		})
		
		
		var arr = [];
		
		function checkClear(){
			var str = "";
			arr = [];
			var checkboxes = document.getElementsByClassName("checkBox");
			for (var i = 0 ; i < checkboxes.length ; i ++){
				if (checkboxes[i].checked)
					checkboxes[i].checked = false;
			}
			var inputTarget = document.getElementById("skill");
			inputTarget.value = str;
			alert("선택 초기화 완료!");
		}
		
		function checkboxHandler(element){
			
			const idx = arr.indexOf(element.value);
			if (idx > -1)
				arr.splice(idx, 1);
			else{
			arr.push(element.value);
			}
			var str = arr.join();
			var inputTarget = document.getElementById("skill");
			inputTarget.value = str;
			/* alert(str); */
		}
		
		
		
	</script>
	</head>
	<body id="page-top">

         <!-- Navigation-->
        <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
            <div class="container">
                <a class="navbar-brand" href="/">Read Me</a>
                <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/list">팀 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/memberSearch/memberSearch">팀원 찾기</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/notice/list">공지사항</a></li>
                        
                        <c:if test = "${loginID == null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/login">로그인/회원가입</a></li>
                        </c:if>
                        
                        <c:if test = "${loginID != null}">
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/login/myPage">마이페이지</a></li>
                        <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="/member/logout">로그아웃</a></li>
                        </c:if>
                        
                    </ul>
                </div>
            </div>
        </nav>  


<div class="container">       
		<section id="container">
		<br>
			<form action="/member/insertMemberDetail" method="post" enctype="multipart/form-data">
				
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${loginID}" readonly="readonly"/>	
				</div>
				<hr>
				<strong><h4>사용 가능한 기술 체크!</h4></strong>
				
				<input id = "skill" type = "hidden" name = "skill" value = ""></input>
				<hr>
				<h5>Front End</h5>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Angular">Angular</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "CSS">CSS</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "HTML">HTML</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "JavaScript">JavaScript</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "React">React</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "TypeScript">TypeScript</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Vue">Vue</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Webpack">Webpack</label>
				<hr>
				<h5>Back End</h5>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "C">C</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "C#">C#</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "C++">C++</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Java">Java</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Node">Node</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "PHP">PHP</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Python">Python</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Ruby">Ruby</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Spring">Spring</label>
				<hr>
				<h5>Mobile Application</h5>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Flutter">Flutter</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Kotlin">Kotlin</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "ReactNative">ReactNative</label>
				<label><input onclick = "checkboxHandler(this)" class = "checkBox" type = "checkbox" value = "Swift">Swift</label>
				<br/>
				<button type = "button" onclick = "checkClear()" value = "선택 초기화" class="btn btn-warning" id="btnRight">선택 초기화</button>
				<br/><br/><br/>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="comment">자기소개</label>
					<!-- <input class="form-control" type="text" id="comment" name="comment" /> -->
					<textarea name="comment" id="comment" class="form-control" cols="40" rows="10"></textarea>
				</div>
				<br>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="url">GitHub URL</label>
					<input class="form-control" type="text" id="url" name="url" />
				</div>
				<br>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="file">포트폴리오</label>
					<input class="form-control" type="file"  name="file" />
					<br>
					<label class="control-label" for="file">파일 설명</label>
					<input class="form-control" type="text" name="portfolio_name">
				</div>
				<br>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit" style="float:right; margin-left:3px;">추가정보입력</button>
					<button class="cancel btn btn-danger" type="button" style="float:right">취소</button>
				</div>
				
			</form>
			
		</section>
</div>		
<br><br>
        <!-- Footer-->
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    <!-- Footer Location-->
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            한국 IT 직업전문학교
                            <br />
                            서울 서초구 강남대로 27길 15-5 성경빌딩
                        </p>
                    </div>
                    <!-- Footer Social Icons-->
                    <!-- Footer 팀원 찾기 Text-->
                    <div class="col-lg-4">
                        <h4 class="text-uppercase mb-4">About Read Me</h4>
                        <p class="lead mb-0">
                            참가하고 싶은 팀에 쉽게 지원할 수 있고 능력있는 팀원을 찾을 수 있습니다.
                        </p>
                    </div>
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">(주) Read Me</h4>
                        <p class="lead mb-0">
                            3조가 만들었습니다.
                        </p>
                    </div>
                </div>
            </div>
        </footer>
	</body>
</html>