package info.thecodinglive.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Member;
import info.thecodinglive.model.ReserveDTO;

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
	
}
