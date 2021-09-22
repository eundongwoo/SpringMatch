package info.thecodinglive.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
		return sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"searchById", user);
	}
	
}
