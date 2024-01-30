<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.mypage-bt {
    	justify-content: center;
    }
    .mypage-bt button {
    	all: unset;
		width: 300px;
		height: 60px;
		border: 4px solid grey;
		background-color: #212121;
		margin: 50px 60px;
		text-align: center;
		border-radius: 10px;
		font-size: 25px;
		font-weight: bold;
		transition-duration: 0.3s;
    }
    .mypage-bt a:hover > button {
    	background-color: white;
    	color: #212121;
    	transition-duration: 0.3s;
    }
    .mypage-list table {
    	width: 1200px;
    	border-collapse: collapse;
    	margin: 10px auto 100px auto;
    }
    .mypage-list th, td {
    	border-bottom: 1px solid white;
    	padding: 10px 20px;
    }
    .mypage-list thead {
    	height: 60px;
    	border: none;
    	background-color: #ff153c;
    	font-size: 20px;
    	border: 2px solid #ff153c;
    }
    .mypage-list tr > td:first-child {
    	font-size: 20px;
    	font-weight: bold;
    }
    .mypage-list td > a > button {
    	all: unset;
    	border: 1px solid #ff153c;
    	width: 50px;
    	text-align: center;
    	color: ff153c;
    	border-radius: 5px;
    	padding: 10px;
    	transition-duration: 0.3s;
    }
    .mypage-list td > a:hover > button {
    	background-color: #ff153c;
    	color: white;
    	transition-duration: 0.3s;
    }
    .mypage-list tbody > tr {transition-duration: 0.3s;}
    .mypage-list tbody > tr:hover {
    	background-color: #212121;
    	transition-duration: 0.3s;
    }
    .bgcolor1 > a > button {
    	background-color: white;
    	color: #212121;
    }
    .bgcolor2 > a > button {
    	background-color: #212121;
    }
    .reply-list-tr > td {
    	height: 43px;
    	text-align: center;
    }
    .mypage-box {
    	margin: 30px;
    }
    .mypage-box > div {
    	margin: 0 100px;
    }
    .mypage-box-nickname {
    	font-size: 30px;
    	font-weight: bold;
    	text-align: center;
    	padding: 30px 0;
    }
    .mypage-box-info {
    	justify-content: center;
    	margin-top: 20px;
    }
    .mypage-box-info > div {
    	margin: 0 50px;
    }
    .mypage-box-info > div:nth-child(2) {
    	padding-top: 20px;
    }
    .mypage-box-info p {
    	font-size: 20px;
    }
    .mypage-box-info a > button {
    	border: 4px solid grey;
    	border-radius: 5px;
    	font-size: 15px;
    	padding: 6px;
    	width: 120px;
    	background-color: #eee;
    	transition-duration: 0.3s;
    	cursor: pointer;
    }
    .mypage-box-info a:hover > button {
    	background-color: #212121;
    	color: white; 
    	transition-duration: 0.3s;
    }
    .mypage-box-info > div > img {
    	border: 2px solid #212121;
    	border-radius: 5px;
    }
</style>
</head>
<body>

<!-- 내가 쓴 글, 내가 쓴 댓글, 회원 정보, 회원탈퇴 -->

<main class="frame">
	<div class="mypage-box">
		<div class="mypage-box-nickname">안녕하세요! ${login.nickname }님♥</div>
		<div class="flex mypage-box-info">
			<div>
				<img src="${cpath }/programImage/${login.image }">
			</div>
			<div>
				<p>아이디 : ${login.userid }</p>
				<p>비밀번호 : ${login.userpw }</p>
				<p>닉네임 : ${login.nickname }</p>
				<p>휴대폰 번호 : ${login.pnum }</p>
				
				<div>
					<a href="${cpath }/member-modify.jsp"><button>정보수정</button></a>
					<a href="${cpath }/member-delete.jsp"><button>회원탈퇴</button></a>
				</div>
			</div>
		</div>
	</div>
	
	
	

	<div>
		<div class="mypage-bt flex">
			<div class="${param.list == 'program' ? 'bgcolor1' : 'bgcolor2'}">
				<a href="${cpath }/mypage.jsp?list=board">
					<button>내가 쓴 글 목록</button>
				</a>
			</div>
			<div class="${param.list == 'member' ? 'bgcolor1' : 'bgcolor2'}">
				<a href="${cpath }/mypage.jsp?list=reply">
					<button>내가 쓴 댓글 목록</button>
				</a>
			</div>
		</div>
	<c:if test="${param.list == 'board'}">
	<div class="mypage-list">
		<table>
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="30%">게시판</th>
					<th width="40%">게시글 제목</th>
					<th width="10%">조회수</th>
					<th width="10%">삭제</th>
				</tr>
			</thead>
			<tbody>
			
			<c:set var="list" value="${boardDAO.selectWriterList(login.userid) }" />
			<c:forEach var="dto" items="${list }">
			<c:set var="programdto" value="${programDAO.selectOne(dto.program_idx) }" />
				<tr>
					<td align="center">${dto.idx }</td>
					<td align="center">${programdto.title }</td>
					<td align="center"><a href="${cpath }/view.jsp?idx=${dto.idx}">${dto.title }</a></td>
					<td align="center">${dto.viewCount }</td>
					<td><a href="${cpath }/board-delete.jsp?idx=${dto.idx}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	</c:if>
	
	
	<c:if test="${param.list == 'reply'}">
		<div class="mypage-list">
		<table>
			<thead>
				<tr>
					<th width="10%">No</th>
					<th width="20%">게시판</th>
					<th width="30%">게시글 제목</th>
					<th width="40%">댓글내용</th>
					
				</tr>
			</thead>
			<tbody>
			<c:set var="list" value="${replyDAO.selectWriterList(login.userid) }" />
			<c:forEach var="dto" items="${list }" varStatus="status">
				<c:set var="replydto" value="${replyDAO.selectOne(dto.idx) }" />
				<c:set var="boarddto" value="${boardDAO.selectOne(replydto.board_idx) }" />
				<c:set var="programdto2" value="${programDAO.selectOne(boarddto.program_idx) }" />
				<tr class="reply-list-tr">
					<td>${status.index +1 }</td>
					<td>${programdto2.title }</td>
					<td><a href="${cpath }/view.jsp?idx=${boarddto.idx}">${boarddto.title }</a></td>
					<td>${replydto.content }</td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
	</c:if>
	</div>
	
</main>


</body>
</html>