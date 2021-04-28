package com.example.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Domain.Member;
import com.example.Service.MemberService;

@Controller()
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/login")
	public String login() {		
		return "/member/login";
	}
	
	@RequestMapping("/loginProc")
	@ResponseBody
	public int loginProc(@RequestBody Member member, HttpServletRequest req) {
		Member m = memberService.accountCheck(member);
		if(m != null) {
			HttpSession session = req.getSession();
			session.setAttribute("account", m);
			return 1;
		} else {
			return 0;
		}
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("account");
		return "redirect:/";
	}
	
	@RequestMapping("/signUp")
	public String signUp() {		
		return "/member/signUp";
	} 
	
	@RequestMapping("/idCheck")
	@ResponseBody
	public int idCheck(@RequestBody Member member) {
		return memberService.idCheck(member);
	}
	
	@PostMapping("/signUpProc")
	@ResponseBody
	public int signUpProc(@RequestBody Member member) {
		return memberService.registerAccount(member);
	}
	
	@RequestMapping("/searchId")
	public String searchId() {
		return "/member/searchId";
	}
	
	@RequestMapping("/searchIdProc")
	@ResponseBody
	public Member searchIdProc(@RequestBody Member member) {
		Member m = memberService.searchId(member);
		
		if(m == null)	return new Member();
		else return m;
	}
	
	@RequestMapping("/searchPwProc")
	@ResponseBody
	public Member searchPwProc(@RequestBody Member member) {		
		Member m = memberService.searchId(member);
		
		if(m == null)	return new Member();
		else return m;
	}
	
	@RequestMapping("/searchPw")
	public String searchPw() {
		return "/member/searchPw";
	}
}
