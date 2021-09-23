package info.thecodinglive.model;

import java.util.Date;

import lombok.Data;

@Data
public class ReservationDTO {
	private int reserveNum;
	private String memberId;
	private int placeId;
	private int operationId;
	private String reserveDate;	//예약 날짜
	private String state;
	private Date regTime;		//신청날짜
}
