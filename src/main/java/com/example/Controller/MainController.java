package com.example.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.Domain.Board;
import com.example.Domain.Paging;
import com.example.Service.BoardService;

@Controller
public class MainController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping("")
	public String main(Model model, @RequestParam(value="searchType", required = false) String type, @RequestParam(value="searchKeyword", required = false) String keyword, Paging page) {	
		Paging paging;
		List<Board> list;
		String url = "";
		
		/* 클라이언트에서 검색 조건이 들어온 경우와 그렇지 않은 경우 구분 */
		if(keyword == null) {
			paging = boardService.getPaging(page);
			list = boardService.selectBoardList(paging);
		} else {
			url += "&searchType=" + type;
			url += "&searchKeyword=" + keyword;
			paging = boardService.getPaging(page, type, keyword);
			list = boardService.selectSearchBoardList(paging);
		}
		
		model.addAttribute("paging", paging);
		model.addAttribute("list", list);
		model.addAttribute("url", url);
		
		return "boardList";
	}
}
