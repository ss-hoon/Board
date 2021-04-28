package com.example.Domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Reply {
	private int idx;
	private int postNum;
	private int parent;
	private String contents;
	private String userId;
	private int level;
	private int order;
	private LocalDate createdDate;
	private LocalDate updatedDate;
	private char deleted;
}
