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
	
	public void login(String memberId) {
		memberRepository.loginUser(memberId);
	}
}
