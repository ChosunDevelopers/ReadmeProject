<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function doing(){
	const test = document.getElementById("profieImgTest");
	test.innerHTML = "${myProfile.profileImg}";
	
	var path = "../../resources" + "${myProfile.profileImg}";
 	var target = document.getElementById("profileImg");
 	target.src = path;
}
</script>
</head>
<body>
<h1> This is MyProfile Page</h1>
<button onClick = "doing()">Click this</button>
<p id = "profieImgTest">a</p>
<img id = "profileImg" src = "" alt = "no Image Founds"></img>
<img src = "s"></img>
<p>
name : ${myProfile.name}</p>
<p>
jumin : ${myProfile.jumin}</p>
<p>
phone : ${myProfile.phone}</p>
<p>
region : ${myProfile.region}</p>
<p>
profileImg : ${myProfile.profileImg}</p>
<p>
profileThumbImg : ${myProfile.profileThumbImg}</p>
<p>
<hr/>
comment : ${myProfile.comment}</p>
<p>
url : ${myProfile.url}</p>
<p>
portfolio_name : ${myProfile.portfolio_name}</p>
<p>
portfolio_path : ${myProfile.portfolio_path}</p>




</body>
</html>