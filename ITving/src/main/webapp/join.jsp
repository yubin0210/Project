<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, program.*, recommend.*, reply.*, fileUtil.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="programDAO" value="${ProgramDAO.getInstance() }" />
<c:set var="recommendDAO" value="${RecommendDAO.getInstance() }" />
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />


<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITving login</title>
<style>
	body {
		margin: 0;
		background-color: black;
		color: white;
	}
	a {
		text-decoration: none;
		color: inherit;
	}
	.frame {
		width: 1700px;
		margin: 0 auto;
	}
	.sb {
		display: flex;
		justify-content: space-between;
	}
	.logo-img {
		margin: 30px;
	}
	.join-page {
		position: fixed;
		top : 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.join-pnum > p,
	.join-page > form > p {
		text-align: center;
	}
	input {
		width: 450px;
		height: 60px;
		font-size: 20px;
	}
	input[type="text"],
	input[type="password"] {
		padding: 2px 15px;
		background-color: #212121;
		border: none;
		border-radius: 2px;
		color: white;
	}
	input[type="submit"] {
		width: 480px;
		border: none;
		background-color: #FF153C;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		transition-duration: 0.3s;
	}
	input[type="submit"]:hover {
		background-color: red;
		transition-duration: 0.3s;
	}
	.search-idpw {
		display: flex;
		justify-content: center;
		color: grey;
	}
	.search-idpw > div {
		margin: 0 10px;
		color: #dadada;
	}
	.search-idpw > div > a:hover {
		color: white;
	}
	.join-button {
		margin-top: 50px;
	}
	.join-button > p > a > button {
		text-decoration: none;
		border: 1px solid #FF153C;
		width: 480px;
		height: 60px;
		background-color: black;
		color: #FF153C;
		font-size: 20px;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		transition-duration: 0.3s;
	}
	.join-button > p > a:hover > button {
		background-color: red;
		color: white;
		transition-duration: 0.3s;
	}
	.join-page > p {
		text-align: center;
		font-size: 40px;
		font-weight: bolder;
	}
}
</style>
</head>
<body>

<main class="frame">
	<div class="sb logo-img">
		<div><img src="${cpath }/image/logo.png" width="200px"></div>
		<div></div>
	</div>
	
	
	<c:if test="${pageContext.request.method == 'GET' }">
	
	<div class="join-page">
		<p>ITVING 회원가입</p>
		<form method="POST" enctype="multipart/form-data">
			<p><input type="text" name="userid" placeholder="아이디" required autofocus></p>
			<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
			<p><input type="text" name="nickname" placeholder="닉네임" required></p>
			<p><input type="text" name="pnum" placeholder="휴대폰 번호" required></p>
			<p align="left">(-)를 제외한 번호를 입력하세요</p>
			<p>
				프로필 사진 : 
				<input type="file" name="image">
			</p>
			<p><input type="submit" value="회원가입"></p>
		</form>
	</div>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="dto" value="${fileUtil.getMemberDTO(pageContext.request) }" />
	<c:set var="row" value="${memberDAO.insert(dto) }" />
		<c:if test="${row != 0 }">
			<script>
				alert('회원가입 성공')
				location.href = '${cpath}/'
			</script>
		</c:if>
		<script>
			alert('회원가입 실패')
			history.go(-1)
		</script>
	</c:if>

</main>

</body>
</html>