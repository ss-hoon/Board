package com.example.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Domain.Member;
import com.example.Mapper.MemberMapper;

@Service
public class MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	public int idCheck(Member member) {
		return memberMapper.idCheck(member);
	}
	
	public int registerAccount(Member member) {
		return memberMapper.registerAccount(member);
	}
	
	public Member accountCheck(Member member) {
		return memberMapper.accountCheck(member);
	}
	
	public Member searchId(Member member) {
		return memberMapper.searchId(member);
	}
	
	public Member searchPw(Member member) {
		return memberMapper.searchPw(member);
	}
}
