<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
   <title>회원정보수정</title>
</head>
<script type="text/javascript">
   $(document).ready(function(){
      // 취소
      $(".cancel").on("click", function(){
         
         location.href = "/";
                   
      })
   
      $("#submit").on("click", function(){
         if($("#password").val()==""){
            alert("비밀번호를 입력해주세요.");
            $("#password").focus();
            return false;
         }
         if($("#name").val()==""){
            alert("성명을 입력해주세요.");
            $("#name").focus();
            return false;
         }
      });
  
      
   })
</script>
<style>
       #mainNav {
           position: sticky;
       }
       .card-body{
          display: flex;
       }
</style>
   
<body>
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
        
      <div class="container">
         <form action="/member/memberUpdate" method="post" enctype="multipart/form-data">
         	<br>
            <div class="form-group has-feedback">
               <label class="control-label" for="id">아이디</label>
               <input class="form-control" type="text" id="id" name="id" value="${loginID}" readonly="readonly"/>   
            </div>
            
            <br>
            <div class="form-group has-feedback">
               <label class="control-label" for="password">패스워드</label>
               <input class="form-control" type="password" id="password" name="password" />
            </div>
            
            <br>
            <div class="form-group has-feedback">
               <label class="control-label" for="name">이름</label>
               <input class="form-control" type="text" id="name" name="name"  placeholder ="${myProfile.name}" />
            </div>

			<br>
            <div class="form-group has-feedback">
               <label class="control-label" for="name">생년월일</label>
               <input class="form-control" type="text" id="jumin" name="jumin"  placeholder = "${myProfile.jumin}" />
            </div>
            
            <br>
            <div class="form-group has-feedback">
               <label class="control-label" for="phone">핸드폰번호</label>
               <input class="form-control" type="text" id="phone" name="phone"  placeholder = "${myProfile.phone}"/>
            </div>
            
            <br>
            <div class="form-group has-feedback">
               <label class="control-label" for="region">지역</label>
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
            </div>
            
            <br>
            <div class="form-group has-feedback">
               <label class="control-label">프로필</label>
               <input class="form-control" type="file" id="profileImg" name="file"/>
               <br/>
               <div class="select_img"><img src="" /></div>
            </div>
            
            
            
       <script>
              $("#profileImg").change(function(){
               if(this.files && this.files[0]) {
                var reader = new FileReader;
                reader.onload = function(data) {
                 $(".select_img img").attr("src", data.target.result).width(500);        
                 console.log("#######",data.target.result);
                }
               
                reader.readAsDataURL(this.files[0]);
               }
              });
            </script>
 
            
            <div class="form-group has-feedback">
               <button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
               <button class="cancel btn btn-danger" type="button">취소</button>
            </div>
         </form>
      </div>


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