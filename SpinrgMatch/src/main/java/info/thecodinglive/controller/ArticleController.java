package info.thecodinglive.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.model.Article;
import info.thecodinglive.model.Member;
import info.thecodinglive.service.ArticleService;

/*@Controller*/
@RestController
@RequestMapping(value = "/article")
public class ArticleController {
	@Autowired
	ArticleService articleService; 
	
	@RequestMapping(value = "/form")
	public ModelAndView insertForm(ModelAndView mv, HttpServletRequest req) {
		mv.addObject("authUser",req.getSession(false).getAttribute("authUser"));
		mv.setViewName("thymeleaf/articleForm");
		return mv;
	}
	
	@RequestMapping(value = "/list")
	public ModelAndView list(@PageableDefault(
			size=5,sort="articleNo",direction=Sort.Direction.DESC) Pageable pageble,
			ModelAndView mv) {
		mv.addObject("articleList", articleService.findArticleList(pageble));
		mv.setViewName("thymeleaf/articleList");
		return mv;
	}
	
	@PostMapping("/insert")
	public ResponseEntity<Article> insert(@RequestBody Article article) {
		articleService.save(article);
		return new ResponseEntity<Article>(article,HttpStatus.CREATED);
	}
	
	@GetMapping("")
	public ModelAndView article(ModelAndView mv,
		@RequestParam(value = "articleNo",defaultValue="0") Integer id) {
		mv.addObject("article",articleService.findArticleById(id));
		mv.setViewName("thymeleaf/articleForm");
		return mv;
	}
	
	@Transactional
	@PutMapping("/update/{id}")
	public ResponseEntity<?> updateBoard(@PathVariable 
			int id,@RequestBody Article reqArticle){
		Article article=articleService.findArticleById(id);
		article.setTitle(reqArticle.getTitle());
		article.setContent(reqArticle.getContent());
		Date nowDate = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy.MM.dd HH:mm");
//		Date d = simpleDateFormat.format(nowDate);
		
		article.setModdate(nowDate);
		//boardService.save(board);
		return new ResponseEntity<>("{}",HttpStatus.OK);
	}
	
	@DeleteMapping("/delete/{id}")
	public ResponseEntity<?> deleteBoard(@PathVariable int id){
		try {	
		articleService.deleteById(id);
		}catch(Exception e) {
			System.out.println(e);
		}
		return new ResponseEntity<>("{}",HttpStatus.OK);
	}
	
	
	@RequestMapping("/abc")
	public String welcome(Model model) throws Exception {

	    model.addAttribute("greeting", "Hello Thymeleaf!");
	    return "/abc";
	}
	
	@RequestMapping(value = "/formTest")
	public ModelAndView insertFormTest(ModelAndView mv) {
		mv.setViewName("/aFormTest");
		return mv;
	}

}
