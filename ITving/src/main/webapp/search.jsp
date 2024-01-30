<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.search-form {
		margin: 50px auto;
		width: 1000px;
		border-bottom: 3px solid #eee;
		position: relative;
	}
	.search-form input {
		border: none;
	}
	.search-form input[type="search"] {
		width: 880px;
		height: 60px;
		background-color: black;
		color: grey;
		padding: 5px 20px;
		font-size: 30px;
		font-weight: bolder;
	}
	.search-form input[type="search"]:focus {
		outline: none;
	}
	.search-form input[type="submit"] {
		width: 100px;
		height: 50px;
		background-color: black;
		font-size: 18px;
		font-weight: bold;
		position: absolute;
		color: grey;
		right: 10px;
		border: 3px solid grey;
		border-radius: 5px;
		transition-duration: 0.2s;
	}
	.search-form input[type="submit"]:hover {
		background-color: #212121;
		color: white;
		transition-duration: 0.2s;
		cursor: pointer;
	}
	.program-list {
		width: 1000px;
		margin: 50px auto;
	}
	.program-list-img > div > a > img {
     	transition-duration: 0.3s;
     }
     .program-list-img > div > a:hover > img {
     	transform: translate(0, -10px);
     	transition-duration: 0.3s;
     }
     .program-list-img > div {
     	text-align: center;
     	margin: 0 10px 50px 10px;
     }
    .program-list-img > div > a > img {
    	border-radius: 10px;
    	height: 330px;
    	
    }
    .program-list-img > div > p {
    	font-size: 18px;
    	font-weight: bold;
    }
</style>
</head>
<body>

<main class="frame">
	<div class="search-form">
		<form action="${cpath }/search.jsp?search=${search}">
			<input type="search" name="search" placeholder="검색어를 입력해보세요." required>
			<input type="submit" value="검색">
		</form>
	</div>
	
	<div class="program-list">
	<div class="flex wrap program-list-img">
	<c:if test="${not empty param.search }">
		<c:set var="list" value="${programDAO.selectList(param.search) }" />
		<c:forEach var="dto" items="${list }">
					<div><a href="${cpath }/board.jsp?idx=${dto.idx}">
						<img src="${cpath }/programImage/${dto.image}"
							 onerror="this.onerror=null; this.src='${cpath }/programImage/default.png';">
						</a>
						<p>${dto.title }</p>
					</div>
		</c:forEach>
	</c:if>
	</div>
	</div>
	
	
</main>

</body>
</html>