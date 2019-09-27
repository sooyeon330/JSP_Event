package test;

public class Board {
	String id;
	String title;
	String content;
	String tel;
	String writetime;
	
	public Board() {
		// TODO Auto-generated constructor stub
	}
	public Board(String id, String title, String content,String tel, String writetime) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
		this.writetime = writetime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWritetime() {
		return writetime;
	}
	public void setWritetime(String writetime) {
		this.writetime = writetime;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
