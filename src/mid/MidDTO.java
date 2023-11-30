package mid;

import java.sql.Timestamp;

public class MidDTO {
	private String goalId;
	private String middleId;
	private String middleGoal;
	private String startNum;
	private String goalNum;
	private String goalUnit;
	private String midDate;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	public String getGoalId() {
		return goalId;
	}
	public void setGoalId(String goalId) {
		this.goalId = goalId;
	}
	public String getMiddleId() {
		return middleId;
	}
	public void setMiddleId(String middleId) {
		this.middleId = middleId;
	}
	public String getMiddleGoal() {
		return middleGoal;
	}
	public void setMiddleGoal(String middleGoal) {
		this.middleGoal = middleGoal;
	}
	public String getStartNum() {
		return startNum;
	}
	public void setStartNum(String startNum) {
		this.startNum = startNum;
	}
	public String getGoalNum() {
		return goalNum;
	}
	public void setGoalNum(String goalNum) {
		this.goalNum = goalNum;
	}
	public String getGoalUnit() {
		return goalUnit;
	}
	public void setGoalUnit(String goalUnit) {
		this.goalUnit = goalUnit;
	}
	public String getMidDate() {
		return midDate;
	}
	public void setMidDate(String midDate) {
		this.midDate = midDate;
	}
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	public Timestamp getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Timestamp updatedAt) {
		this.updatedAt = updatedAt;
	}
	

}
