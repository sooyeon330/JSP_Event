package test;
public class Spell {
	String id;
	String left;
	String right;
	String answer;
	
	public Spell() {
		// TODO Auto-generated constructor stub
	}
	public Spell(String id, String left, String right, String answer) {
		super();
		this.id = id;
		this.left = left;
		this.right = right;
		this.answer = answer;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getLeft() {
		return left;
	}
	public void setLeft(String left) {
		this.left = left;
	}
	public String getRight() {
		return right;
	}
	public void setRight(String right) {
		this.right = right;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}

	
}
