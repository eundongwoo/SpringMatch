package info.thecodinglive.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndCalendar;
import info.thecodinglive.model.ReserveDTO;
import info.thecodinglive.repository.MemberRepository;
import info.thecodinglive.repository.OperationRepository;
import info.thecodinglive.repository.PlaceRepository;
import info.thecodinglive.repository.ReservationRepository;

@Service
public class ReserveService {
	
	@Autowired
	PlaceRepository placeRepository;
	@Autowired
	OperationRepository operationRepository;
	@Autowired
	ReservationRepository reservationRepository;
	
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
	
	
	public void reserve(ReserveDTO reserveDTO) {
		int reserveCount = checkCount(reserveDTO);
		if(reserveCount<=2) {
			reservationRepository.addReservation(reserveDTO);
			reserveCount = checkCount(reserveDTO);
			if(reserveCount==3) {
				reservationRepository.stateUpdate(reserveDTO);
			}
		}
		
	}
	
	public int checkCount(ReserveDTO reserveDTO) {
		int reserveCount = reservationRepository.reserveCount(reserveDTO);	//사람수
		return reserveCount;
	}
}
