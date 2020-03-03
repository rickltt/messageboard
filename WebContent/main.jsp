<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*"
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
    <div style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
    <h1 style="margin-left: 1%">欢迎来到程序员技术交流论坛</h1>
		<%
		// 设置请求编码
		request.setCharacterEncoding("utf-8");
		// 设置响应编码
		response.setContentType("utf-8");
		
		user u=(user) request.getSession().getAttribute("login"); %>
	<h2 style="margin-left: 1%">欢迎您，<%=u.getName() %>用户</h2>
    <h3>搜索栏</h3>
    <form action="Search.jsp" method="post">
    <input type="text" name="corp_name" />
    <input type="submit" onclick="Search.jsp" value="搜索" />
    </form>
    </div>
    
	<div
		style="margin-left: 35%; margin-top: 100px; font-family: Microsoft YaHei">
		
			<table border="1">
			
				<tr>
					
					<th>标题</th>
					<th>留言和回复条数</th>
					<th>留言时间</th>
					<th>留言人ID</th>
					<td>进入</td>
					<td>删除</td>
					<td>编辑</td>
					
				</tr>
				<br>
				<br>
				
				<%  
				int pagesize=5; 
				int showPage=1;
				String strPage = null;
			 	//获取目的界面
			 	strPage = request.getParameter("showPage");
			 	if(strPage == null){
			 	showPage = 1;
			 	}
			 	else{
			 	
			 		try{
			 			showPage=Integer.parseInt(strPage);
			 			}
			 			catch(NumberFormatException e){
			 			
			 			showPage = 1;
			 			}
			 			if(showPage<1){
			 			
			 			showPage=1;
			 	}
			 	}
				int line=(showPage-1)*pagesize;
				    
					UserLoginDao loginDao = new UserLoginDao();
					ArrayList<MessageBlock> al = loginDao.findMbInfo(line,pagesize);					
							if (al != null) {
								Iterator iter = al.iterator();
								while (iter.hasNext()) {
									MessageBlock mb = (MessageBlock) iter.next();
				%>
				<br>
				<tr>
					
					<td><%=mb.getMBName()%></td>
					<td><%=loginDao.getNumber(mb.getMBId())%></td>
					<td><%=mb.getMBtime()%></td>
					<td><%=loginDao.getUserNameById(mb.getUserId())%></td>
					<td><a href="message.jsp?mb_id=<%=mb.getMBId()%>">点击进入</a></td>
					<%if(loginDao.getUserNameById(mb.getUserId()).equals(u.getName())){%>
						<td><a href="userdodel1.jsp?mb_id=<%=mb.getMBId()%>">删除</a></td>
						<td><a href="edit1.jsp?mb_id=<%=mb.getMBId()%>">编辑</a></td>
					<% 
					}
					%>
					
				</tr>
				<%
					}
					}
							
							int getRowCount=loginDao.counts_mb();
							int getPageCount=0;
							if(getRowCount%pagesize==0){
								getPageCount=getRowCount/pagesize;
							}
							else{
								getPageCount=getRowCount/pagesize+1;
							}
				%>
			</table>
		<form action="main.jsp" method="get" target="_self">
	    	共<font color = red><%=getRowCount%></font>条&nbsp;
	    	<%=pagesize%>条/页&nbsp;
	    	第<font color = red><%=showPage%></font>页/共
	    	<font color = red><%=getPageCount%></font>页&nbsp;
	    	<a href="main.jsp?showPage=1"target="_self">[首页]</a>&nbsp;
	    	<%
	    		//判断“上一页”链接是否要显示
	    		if(showPage>1){
	    		
	    	 %>
	    			<a href="main.jsp?showPage=<%=showPage-1%>" target="_self">[上一页]</a>&nbsp;
	    				
	    				<%
	    				}else{ 
	    				%>
	    					[上一页]
	    	
	    	<%
    	} 
    	//判断下一页链接是否要显示
			if(showPage<getPageCount)
			{    	
    	%>
    	
    	<a 
    		href="main.jsp?showPage=<%=showPage+1%>"
    		 target="_self">[下一页]</a>
    		&nbsp;
    	
    	<%
    	}else{
    	 %>
    	 [下一页]&nbsp;
    	 <%
    	 } 
    	 %>
    	 <a href="main.jsp?showPage=<%=getPageCount%>"
    	 	target="_self">[尾页]</a>&nbsp;
    	 	
    	 	转到
    	 	<select name = "showPage">
    	 	<%
    	 		for(int x = 1;x <= getPageCount;x++){
    	 		
    	 	 %>
    	 	 <option value="<%=x %>"<%if(showPage==x)
    	 	 		out.println("selected");%>>
    	 	 		<%=x %></option>
    	 	 		<%
    	 	 		}
    	 	 		 %>
    	 	 </select>
    	 	 页&nbsp;
    	 	 <input type="submit" name="go" value="提交"/>
    	 	 
    	</form>
  
		<a href="usermessage.jsp?u_name=<%=u.getName()%>">我的信息</a>
		<a style="margin-left: 12%" href="addMessageBlock.jsp">创建论坛板块</a>
		<a style="margin-left: 12%" href="login.jsp">退出</a>
	</div>

</body>
</html>