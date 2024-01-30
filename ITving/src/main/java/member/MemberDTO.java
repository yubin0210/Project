package member;

//	IDX      NOT NULL NUMBER         
//	USERID   NOT NULL VARCHAR2(500)  
//	USERPW   NOT NULL VARCHAR2(500)  
//	NICKNAME NOT NULL VARCHAR2(500)  
//	IMAGE             VARCHAR2(1000) 
//	PNUM     NOT NULL VARCHAR2(100)

public class MemberDTO {
	private int idx;
	private String userid;
	private String userpw;
	private String nickname;
	private String image;
	private String pnum;
	
	public int getIdx() {
		return idx;
	}
	public void setIdx(int idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	
	

}
