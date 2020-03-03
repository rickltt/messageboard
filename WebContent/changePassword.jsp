<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
		<h1>登录界面</h1>
		<form action="ChangePasswordServlet" method="post">
			<table>
				<tr>
					<td>原密码:</td>
					<td><input name="oldpsw" type="text"></td>
				</tr>
				<tr>
					<td>新密码:</td>
					<td ><input name="newpsw" type="text"></td>
				</tr>
			</table>
			<input type="submit"  value="提交" style="font-size: 16px"> 
			&nbsp;&nbsp;
			<a href="usermessage.jsp">返回</a>
		</form>
	</div>

</body>
</html>