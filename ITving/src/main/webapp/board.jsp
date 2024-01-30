<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	button.write {
		background-color: #eee;
		width: 200px;
		height: 50px;
		font-size: 20px;
		font-weight: bold;
		border: none;
		border-radius: 5px;
		margin-bottom: 5px;
	}
	button.write:hover {
		background-color: grey;
		cursor: pointer;
	}
	table {
		border: 1px solid black;
		border-collapse: collapse;
		border-radius: 10px;
		background-color: #black;
		width: 1700px;
	}
	tr, th, td {
		color: white;
	}
	tr {
		height: 50px;
	}
	h2 {
		color: black;
	}
 	thead > tr { 
 		border-bottom: 1px solid white; 
 	} 
	thead > tr > th {
		background-color: #ff153c;
	}
	tbody > tr:hover {
		background-color: #212121;
	}
	.mainImg {
		height: 500px;
	}

	.top {
		width: 100%;
		margin-left: 40px;
	}
	.content {
		height: 160px;
		padding: 10px;
		font-size: 20px;
	}
	.content > pre {
		font-family: sans-serif;
		word-break: break-word;
		line-height: 150%;
		white-space: pre-line;
	}
	p {
		font-size: 20px;
	}
	.head {
		border-bottom: 1px solid white;
		margin-bottom: 20px;
	}
	<!-- 20240116 임시 -->
	.black {
		background-color: #212121;
		color: white;
	}
	.white {
		background-color: #ff153c;
		color: white;
	}
	#likebt {
		padding: 5px;
		font-size: 40px;
	}
	#likebt:focus {
		outline:none;
	}
	.video > iframe {
		width: 400px;
		height: 300px;
	}
	.title > a {
		display: block;
		width: 100%;
		height: 100%;
	}
	.title:hover {
		cursor: pointer;
	}
	.likeCount {
		font-size: 30px;
		margin-top: 16px;
	}
</style>

<c:set var="list" value="${boardDAO.selectList(param.idx) }" />
<c:set var="programdto" value="${programDAO.selectOne(param.idx) }" />

<main class="frame">
	<div class="head frame flex">
		<div>
			<img src="${cpath }/programImage/${programdto.image}" class="mainImg">
		</div>
		<div class="top">
			<div class="sb">
				<c:set var="videoList" value="${videoDAO.selectList(param.idx) }" />
				<c:forEach var="video" items="${videoList }">
					<div class="video">
						${video.link }
					</div>
				</c:forEach>
			</div>
			<div class="like-button flex    ">
				<c:set var="recommenddto" value="${recommendDAO.selectOne(login.userid, 'program', programdto.idx) }" />
				<c:if test="${empty recommenddto}">
					<c:set var="row" value="${recommendDAO.insert(login.userid, 'program', programdto.idx) }" />
					<c:set var="recommenddto" value="${recommendDAO.selectOne(login.userid, 'program', programdto.idx) }" />
				</c:if>				
				<a href="${cpath }/like.jsp?idx=${recommenddto.idx}" id="likebt">
					${recommenddto.isLike == 0 ? '🤍': '💛'}
				</a>
				<c:set var="likedto" value="${recommendDAO.selectProgramCount(param.idx) }" />
           		<div class="likeCount">${likedto.likeCount }</div>
			</div>
			<div class="content">
				<pre>${programdto.content }</pre>
			</div>
		</div>
	</div>
	<a href="${cpath }/write.jsp?idx=${programdto.idx}"><button class="write">글쓰기</button></a>
	<table id="boardList">
		<thead>
			<tr>
				<th width="10%">No</th>
				<th width="50%">제목</th>
				<th width="20%">작성자</th>
				<th width="10%">조회수</th>
				<th width="10%">작성날짜</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="dto" items="${list }">
				<tr>
					<th width="10%">${dto.idx }</th>
					<th width="50%" class="title">
						<a href="${cpath }/view.jsp?idx=${dto.idx}">
						${dto.title }
						</a>
					</th>		
					<th width="20%">${dto.writer }</th>
					<th width="10%">${dto.viewCount }</th>
					<th width="10%">${dto.writeDate }</th>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		
	</div>
</main>
</body>
</html>