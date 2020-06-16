package kr.jungang.dive.product.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.jungang.dive.board.domain.PostCriteria;
import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.framework.domain.AttachVO;
import kr.jungang.dive.framework.paging.PageDTO;
import kr.jungang.dive.product.domain.ProductCriteria;
import kr.jungang.dive.product.domain.ProductVO;
import kr.jungang.dive.product.service.ProductService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProductController {
	
	private ProductService productService;

	
	@GetMapping("/list")
	public void getProductList(ProductCriteria productCriteria, Model model) {
		List<ProductVO> list = productService.getWithPagingProduct(productCriteria);
		model.addAttribute("listProduct", list);
		model.addAttribute("pageMaker", new PageDTO(productService.getTotCount(productCriteria), productCriteria));
	}
	
	@GetMapping("/getAttachList")
	@ResponseBody
	public ResponseEntity<List<AttachVO>> getAttachList(int id) {
		return new ResponseEntity<>(productService.getAttachList(id), HttpStatus.OK);
	}
	
	
	@GetMapping("/detailProduct")
	public String detailProduct(@RequestParam("id") int id, @ModelAttribute("criteria") PostCriteria postCriteria ,Model model) {
		model.addAttribute("product",productService.findById(id));
		return "product/detailProduct";
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()") //인증된 상태일 때 연결해 줄 것이다.
	public void regiProduct() {
		
	}
	
	@GetMapping("/updateProduct")
	public void updateProduct(@RequestParam("id") int id,@ModelAttribute("criteria") PostCriteria postCriteria, Model model) {
		model.addAttribute("product",productService.findById(id));
	}
	
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()") //인증된 상태일 때 연결해 줄 것이다.
	public String regiProduct(ProductVO obj, @ModelAttribute("criteria") ProductCriteria productCriteria, RedirectAttributes rttr){
		productService.registerProduct(obj);
		rttr.addFlashAttribute("result",obj.getId());
		rttr.addAttribute("type",productCriteria.getType());		
		rttr.addAttribute("keyword",productCriteria.getKeyword());	
		return "redirect:/product/list";
	}
	
	
	
	@PreAuthorize("principal.user.id == #obj.userNum")
	@PostMapping("/updateProduct")
	public String updatePost(ProductVO obj, @ModelAttribute("criteria") PostCriteria postCriteria, RedirectAttributes rttr){
		if(productService.updateProduct(obj)) {
			rttr.addFlashAttribute("result","success");			
		}
		return "redirect:/product/detailProduct?id=" + obj.getId();
	}
	
	@PreAuthorize("principal.user.id == #userNum") //현재 사용자 id가 게시글의 작성자 id와 같을 경우 허용
	@PostMapping("/deleteProduct")
	public String deletePost(@RequestParam("id") int id, @ModelAttribute("criteria") PostCriteria postCriteria, 
			RedirectAttributes rttr, long userNum){
		if(productService.deleteProduct(id) == 1) {
			rttr.addFlashAttribute("result","success");			
		}
		return "redirect:/product/list";
	}
	
}
