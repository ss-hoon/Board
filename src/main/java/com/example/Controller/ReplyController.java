package com.example.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Domain.Board;
import com.example.Domain.Reply;
import com.example.Service.ReplyService;

import lombok.extern.slf4j.Slf4j;
 
@Slf4j
@Controller
@RequestMapping("/reply")
public class ReplyController {

	@Autowired
	private ReplyService replyService; 
	
	@RequestMapping("")
	public List<Reply> getReplyList(Board board) {
		return replyService.getReplyList(board);
	}
	
	@RequestMapping("/insert")
	@ResponseBody
	public int insertReplyList(@RequestBody Reply reply) {
		return replyService.insertReplyList(reply);
	}
	
	@RequestMapping("/update")
	@ResponseBody
	public int updateReplyList(@RequestBody Reply reply) {
		return replyService.updateReplyList(reply);
	}
	
	@RequestMapping("/delete")
	public String deleteReplyList(Reply reply) {
		log.info("reply : {}", reply);
		replyService.deleteReplyList(reply);
		
		return "redirect:/board/detail?postNum=" + reply.getPostNum();
	}
}
