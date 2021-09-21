package info.thecodinglive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import info.thecodinglive.model.Place;
import info.thecodinglive.repository.MemberRepository;
import info.thecodinglive.repository.PlaceRepository;

@Service
public class ReserveService {
	
	@Autowired
	PlaceRepository placeRepository;
	
	public List<Place> showPlace() {
		List<Place> placeList= placeRepository.getPlaceInfo();
		return placeList;
		
	}
}
