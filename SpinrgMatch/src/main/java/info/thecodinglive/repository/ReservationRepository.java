package info.thecodinglive.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.DateOperationPlace;
import info.thecodinglive.model.Member;
import info.thecodinglive.model.ReservationDTO;
import info.thecodinglive.model.ReserveDTO;
import info.thecodinglive.model.Search;

@Repository
public class ReservationRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.reservation.ReservationMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//예약
	public void addReservation(ReserveDTO reserveDTO) {
		System.out.println("====repository>"+reserveDTO.toString());
		System.out.println("체크 operationID"+reserveDTO.toString());
		sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addReservation", reserveDTO);
		
	}
	
	public int reserveCount(ReserveDTO reserveDTO) {
		
		int reserveCount = sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"reserveCount", reserveDTO);
		System.out.println("rscount"+reserveCount);
		return reserveCount;
		
	}
	
	public void stateUpdate(ReserveDTO reserveDTO) {
		sqlSessionTemplate.update(MAPPER_NAME_SPACE+"stateUpdate", reserveDTO);
		System.out.println("업데이트");
	}
	
	public List<ReservationDTO> searchById(Member user) {
		List<ReservationDTO> list = sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"searchById", user);;
		for(int i=0; i<list.size(); i++) {
			list.get(i).setMemberId(user.getMemberId());
		}

		return list;
	}
	
	
	//Search의 리스트 조인으로 반환
	public List<Search> searchJoinById(Member user) {
		List<Search> list = sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"searchJoinById", user);
		
		return list;
	}
	
	//예약 취소
	public void cancelReservation(Search search) {
		sqlSessionTemplate.delete(MAPPER_NAME_SPACE+"cancelReservation", search);
		System.out.println("삭제되었습니다");
	}
	
	public void stateUpdateByReserveNum(Search search) {
		sqlSessionTemplate.update(MAPPER_NAME_SPACE+"stateUpdateByReserveNum", search);
		System.out.println("매칭실패로 update");
	}
	
	public int searchByDop(DateOperationPlace dateOperationPlace) {
		return sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"searchByDop", dateOperationPlace);
			
	}
	
}
