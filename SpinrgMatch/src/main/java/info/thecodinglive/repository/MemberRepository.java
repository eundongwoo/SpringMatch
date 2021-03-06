package info.thecodinglive.repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public Member loginUser(String memberId, String memberPassword) {
		Map<String, String> params = new HashMap<String, String>();
		params.put("memberId", memberId);
		params.put("memberPassword", memberPassword);
		
		return sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"loginUser",params);		
	}
	
	
	
}
