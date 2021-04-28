package com.example.Mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.Domain.Member;

@Mapper
public interface MemberMapper {
	int idCheck(Member member);
	int registerAccount(Member member);
	Member accountCheck(Member member);
	Member searchId(Member member);
	Member searchPw(Member member);
}
