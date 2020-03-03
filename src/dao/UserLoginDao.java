package dao;

import java.sql.Connection;

import java.sql.Timestamp;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import model.*;
import util.DBConn;

public class UserLoginDao {
	Connection conn = DBConn.getConn();
	// 数据库连接对象
	PreparedStatement pstmt;
/**
 * 验证登陆
 * @param name 用户名
 * @param password 登陆密码
 * @return
 */
	public user checkLogin(String name, String password) {
		// 验证用户名密码
		try {
			pstmt = conn.prepareStatement("select* from user where u_name=? and u_password=?");
			pstmt.setString(1, name);
			// 设置SQL语句参数
			pstmt.setString(2, password);
			// 设置SQL语句参数
			ResultSet rs = pstmt.executeQuery();
			// 执行查询，返回结果集
			if (rs.next()) {
				// 通过JavaBean保存值
				user login=new user();
				login.setId(rs.getInt(1));
				login.setName(rs.getString(2));
				login.setPassword(rs.getString(3));
				login.setSex(rs.getString(4));
				login.setEmail(rs.getString(5));
				login.setTelephone(rs.getString(6));
				login.setRegday(rs.getDate(7));
				login.setSignature(rs.getString(8));;
				return login;     			
			}
			
			return null;
			
			// 验证失败返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
/**
 * 查询所有板块
 * @return
 */
	public ArrayList<MessageBlock> findMbInfo(int line,int pagesize) {
		try {
			ArrayList<MessageBlock> al = new ArrayList<MessageBlock>();
			pstmt = conn.prepareStatement("SELECT * FROM message_block order by MB_time desc limit ?,?");
			pstmt.setInt(1, line);
			pstmt.setInt(2, pagesize);
			// 设置SQL语句参数
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				MessageBlock mb=new MessageBlock();
				mb.setMBId(rs.getInt(1));
				mb.setMBName(rs.getString(2));
				mb.setMBtime(rs.getTimestamp(3));
				mb.setUserId(rs.getInt(4));
				al.add(mb);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int counts_mb() {
		try {
			int res=0;
			pstmt = conn.prepareStatement("SELECT count(*) FROM message_block  ");
			
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
			 res=rs.getInt(1);
			}
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int counts_m(int MB_id) {
		try {
			int res=0;
			pstmt = conn.prepareStatement("SELECT count(*) FROM message where fk_MB_id=?  ");
			pstmt.setInt(1, MB_id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
			 res=rs.getInt(1);
			}
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public int counts_r(int m_id) {
		try {
			int res=0;
			pstmt = conn.prepareStatement("SELECT count(*) FROM reply where fk_m_id=?  ");
			pstmt.setInt(1, m_id);
			ResultSet rs=pstmt.executeQuery();
			while(rs.next()) {
			 res=rs.getInt(1);
			}
			return res;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public ArrayList<MessageBlock> findMbInfoById(int mb_id) {
		try {
			ArrayList<MessageBlock> al = new ArrayList<MessageBlock>();
			pstmt = conn.prepareStatement("select * from message_block where MB_id=?");
			pstmt.setInt(1, mb_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				MessageBlock mb=new MessageBlock();
				mb.setMBId(rs.getInt(1));
				mb.setMBName(rs.getString(2));
				mb.setMBtime(rs.getTimestamp(3));
				mb.setUserId(rs.getInt(4));
				al.add(mb);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<message> findMessageByid(int m_id) {
		try {
			ArrayList<message> al = new ArrayList<message>();
			pstmt = conn.prepareStatement("select * from message where m_id=?");
			pstmt.setInt(1, m_id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				message m=new message();
				m.setId(rs.getInt(1));
				m.setTitle(rs.getString(2));
				m.setContent(rs.getString(3));
				m.setPublishtime(rs.getTimestamp(4));
				m.setMb_id(rs.getInt(5));
				m.setUserId(rs.getInt(6));
				al.add(m);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<MessageBlock> findMbInfoBySelect(String corp_name) {
		try {
			ArrayList<MessageBlock> al = new ArrayList<MessageBlock>();
			pstmt = conn.prepareStatement("SELECT * FROM message_block where MB_name like concat('%',?,'%')  ");
			pstmt.setString(1, corp_name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				MessageBlock mb=new MessageBlock();
				mb.setMBId(rs.getInt(1));
				mb.setMBName(rs.getString(2));
				mb.setMBtime(rs.getTimestamp(3));
				mb.setUserId(rs.getInt(4));
				al.add(mb);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<message> findMessage(int MBid,int line,int pagesize) {
		try {
			ArrayList<message> al = new ArrayList<message>();
			pstmt = conn.prepareStatement("SELECT * FROM message where fk_MB_id=? limit ?,?");
			pstmt.setInt(1, MBid);
			pstmt.setInt(2, line);
			pstmt.setInt(3, pagesize);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				message m=new message();
				m.setId(rs.getInt(1));
				m.setTitle(rs.getString(2));
				m.setContent(rs.getString(3));
				m.setPublishtime(rs.getTimestamp(4));
				m.setMb_id(rs.getInt(5));
				m.setUserId(rs.getInt(6));
				
				al.add(m);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<reply> findreply(int mid,int line,int pagesize) {
		try {
			ArrayList<reply> al = new ArrayList<reply>();
			pstmt = conn.prepareStatement("SELECT * FROM reply where fk_m_id=? limit ?,?");
			pstmt.setInt(1, mid);
			pstmt.setInt(2, line);
			pstmt.setInt(3, pagesize);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				reply r=new reply();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setContent(rs.getString(3));
				r.setTime(rs.getTimestamp(4));
				r.setMB_id(rs.getInt(5));
				r.setU_id(rs.getInt(6));
				r.setM_id(rs.getInt(7));
				al.add(r);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<reply> findreply(int mid) {
		try {
			ArrayList<reply> al = new ArrayList<reply>();
			pstmt = conn.prepareStatement("SELECT * FROM reply where fk_m_id=? ");
			pstmt.setInt(1, mid);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				reply r=new reply();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setContent(rs.getString(3));
				r.setTime(rs.getTimestamp(4));
				r.setMB_id(rs.getInt(5));
				r.setU_id(rs.getInt(6));
				r.setM_id(rs.getInt(7));
				al.add(r);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<reply> findreplyById(int rid) {
		try {
			ArrayList<reply> al = new ArrayList<reply>();
			pstmt = conn.prepareStatement("SELECT * FROM reply where r_id=?");
			pstmt.setInt(1, rid);
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				
				reply r=new reply();
				r.setId(rs.getInt(1));
				r.setTitle(rs.getString(2));
				r.setContent(rs.getString(3));
				r.setTime(rs.getTimestamp(4));
				r.setMB_id(rs.getInt(5));
				r.setU_id(rs.getInt(6));
				r.setM_id(rs.getInt(7));
				al.add(r);
				
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int getNumber(int id) {
		
		try {
			pstmt = conn.prepareStatement("call getnum(?)");
			pstmt.setInt(1, id);
		    ResultSet rs= pstmt.executeQuery();
		  int i=0;
		    while(rs.next()) {
		    	 i=rs.getInt(1);
		    }
		    return i;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}

	public boolean addInfo(MessageBlock mb) {
		try {
			pstmt = conn.prepareStatement("insert into message_block(MB_name,MB_time,fk_u_id)values(?,?,?)");
			
			pstmt.setString(1, mb.getMBName());
			pstmt.setTimestamp(2, mb.getMBtime());
			pstmt.setInt(3, mb.getUserId());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	

	public String getName(int id) {
		String name = null;
		try {
			pstmt = conn.prepareStatement("select name from messages where id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);
			}
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String getMbName(int MBid) {
		String name = null;
		try {
			pstmt = conn.prepareStatement("select MB_name from message_block where MB_id=?");
			pstmt.setInt(1, MBid);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				name = rs.getString(1);
			}
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int getUserId(int id) {
		int getId=0;
		try {
			pstmt = conn.prepareStatement("select id from user where id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				getId=rs.getInt(1);
				
			}
			return getId;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public String getUserNameByName(String name) //根据用户名查询
	{
		String getName=null;
		try {
			pstmt = conn.prepareStatement("select u_name from user where u_name=?");
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				getName=rs.getString(1);
				
			}
			return getName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public String getUserNameById(int id) //根据用户名查询
	{
		String getName=null;
		try {
			pstmt = conn.prepareStatement("select u_name from user where u_id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				getName=rs.getString(1);
				
			}
			return getName;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public int getRows() {
		int row =0;
		try {
			pstmt = conn.prepareStatement("select count(*) from messages");
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				row = rs.getInt(1);
			}
			return row+1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public boolean insert_message(message m)//新增留言
	{
		try {
			pstmt = conn.prepareStatement("insert into message(m_title,m_content,m_publishtime,fk_MB_id,fk_u_id)values(?,?,?,?,?)");
			
			pstmt.setString(1, m.getTitle());
			pstmt.setString(2, m.getContent());
			pstmt.setTimestamp(3, m.getPublishtime());
			pstmt.setInt(4, m.getMb_id());
			pstmt.setInt(5, m.getUserId());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean update_signature(String newSignature,int u_id)//新增留言
	{
		try {
			pstmt = conn.prepareStatement("update user set u_signature=? where u_id=?");
			
			pstmt.setString(1,newSignature);
			pstmt.setInt(2, u_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean update_MB(String newtitle,int mb_id)//新增留言
	{
		try {
			pstmt = conn.prepareStatement("update message_block set MB_name=? where MB_id=?");
			
			pstmt.setString(1,newtitle);
			pstmt.setInt(2, mb_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean update_M(String newtitle,String newmessage,int m_id)//新增留言
	{
		try {
			pstmt = conn.prepareStatement("update message set m_title=? , m_content=? where m_id=?");
			
			pstmt.setString(1,newtitle);
			pstmt.setString(2, newmessage);
			pstmt.setInt(3, m_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean update_r(String newtitle,String newmessage,int r_id)//新增留言
	{
		try {
			pstmt = conn.prepareStatement("update reply set r_title=? , r_content=? where r_id=?");
			
			pstmt.setString(1,newtitle);
			pstmt.setString(2, newmessage);
			pstmt.setInt(3, r_id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public boolean insert_reply(reply r)//新增回复
	{
		try {
			pstmt = conn.prepareStatement("insert into reply(r_title,r_content,r_time,fk_MB_id,fk_u_id,fk_m_id)values(?,?,?,?,?,?)");
			
			pstmt.setString(1, r.getTitle());
			pstmt.setString(2, r.getContent());
			pstmt.setTimestamp(3, r.getTime());
			pstmt.setInt(4, r.getMB_id());
			pstmt.setInt(5, r.getU_id());
			pstmt.setInt(6, r.getM_id());
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public void insertUser(String name, String password,String sex,String email,String telephone) {
		try {
			pstmt = conn.prepareStatement("insert into user(u_name,u_password,u_sex,u_email,u_telephone,u_regday) "
					+ "values(?,?,?,?,?,?)");
			pstmt.setString(1, name);
			pstmt.setString(2, password);
			pstmt.setString(3, sex);
			pstmt.setString(4, email);
			pstmt.setString(5, telephone);
			pstmt.setTimestamp(6, new Timestamp(System.currentTimeMillis()));
			
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
	}

	public boolean ChangePsw(int id,String newpsw) {
		try {
			pstmt = conn.prepareStatement("update user set u_password=? where u_id=?;");
			pstmt.setString(1, newpsw);
			pstmt.setInt(2, id);
			pstmt.executeUpdate();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public String getPsw(int id) {
		String Psw = null;
		try {
			pstmt = conn.prepareStatement("select u_password from user where u_id=?");
			pstmt.setInt(1, id);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				Psw = rs.getString(1);
			}
			return Psw;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
