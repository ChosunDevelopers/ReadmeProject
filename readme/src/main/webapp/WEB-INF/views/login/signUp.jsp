
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="../../../resources/css/main_styles.css">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>
<style>
        #mainNav {
            position: sticky;
        }
        .card-body{
        	display: flex;
        }
    </style>
<link rel="stylesheet" href="../../resources/css/signUp.css">
<script>
 function validate() {
	 var jumin = document.getElementById("jumin");
	 var phone = document.getElementById("phone");
	 
	 if (jumin.value != '') {
         if (!chk(/^[0-9]{6}$/, jumin, "생년월일을 YYMMDD형식으로 입력해주세요"))
                 return false;
         }
	if( phone.value != ''){
/* 		if (!chk(/^[0-9]{11}$/, phone, "전화번호형식을 010-1111-2222로 입력해주세요")) */
		if (!chk(/^[0-9]{3}[-]+[0-9]{4}[-]+[0-9]{4}$/, phone, "전화번호형식을 010-1111-2222로 입력해주세요"))
            return false;
            
            
	}
	
 }
 
 function validateEmail(){
	 var email = document.getElementById("email");
 	 if(!chk(/^[\w]{4,}@[\w]+(\.[\w-]+){1,3}$/, email, "아이디가 이메일 형식에 어긋납니다."))
         return false;
 	 return true;
	 
 }
 
 function chk(re, e, msg) {

	 if (re.test(e.value)) {
             return true;
     }

     alert(msg);
     e.value = "";
     e.focus();
     return false;
 } 
 
//아이디 체크여부 확인 (아이디 중복일 경우 = 0 , 중복이 아닐경우 = 1 )
 var idck = 0;
 $(function() {
     //idck 버튼을 클릭했을 때 
     $("#idck").click(function() {
         
    	 var flag = validateEmail();
    	 console.log("flag : " ,flag);
    	 if (flag == false){
    		 $("#email").addClass("has-error")
             $("#email").removeClass("has-success") 
             $("#email").focus();
    		 return;
    	 }
    	 console.log("function not stopped");
    	 
         //userid 를 param.
         var email =  $("#email").val();  
         console.log("email : ", email);
         $.ajax({
             async: true,
             type : 'POST',
             data : email,
             url : "/member/idcheck.do",
             dataType : "json",
             contentType: "application/json; charset=UTF-8",
             success : function(data) {
            	 console.log("data.count ::::::", data.cnt);
                 if (data.cnt > 0) {
                     alert("아이디가 존재합니다. 다른 아이디를 입력해주세요.");
                     //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                     $("#email").addClass("has-error")
                     $("#email").removeClass("has-success") 
                     $("#email").focus();
                     
                 
                 } else {
                	 
                     alert("사용가능한 아이디입니다.");
                     //아이디가 존제할 경우 빨깡으로 , 아니면 파랑으로 처리하는 디자인
                     $("#email").addClass("has-success")
                     $("#email").removeClass("has-error") 
                     /* $("#userpwd").focus(); */
                     //아이디가 중복하지 않으면  idck = 1 
                     idck = 1;
                     
                 }
             },
             error : function(error) {
                 
                 alert("error : " + error);
             }
         });
     });
 });
  

</script>
</head>
<body>

<!-- <input type = "button" id = "idck" value = "id 중복체크a"> -->
<!-- <button id = "idck" value = "ID 중복체크">ID 중복체크</button> -->
<div id="page-top">
      <!-- Navigation-->
            <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
                <div class="container">
                    <a class="navbar-brand" href="/index">Read Me</a>
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
 </div>

        

<div class = "wrapper">
	<div class = "content">
	<center>
		<h1 class = "pageTitle">Sign Up</h1>
	</center>
	
	<form onsubmit = "return validate();" role="form" method="post" action = "/member/insertMember" autocomplete="off" enctype="multipart/form-data">

	<span class = "loginLabel">ID</span>
		<br/>
		<input class="loginBox" type="text" id = "email" name="id" placeholder="email@gmail.com"/>
		<button type = "button" id = "idck" value = "ID 중복체크">ID 검사하기</button>
		<br/><br/>
		
	<span class = "loginLabel">비밀번호</span>
		<br/>
		<input class="loginBox" type="password" name="password"/>
		<br/><br/>
		
	<span class = "loginLabel">이름</span>
		<br/>
		<input class="loginBox" type="text" name="name" placeholder = "홍길동"/>
		<br/><br/>
		
	<span class = "loginLabel">생년월일</span>
		<br/>
		<input class="loginBox" id = "jumin" type="text" name="jumin" placeholder = "YYMMDD"/>
		<br/><br/>
		
	<span class = "loginLabel">핸드폰번호</span>
		<br/>
		<input class="loginBox" id = "phone" type="text" name="phone" placeholder = "010-1111-2222"/>
		<br/><br/>
		
	<span class = "loginLabel">지역</span>
	 <br/>
	 <select class = "loginBox" name = "region" id = "region">
	 	<option value = "서울특별시">서울특별시</option>
	 	<option value = "경기도">경기도</option>
	 	<option value = "대전광역시">대전광역시</option>
	 	<option value = "세종특별자치시">세종특별자치시</option>
	 	<option value = "광주광역시">광주광역시</option>
	 	<option value = "부산광역시">부산광역시</option>
	 	<option value = "대구광역시">대구광역시</option>
	 	<option value = "울산광역시">울산광역시</option>
	 	<option value = "제주특별자치도">제주특별자치도</option>
	 	<option value = "강원도">강원도</option>
	 	<option value = "충청도">충청도</option>
	 	<option value = "경상도">경상도</option>
	 	<option value = "전라도">전라도</option>
	 </select>
		<br/><br/>
		
	<span class = "loginLabel">프로필</span>
		<br/>
		<input class = "signUpButton" type="file" id="profileImg" name="file" />
		<br/>
		<div class="select_img"><img src="" /></div>
 
 
 
 
	 <script>
	  $("#profileImg").change(function(){
	   if(this.files && this.files[0]) {
	    var reader = new FileReader;
	    reader.onload = function(data) {
	     $(".select_img img").attr("src", data.target.result).width(500);        
	    }
	    reader.readAsDataURL(this.files[0]);
	   }
	  });
	 </script>
 
  	
	

	<div class="inputArea">
	 <button type="submit" id="register_Btn" class="btn btn-primary">Register</button>
	</div>

	</form>
	</div>
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