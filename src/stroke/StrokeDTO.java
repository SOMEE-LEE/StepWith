package stroke;

import java.sql.Timestamp;

public class StrokeDTO {
	//멤버 변수 선언
	private String usermakeId;
	private String strokeId;
	private String strokeColor;
	private String strokeDate;
	private String strokeMent;
	private String strokeMyself;
	private Timestamp createdAt; 
	
	// 게터/세터
	public String getUsermakeId() {
		return usermakeId;
	}
	
	public void setUsermakeId(String usermakeId) {
		this.usermakeId = usermakeId;
	}
	
	public String getStrokeId() {
		return strokeId;
	}
	
	public void setStrokeId(String strokeId) {
		this.strokeId = strokeId;
	}
	
	public String getStrokeColor() {
		return strokeColor;
	}
	
	public void setStrokeColor(String strokeColor) {
		this.strokeColor = strokeColor;
	}
	
	public String getStrokeDate() {
		return strokeDate;
	}
	
	public void setStrokeDate(String strokeDate) {
		this.strokeDate = strokeDate;
	}
	
	public String getStrokeMent() {
		return strokeMent;
	}
	
	public void setStrokeMent(String strokeMent) {
		this.strokeMent = strokeMent;
	}
	
	public String getStrokeMyself() {
		return strokeMyself;
	}
	
	public void setStrokeMyself(String strokeMyself) {
		this.strokeMyself = strokeMyself;
	}
	
	public Timestamp getCreatedAt() {
		return createdAt;
	}
	
	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}
	
	
}
