package info.thecodinglive.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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

import info.thecodinglive.model.CalendarDate;
import info.thecodinglive.model.CheckButton;
import info.thecodinglive.model.CheckRed;
import info.thecodinglive.model.DateOperationPlace;
import info.thecodinglive.model.Member;
import info.thecodinglive.model.OperationTime;
import info.thecodinglive.model.Place;
import info.thecodinglive.model.PlaceAndCalendar;
import info.thecodinglive.model.ReserveDTO;
import info.thecodinglive.model.ReserveInfo;
import info.thecodinglive.model.Search;
import info.thecodinglive.repository.OperationRepository;
import info.thecodinglive.repository.PlaceRepository;
import info.thecodinglive.repository.ReservationRepository;
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
		if(httpSession.getAttribute("authUser")==null) {
			System.out.println("로그인이 필요합니다.");
			httpSession.setAttribute("loginCheck", "no");
			
		} else {
			httpSession.setAttribute("loginCheck", "yes");
		}
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
	//결국해야 되는 것은 checkButton을 완성시켜야 한다.
	@PostMapping(value = "/timelook")
	public ResponseEntity<CheckButton> getOperationTimes(@RequestBody PlaceAndCalendar placeAndCalendar, HttpSession httpSession) throws ParseException {
		//Date nowDate = new Date();	//현재시각 불러오기
		String datefullTime;	//쿼리문에 사용될 "년 월 일"
//		DateOperationPlace dateOperationPlace = new DateOperationPlace();	//쿼리문에 사용될 객체
		CheckButton checkButton = new CheckButton();		//
		
		List<OperationTime> operationTimeList= reserveService.getOperationTimeList(placeAndCalendar);	
		List<DateOperationPlace> dopList = new ArrayList<DateOperationPlace>();
		List<CheckRed> checkRedList = new ArrayList<CheckRed>();
		//dopList에다 쿼리문에 돌릴꺼 넣어주는 작업
		for(int i=0; i<operationTimeList.size(); i++) {
			DateOperationPlace dateOperationPlace = new DateOperationPlace();
			dateOperationPlace.setOperationId(operationTimeList.get(i).getOperationId());
			dateOperationPlace.setPlaceId(operationTimeList.get(i).getPlaceId());
			dateOperationPlace.setReserveDate(placeAndCalendar.getCalendarFullDate());
			dopList.add(dateOperationPlace);
		}
		//dopList로 예약가능인원 처리
		List<DateOperationPlace> dopMemberList = reservationRepository.getMemberGroup(dopList.get(0));
		//dopMemberList에는 operationId, maxPerson, memberGroup, possbleNum 있다.
		
		//checkRedList의 checkNum완성
		for(int i=0; i<dopList.size(); i++) {
			CheckRed cr = new CheckRed();
			int maxNum = reservationRepository.getMaxPerson(dopList.get(i));	//풋살장 최대인원 
			int num = reservationRepository.getMemberSumDOP(dopList.get(i));	//이것도 수정
			if(num<maxNum) {
				cr.setCheckNum(true);	//3명보다 작으면 true
			}else {
				cr.setCheckNum(false);
			}
			checkRedList.add(cr);
		}
		//날짜 비교 해야 함  날짜 boolean완성
		for(int i=0; i<operationTimeList.size(); i++) {
			Date nowDate =new Date();
			nowDate.setHours(0);
			nowDate.setMinutes(0);
			nowDate.setSeconds(0);	//현재날짜도 00시 
//			String reserveDate = operationTimeList.get(i).getFullTime();
			String reserveDate =placeAndCalendar.getCalendarFullDate();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy년MM월dd일");
			Date reservedt = formatter.parse(reserveDate);	//예약시간 00시 
			System.out.println(nowDate+":::::"+reservedt);
			if(nowDate.before(reservedt)) {
				checkRedList.get(i).setCheckDate(true);	//nowDate가 예약시간보다 이전이면 true
			}
		}
		for(int i=0; i<operationTimeList.size(); i++) {
			System.out.println("-----checkDate"+checkRedList.get(i).isCheckDate());
		}
		//시간비교 
		for(int i=0; i<operationTimeList.size(); i++) {
			Date nowDate = new Date();
			SimpleDateFormat sdf= new SimpleDateFormat("HH:mm");
			Date reserveTime = new Date(sdf.parse(operationTimeList.get(i).getStartTime()).getTime());
			System.out.println("reserveTIME!!!===>"+reserveTime);
			reserveTime.setYear(nowDate.getYear());
			reserveTime.setMonth(nowDate.getMonth());
			reserveTime.setDate(nowDate.getDate());
//			System.out.println("변경 후 currentTIME!!!===>"+nowDate);
//			System.out.println("변경 후 reserveTIME!!!===>"+reserveTime);
			checkRedList.get(i).setCheckTime(reserveTime.after(nowDate));
		}
		//이제 checkRed의 리스트 완성
		System.out.println("checkRedList===>"+checkRedList.toString());
		System.out.println("operationTimeList===>"+operationTimeList.toString());
		for(int i=0;i<operationTimeList.size(); i++) {
			operationTimeList.get(i).setMaxNum(reservationRepository.getMaxPersonOperation(operationTimeList.get(i)));
			
		}
		
		
		//checkButton에 넣어서 이 데이터를 뷰에 전달
		checkButton.setCheckRedList(checkRedList);
		checkButton.setOperationTimeList(operationTimeList);
		checkButton.setMemberCheckList(dopMemberList);
		System.out.println("후operationTimeList===>"+operationTimeList.toString());
		System.out.println(dopMemberList.toString());
		System.out.println("test~~dopMeberList~~~~~~~~~~~~");
		
		for(int i=0; i<dopMemberList.size(); i++)  {
			System.out.println(dopMemberList.get(i).toString());
		}
		
		//풋살장 비용 가져오기
		int cost=reserveService.cost(placeAndCalendar);
		checkButton.setCost(cost);
		

		
		
		httpSession.setAttribute("operationTimeList", operationTimeList);
//		return new ResponseEntity<List<OperationTime>>(operationTimeList,HttpStatus.OK);
		return new ResponseEntity<CheckButton>(checkButton,HttpStatus.OK);
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
		reserveDTO.setMemberGroup(Integer.parseInt(reserveDTO.getMemberGroupString()));
		
		
		String memberNumCheck = reserveService.reserve(reserveDTO, httpSession);
		if(memberNumCheck.equals("full")) {
			httpSession.setAttribute("memberNumCheck", "full");
			return "redirect:/reserve/reserveHome";
		} 
		else if(memberNumCheck.equals("DoubleReserve")) {
			httpSession.setAttribute("DoubleReserve", "DoubleReserve");
			return "redirect:/reserve/reserveHome";
		} 
		else {
			httpSession.setAttribute("memberNumCheck", "good");
		}
		System.out.println("예약되었습니다.");
		httpSession.setAttribute("memberNumCheck", "good");
		return "main";
	}
	
	//search클래스 리스트를 얻어서 뷰로 보내야 함.
	@GetMapping(value = "/search")
	public String searchReservation(HttpSession httpSession) throws ParseException {
		Member authUser = (Member)httpSession.getAttribute("authUser");	
		if(authUser!=null) {
			System.out.println("계속 진행합니다.");
		} else {
			System.out.println("로그인이 필요합니다.");
			return "main";
		}
		
		
		List<Search> searchList = reservationRepository.searchJoinById(authUser);
		
		//현재시간의 날짜 가져와서 유저의 예약리스트에서 예약날짜(reserveDate)를 가져와서 비교한다. 그리고 업데이트문 쿼리해준다 
		//예약날짜를 파싱하는 작업.
		
		
		for(int i=0; i<searchList.size(); i++) {
			String reserveDate = searchList.get(i).getReserveDate();		
			Date nowDate = new Date();	//현재시간
		
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy년MM월dd일");
			Date reservedt = formatter.parse(reserveDate);	//예약시간
			reservedt.setHours(nowDate.getHours());

			nowDate.setHours(0);

			//reservedt.setTime(nowDate.getTime());	//시간도 맞춰주기
			System.out.println("nowDate===>"+nowDate.toString());
			System.out.println("reservedt===>"+reservedt.toString());
			if(nowDate.after(reservedt)) {
				//Search객체의 reserveNum으로 state '매칭실패'로 update
				reservationRepository.stateUpdateByReserveNum(searchList.get(i));
				
			}
		}
		
		searchList = reservationRepository.searchJoinById(authUser);		
		
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
