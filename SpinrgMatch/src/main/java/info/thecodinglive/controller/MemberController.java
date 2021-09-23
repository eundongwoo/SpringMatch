package info.thecodinglive.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

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
import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import info.thecodinglive.model.Member;
import info.thecodinglive.service.MemberService;



@Controller
@RequestMapping(value="/member")
public class MemberController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping(value = "/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@GetMapping(value = "/joinForm")
	public String joinForm() {
//		mv.setViewName("joinForm");
//		return mv;
		return "joinForm";
	}
	
	@PostMapping(value="/register")
	public ResponseEntity<String> insert(@RequestBody Member member) {
		System.out.println(member.getMemberName());
		memberService.register(member);
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		
		
		return entity;
//		return new ResponseEntity<Member>(member,HttpStatus.CREATED);
		
	}
	
	@PostMapping(value="/login")
	public ResponseEntity<String> login(@RequestBody Member member, HttpSession session) {
		//System.out.println(member.getMemberName());
//		memberService.register(member);
		ResponseEntity<String> entity;
		System.out.println(member.getMemberId());
		System.out.println(member.getMemberPassword());
		Member user = memberService.login(member.getMemberId(), member.getMemberPassword());
		
		System.out.println("->>>>"+user.getMemberId());
		System.out.println("->>>>"+user.getMemberName());
		System.out.println("->>>>"+user.getMemberPassword());
		System.out.println("->>>>"+user.getMemberTel());
		System.out.println("->>>>"+user.getAuthor());
		
		if(user==null) {

			System.out.println("로그인 실패");

			session.setAttribute("authUser", null);
			return null;
		}else {

			System.out.println("로그인 성공");

			session.setAttribute("authUser", user);
			System.out.println("user"+user.toString());
			return new ResponseEntity<String>("success",HttpStatus.OK);
		}
	}
	
//	@GetMapping(value="/logout")
//	public String logout(HttpSession session) {
//		
//		session.invalidate();
//		
//		return "/main";
//		}
	
	@GetMapping(value="/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) throws IOException {
		
		HttpSession session=request.getSession();
		if(session !=null)
		{
			session.invalidate();			
		}
		
		mv.setViewName("/main");
		
		return mv;
		}
	
}
