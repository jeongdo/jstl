<%@page import="java.util.Map"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>JSTL ForEach 테스트</title>
</head>

<body>
	<%
		List commentList = new ArrayList();

		for (int i = 0; i < 3; i++) {
			Map commentsMap = new HashMap<>();
			commentsMap.put("no", i + 1);
			commentsMap.put("name", "이름" + (i + 1));
			commentList.add(commentsMap);
		}
		request.setAttribute("list", commentList);
	%>

	<h4>JSTL ForEach 테스트</h4>

	<table border="1">
		<caption>UI 개선</caption>
		<colgroup>
			<col style="width: 140px;" />
			<col style="width: 328px;" />
			<col style="width: 140px;" />
			<col style="width: auto;" />
		</colgroup>
		<tbody>
			<c:forEach items="${list}" var="result" varStatus="status">
				<c:if test="${status.index % 2 == 0}">
					<tr>
						<td>${result.no}</td>
						<td>${result.name}</td>
						<td>${list[status.index + 1].no}</td>
						<td>${list[status.index + 1].name}</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>