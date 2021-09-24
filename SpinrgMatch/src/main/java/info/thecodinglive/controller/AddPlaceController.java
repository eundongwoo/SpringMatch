package info.thecodinglive.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndOperation;
import info.thecodinglive.repository.OperationRepository;
import info.thecodinglive.repository.PlaceRepository;

@Controller
@RequestMapping(value ="/admin")
public class AddPlaceController {
	@Autowired
	PlaceRepository placeRepository;
	
	@Autowired
	OperationRepository operationRepository;
	@GetMapping(value = "/addplaceForm")
	public String addPlaceForm() {
		return "addPlace";
	}
	
	@PostMapping(value ="/addplace")
	public ResponseEntity<String> addPlace(@RequestBody PlaceAndOperation placeAndOperation	)
	{

		System.out.println(placeAndOperation.toString());
		placeRepository.addPlace(placeAndOperation);
		int placeId = placeRepository.getPlaceId(placeAndOperation.getPlaceName());
		List<OperationTime> list= placeAndOperation.getOperationTimeList();
		for(int i=0; i<list.size(); i++) {
			list.get(i).setPlaceId(placeId);
		}
		operationRepository.addOperation(placeAndOperation);

		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
}
