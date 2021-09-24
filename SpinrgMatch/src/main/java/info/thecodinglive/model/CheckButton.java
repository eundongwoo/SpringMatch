package info.thecodinglive.model;

import java.util.List;

import lombok.Data;

@Data
public class CheckButton {
	private List<OperationTime> operationTimeList;
	private List<CheckRed> checkRedList;
	private int cost;
	private List<DateOperationPlace> memberCheckList;
	
}
