package servlet;

import java.io.IOException;


import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user;
import dao.UserLoginDao;
import model.message;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求编码
		request.setCharacterEncoding("utf-8");
		// 设置响应编码
		response.setContentType("utf-8");
		UserLoginDao loginDao = new UserLoginDao();
		HttpSession session = request.getSession();
		
		
		user l = loginDao.checkLogin(request.getParameter("name"), request.getParameter("password"));
		if (l != null) {
			// 如果登陆成功
			session.setAttribute("login", l);
			// 将获取的对象保存在session中
			response.sendRedirect("main.jsp");
			// 验证成功跳转到 main.jsp
		} else {
			// 验证失败跳转到 error.jsp
			response.sendRedirect("error.jsp");
		}
	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
