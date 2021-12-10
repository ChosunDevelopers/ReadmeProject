<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
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
		
		function checkStr(){
			var str = "";
			var targets = document.getElementsByClassName("checkBox");
			for (var i = 0 ; i < targets.length ; i ++){
				if (targets[i].checked){
					if (!str){
						str += targets[i].value;	
					}
					else{
						str += "," + targets[i].value;
					}
				}
			}
			var inputTarget = document.getElementById("skill");
			inputTarget.value = str;
			alert("Skill selected!");
		/* alert(inputTarget.value); */
		/* alert(str); */
		/* alert(checkbox accepted); */
		}
		
	</script>
	</head>
	<body>
	<span>${loginID }</span>
		<section id="container">
			<form action="/member/insertMemberDetail" method="post" enctype="multipart/form-data">
			
				<div class="form-group has-feedback">
					<label class="control-label" for="id">아이디</label>
					<input class="form-control" type="text" id="id" name="id" value="${loginID}" readonly="readonly"/>	
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="comment">자기소개</label>
					<input class="form-control" type="text" id="comment" name="comment" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="url">github url</label>
					<input class="form-control" type="text" id="url" name="url" />
				</div>
				
				<div class="form-group has-feedback">
					<label class="control-label" for="file">포트폴리오 파일</label>
					<input class="form-control" type="file"  name="file" />
					<label class="control-label" for="file">포트폴리오 파일 설명</label>
					<input class="form-control" type="text" name="portfolio_name">
				</div>
				
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">추가정보입력</button>
					<button class="cancel btn btn-danger" type="button">취소</button>
				</div>
				
				<input id = "skill" type = "hidden" name = "skill" value = ""></input>
				<h3>Front End</h3>
				<label><input class = "checkBox" type = "checkbox" value = "Angular">Angular</label>
				<label><input class = "checkBox" type = "checkbox" value = "CSS">CSS</label>
				<label><input class = "checkBox" type = "checkbox" value = "HTML">HTML</label>
				<label><input class = "checkBox" type = "checkbox" value = "JavaScript">JavaScript</label>
				<label><input class = "checkBox" type = "checkbox" value = "React">React</label>
				<label><input class = "checkBox" type = "checkbox" value = "TypeScript">TypeScript</label>
				<label><input class = "checkBox" type = "checkbox" value = "Vue">Vue</label>
				<label><input class = "checkBox" type = "checkbox" value = "Webpack">Webpack</label>
				<h3>Back End</h3>
				<label><input class = "checkBox" type = "checkbox" value = "C">C</label>
				<label><input class = "checkBox" type = "checkbox" value = "C#">C#</label>
				<label><input class = "checkBox" type = "checkbox" value = "C++">C++</label>
				<label><input class = "checkBox" type = "checkbox" value = "Java">Java</label>
				<label><input class = "checkBox" type = "checkbox" value = "Node">Node</label>
				<label><input class = "checkBox" type = "checkbox" value = "PHP">PHP</label>
				<label><input class = "checkBox" type = "checkbox" value = "Python">Python</label>
				<label><input class = "checkBox" type = "checkbox" value = "Ruby">Ruby</label>
				<label><input class = "checkBox" type = "checkbox" value = "Spring">Spring</label>
				<h3>Mobile Application</h3>
				<label><input class = "checkBox" type = "checkbox" value = "Flutter">Flutter</label>
				<label><input class = "checkBox" type = "checkbox" value = "Kotlin">Kotlin</label>
				<label><input class = "checkBox" type = "checkbox" value = "ReactNative">ReactNative</label>
				<label><input class = "checkBox" type = "checkbox" value = "Swift">Swift</label>
				
				
			</form>
			<button onclick = "checkStr()" value = "선택 완료">선택 완료</button>
		</section>
	</body>
</html>