package info.thecodinglive.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Article;

@Repository
public class ArticleRepository {
private static final String MAPPER_NAME_SPACE="sample.mapper.board.ArticleMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void Insert(Article article) {
		sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"Insert",article);
	}
	
	/*
	 * public void adduser(Member member) {
	 * sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addUser",member);
	 * 
	 * } public Member loginUser(String memberId, String memberPassword) {
	 * HashMap<String, String> params = new HashMap(); params.put("memberId",
	 * memberId); params.put("memberPassword", memberPassword); return
	 * sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"loginUser",params);
	 * 
	 * }
	 */
}
