<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>



<c:set var="row" value="${programDAO.delete(param.idx) }" />
<c:if test="${row != 0 }">
	<c:redirect url="/admin.jsp?list=program" />
</c:if>

<script>
	alert('삭제 실패')
	history.go(-1)
</script>

</body>
</html>