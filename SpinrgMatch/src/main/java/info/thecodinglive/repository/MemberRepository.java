package info.thecodinglive.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Member;


@Repository
public class MemberRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.member.MemberMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public void adduser(Member member) {
		sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addUser",member);
		
	}
}
