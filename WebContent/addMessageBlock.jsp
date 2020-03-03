<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	   <%@page import="dao.*" %>
<%@page import="model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div style="text-align: center; margin-top: 140px">
		<h1>创建论坛板块</h1>
		<form action="addMessageBlockServlet" method="post">
			<table style="margin-left: 37%" border="1">
				<caption>填写论坛板块名</caption>
				<tr>
					<td>板块名</td>
					<td><input type="text" name="title" /></td>
					
			
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回主界面</a>
	</div>

</body>
</html>