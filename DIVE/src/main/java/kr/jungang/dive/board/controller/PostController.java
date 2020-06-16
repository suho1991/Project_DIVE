package kr.jungang.dive.board.controller;

import java.util.List;

import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.jungang.dive.board.domain.PostCriteria;
import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.board.service.PostService;
import kr.jungang.dive.framework.paging.PageDTO;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/board/*")
public class PostController {
	
	private PostService postService;

	
	@GetMapping("/list")
	public void getPostList(PostCriteria postCriteria, Model model) {
		List<PostVO> list = postService.getPostWithPaging(postCriteria);
		model.addAttribute("listPost", list);
		model.addAttribute("pageMaker", new PageDTO(postService.getTotCount(postCriteria), postCriteria));
	}
	
	@GetMapping("/detailPost")
	public String findPostById(@RequestParam("id") int id, @ModelAttribute("criteria") PostCriteria postCriteria ,Model model) {
		model.addAttribute("post", postService.findById(id));
		return "board/detailPost";
	}
	
	
	@GetMapping("/create")
	@PreAuthorize("isAuthenticated()") //인증된 상태일 때 연결해 줄 것이다.
	public void createPost() {
	}
	
	@GetMapping("/updatePost")
	public void openModifyPost(@RequestParam("id") int id,@ModelAttribute("criteria") PostCriteria postCriteria, Model model) {
		model.addAttribute("post",postService.findById(id));
	}
	
	@PostMapping("/create")
	@PreAuthorize("isAuthenticated()") //인증된 상태일 때 연결해 줄 것이다.
	public String insertPost(PostVO obj, @ModelAttribute("criteria") PostCriteria postCriteria, RedirectAttributes rttr){
		postService.insertPost(obj);
		rttr.addFlashAttribute("result",obj.getId());
		rttr.addAttribute("type",postCriteria.getType());		
		rttr.addAttribute("keyword",postCriteria.getKeyword());	
		return "redirect:/board/list";
	}
	
	@PreAuthorize("principal.user.id == #obj.userNum")
	@PostMapping("/updatePost")
	public String updatePost(PostVO obj, @ModelAttribute("criteria") PostCriteria postCriteria, RedirectAttributes rttr){
		if(postService.updatePost(obj) == 1) {
			rttr.addFlashAttribute("result", obj.getId());			
		}
		return "redirect:/board/detailPost?id=" + obj.getId();
	}
	
	@PreAuthorize("principal.user.id == #userNum") //현재 사용자 id가 게시글의 작성자 id와 같을 경우 허용
	@PostMapping("/deletePost")
	public String deletePost(@RequestParam("id") int id, @ModelAttribute("criteria") PostCriteria postCriteria, 
			RedirectAttributes rttr, long userNum){
		if(postService.deletePost(id) == 1) {
			rttr.addFlashAttribute("result","delete");			
		}
		return "redirect:/board/list";
	}
	
}
