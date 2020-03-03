package dao;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.sql.*;
import java.util.ArrayList;

import model.*;
import util.DBConn;

public class AdminLoginDao {
	Connection conn = DBConn.getConn();
	// 数据库连接对象
	PreparedStatement pstmt;

	public admin checkLogin(String name, String password) {
		// 验证用户名密码
		try {
			pstmt = conn.prepareStatement("select* from admin where name=?and password=?");
			pstmt.setString(1, name);
			// 设置SQL语句参数
			pstmt.setString(2, password);
			// 设置SQL语句参数
			ResultSet rs = pstmt.executeQuery();
			// 执行查询，返回结果集
			if (rs.next()) {
				// 通过JavaBean保存值
				admin login=new admin();
				login.setId(rs.getInt(1));
				login.setName(rs.getString(2));
				login.setPassword(rs.getString(3));
				return login;     

				
			}
			
			return null;
			
			// 验证失败返回null
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<user> findAllUser() {
		try {
			ArrayList<user> al = new ArrayList<user>();
			pstmt = conn.prepareStatement("select * from user ");
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user u = new user();
				u.setId(rs.getInt(1));
				u.setName(rs.getString(2));
				u.setPassword(rs.getString(3));
				u.setSex(rs.getString(4));
				u.setEmail(rs.getString(5));
				u.setTelephone(rs.getString(6));
				u.setRegday(rs.getDate(7));
				u.setSignature(rs.getString(8));
				al.add(u);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<logs> findAllLogs() {
		try {
			ArrayList<logs> al = new ArrayList<logs>();
			pstmt = conn.prepareStatement("select * from logs ");
			
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				logs l = new logs();
				l.setId(rs.getInt(1));
				l.setLogs(rs.getString(2));
				l.setTime(rs.getTimestamp(3));
				
				al.add(l);
			}
			return al;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public ArrayList<MessageBlock> findMbInfo() {
		try {
			ArrayList<MessageBlock> al = new ArrayList<MessageBlock>();
			pstmt = conn.prepareStatement("SELECT * FROM message_block");
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
public int delmess_block(int MBid) {
	
	try {
		pstmt = conn.prepareStatement("call delmess_block(?)");
		pstmt.setInt(1, MBid);
	    pstmt.executeQuery();
	 
	    return 1;
		
	} catch (Exception e) {
		e.printStackTrace();
		return 0;
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
public boolean DelMessage(int mid) {
	try {
		pstmt = conn.prepareStatement("call del_message(?)");
		pstmt.setInt(1, mid);
		
		pstmt.executeUpdate();
		return true;
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
}
public boolean DelReply(int id) {
	try {
		pstmt = conn.prepareStatement("delete from reply where r_id=?");
		pstmt.setInt(1, id);
		
		pstmt.executeUpdate();
		return true;
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
}
public boolean DelUser(int id) {
	try {
		pstmt = conn.prepareStatement("delete from user where u_id=?");
		pstmt.setInt(1, id);
		
		pstmt.executeUpdate();
		return true;
	} catch (Exception e) {
		e.printStackTrace();
		return false;
	}
}
public ArrayList<message> findMessage(int MBid) {
	try {
		ArrayList<message> al = new ArrayList<message>();
		pstmt = conn.prepareStatement("SELECT * FROM message where fk_MB_id=? ");
		pstmt.setInt(1, MBid);
		
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
}
