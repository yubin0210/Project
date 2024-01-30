<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>

<style>
	.program-add-form {
		position: fixed;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
	}
	.program-add-form > div {
		margin:0;
	}
	.program-add-form > div > p > select {
		width: 300px;
		padding: 10px;
		border: 1px solid #999;
		background-color: #eee;
		border-radius: 0px;
		font-size: 17px;
		font-weight: bold;
	}
	
	.program-add-from-text {
		font-size: 20px;
		font-weight: bold;
	}
	.program-add-form input[type="text"] {
		font-size: 17px;
		font-weight: bold;
		background-color: #eee;
		border: 1px solid #999;
		padding: 10px;
		width: 280px;
	}
	.program-add-form input[type="file"] {
		font-size: 15px;
	}
	.program-add-form textarea {
		resize: none;
		font-size: 17px;
		font-family : Nanumgothic, "맑은고딕", sans-serif;
		padding: 10px 15px;
		background-color: #eee;
		border-radius: 5px;
	}
	.program-add-form input[type="submit"] {
		width: 500px;
		height: 60px;
		background-color: #ff153c;
		color: white;
		font-size: 20px;
		font-weight: bold;
		border: none;
		border-radius: 5px;
		margin-top: 15px;
	}
	.program-add-form input[type="submit"]:hover {
		background-color: red;
		cursor: pointer;
	}
</style>

<main class="frame">
	<c:if test="${pageContext.request.method == 'GET' }">
	<c:set var="dto" value="${programDAO.selectOne(param.idx) }" />
	
	<form method="POST" enctype="multipart/form-data" class="program-add-form">
		<div><h1>프로그램 수정</h1></div>
		<hr>
		<br>
		<div class="sb">
			<p class="program-add-from-text">카테고리 선택</p>
			<p>
				<select name="category" required>
					<option value="드라마">드라마</option>
					<option value="영화">영화</option>
					<option value="애니메이션">애니메이션</option>
					<option value="예능">예능</option>
				</select>
			</p>
		</div>
		
		<div class="sb">
			<p class="program-add-from-text">프로그램 이름</p>
			<p><input type="text" name="title" value="${dto.title }" placeholder="프로그램 이름" 
					  required autofocus></p>
		</div>
		<div class="sb">
			<p class="program-add-from-text">이미지 등록</p>
			<p><input type="file" name="image" required></p>
		</div>
		<div>
			<p><textarea name="content" rows="4" cols="50"
						 placeholder="프로그램 설명">${dto.content }</textarea></p>
		</div>
		<div><input type="submit" value="프로그램 등록"></div>
	</form>
	
	</c:if>
	
	<c:if test="${pageContext.request.method == 'POST' }">
		<c:set var="programdto" value="${fileUtil.getProgramDTO(pageContext.request) }" />
		<c:set target="${programdto }" property="idx" value="${param.idx }" />
		<c:set var="row" value="${programDAO.update(programdto) }" />
		
		<c:if test="${row != 0 }">
			<c:redirect url="/admin.jsp?list=program" />
		</c:if>
		
		<script>
			alert('프로그램 수정 실패')
			history.go(-1)
		</script>
	</c:if>
</main>

</body>
</html>