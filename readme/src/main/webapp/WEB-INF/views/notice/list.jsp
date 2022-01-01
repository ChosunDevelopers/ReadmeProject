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
       <script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
    
       <title>공지사항</title>
       
       <style>
       
       .middle {
        position: absolute; left: 50%; top: 60%; 
        transform: translate(-50%, -50%); text-align: center;
        background: white;
      }
      
      .listButton{
         background-color : white;
         border : 2px solid #1ABC9C;
         width : 80px;
         height : 35px;
         border-radius:8px;
         color : #1ABC9C;
         margin-bottom: 4rem;
      }
      
      #map {
         border: 3px solid green; 
         margin-bottom: 1rem;
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
 
         <div class = "middle">
      
         <header>
            <h1>공지사항</h1>
         </header>
         <hr />

	<form name="noticelist" method="post" action="/notice/write">
		<table class="table text-center table-bordered table-hover">
			<thead>
				<tr>
					<td>번호</td>
					<td>아이디</td>
					<td>제목</td>
					<td>등록일</td>
				</tr>
			</thead>
			<tbody>
               <c:forEach items="${list}" var = "list">
                  <tr>
                     <td><c:out value="${list.bno}"/></td>
                     <td>readme@readme.com</td>
                     <td>
                        <a href="noticedetail.do?bno=${list.bno }">
                        	<c:out value="${list.title}" />
                        </a>
                     </td>
                     <%-- <td><c:out value="${list.content}" /></td> --%>
                     <%-- <td><c:out value='${loginID }' /></td> --%>
                     <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                  </tr>
               </c:forEach>				
			</tbody>
		</table>
	</form>
	<hr>
         <c:if test="${loginID == 'readme@readme.com'}">
            <button class = "listButton"><a href = "./writeView">작성</a></button>
         </c:if>	




<%--         
            <form name="noticelist" method="post" action="/notice/write">
               <table style="width: 800px;">
                  <tr><th>번호</th><th>제목</th><!-- <th>내용</th> <th>작성자</th>--><th>등록일</th></tr>
                  
                  <c:forEach items="${list}" var = "list">
                     <tr>
                        <td><c:out value="${list.bno}" /></td>
                        <td>
                           <a href="noticedetail.do?bno=${list.bno }">
                           <c:out value="${list.title}" />
                           </a>
                        </td>
                        <td><c:out value="${list.content}" /></td>
                        <td><c:out value='${loginID }' /></td>
                        <td><fmt:formatDate value="${list.regdate}" pattern="yyyy-MM-dd"/></td>
                     </tr>
                  </c:forEach>
               </table>
            </form>
         <hr />
         <c:if test="${loginID == 'dog@naver.com'}">
            <button class = "listButton"><a href = "./writeView">작성</a></button>
         </c:if>
--%>
     
      
      <div id="map" style="width:800px;height:400px;text-align: center;">
      <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=201bfd1caaf16ce867a43d713727a9d8"></script>
      <script>
         
         var container = document.getElementById('map'); 
         var options = { 
            center: new kakao.maps.LatLng(37.47906033318788,  127.03731765117556), 
            level: 3 
         };
         
         var map = new kakao.maps.Map(container, options); 
         
         // 마커 표시될 위치
         var markerPosition  = new kakao.maps.LatLng(37.47906033318788,  127.03731765117556); 

         // 마커 생성
         var marker = new kakao.maps.Marker({
             position: markerPosition
         });

         // 마커가 지도 위에 표시되도록 설정
         marker.setMap(map);
         
      </script>
      
      </div>
            한국 IT 직업전문학교
      서울 서초구 강남대로 27길 15-5 성경빌딩
      </div>

<!--         Footer
        
        <footer class="footer text-center">
            <div class="container">
                <div class="row">
                    Footer Location
                    <div class="col-lg-4 mb-5 mb-lg-0">
                        <h4 class="text-uppercase mb-4">Location</h4>
                        <p class="lead mb-0">
                            한국 IT 직업전문학교
                            <br />
                            서울 서초구 강남대로 27길 15-5 성경빌딩
                        </p>
                    </div>
                    Footer Social Icons
                    Footer 팀원 찾기 Text
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
        </footer>    -->
   </body>
</html>