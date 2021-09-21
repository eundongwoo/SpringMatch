package info.thecodinglive.model;

import lombok.Data;

@Data
public class ReserveDTO {
	private String place;
	private String date;
	private String time;
	private String memberId;
	private int placeId;
	private int operationId;
	
}
