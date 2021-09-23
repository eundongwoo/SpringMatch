package info.thecodinglive.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.PlaceAndOperation;
import info.thecodinglive.model.ReservationDTO;
import info.thecodinglive.model.Search;

@Repository
public class OperationRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.operation.OperationMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OperationTime> getOperation(int placeId) {
		HashMap<String, Integer> hm = new HashMap();
		hm.put("placeId", placeId);
		List<OperationTime> operationTimeList= sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"getOperationInfo", hm);
		for(int i=0; i<operationTimeList.size(); i++) {
			operationTimeList.get(i).setFullTime(operationTimeList.get(i).getStartTime()+"~"+operationTimeList.get(i).getEndTime());
		}
		return operationTimeList;
		
	}
	
	public void addOperation(PlaceAndOperation placeAndOperation) {
		List<OperationTime> list= placeAndOperation.getOperationTimeList();
		for(int i=0; i<list.size(); i++) {
			sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addOperation", list.get(i));
		}
		
	}
	
	
	public void getOperationTime(ReservationDTO reservationDTO) {
		OperationTime operationTime = sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"getOperationTime", reservationDTO);
		System.out.println("operationTIme===>"+operationTime.toString());
	}
	
	public OperationTime getOperationTimeSearch(Search search) {
		OperationTime operationTime = sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"getOperationTimeSearch", search);
		System.out.println("operationTIme===>"+operationTime.toString());
		return operationTime;
	}
}
