package info.thecodinglive.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import info.thecodinglive.model.Article;
import info.thecodinglive.service.ArticleService;

@RestController
@RequestMapping(value = "/article")
public class ArticleController {
	@Autowired
	ArticleService articleService; 
	
	@RequestMapping(value = "/form")
	public ModelAndView insertForm(ModelAndView mv) {
		mv.setViewName("/articleForm");
		return mv;
	}
	
	@RequestMapping(value = "/formTest")
	public ModelAndView insertFormTest(ModelAndView mv) {
		mv.setViewName("/aFormTest");
		return mv;
	}
	@RequestMapping(value = "/list")
	public ModelAndView list(@PageableDefault(
			size=5,sort="articleNo",direction=Sort.Direction.DESC) Pageable pageble,
			ModelAndView mv) {
		mv.addObject("articleList", articleService.findArticleList(pageble));
		System.out.println(articleService.findArticleList(pageble).toString());
		mv.setViewName("/articleList");
		return mv;
	}
	
	@PostMapping("/insert")
	public ResponseEntity<Article> insert(@RequestBody Article article) {
		articleService.save(article);
		return new ResponseEntity<Article>(article,HttpStatus.CREATED);
	}
	
	@GetMapping("")
	public ModelAndView article(ModelAndView mv,
		@RequestParam(value = "id",defaultValue="0") Integer id) {
		mv.addObject("article",articleService.findArticleById(id));
		mv.setViewName("/articleForm");
		return mv;
	}

}
