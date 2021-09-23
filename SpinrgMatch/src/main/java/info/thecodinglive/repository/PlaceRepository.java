package info.thecodinglive.repository;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import info.thecodinglive.model.Member;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndOperation;
import info.thecodinglive.model.Search;

@Repository
public class PlaceRepository {
	private static final String MAPPER_NAME_SPACE="sample.mapper.place.PlaceMapper.";
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	//place 리스트 가져옴
	public List<Place> getPlaceInfo() {
		System.out.println("여기");
		HashMap<String, String> params = new HashMap();
		params.put("placeName", "북현풋살구장");
		List<Place> placeList = sqlSessionTemplate.selectList(MAPPER_NAME_SPACE+"getPlaceInfo");
		System.out.println(placeList);
		
		
		return placeList;
	}
	
	public int getPlaceId(String place) {
		System.out.println("place"+place);
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("place", place);
		// placeId
		 Place placeSample=(Place)sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"getPlaceId", params);
		int placeId = placeSample.getPlaceId();
		System.out.println("placeId"+placeId);
		return placeId;
		
	}
	
	public void addPlace(PlaceAndOperation placeAndOperation) {
		sqlSessionTemplate.insert(MAPPER_NAME_SPACE+"addPlace", placeAndOperation);
	}
	
	public void getPlaceName(Search search) {
		sqlSessionTemplate.selectOne(MAPPER_NAME_SPACE+"getPlaceName", search);
	}
	
}
