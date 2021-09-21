package info.thecodinglive.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.OperationTime;

@Repository
public class OperationRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.operation.OperationMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<OperationTime> getOperation(int placeId) {
		HashMap<String, Integer> hm = new HashMap();
		hm.put("placeId", placeId);
		List<OperationTime> operationTimeList= sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"getOperationInfo", hm);
		
		return operationTimeList;
		
	}
	
	
}
