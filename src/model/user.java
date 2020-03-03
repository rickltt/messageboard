package model;
import java.sql.Date;
public class user {
	private int id;  //用户账号
	private String name;  //用户名
	private String password;//密码
	private String sex; //性别
	private String email; //邮箱
	private String telephone; //电话
	private Date regday;   //注册日期
	private String signature; //个性签名
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Date getRegday() {
		return regday;
	}
	public void setRegday(Date regday) {
		this.regday = regday;
	}

	public String getSignature() {
		return signature;
	}
	public void setSignature(String signature) {
		this.signature = signature;
	}
	

	
}
