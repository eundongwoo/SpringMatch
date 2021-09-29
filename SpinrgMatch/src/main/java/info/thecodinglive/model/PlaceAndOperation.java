package info.thecodinglive.model;

import java.util.List;

import lombok.Data;

@Data
public class PlaceAndOperation {
	private String placeName;
	private String placeAddr;
	private String placeTel;
	private String manager;
	private int maxPerson;
	private List<OperationTime> operationTimeList;
	private int placeCost;
	
}
