<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.admin-page {
    	justify-content: center;
    }
    .admin-page button {
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
    .admin-page a:hover > button {
    	background-color: white;
    	color: #212121;
    	transition-duration: 0.3s;
    }
    .admin-list table {
    	width: 1200px;
    	border-collapse: collapse;
    	margin: 10px auto 100px auto;
    }
    .admin-list th, td {
    	border-bottom: 1px solid white;
    	padding: 10px 20px;
    }
    .admin-list thead {
    	height: 60px;
    	border: none;
    	background-color: #ff153c;
    	font-size: 20px;
    	border: 2px solid #ff153c;
    }
    .admin-list tr > td:first-child {
    	font-size: 20px;
    	font-weight: bold;
    }
    .admin-list td > a > button {
    	all: unset;
    	border: 1px solid #ff153c;
    	width: 50px;
    	text-align: center;
    	color: ff153c;
    	border-radius: 5px;
    	padding: 10px;
    	transition-duration: 0.3s;
    }
    .admin-list td > a:hover > button {
    	background-color: #ff153c;
    	color: white;
    	transition-duration: 0.3s;
    }
    .admin-list tbody > tr {transition-duration: 0.3s;}
    .admin-list tbody > tr:hover {
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
    .member-list-tr > td {
    	text-align: center;
    }
    
    
</style>
</head>
<body>

<main class="frame">
	<div class="admin-page flex">
		<div class="${param.list == 'program' ? 'bgcolor1' : 'bgcolor2'}">
			<a href="${cpath }/admin.jsp?list=program">
				<button>프로그램 목록 보기</button>
			</a>
		</div>
		<div class="${param.list == 'member' ? 'bgcolor1' : 'bgcolor2'}">
			<a href="${cpath }/admin.jsp?list=member">
				<button>회원 목록 보기</button>
			</a>
		</div>
		<div><a href="${cpath }/program-add.jsp"><button>프로그램추가</button></a></div>
	</div>
	<c:if test="${param.list == 'program'}">
	<div class="admin-list">
		<table>
			<thead>
				<tr>
					<th width="10%">Idx</th>
					<th width="70%">프로그램 이름</th>
					<th colspan="2" width="20%">수정 및 삭제</th>
				</tr>
			</thead>
			<tbody>
			
			<c:set var="list" value="${programDAO.selectList() }" />
			<c:forEach var="dto" items="${list }">
				<tr>
					<td align="center">${dto.idx }</td>
					<td>${dto.title }</td>
					<td><a href="${cpath }/program-modify.jsp?idx=${dto.idx}"><button>수정</button></a></td>
					<td><a href="${cpath }/program-delete.jsp?idx=${dto.idx}"><button>삭제</button></a></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
	</div>
	</c:if>
	<c:if test="${param.list == 'member'}">
		<div class="admin-list">
		<table>
			<thead>
				<tr>
					<th width="5%">Idx</th>
					<th width="20%">아이디</th>
					<th width="20%">비밀번호</th>
					<th width="20%">닉네임</th>
					<th width="20%">휴대폰번호</th>
					<th width="15%">회원 탈퇴</th>
				</tr>
			</thead>
			<tbody>
			
			<c:set var="list" value="${memberDAO.selectList() }" />
			<c:forEach var="dto" items="${list }">
				<tr class="member-list-tr">
					<td>${dto.idx }</td>
					<td>${dto.userid }</td>
					<td>${dto.userpw }</td>
					<td>${dto.nickname }</td>
					<td>${dto.pnum }</td>
					<td><a href="${cpath }/member-delete.jsp?idx=${dto.idx}"><button>탈퇴</button></a></td>
				</tr>
			</c:forEach>
			
			</tbody>
		</table>
		</div>
	</c:if>
</main>

</body>
</html>