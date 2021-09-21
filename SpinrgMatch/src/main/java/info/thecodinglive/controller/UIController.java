package info.thecodinglive.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.service.MemberService;


@Controller
@RequestMapping(value="/")
public class UIController {
	

		
//		@GetMapping(value = "/hello")
//		public String helloForm() {
//			return "hellojsp";
//		}
		
		@GetMapping(value = "/main")
		public String mainForm() {
			return "main";
		}
		
		@GetMapping(value = "/map")
		public String showMap() {
			return "map";
		}
		

		
}
