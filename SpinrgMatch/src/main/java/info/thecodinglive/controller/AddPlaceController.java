package info.thecodinglive.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndOperation;

@Controller
@RequestMapping(value ="/admin")
public class AddPlaceController {

	@GetMapping(value = "/addplaceForm")
	public String addPlaceForm() {
		return "addPlace";
	}
	
	@PostMapping(value ="/addplace")
	public ResponseEntity<String> addPlace(@RequestBody PlaceAndOperation placeAndOperation	)
	{
		System.out.println(placeAndOperation.toString());
		
		return new ResponseEntity<String>("success",HttpStatus.OK);
	}
	
}
