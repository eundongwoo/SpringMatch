package info.thecodinglive.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import info.thecodinglive.model.Member;
import info.thecodinglive.repository.MemberRepository;


@Service
public class MemberService {
	@Autowired
	MemberRepository memberRepository;
	
	public void register(Member member) {
		memberRepository.adduser(member);
	}
	
	public Member login(String memberId, String memberPassword) {
		Member member = memberRepository.loginUser(memberId, memberPassword);	
		if(member==null) {
			System.out.println("일치하지 않습니다");
			return null;
		}else
		return member;
	}
}
