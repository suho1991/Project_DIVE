package kr.jungang.dive.exception;

import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import lombok.extern.log4j.Log4j2;

@ControllerAdvice
@Log4j2
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class)
	public String exception(Exception exception, Model model) {
		log.error("Exception, ", exception.getMessage());
		model.addAttribute("exception", exception);
		log.debug(model);
		
		return "exceptions/errorPage";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException exception) {
		
		return "exceptions/error404";
	}
}
