<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
    pageEncoding="UTF-8"%>
<%@page import="dao.*" %>
<%@page import="model.*" %>
<%@page import="java.sql.*" %>
<%@page import="util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div
		style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1 style="margin-left: 5%">这里是用户个人信息界面</h1>
		<form action="myMessages.jsp" method="post">
			<table border="1">
				<caption>用户个人信息</caption>
				<tr>
					<th>用户名</th>
					<th>性别</th>
					<th>邮箱</th>
					<th>电话</th>
					<th>注册日期</th>
					<th>个性签名</th>
					
				</tr>
				<%  Connection conn = DBConn.getConn();
				// 数据库连接对象
				    PreparedStatement pstmt;
				    request.setCharacterEncoding("utf-8");				
			 		// 设置响应编码				
			 		response.setContentType("utf-8");				
			 				
			 		// 获取message内容				
			 		String u_name = String.valueOf(request.getParameter("u_name"));
					pstmt = conn.prepareStatement("select * from user_info where u_name=?");
					pstmt.setString(1, u_name);
					ResultSet rs = pstmt.executeQuery();
					while (rs.next()) {

				%>
				<tr>
					<td><%=rs.getString("u_name") %></td>
					<td><%=rs.getString("u_sex") %></td>
					<td><%=rs.getString("u_email") %></td>
					<td><%=rs.getString("u_telephone") %></td>
					<td><%=rs.getString("u_regday") %></td>
					<td><%=rs.getString("u_signature") %></td>
				</tr>
				<%
				}
				%>
				
			</table>
		</form>
	    <a  href="changePassword.jsp">修改密码</a>
		<a style="margin-left: 12%" href="main.jsp">返回</a>
		
	</div>
	<div style="text-align: center; margin-top: 140px">
		<h1>请填写</h1>
		<form action="LeaveSignature" method="post">
			<table style="margin-left: 37%" border="1">
				<caption>填写个性签名</caption>
				<tr>
					<td>个性签名</td>
					<td><textarea name="message" rows="5" cols="35"></textarea></td>
				</tr>
			</table>
			<input type="submit" value="提交" /> <input type="reset" value="重置" />
		</form>
		<a href="main.jsp">返回留言板界面</a>
	</div>


</body>
</html>