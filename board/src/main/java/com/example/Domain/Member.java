package com.example.Domain;

import lombok.Data;

@Data
public class Member {
	private String userId;
	private String userPw;
	private String name;
	private char state;
	private String email;
}
