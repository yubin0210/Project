<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
/* 	#ff153c */
	h1 {
		width: 1000px;
		margin-right: 20px;
		font-size: 50px;
		word-break: break-word;
	}
	.boardFrame {
		width: 1200px;
		margin: 0 auto;
	}
	.name {
		font-size: 16px;
		font-weight: bold;
		margin-left: 5px;
	}
	.title {
		border-bottom: 2px solid #ff153c;
		padding: 10px;
	}
	div.title > div:nth-child(2) {
	
	}
	.profile {
		height: 20px;
		border-radius: 50px;
	}
	.content {
		height: 800px;
		padding: 20px;
		font-size: 20px;
		border-bottom: 2px solid #ff153c;
		margin-bottom: 10px;
	}
	.content > pre {
		word-break: break-word;
		line-height: 150%;
		white-space: pre-line;
	}
	.viewCount {
		font-size: 13px;
	}
	.replyWrite input[type="submit"] {
		border: none;
		height: 82px;
		width: 110px;
		background-color: #ff153c;
		color: white;
		font-weight: bold;
		font-size: 18px;
		border-radius: 5px;
		cursor: pointer;
		transition-duration: 0.3s;
	}
	.replyWrite input[type="submit"]:hover {
		background-color: red;
		transition-duration: 0.3s;
	}
	.replyBox {
		resize: none;
	}
	.replyContent{
		margin-top: 20px;
		border-bottom: 1px solid darkgray;
		padding: 10px;
		font-size: 15px;
	}
	.delete button {
		background-color: #gray;
		color: blak;
		font-weight: bold;
		margin-bottom: 10px;
	}
	.delete button:hover {
		cursor: pointer;
	}
</style>

<main class="boardFrame">
	<c:set var="row" value="${boardDAO.updateViewCount(param.idx) }" />
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />
	<c:set var="memberdto" value="${memberDAO.selectOne(dto.writer) }" />
			<div class="title sb">
				<div>
					<h1>${dto.title }</h1>
					<div class="flex">
						<div><img src="${cpath }/programImage/${memberdto.image}" class="profile"/></div>
						<div class="name">${memberdto.nickname }</div>
					</div>
				</div>
				<div>
					<p class="viewCount">조회수 : ${dto.viewCount }</p>
					<p>${dto.writeDate }</p>
				</div>
			</div>
			<div class="content">
				<c:if test="${not empty dto.image }">
					<img src="${cpath }/programImage/${dto.image }" class="contentImg"/>
				</c:if>
				<pre>${dto.content }</pre>
			</div>
			<div class="delete sb">
				<div>
					<c:if test="${login.userid == dto.writer}">
							<a href="${cpath }/board-delete.jsp?idx=${dto.idx}&proidx=${dto.program_idx}">
								<button>삭제</button>
							</a>
							<a href="${cpath }/board-modify.jsp?idx=${dto.idx}">
								<button>수정</button>
							</a>
					</c:if>
				</div>
				<div>
					<a href="${cpath}/board.jsp?idx=${dto.program_idx }"><button>목록으로</button></a>
				</div>
			</div>
			<div>
				<form method="POST" class="replyWrite">
					<input type="hidden" name="writer" value="${login.userid }">
					<input type="hidden" name="board_idx" value="${dto.idx }">
					<div class="sb">
						<div><textarea class="replyBox" name="content" rows="5" cols="150" required></textarea></div>
						<div><input type="submit" value="댓글작성"></div>
					</div>
				</form>
			</div>
		<c:if test="${pageContext.request.method == 'POST' }">
			<jsp:useBean id="reply" class="reply.ReplyDTO" />
			<jsp:setProperty property="*" name="reply"/>
			<c:set var="row" value="${replyDAO.insert(reply) }" />
		</c:if>
		<c:set var="list" value="${replyDAO.selectList(param.idx) }"></c:set>
		<h2>댓글</h2>
		<c:forEach var="dto" items="${list }">
			<div class="replyContent sb">
				<div>
					<pre>${dto.writer }</pre>
					<pre>${dto.content }</pre>
				</div>
				<div>
					<pre>${dto.writeDate }</pre>
				</div>
			</div>
		</c:forEach>
</main>
</body>
</html>