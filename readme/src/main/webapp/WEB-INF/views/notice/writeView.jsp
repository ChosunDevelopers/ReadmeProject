<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
   <head>
      <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
      <meta charset="UTF-8">
       <meta http-equiv="X-UA-Compatible" content="IE=edge">
       <meta name="viewport" content="width=device-width, initial-scale=1.0">
       <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
       <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
       <link rel="stylesheet" href="../../../resources/css/main_styles.css">
       <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
   

   
       <title>공지사항 게시글 작성</title>
       <style>
#mainNav {
	position: sticky;
}       
 /*       .middle {
        position: absolute; left: 50%; top: 40%; 
        transform: translate(-50%, -50%); text-align: center;
        background: white;
        width: 800px;
        height: 600px;
      }
      
      .table {
         width: 500px;
         text-align: center;
      }
      
      .listButton{
         background-color : white;
         border : 2px solid #1ABC9C;
         width : 80px;
         height : 35px;
         border-radius:8px;
         color : #1ABC9C;
      }
      
      #bno {
         text-align: center;
         width:100px;
         height:20px;
         box-shadow: 0 0 0 0.5rem skyblue;
         border-radius: 12px;
         font: bold 1rem sans-serif;
         margin: 0.5rem;
         margin-top: 1rem;
         padding: 1.5rem;
         outline-offset: 0.5rem;
      }
      
      #title {
        width: 500px;
        border: 0.5rem outset green;
        box-shadow: 0 0 0 0.5rem skyblue;
        border-radius: 12px;
        font: bold 1rem sans-serif;
        margin-top: 1rem;
        margin-bottom: 3rem;
        padding: 1rem;
        outline-offset: 0.5rem;
      }
      
      #content {
         width:500px;
         height:100px;
         box-shadow: 0 0 0 0.5rem skyblue;
         border-radius: 12px;
         font: bold 1rem sans-serif;
         margin-top: 2rem;
         margin-bottom: 3rem;
         padding: 1.5rem;
         outline-offset: 0.5rem;
      }
      
        #mainNav {
            position: sticky;
        }
        .container form {
            margin: 20px 0;
        }
        .container form button{
            margin-bottom: 4px;
            margin-left: 4px;
        }
        
        button{
         width: 75px;
         height: 35px;
         color:#fff;
         background: #40ed82;
         font-size: 16px;
         border:none;
         border-radius: 20px;
         box-shadow: 0 4px 16px rgba(0,79,255,0.3);
      }

      button:hover{
         background: rgba(0,79,255,0.9);
         cursor: pointer;
         box-shadow: 0 2px 4px rgba(0,79,255,0.6);
      } */
    </style>
       
   </head>
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
	<br>
      <h2 style="text-align: center">공지사항 게시글 작성</h2>
      <hr />	
		<form method="POST" action="/notice/write">
			<p class="form-group">
				<label for="subject">제목</label> <input type="text"
					class="form-control" name="title" id="title" placeholder="제목을 입력하세요." />
			</p>
			<p class="from-group ">
				<label for="subject">내용</label> 
				<textarea class="form-control" rows="20" id="content" name="content" 
					class="form-control"
					placeholder="내용을 입력하세요.(시간, 장소, 진행 방식 등)"></textarea>
			</p>

			<p style="text-align: right;">
				<input type="submit" class="btn btn-primary pull-right" value="저장" />
		</form>
	</div>
	
	
	

        
<%--         <div class = "middle" style=" width:800px; height: 230px; ">
         <h2>공지사항 게시글 작성</h2>
         <hr />
         <center>
            <form class="writeView" method="post" action="/notice/write">
               <div class="form-group" style="width: 500px;">
                  <label for="title">제목</label><input type="text" id="title" name="title" />
               </div>
               <div class="form-group" style="width: 500px;">
                  <label for="content">내용</label><textarea id="content" name="content" ></textarea>
               </div>   
               <hr />      
               <button type="submit" >작성</button>
               
            </form>
            </center>
            
      </div>
 --%>   
 
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