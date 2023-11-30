package habit;

import java.sql.Timestamp;

public class HabitDTO {
	private String goalId;
	private String habitId;
	private String todo;
	private String startNum;
	private String goalNum;
	private String goalUnit;
	private Timestamp createdAt;
	private Timestamp updatedAt;
	
	public String getGoalId() {
		return goalId;
	}
	public void setGoalId(String goalId) {
		this.goalId = goalId;
	}
	public String getHabitId() {
		return habitId;
	}
	public void setHabitId(String habitId) {
		this.habitId = habitId;
	}
	public String getTodo() {
		return todo;
	}
	public void setTodo(String todo) {
		this.todo = todo;
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
