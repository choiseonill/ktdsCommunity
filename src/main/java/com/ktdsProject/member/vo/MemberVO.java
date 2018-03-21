package com.ktdsProject.member.vo;

public class MemberVO {

		private int UserNo;
		private String UserId;
		private String UserPassword;
		private String nickname;
		
		
		public int getUserNo() {
			return UserNo;
		}
		public void setUserNo(int userNo) {
			UserNo = userNo;
		}
		public String getUserId() {
			return UserId;
		}
		public void setUserId(String userId) {
			UserId = userId;
		}
		public String getUserPassword() {
			return UserPassword;
		}
		public void setUserPassword(String userPassword) {
			UserPassword = userPassword;
		}
		public String getNickname() {
			return nickname;
		}
		public void setNickname(String nickname) {
			this.nickname = nickname;
		}

		
}
