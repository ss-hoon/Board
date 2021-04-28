package com.example.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.Domain.Board;
import com.example.Domain.Reply;
import com.example.Mapper.ReplyMapper;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyMapper replyMapper;
	
	public List<Reply> getReplyList(Board board){
		return replyMapper.getReplyList(board);
	}
	
	public int insertReplyList(Reply reply) {
		int nextOrder = replyMapper.getNextOrder(reply);
		reply.setOrder(nextOrder);
		return replyMapper.insertReplyList(reply);
	}
	
	public int updateReplyList(Reply reply) {
		return replyMapper.updateReplyList(reply);
	}
	
	public void deleteReplyList(Reply reply) {
		replyMapper.deleteReplyList(reply);
	}
}
