package info.thecodinglive.model;

import lombok.Data;

@Data
public class DateOperationPlace {
	private String reserveDate;
	private int operationId;		//c
	private int placeId;
	private int maxPerson;		//최대인원  c
	private int memberGroup;	//예약되어있는 인원 c
	private int possibleNum;	//예약 가능인원  c
}
