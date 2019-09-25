package test;
public class Spell {
	String left;
	String right;
	String answer;
	
	public Spell() {
		super();
	}
	public Spell(String left, String right, String answer) {
		super();
		this.left = left;
		this.right = right;
		this.answer = answer;
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
