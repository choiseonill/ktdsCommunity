package com.ktdsProject.community.vo;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import com.ktdsProject.member.vo.MemberVO;

public class CommunityVO {

	private MemberVO memberVO;

	private int communityId;
	private int memberId;
	private String title;
	private String body;
	private String writeDate;
	private int viewCount; 
	private int likeCount; 
	private int disLikeCount; 

	private MultipartFile file;
	private String displayFilename;

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public int getCommunityId() {
		return communityId;
	}

	public void setCommunityId(int communityId) {
		this.communityId = communityId;
	}


	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public int getViewCount() {
		return viewCount;
	}

	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}

	public int getLikeCount() {
		return likeCount;
	}

	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}

	public int getDisLikeCount() {
		return disLikeCount;
	}

	public void setDisLikeCount(int disLikeCount) {
		this.disLikeCount = disLikeCount;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}

	public String getDisplayFilename() {
		if (displayFilename == null) {
			displayFilename = "";
		}
		return displayFilename;
	}

	public void setDisplayFilename(String displayFilename) {
		this.displayFilename = displayFilename;
	}

	public String save() {
		// 파일을 디스크에 쓰즌거
		if (file != null && !file.isEmpty()) {
			displayFilename = file.getOriginalFilename();
			File newFile = new File(
					"/Users/choiseonill/KTDS/workspace-sts-3.9.3.RELEASE/uploadFiles/" + file.getOriginalFilename());
			try {
				file.transferTo(newFile);
				return newFile.getAbsolutePath();
			} catch (IllegalStateException e) {
				throw new RuntimeException(e.getMessage(), e);
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		}
		return null;
	}

}