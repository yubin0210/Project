<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.main-image {
        position: relative;
        height: 700px;
        margin-top: 5px;
     }
     .main-image > div > a > img {
     	width: 1700px;
     	border-radius: 15px;
     }
     .item {
        position: absolute;
        transition-duration: 3s;
    }
	 .program-top5 {
     	margin: 50px 0 90px 0;
     }
     .program-top5 > p{
     	font-weight: bold;
     	font-size: 20px;
     }
     .program-top5 > div > div {
     	flex: 1;
     	text-align: center;
     }
     .program-top5-img {
     	position: relative;
     	z-index: 1;
     }
     .rankNum {
    	position: absolute;
    	bottom: -45px;
    	left: -30px;
    	z-index: 5;
    	font-size: 200px;
    	font-family: fantasy;
    	color: #eee;
     }
     .program-list > div > div {
     	font-weight: bold;
     	font-size: 20px;
     }
     .program-list  > div:first-child {
     	margin: 20px 0;
     }
     .program-list-arrbt > div {
    	margin: 0 6px;
     }
     .program-list-arrbt > div > a:hover {
     	color: #ff153c;
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
    	height: 320px;
    }
</style>
</head>
<body>

<main class="frame">
	<div class="program-top5">
		<p>오늘의 ${param.category } TOP 5</p>
		
		<div class="flex">
			<c:set var="recommendlist" value="${recommendDAO.selectTopProgramCategory(param.category) }" />
			<c:forEach var="recommenddto" items="${recommendlist }" varStatus="status">
				<c:set var="programdto" value="${programDAO.selectOne(recommenddto.idx) }"/>
				
				<div class="program-top5-img">
					<a href="${cpath }/board.jsp?idx=${programdto.idx}"><img src="${cpath }/programImage/${programdto.image}" 
						height="320px" style="border-radius: 10px;"
						 onerror="this.onerror=null; this.src='${cpath }/programImage/default.png';"></a>
					<div class="rankNum">${status.index +1}</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div class="program-list">
	
		<div class="sb">
			<div>${param.category } 목록</div>
			<div class="flex program-list-arrbt" id="arr-bt">
				<div><a href="${cpath }/program-view.jsp?category=${param.category }&str=likecount#arr-bt">좋아요순</a></div>
				<div style="color: grey;"> | </div>
				<div><a href="${cpath }/program-view.jsp?category=${param.category }&str=idx#arr-bt">최신순</a></div>
			</div>
		</div>
		
		
		<div class="flex wrap program-list-img">
			<c:if test="${empty param.str }">
				<c:set var="list" value="${programDAO.selectCategoryList(param.category) }" />
				<c:forEach var="dto" items="${list }">
					<div><a href="${cpath }/board.jsp?idx=${dto.idx}"><img src="${cpath }/programImage/${dto.image}"></a></div>
				</c:forEach>
			</c:if>
			
			<c:if test="${not empty param.str }">
				<c:set var="idxlist" value="${recommendDAO.selectOrderByCategoryCount(param.category, param.str) }" />
				<c:forEach var="idxdto" items="${idxlist }">
					<c:set var="programcategorydto" value="${programDAO.selectOne(idxdto.idx) }" />
					<div><a href="${cpath }/board.jsp?idx=${categorydto.idx}"><img src="${cpath }/programImage/${programcategorydto.image}"></a></div>
				</c:forEach>
			</c:if>
		</div>
		
	</div>
	
	
</main>

</body>
</html>






















