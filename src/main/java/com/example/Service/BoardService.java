package com.example.Service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Domain.Board;
import com.example.Domain.Paging;
import com.example.Mapper.BoardMapper;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public List<Board> selectBoardList(Paging page) {
		return boardMapper.selectBoardList(page);
	}
	
	public List<Board> selectSearchBoardList(Paging page){
		return boardMapper.selectSearchBoardList(page);
	}
	
	public Paging getPaging(Paging page) {
		int totalList = boardMapper.selectCntAll();
		
		return new Paging(totalList, page.getCurPage());
	}
	
	public Paging getPaging(Paging page, @Param("searchType") String type, @Param("searchKeyword") String keyword) {		
		int totalList = boardMapper.selectCntSearch(type, keyword);
		
		return new Paging(totalList, page.getCurPage(), type, keyword);
	}
	
	public Board selectBoardDetail(Board board) {
		return boardMapper.selectBoardDetail(board);
	}
	
	public int insertBoardList(Board board) {
		return boardMapper.insertBoardList(board);
	}
	
	public int updateBoardList(Board board) {
		return boardMapper.updateBoardList(board);
	}
	
	public void deleteBoardList(Board board) {
		boardMapper.deleteBoardList(board);
	}
	
	public void increaseHit(Board board) {
		boardMapper.increaseHit(board);
	}
}
