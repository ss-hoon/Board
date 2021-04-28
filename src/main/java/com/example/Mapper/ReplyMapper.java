package com.example.Mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.Domain.Board;
import com.example.Domain.Reply;

@Mapper
public interface ReplyMapper {
	List<Reply> getReplyList(Board board);
	int getNextOrder(Reply reply);
	int insertReplyList(Reply reply);
	int updateReplyList(Reply reply);
	void deleteReplyList(Reply reply);
}
