package info.thecodinglive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import info.thecodinglive.model.Article;
import info.thecodinglive.repository.ArticleRepository;

@Service
public class ArticleService {
	
	@Autowired
	ArticleRepository articleRepository;
	
	public void Insert(Article article) {
		articleRepository.Insert(article);
	}
	

}
