package servlet;

import java.io.IOException;





import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.*;



@WebServlet("/ReplyServlet")
public class ReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ReplyServlet() {
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
		String title=request.getParameter("title");				
		// 获取message内容				
		String message=request.getParameter("message");				
		// 从session中取出当前用户对象				
		user u=(user) request.getSession().getAttribute("login");
		int mbId=(int) request.getSession().getAttribute("mb_id");	
		int mId=(int) request.getSession().getAttribute("m_id");	
		// 建立留言表对应JavaBean对象，把数据封装进去				
		reply r=new reply();				
					
		r.setTitle(title);
		r.setContent(message);
		r.setTime(new Timestamp(System.currentTimeMillis()));
		r.setMB_id(mbId);	
		r.setU_id(u.getId());
		r.setM_id(mId);
				
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().insert_reply(r)){					
			response.sendRedirect("main.jsp") ;				
			}
		else {
			response.sendRedirect("error.jsp") ;
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
