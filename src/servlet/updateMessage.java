package servlet;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserLoginDao;
import model.*;


@WebServlet("/updateMessage")
public class updateMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updateMessage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 设置请求编码				
		request.setCharacterEncoding("utf-8");				
		// 设置响应编码				
		response.setContentType("utf-8");							
		// 获取message内容				
		String newtitle=request.getParameter("title");	
		String newmessage=request.getParameter("message");	
		int m_id=(int) request.getSession().getAttribute("m_id");
		
		// 建立留言表对应JavaBean对象，把数据封装进去				
				
					
		// 调DB类中的方法判断是否插入成功				
		if(new UserLoginDao().update_M(newtitle, newmessage, m_id)){					
			response.sendRedirect("message.jsp") ;				
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
