package info.thecodinglive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndCalendar;
import info.thecodinglive.repository.MemberRepository;
import info.thecodinglive.repository.OperationRepository;
import info.thecodinglive.repository.PlaceRepository;

@Service
public class ReserveService {
	
	@Autowired
	PlaceRepository placeRepository;
	@Autowired
	OperationRepository operationRepository;
	
	public List<Place> showPlace() {
		List<Place> placeList= placeRepository.getPlaceInfo();
		return placeList;
		
	}
	
	public List<OperationTime> getOperationTimeList(PlaceAndCalendar placeAndCalendar) {
		int placeId = placeRepository.getPlaceId(placeAndCalendar.getPlaceName());
		List<OperationTime> operationTimeList= operationRepository.getOperation(placeId);
		System.out.println(operationTimeList.get(0));
		return operationTimeList;
		
	}
}
