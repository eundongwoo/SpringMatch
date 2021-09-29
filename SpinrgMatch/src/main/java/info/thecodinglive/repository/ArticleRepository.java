package info.thecodinglive.repository;

import org.apache.ibatis.annotations.Param;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Article;

@Repository
public interface ArticleRepository extends JpaRepository<Article, Integer>{
	Article findByMemberId(@Param("memberId") String memberid);
}
