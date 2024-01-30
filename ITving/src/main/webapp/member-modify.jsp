<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
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
	.join-page input {
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
	
	
	<c:if test="${pageContext.request.method == 'GET' }">
	
	<div class="join-page">
		<p>회원 정보 수정</p>
		<form method="POST" enctype="multipart/form-data">
			<p><input type="text" name="userid" placeholder="아이디" value="${login.userid }" required autofocus></p>
			<p><input type="password" name="userpw" placeholder="비밀번호" required></p>
			<p><input type="text" name="nickname" placeholder="닉네임" value="${login.nickname }" required></p>
			<p><input type="text" name="pnum" placeholder="휴대폰 번호" value="${login.pnum }" required></p>
			<p align="left">(-)를 제외한 번호를 입력하세요</p>
			<p>
				프로필 사진 : 
				<input type="file" name="image">
			</p>
			<p><input type="submit" value="회원 정보 수정"></p>
		</form>
	</div>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
	<c:set var="memberdto" value="${fileUtil.getMemberDTO(pageContext.request) }" />
	<c:set target="${memberdto }" property="idx" value="${login.idx }" />
	<c:set var="row" value="${memberDAO.update(memberdto) }" />
		<c:if test="${row != 0 }">
			<c:set var="login" value="${memberDAO.login(memberdto) }" scope="session" />
			<script>
				alert('수정 완료')
				location.href = '${cpath}/'
			</script>
		</c:if>
		<script>
			alert('수정 실패')
			history.go(-1)
		</script>
	</c:if>

</main>

</body>
</html>