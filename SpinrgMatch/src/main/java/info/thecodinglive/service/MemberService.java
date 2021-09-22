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
		System.out.println("서비스 쪽"+member.getMemberId());
		System.out.println("서비스 쪽"+member.getMemberName());
		if(member==null) {
			System.out.println("��ġ���� �ʽ��ϴ�");
			return null;
		}else
		return member;
	}
}
