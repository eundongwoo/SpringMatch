package info.thecodinglive.model;

import lombok.Data;

@Data
public class Search {
	private int operationId;	//운영시간대 id
	private String placeName;	//풋살장명
	private String reserveDate;	//예약날짜
	private String reserveTime;	//예약시간 operationId로 구함
	private String regDate;		//신청날짜ReservationDTO의 regTime
	private String state;		//예약상태 
	
}
