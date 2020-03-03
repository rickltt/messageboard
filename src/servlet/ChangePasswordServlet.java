package servlet;

import java.io.IOException;



import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.user;
import model.message;



@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ChangePasswordServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求编码				
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");				
		// 获取title内容				
		String newpsw=request.getParameter("newpsw");	
		String oldpsw=request.getParameter("oldpsw");
	
		user u=(user) request.getSession().getAttribute("login");				
		UserLoginDao login=new UserLoginDao();		
		if(login.getPsw(u.getId()).contentEquals(oldpsw)) {
		      if(login.ChangePsw(u.getId(), newpsw)){					
			response.sendRedirect("changePswSuccess.jsp") ;				
			}
		}else {
			response.sendRedirect("OldPswError.jsp") ;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}

