/**
 * 
 */
package com.springboot.dropbucket.exceptionhandlers;


import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.multipart.MultipartException;

/**
 * @author PK
 *
 */
@ControllerAdvice
public class GlobalExceptionHandler {

	@ExceptionHandler(MultipartException.class)
	public String fileSizeExceed(){
		
		return "redirect:/dashboard?exceedfilesize=true";
	}
}
