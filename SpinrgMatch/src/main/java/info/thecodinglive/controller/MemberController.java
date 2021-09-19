package info.thecodinglive.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.model.Member;
import info.thecodinglive.service.MemberService;



@Controller
@RequestMapping(value ="/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@PostMapping(value="/register")
	public ResponseEntity<String> insert(@RequestBody Member member) {
		System.out.println(member.getMemberName());
		memberService.register(member);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		
		return entity;
//		return new ResponseEntity<Member>(member,HttpStatus.CREATED);
		
	}
}
