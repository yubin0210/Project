<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<style>
	.write-frame {
		width: 1300px;
		margin: 0 auto;
	}
	.box {
		border-top: 2px solid #ff153c; 
	}
	.title {
		color: white;
		font-size: 35px;
		margin-top: 30px;
		background-color: black;
		border:none;
		height: 50px;
		width: 100%;
		border-bottom: 1px solid darkgray;
	}
	.title::placeholder {
		color: gray;
		font-size: 35px;
	}
	.title:focus {
		outline:none;
	}
	.content {
		color: white;
		font-size: 20px;
		resize: none;
		background-color: black;
		border: none;
		height: 500px;
		width: 100%;
		border-bottom: 2px solid #ff153c;
	}
	.content::placeholder {
		color: gray;
		font-size: 20px;
	}
	.content:focus {
		outline:none;
	}
	input[type="submit"] {
		height: 50px;
		width: 300px;
		border: none;
		background-color: #FF153C;
		color: white;
		font-weight: bold;
		border-radius: 5px;
		cursor: pointer;
		transition-duration: 0.3s;
		margin-left: 741px;
		margin-bottom: 50px;
	}
	input[type="submit"]:hover {
		background-color: red;
		transition-duration: 0.3s;
	}
	
</style>

<main class="write-frame">
	<c:set var="dto" value="${boardDAO.selectOne(param.idx) }" />
	<c:if test="${pageContext.request.method == 'GET' }">		
		<div>
			<h1>게시글 수정</h1>
			<div class="box">
				<form method="POST" enctype="multipart/form-data">
					<div>
						<input type="hidden" name="program_idx" value="${dto.program_idx }">
						<input type="hidden" name="idx" value="${dto.idx }">
						<p><input type="text" name="title" placeholder="제목" class="title" value="${dto.title }"></p>
						<p><textarea name="content" placeholder="내용" class="content">${dto.content }</textarea></p>
					</div>
					<div>
						<input type="file" name="uploadFile">
						<input type="submit" value="수정완료">
						<input type="hidden" name="writer" value="${login.userid }">
					</div>
				</form>
			</div>
		</div>
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="dto" value="${fileUtil.getBoardDTO(pageContext.request) }" />
		<c:set var="row" value="${boardDAO.update(dto) }" />
		<c:if test="${row != 0 }" >
			<script>
				alert('게시글 수정 완료!')
				location.href = '${cpath}/board.jsp?idx=${dto.program_idx }'
			</script>
		</c:if>
		<script>
			alert('게시글 수정 실패')
			history.go(-1)
		</script>
	</c:if>
</main>

</body>
</html>