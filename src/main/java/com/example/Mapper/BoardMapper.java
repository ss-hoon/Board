package com.example.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.example.Domain.Board;
import com.example.Domain.Paging;

@Mapper
public interface BoardMapper {
	List<Board> selectBoardList(Paging paging);
	List<Board> selectSearchBoardList(Paging paging);
	int selectCntAll();
	int selectCntSearch(@Param("searchType") String type, @Param("searchKeyword") String keyword);
	Board selectBoardDetail(Board board);
	int insertBoardList(Board board);
	int updateBoardList(Board board);
	void deleteBoardList(Board board);
	void increaseHit(Board board);
}
