package model;
import java.sql.Timestamp;
public class MessageBlock {
	private int MBId; //¡Ù—‘∞ÂøÈ±‡∫≈
	private String MBName; //¡Ù—‘∞ÂøÏ√˚≥∆
	private Timestamp MBtime;//¡Ù—‘ ±º‰

	private int userId;//¡Ù—‘»À±‡∫≈

	public int getMBId() {
		return MBId;
	}
	public void setMBId(int mBId) {
		MBId = mBId;
	}
	public String getMBName() {
		return MBName;
	}
	public void setMBName(String mBName) {
		MBName = mBName;
	}
	public Timestamp getMBtime() {
		return MBtime;
	}
	public void setMBtime(Timestamp mBtime) {
		MBtime = mBtime;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	
	

}
