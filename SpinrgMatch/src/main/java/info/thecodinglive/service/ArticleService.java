package info.thecodinglive.service;

import java.util.Date;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import info.thecodinglive.model.Article;
import info.thecodinglive.repository.ArticleRepository;

@Service
public class ArticleService {
	private final ArticleRepository articleRepository;
	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository=articleRepository;
	}

	public Page<Article> findArticleList(Pageable pageable){
		pageable=PageRequest.of(pageable.getPageNumber()<=0?0:
			pageable.getPageNumber()-1
			, pageable.getPageSize(),pageable.getSort());
		return articleRepository.findAll(pageable);
	}
	
	public void save(Article article) {
//		article.setModdate(new Date());
		articleRepository.save(article);
	}
	public Article findArticleById(Integer id) {
		return articleRepository.findById(id).orElse(new Article());
	}
	
	public void deleteById(Integer seq) {
		articleRepository.deleteById(seq);
	}
	
}
