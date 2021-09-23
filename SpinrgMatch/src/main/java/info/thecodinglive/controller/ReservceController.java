package info.thecodinglive.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import info.thecodinglive.model.CalendarDate;
import info.thecodinglive.model.Member;
import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndCalendar;
import info.thecodinglive.model.ReservationDTO;
import info.thecodinglive.model.ReserveDTO;
import info.thecodinglive.model.ReserveInfo;
import info.thecodinglive.model.Search;
import info.thecodinglive.repository.OperationRepository;
import info.thecodinglive.repository.PlaceRepository;
import info.thecodinglive.repository.ReservationRepository;
import info.thecodinglive.service.MemberService;
import info.thecodinglive.service.ReserveService;

@Controller
@RequestMapping(value="/reserve")
public class ReservceController {
	
	@Autowired
	ReserveService reserveService;
	
	@Autowired
	ReservationRepository reservationRepository;
	
	@Autowired
	OperationRepository operationRepository;
	
	@Autowired
	PlaceRepository placeRepository;
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
		System.out.println("operationTimeList정보operationId===>"+operationTimeList.get(1).getOperationId());
		System.out.println("operationTimeList정보placeId==>"+operationTimeList.get(1).getPlaceId());
		httpSession.setAttribute("operationTimeList", operationTimeList);
		return new ResponseEntity<List<OperationTime>>(operationTimeList,HttpStatus.OK);
	}
	
	
	@PostMapping(value = "/reserveSubmit")
	public String reserveSubmit(ReserveDTO reserveDTO, HttpSession httpSession) {
		Member authUser = (Member)httpSession.getAttribute("authUser");	
		if(authUser!=null) {
			reserveDTO.setMemberId(authUser.getMemberId());
		} else {
			System.out.println("로그인이 필요합니다");
			return "main";
		}
		reserveDTO.setPlaceId(Integer.parseInt(reserveDTO.getPlaceIdString()));
		reserveDTO.setOperationId(Integer.parseInt(reserveDTO.getOperationIdString()));
		System.out.println(reserveDTO.toString());
		reserveService.reserve(reserveDTO);
		System.out.println("예약되었습니다.");
		
		return "main";
	}
	
	//search클래스 리스트를 얻어서 뷰로 보내야 함.
	@GetMapping(value = "/search")
	public String searchReservation(HttpSession httpSession) throws ParseException {
		Member authUser = (Member)httpSession.getAttribute("authUser");	
		if(authUser!=null) {
			System.out.println("계속 진행합니다.");
		} else {
			System.out.println("로그인이 필요합니다");
			return "main";
		}
		
		
		List<Search> searchList = reservationRepository.searchJoinById(authUser);
		
		//현재시간의 날짜 가져와서 유저의 예약리스트에서 예약날짜(reserveDate)를 가져와서 비교한다. 그리고 업데이트문 쿼리해준다 
		//예약날짜를 파싱하는 작업.
		
		
		for(int i=0; i<searchList.size(); i++) {
			String reserveDate = searchList.get(i).getReserveDate();		
			Date nowDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy년MM월dd일");
			Date reservedt = formatter.parse(reserveDate);
			if(nowDate.after(reservedt)) {
				//Search객체의 reserveNum으로 state '매칭실패'로 update
				reservationRepository.stateUpdateByReserveNum(searchList.get(i));
				
			}
		}
		

		
		//이제 operationId로 예약시간대 구하는 작업 하고 각 Search객체에 넣어준다.
		for(int i=0; i<searchList.size(); i++) {
			OperationTime operationtime = operationRepository.getOperationTimeSearch(searchList.get(i));
			searchList.get(i).setReserveTime(operationtime.getStartTime()+"~"+operationtime.getEndTime());	// 각 리스트 요소별 예약시간대 설정
		}
		
		
		//여기까지하면 searchList완성 이걸 이제 뷰로 보낸다.
		httpSession.setAttribute("searchList", searchList);
		
		
		return "search";
	}
	
	@PostMapping(value = "/cancel")
	public String reserveCacnel(Search search, HttpSession httpSession) {
		Member authUser = (Member)httpSession.getAttribute("authUser");	
		//cancelDTO에 담긴 풋살장이름, 예약날짜, 시간대를 가지고 delete쿼리문 해주면 됨.
		
		reservationRepository.cancelReservation(search);	//reservationDTO 받아서 삭제 쿼리

		System.out.println("삭제완료");
		
		return "redirect:/reserve/search";
		
	}
	
	
	
}
