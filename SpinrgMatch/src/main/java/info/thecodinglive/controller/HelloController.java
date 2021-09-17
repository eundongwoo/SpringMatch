package info.thecodinglive.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.model.UserVO;
import info.thecodinglive.repository.UserRepository;



@Controller
public class HelloController {
	
	@Autowired
	private UserRepository userRepository;
	
	@GetMapping({"","/"})
	public String hello() {
		return "hello";
	}
	
	@GetMapping("/hello")
	public ModelAndView testhello(ModelAndView mv) {
		UserVO userVO = userRepository.findByUserName("jpub");
		mv.addObject(userVO);
		mv.setViewName("hello");
		return mv;
	}
}
