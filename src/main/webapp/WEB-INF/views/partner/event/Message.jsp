<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:choose>
	<c:when test="${WHERE eq 'SUCCESS' }">
		<c:set var="successMessage" value="승인 완료!"/>
		<c:set var="failMessage" value="승인 실패!"/>
		<c:set var="successMoveUrl" value="/Planit/Admin/Event/Request.do"/>
	</c:when>
</c:choose>

<script>
	<c:choose>
		<c:when test="${successFail == 1}">
			alert("${successMessage}");
			location.replace("<c:url value='${successMoveUrl}'/>");
		</c:when>
		<c:when test="${successFail == 0}">
			alert("${failMessage}");
			history.back();
		</c:when>
	</c:choose>
</script>