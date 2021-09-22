package info.thecodinglive.model;

import lombok.Data;

@Data
public class Article {
	private int articleNo;
	private String memberId;
	private String title;
	private int readCnt;
	private String content;
}
