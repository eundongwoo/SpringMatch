package info.thecodinglive.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//운영시간대 정보
@Data

public class OperationTime {
	private int operationId;
	private int placeId;
	private String startTime;
	private String endTime;
	private String fullTime;
	
	/*
	 * OperationTime(String startTime, String endTime) { this.fullTime=
	 * startTime+"~"+endTime; }
	 */
	 
}
