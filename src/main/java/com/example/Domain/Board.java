package com.example.Domain;

import java.time.LocalDate;

import lombok.Data;

@Data
public class Board {
	private int rowNum;
	private int postNum;
	private String userId;
	private String title;
	private String contents;
	private int hitCnt;
	private LocalDate createdDate;
	private LocalDate updatedDate;
	private char deleted;
}
