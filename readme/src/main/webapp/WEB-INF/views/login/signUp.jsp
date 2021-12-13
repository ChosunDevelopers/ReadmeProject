<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>

</head>
<body>
<div id="page-top">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
                <div class="container">
                    <a class="navbar-brand" href="#page-top">ReadMe</a>
                    <button class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                        Menu
                        <i class="fas fa-bars"></i>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarResponsive">
                        <ul class="navbar-nav ms-auto">
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#board">팀 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#find">팀원 찾기</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">공지사항</a></li>
                            <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded" href="#notify">로그인/회원가입</a></li>
                        </ul>
                    </div>
                </div>
            </nav>    
        </div>
        

<form role="form" method="post" action = "/member/insertMember" autocomplete="off" enctype="multipart/form-data">

<div class="inputArea">
 <label for="id">아이디</label>
 <input type="text" id="id" name="id" />
</div>

<div class="inputArea">
 <label for="password">비밀번호</label>
 <input type="text" id="password" name="password" />
</div>

<div class="inputArea">
 <label for="name">이름</label>
 <input type="text" id="name" name="name" />
</div>

<div class="inputArea">
 <label for="jumin">생년월일</label>
 <input type="text" id="jumin" name="jumin" />
</div>

<div class="inputArea">
 <label for="phone">핸드폰번호</label>
 <input type="text" id="phone" name="phone" />
</div>

<div class="inputArea">
 <label for="region">지역</label>
 <input type="text" id="region" name="region" />
</div>

<div class="inputArea">
 <label for="profileImg">이미지</label>
 <input type="file" id="profileImg" name="file" />
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
 
  <%= request.getRealPath("/") %>
</div>




<div class="inputArea">
 <button type="submit" id="register_Btn" class="btn btn-primary">등록</button>
</div>

</form>
</body>
</html>