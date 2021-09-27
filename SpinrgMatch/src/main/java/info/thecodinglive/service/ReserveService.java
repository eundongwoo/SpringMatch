package info.thecodinglive.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import info.thecodinglive.model.Member;
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
	
	
	public String reserve(ReserveDTO reserveDTO, HttpSession httpSession) {
		/* int reserveCount = checkCount(reserveDTO); */		//아이디 수	
		int maxNum = placeRepository.getMaxPersonPlace(reserveDTO);	//최대인원
		int reserveCount = reservationRepository.getMemberSum(reserveDTO);	//맨 처음 예약테이블 인원수 합
		int reserveCheck= reserveCheck(reserveDTO);
		System.out.println("maxNum==>"+maxNum+"reserveCount==>"+reserveCount);
		if(reserveCheck==1)
		{
			System.out.println("이미 예약했어...");
			
		}else
		{
			//if(reserveCount<=maxNum-1) {
				int requestNum = reserveDTO.getMemberGroup();	//예약 요청 인원 수 
				if(requestNum+reserveCount<=maxNum) {
					reservationRepository.addReservation(reserveDTO);
					/* reserveCount = checkCount(reserveDTO); */
					reserveCount = reservationRepository.getMemberSum(reserveDTO);	//예약 후 인원수 합
					if(reserveCount==maxNum) {
						reservationRepository.stateUpdate(reserveDTO);
					}
					httpSession.setAttribute("memberNumCheck", "good");
				}else if(reserveCount+requestNum>maxNum) {
					System.out.println("예약인원을 확인해주세요");					
					return "full";
				}
				
				
				
				
			//}
			
		}
		return "good";		
	}
	
	public int reserveCheck(ReserveDTO reserveDTO)
	{
		int reserveCheck=reservationRepository.reserveCheck(reserveDTO);
		return reserveCheck;
		
	}
	
	public int checkCount(ReserveDTO reserveDTO) {
		int reserveCount = reservationRepository.reserveCount(reserveDTO);	//사람수
		return reserveCount;
	}
	
	public int cost(PlaceAndCalendar placeAndCalendar)
	{
		int cost=reservationRepository.getCost(placeAndCalendar);
		return cost;
	}
	
	
	
	/*
	 * public void cancel(ReserveDTO reserveDTO, Member authUser) { //reserveDTO로부터
	 * place로부터 placeId, date로부터 reserveDate, time으로부터 operationId가져와야 됨 //그리고 그
	 * 정보들을 ReservationDTO에 넣어줘야 함. reservationRepository.cancelReservation(null); }
	 */
}
