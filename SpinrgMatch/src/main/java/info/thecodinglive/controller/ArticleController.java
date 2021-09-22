package info.thecodinglive.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.model.Article;
import info.thecodinglive.service.ArticleService;

@Controller
@RequestMapping(value = "/article")
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	
//	@GetMapping(value = "/write")
//	public String wrtiePage() {
//		return "newArticleForm";
//	}
	
	@RequestMapping(value = "/write")
	public ModelAndView insertForm(ModelAndView mv) {
		mv.setViewName("newArticleForm");
		return mv;
	}
	
	
//	@PostMapping("/insert")
//	public ResponseEntity<String> insert(@RequestBody Article article) {
//		articleService.Insert(article);
//		return new ResponseEntity<>(HttpStatus.CREATED);
//		//return new ResponseEntity<String>(HttpStatus.CREATED);
//	}
	
	@PostMapping("/insertProc")
	public void insert(HttpServletRequest req) {
		Article article = new Article();
		article.setTitle(req.getParameter("title"));
		article.setContent(req.getParameter("content"));
		articleService.Insert(article);
//		return new ResponseEntity<>(HttpStatus.CREATED);
		//return new ResponseEntity<String>(HttpStatus.CREATED);
	}
	

}
