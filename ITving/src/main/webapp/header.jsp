<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="member.*, board.*, program.*, recommend.*, reply.*, fileUtil.*, video.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<c:set var="cpath" value="${pageContext.request.contextPath }" />
<c:set var="memberDAO" value="${MemberDAO.getInstance() }" />
<c:set var="boardDAO" value="${BoardDAO.getInstance() }" />
<c:set var="programDAO" value="${ProgramDAO.getInstance() }" />
<c:set var="recommendDAO" value="${RecommendDAO.getInstance() }" />
<c:set var="replyDAO" value="${ReplyDAO.getInstance() }" />
<c:set var="videoDAO" value="${VideoDAO.getInstance() }" />
<c:set var="fileUtil" value="${FileUtil.getInstance() }" />


<% request.setCharacterEncoding("UTF-8"); %>
<% response.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ITving</title>
<style>
	body {
		margin: 0;
		background-color: black;
		color: white;
	}
	ol, ul, li {
		list-style: none;
	}
	a {
		color: inherit;
		text-decoration: none;
	}
	.frame {
		width: 1700px;
		margin: 0 auto;
	}
	.sb {
		display: flex;
		justify-content: space-between;
	}
	header {
		background-color: black;
		height: 80px;
		color: white;
		position: fixed; 
		top: 0;
 		width: 100%;
		z-index: 3; 
	}	
	.margin {
		margin-top: 80px;
	}
	.flex {
		display: flex;
	}
	.nav-bar > div {
		margin: 0 20px;
		text-align: center;
		line-height: 70px;
		font-size: 20px;
		font-weight: bold;
	}
	
	<!-- 아래로 내가 한 style -->
	
	textarea {
		resize: none;
	}
	.wrap {
		flex-flow: wrap;
	}
	.nav-bar-profile {
		width: 100px;
	}
	.nav-bar-profile > div > a > img {
		margin-top: 10px;
		width: 30px;
	}
    .profile-img > img {
    	border-radius: 15px;
    	height: 40px;
    	position: relative;
    }
    .profile-img {
    	position: relative;
    }
    .profile-img > ul {
    	border: 1px solid grey;
    	display: none;
    	position: absolute;
    	background-color: black;
    	padding-left: 0;
    	width: 300px;
    	left: -200px;
    }
    .profile-img:hover > ul {
    	display: block;
    	z-index: 100;
    }
    .profile-img:hover > img {
    	cursor: pointer;
    }
    .profile-img ul > li {
    	text-align: center;
    	width: 300px;
    }
    .profile-img ul > li:first-child > div{
    	font-size: 20px;
    	font-weight: bold;
    	text-align: center;
    	height: 30px;
    	padding: 10px;
    	padding-top: 20px;
    }
    .profile-img ul > li > a{
    	display: block;
    	width: 100%;
    	height: 100%;
    	padding: 20px;
    }
    .profile-img ul > .profile-img-bt:hover {
    	background-color: #212121;
    }
    .profile-img ul > li > img {
    	height: 80px;
    }
  	.profile-img-bt {
		margin-right: 20px;
  	}
    
</style>
</head>
<body>

<header>
	<nav class="sb frame">
		<div class="sb">
			<a href="${cpath }"><img src="image/logo.png" height="65px" style="margin-top: 10px;"></a>
			<div class="flex nav-bar">
				<div><a href="${cpath }/program-view.jsp?category=영화">영화</a></div>
				<div><a href="${cpath }/program-view.jsp?category=드라마">드라마</a></div>
				<div><a href="${cpath }/program-view.jsp?category=예능">예능</a></div>
				<div><a href="${cpath }/program-view.jsp?category=애니메이션">애니메이션</a></div>
				
				<c:if test="${login.userid == 'admin' }">
					<div><a href="${cpath }/admin.jsp">관리자페이지</a></div>
				</c:if>
			</div>
		</div>
		
		
		<div class="sb nav-bar-profile">
			<div><a href="${cpath }/search.jsp">
				<img src="https://www.tving.com/img/icon_search.svg" bgcolor="black">
			</a></div>
			<div class="profile-img">
				<img src="${cpath }/programImage/${login.image}">
				<ul>
					<li><div>${login.nickname }님♥</div> <img src="${cpath }/programImage/${login.image}"></li>
					<li class="profile-img-bt"><a href="${cpath }/mypage.jsp">마이페이지</a></li>
					<li class="profile-img-bt"><a href="${cpath }/logout.jsp">로그아웃</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
</header>
<div class="margin"></div>

</body>
</html>