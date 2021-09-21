package info.thecodinglive.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import info.thecodinglive.model.CalendarDate;
import info.thecodinglive.model.Member;
import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndCalendar;
import info.thecodinglive.model.ReserveDTO;
import info.thecodinglive.model.ReserveInfo;
import info.thecodinglive.service.MemberService;
import info.thecodinglive.service.ReserveService;

@Controller
@RequestMapping(value="/reserve")
public class ReservceController {
	
	@Autowired
	ReserveService reserveService;
	
	
	//하나의 날짜, 풋살장, 시간대 정보 있는 객체 만들어서 세션에 넣기
	@GetMapping(value = "/reserveHome")
	public String init(HttpSession httpSession) {
		if(httpSession.getAttribute("reserveInfo")==null) {
			httpSession.setAttribute("reserveInfo", new ReserveInfo());
			System.out.println("reserveInfo생성");
		}
		List<Place> placeList = reserveService.showPlace();
		System.out.println("풋살장이름:"+placeList.get(0).getPlaceName());	//test
		httpSession.setAttribute("placeList", placeList);
		return "reserve";
	}
	
	@PostMapping(value = "/map")
	public ResponseEntity<ReserveInfo> getPlaceName(@RequestBody Place place, HttpSession httpSession) {
		
		System.out.println("가져온 풋살장이름:"+place.getPlaceName());	//test
		ReserveInfo reserveInfo = (ReserveInfo) httpSession.getAttribute("reserveInfo");
		reserveInfo.setPlaceName(place.getPlaceName());	
		httpSession.setAttribute("reserveInfo", reserveInfo);
		ReserveInfo ts=(ReserveInfo)httpSession.getAttribute("reserveInfo");
		System.out.println("test"+ts.getPlaceName());
		return new ResponseEntity<ReserveInfo>(reserveInfo,HttpStatus.OK);
	}
	
	@PostMapping(value = "/calendar")
	public ResponseEntity<ReserveInfo> getCalendarDate(@RequestBody CalendarDate calendarDate, HttpSession httpSession) {
		System.out.println(calendarDate.getCalendarFullDate());		
		ReserveInfo reserveInfo=(ReserveInfo)httpSession.getAttribute("reserveInfo");
		reserveInfo.setDate(calendarDate.getCalendarFullDate());
		httpSession.setAttribute("reserveInfo", reserveInfo);
		return new ResponseEntity<ReserveInfo>(reserveInfo,HttpStatus.OK);
	}
	
	@PostMapping(value = "/timelook")
	public ResponseEntity<List<OperationTime>> getOperationTimes(@RequestBody PlaceAndCalendar placeAndCalendar, HttpSession httpSession) {
		List<OperationTime> operationTimeList= reserveService.getOperationTimeList(placeAndCalendar);		
		System.out.println("operationTimelist정보"+operationTimeList.get(0).getFullTime());
		System.out.println("operationTimeList정보"+operationTimeList.get(1).getFullTime());
		httpSession.setAttribute("operationTimeList", operationTimeList);
		return new ResponseEntity<List<OperationTime>>(operationTimeList,HttpStatus.OK);
	}
	
	
	@PostMapping(value = "/reserveSubmit")
	public String reserveSubmit(@RequestBody ReserveDTO reserveDTO, HttpSession httpSession) {
				
		System.out.println("operationTimelist정보"+operationTimeList.get(0).getFullTime());
		System.out.println("operationTimeList정보"+operationTimeList.get(1).getFullTime());
		httpSession.setAttribute("operationTimeList", operationTimeList);
		return "main";
	}
	
	
}
