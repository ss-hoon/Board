package com.example.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.Domain.Board;
import com.example.Domain.Reply;
import com.example.Service.BoardService;
import com.example.Service.ReplyService;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private ReplyService replyService;
	
	@RequestMapping("/detail")
	public String getBoardDetail(Model model, Board board) {
		boardService.increaseHit(board);
		Board detailList = boardService.selectBoardDetail(board);
		List<Reply> replyList = replyService.getReplyList(board);
		
		model.addAttribute("detailList", detailList);
		model.addAttribute("replyList", replyList);
		
		return "boardDetail";
	}
	
	@RequestMapping("/insert")
	public String insertBoardList() {
		return "insertBoard";
	}
	
	@PostMapping("/insertProc")
	@ResponseBody
	public int insertProc(@RequestBody Board board) {
		return boardService.insertBoardList(board);
	}
	
	@RequestMapping("/update")
	public String updateBoardList(Model model, Board board) {
		Board detailList = boardService.selectBoardDetail(board);
		
		model.addAttribute("detailList", detailList);
		
		return "updateBoard";
	}
	
	@PostMapping("/updateProc")
	@ResponseBody
	public int updateProc(@RequestBody Board board) {		
		return boardService.updateBoardList(board);
	}
	
	@RequestMapping("/delete")
	public String deleteBoardList(Board board) {
		Board detailList = boardService.selectBoardDetail(board);
		boardService.deleteBoardList(detailList);
		
		return "redirect:/";
	}
}
