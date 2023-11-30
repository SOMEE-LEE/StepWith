package usergoal;

import java.sql.Timestamp;

public class UserGoalDTO {
	public String usermakeId;
	public String goalId;
	public String goalType;
	public String goalName;
	public String startDate;
	public String endDate;
	public String repeatCycle;
	public String repeatType;
	public Timestamp createdAt;
	
	public String getUsermakeId() {
		return usermakeId;
	}
	
	public void setUsermakeId(String usermakeId) {
		this.usermakeId = usermakeId;
	}
	
	public String getGoalId() {
		return goalId;
	}
	
	public void setGoalId(String goalId) {
		this.goalId = goalId;
	}
	
	public String getGoalType() {
		return goalType;
	}
	
	public void setGoalType(String goalType) {
		this.goalType = goalType;
	}
	
	public String getGoalName() {
		return goalName;
	}
	
	public void setGoalName(String goalName) {
		this.goalName = goalName;
	}
	
	public String getStartDate() {
		return startDate;
	}
	
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	
	public String getEndDate() {
		return endDate;
	}
	
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public String getRepeatCycle() {
		return repeatCycle;
	}
	
	public void setRepeatCycle(String repeatCycle) {
		this.repeatCycle = repeatCycle;
	}
	
	public String getRepeatType() {
		return repeatType;
	}
	
	public void setRepeatType(String repeatType) {
		this.repeatType = repeatType;
	}
	
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
}
