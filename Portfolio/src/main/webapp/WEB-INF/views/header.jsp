<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="cpath" value="${pageContext.request.contextPath }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header.jsp</title>

<!-- Font Awesome CSS for icons -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap"
	rel="stylesheet">

<style>
/* 전체 페이지 스타일 */
body {
	font-family: 'Poppins', sans-serif; /* Google Fonts로 변경 */
	margin: 0;
	padding: 0;
	height: 1000px;
	background-color: #f0f4f8; /* 밝은 회색 배경 */
	color: #333; /* 기본 텍스트 색상 */
	transition: background-color 0.5s ease;
}

/* 헤더 스타일 */
header {
	background-color: #292b2c; /* 어두운 회색 */
	color: #fff;
	padding: 20px;
	text-align: center;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* 헤더에 그림자 추가 */
}

header h1 a {
	text-decoration: none;
	color: #fff;
}
/* 네비게이션 스타일 */
nav ul {
	list-style-type: none;
	padding: 0;
	display: flex;
	justify-content: center;
	margin: 0;
}

nav ul li {
	margin: 0 15px;
}

nav ul li a {
	color: #fff;
	text-decoration: none;
	font-weight: 600; /* 좀 더 두꺼운 폰트 */
}

nav ul li a:hover {
	text-decoration: underline;
	color: #d1eaff; /* 블루 색상으로 변경 */
}
</style>

<script>
	// 배경색을 시간대에 따라 변경
	var currentHour = new Date().getHours();
	if (currentHour < 12) {
		document.body.style.backgroundColor = "#e0f7fa"; // 오전: 밝은 청록색
	} else if (currentHour < 18) {
		document.body.style.backgroundColor = "#ffecb3"; // 오후: 밝은 노란색
	} else {
		document.body.style.backgroundColor = "#cfd8dc"; // 저녁: 밝은 회색
	}
</script>

</head>
<body>

	<header>
		<nav>
			<ul>
				<li><a href="${cpath}/">Home</a></li>
				<li><a href="${cpath}/about">About Me</a></li>
				<li><a href="${cpath}/skills">Skills</a></li>
				<li><a href="${cpath}/projects">Project Experience</a></li>
			</ul>
		</nav>
		<h1>
			<a href="${cpath}/">Yubin's portfolio</a>
		</h1>

	</header>
</body>
</html>