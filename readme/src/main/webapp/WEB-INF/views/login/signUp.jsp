<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../../resources/css/login.css">
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"   
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="   
	crossorigin="anonymous">
</script>

</head>
<body>

	<h1>This is signUp Page</h1>

	<form role = "form" name="loginForm" action="/member/insertMember"
		enctype="multipart/form-data" method="POST">


		<p>id</p>
		<input type="text" name="id" />
		
		<p>password</p>
		<input type="text" name="password" />
		
		<p>name</p>
		<input type="text" name="name" />
		
		<p>jumin</p>
		<input type="text" name="jumin" />
		
		<p>phone</p>
		<input type="text" name="phone" placeholder="010-1111-2222" />
		
		<p>Region</p>
		<input type="text" name="region" />
		
		<p>profileImg</p>
	 	<input type="file" id = "profileImg" name="profileImg" />
	 	<div class = "select_img"><img src = "" /></div> 	
	 	
	 	
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
 
	
		<input type="submit" value="signUp">
		
	</form>


	<!--
			<select>
				<option>����Ư����</option>
				<option>�λ걤����</option>
				<option>��⵵</option>
				<option>��û��</option>
				<option>���</option>
				<option>����</option>
				<option>���ֵ�</option>
			</select>
		<p>profileimg</p>
		 <input type="file" name="profileimg" accept="image/*"> -->



</body>
</html>