package kr.jungang.dive.board.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.jungang.dive.board.domain.PostVO;
import kr.jungang.dive.board.domain.ReplyCriteria;
import kr.jungang.dive.board.domain.ReplyVO;
import kr.jungang.dive.board.service.ReplyService;
import kr.jungang.dive.framework.paging.Criteria;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j2;

@RestController
@RequestMapping("/reply/")
@Log4j2
@AllArgsConstructor
public class ReplyController {
	
	private ReplyService service;

	@GetMapping(value="/list/{pid}/{pageNum}/{amount}",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE,
						MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<ReplyCriteria> getList(
			@PathVariable("pid") long pid, 
			@PathVariable("pageNum") int pageNum, 
			@PathVariable("amount") int amount) {
		Criteria criteria = new Criteria(pageNum, amount);
		ReplyCriteria replyCri = service.getReplyWithPaging(criteria, pid);

		return new ResponseEntity<>(replyCri, HttpStatus.OK);
	}
	
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value="/createReply",
			consumes="application/json",
			produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> create(@RequestBody ReplyVO obj) {
		int cnt = service.insertReply(obj);
		if (cnt == 1) {
			return new ResponseEntity<>("success", HttpStatus.OK);
		} else {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PreAuthorize("principal.user.id == #obj.userNum")
	@RequestMapping(method= {RequestMethod.PUT, RequestMethod.PATCH},
			consumes="application/json")
	public ResponseEntity<String> modify(@RequestBody ReplyVO obj) {
		return service.updateReply(obj) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	@PreAuthorize("principal.user.id == #userNum")
	@DeleteMapping(value="/{id}/{userNum}")
	public ResponseEntity<String> remove(@PathVariable("id") long id, @PathVariable("userNum") long userNum) {
		return service.deleteReply(id) == 1 ?
				new ResponseEntity<>("success", HttpStatus.OK) :
				new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
}
