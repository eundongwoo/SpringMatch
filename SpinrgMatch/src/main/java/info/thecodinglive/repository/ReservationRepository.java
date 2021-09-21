package info.thecodinglive.repository;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Member;
import info.thecodinglive.model.ReserveDTO;

@Repository
public class ReservationRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.reservation.reservationMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	
	public void addReservation(ReserveDTO reserveDTO) {
		
		sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addReservation",params);
		
	}
	
}
