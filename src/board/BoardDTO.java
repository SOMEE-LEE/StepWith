package board;

import java.sql.Timestamp;

public class BoardDTO {
	//멤버 변수 선언
	private String goalId;
	private String togetherId;
	private String userNickname;
	private String boardId;
	private String photo;
	private String detail; 
	private Timestamp createdAt;

	// 게터/세터
	public String getGoalId() {
		return goalId;
	}
	
	public void setGoalId(String goalId) {
		this.goalId = goalId;
	}
	
	public String getTogetherId() {
		return togetherId;		
	}
	
	public void setTogetherId(String togetherId) {
		this.togetherId = togetherId;
	}
	
	
	
	public String getUserNickname() {
		return userNickname;
	}
	
	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}
	
	public String getBoardId() {
		return boardId;
	}
	
	public void setBoardId(String boardId) {
		this.boardId = boardId;
	}
	
	public String getPhoto() {
		return photo;
	}
	
	public void setPhoto(String photo) {
		this.photo = photo;
	}
	
	public String getDetail() {
		return detail;
	}
	
	public void setDetail(String detail) {
		this.detail = detail;
	}
	
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}


	
