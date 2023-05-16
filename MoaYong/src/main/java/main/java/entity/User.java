package main.java.entity;

public class User {
	private String id;
	private String pw;
	private String nickname;
	private String email;
	private int joindate;
	private String person_type;
	private String photo;
	private String self_intro;
	
	public User() {}
	public User(String id, String pw, String nickname, int joindate, String person_type, String photo,
			String self_intro, String email) {
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
		this.joindate = joindate;
		this.person_type = person_type;
		this.photo = photo;
		this.self_intro = self_intro;
		this.email = email;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getJoindate() {
		return joindate;
	}
	public void setJoindate(int joindate) {
		this.joindate = joindate;
	}
	public String getPerson_type() {
		return person_type;
	}
	public void setPerson_type(String person_type) {
		this.person_type = person_type;
	}
	public String getPhoto() {
		return photo;
	}
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	public String getSelf_intro() {
		return self_intro;
	}
	public void setSelf_intro(String self_intro) {
		this.self_intro = self_intro;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
