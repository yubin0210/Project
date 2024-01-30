<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="row" value="${memberDAO.delete(login.idx) }" />
<c:remove var="login" scope="session" />
<c:if test="${row != 0 }">
	<c:redirect url="/" />
</c:if>

<script>
	alert('회원탈퇴 실패')
	history.go(-1)
</script>

</body>
</html>