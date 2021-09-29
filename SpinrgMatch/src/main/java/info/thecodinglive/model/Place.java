package info.thecodinglive.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Place {
	private int placeId;
	private String placeName;
	private String placeAddr;
	private String placeTel;
	private int maxPerson;
	private String manager;
	
}
