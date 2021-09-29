package info.thecodinglive.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Operation {

	private int operationId;
	private int placeId;
	private String startTime;
	private String endTime;
	
}
