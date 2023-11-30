package memberbean;

import java.sql.Timestamp;


public class MemberDTO {
	// 멤버 변수 선언
	private String usermakeId;
	private String userPw;
	private String userNickname;
	private String phoneNumber;
	/*
	 * private String gender; private Date birth;
	 */
	/* private String pro_img; */
	/*
	 * private String job; private String favorite_field; private String
	 * terms_of_use_agree; private String privacy_agree; private String
	 * privacy_agree_choice; private String benefits_SMS_agree;
	 */
	private Timestamp createdAt;
	/*
	 * private Timestamp updated_at;
	 */

	// 멤버 변수별 게터와 세터
	/*
	 * public String getUserId() { return user_id; } public void setUserId(String
	 * userId) { this.user_id = userId; }
	 */
	 
	//생성자
	public MemberDTO() {

	}
    public MemberDTO(String usermakeId, String userPw, String userNickname, String phoneNumber, Timestamp createdAt) {
        super();
        this.usermakeId = usermakeId;
        this.userPw = userPw;
        this.userNickname = userNickname;
        this.phoneNumber = phoneNumber;
        this.createdAt = createdAt;
    }
	
	public String getUsermakeId() {
		return usermakeId;
	}

	public void setUsermakeId(String usermakeId) {
		this.usermakeId = usermakeId;
	}

	public String getUserPw() {
		return userPw;
	}

	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	/*
	 * public String getProImg() { return pro_img; }
	 * 
	 * public void setProImg(String proImg) { this.pro_img = proImg; }
	 */

	/*
	 * public String getGender() { return gender; }
	 * 
	 * public void setGender(String gender) { this.gender = gender; }
	 * 
	 * public Date getBirth() { return birth; }
	 * 
	 * public void setBirth(Date birth) { this.birth = birth; }
	 */
	/*
	 * 
	 * public String getJob() { return job; }
	 * 
	 * public void setJob(String job) { this.job = job; }
	 * 
	 * public String getFavoriteField() { return favorite_field; }
	 * 
	 * public void setFavoriteField(String favoriteField) { this.favorite_field =
	 * favoriteField; }
	 * 
	 * public String getTermsOfUseAgree() { return terms_of_use_agree; }
	 * 
	 * public void setTermsOfUseAgree(String termsOfUseAgree) {
	 * this.terms_of_use_agree = termsOfUseAgree; }
	 * 
	 * public String getPrivacyAgree() { return privacy_agree; }
	 * 
	 * public void setPrivacyAgree(String privacyAgree) { this.privacy_agree =
	 * privacyAgree; }
	 * 
	 * public String getPrivacyAgreeChoice() { return privacy_agree_choice; }
	 * 
	 * public void setPrivacyAgreeChoice(String privacyAgreeChoice) {
	 * this.privacy_agree_choice = privacyAgreeChoice; }
	 * 
	 * public String getBenefitsSMSAgree() { return benefits_SMS_agree; }
	 * 
	 * public void setBenefitsSMSAgree(String benefitsSMSAgree) {
	 * this.benefits_SMS_agree = benefitsSMSAgree; }
	 */
	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	/*
	 * public Timestamp getUpdatedAt() { return updated_at; }
	 * 
	 * public void setUpdatedAt(Timestamp updatedAt) { this.updated_at = updatedAt;
	 * }
	 */
}