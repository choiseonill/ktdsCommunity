package com.ktdsProject.member.service;

import com.ktdsProject.Utill.SHA256Util;
import com.ktdsProject.member.dao.MemberDao;
import com.ktdsProject.member.service.MemberService;
import com.ktdsProject.member.vo.MemberVO;


public class MemberServiceImpl implements MemberService{

	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	
	// 입력한 비밀번호를 암호화하여 저장하는 작업(회원가입)
	
	@Override
	public boolean createMember(MemberVO memberVO) {
		
		// 회원가입을 진행하면서 비밀번호를 암호화 시키는부분
		String salt = SHA256Util.generateSalt();
		memberVO.setSalt(salt);
		//입력한 비밀번호
		String password = memberVO.getPassword();
		//가져온 패스워드를 암호화 시켜 다시 재할당
		password = SHA256Util.getEncrypt(password, salt);
		// 암호화된 패스워드를 vo에 다시 set 하여준다.
		memberVO.setPassword(password);
		
		
		return memberDao.insertMember(memberVO) > 0;
	}
	
	// 입력한 비빌먼호를 암호화 작업 (로그인시 디비에 있는거랑 비교하기 위햐ㅐ)
	@Override
	public MemberVO readMember(MemberVO memberVO) {
		// 사용자의 email로 sale된 값을 가져온다
		String salt = memberDao.selectSalt(memberVO.getEmail());
		// NullPointerException 막을려고 하는 조건문
		if ( salt == null ) {
			salt = "";
		}
		//입력한 패스워드를 가져온다.
		String password = memberVO.getPassword();
		//가져온 패스워드를 암호화시켜 다시 재할
		password = SHA256Util.getEncrypt(password, salt);
		// 암호화된 패스워드를 vo에 다시 set 하여준다.
		memberVO.setPassword(password);
		
		
		return memberDao.selectMember(memberVO);
	}


	// 회원가입 이메일 중복체크
	@Override
	public boolean readCheckMemberEmail(String email) {
		int checkEmail = memberDao.selectCheckMemberEmail(email);
		return checkEmail > 0;
	}

	// 회원가입 닉네임 중복체크
	@Override
	public boolean readCheckMemberNickname(String nickname) {
		int checkNickname = memberDao.selectCheckMemberNickname(nickname);
		return checkNickname > 0;
	}
	
}
	

	


