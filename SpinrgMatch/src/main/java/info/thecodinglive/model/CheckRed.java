package info.thecodinglive.model;

import lombok.Data;

//빨간색 버튼 체크 객체
@Data
public class CheckRed {
	
	private boolean checkNum;		//사람 수 비교
	private boolean checkDate;		//날짜 비교
	private boolean checkTime;		//시간 비교
}
