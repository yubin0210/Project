<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>


<c:set var="dto" value="${recommendDAO.selectOneByIdx(param.idx) }" />
<c:set var="row" value="${recommendDAO.likeButton(param.idx) }" />

<c:if test="${row != 0 }">
	<c:if test="${dto.category == 'program' }">
		<c:redirect url="/board.jsp?idx=${dto.category_idx }#likebt" />
	</c:if>
</c:if>



</body>
</html>