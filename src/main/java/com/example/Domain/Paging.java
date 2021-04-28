package com.example.Domain;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Paging {
	
	/* 한 페이지 당 게시글 수 */
	private int pageSize;
	
	/* 한 화면 당 페이지 수 */
	private int blockSize;
	
	/* 현재 페이지 */
	private int curPage;
	
	/* 총 게시글 수 */
	private int totalList;
	
	/* 총 페이지 수 */
	private int totalPage;
	
	/* 시작 페이지 */
    private int startPage;
	
	/* 마지막 페이지 */
    private int endPage;
    
    /* 시작 번호 */
    private int startNo;
    
    /* 끝 번호 */
    private int endNo;
    
    /* 검색 타입 */
    private String searchType;
    
    /* 검색 키워드 */
    private String searchKeyword;
    
    public Paging(int totalList, int curPage) {
    	setTotalList(totalList);
    	setCurPage(curPage);
    	
    	makePaging();
    }
    
    public Paging(int totalList, int curPage, String searchType, String searchKeyword) {
    	setTotalList(totalList);
    	setCurPage(curPage);
    	setSearchType(searchType);
    	setSearchKeyword(searchKeyword);
    	
    	makePaging();
    }
    
    private void makePaging() {
    	if(totalList == 0)	return;
    	
    	/* 기본값 설정 */
    	if(curPage == 0)	setCurPage(1);
    	if(pageSize == 0)	setPageSize(5);
    	if(blockSize == 0)	setBlockSize(5);
    	
    	/* 총 페이지 수 계산 */
    	totalPage = totalList / pageSize;
    	if(totalList % pageSize != 0)	totalPage++;
    	
    	/* 현재 페이지 보정 */
    	if(totalPage < curPage)	curPage = totalPage;
    	
    	/* 화면에 보여질 게시글의 시작 페이지와 끝 페이지 */
    	startPage = ((curPage - 1) / blockSize) * blockSize + 1;
    	endPage = startPage + blockSize - 1;
    	
    	/* 계산된 끝 페이지 번호가 총 페이지 수보다 클 때 보정 */
    	if(totalPage < endPage)	endPage = totalPage;
    	
    	/* 화면에 보여질 게시글의 시작번호와 끝번호 */
    	endNo = totalList - (pageSize * (curPage - 1));
    	startNo = endNo - pageSize + 1;
    }
}