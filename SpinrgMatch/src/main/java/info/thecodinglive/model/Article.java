package info.thecodinglive.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
import lombok.ToString;

@Data
@Entity
@Table(name="article")
@ToString
@SequenceGenerator(
        name="ARTICLE_SEQ_GEN", //시퀀스 제너레이터 이름
        sequenceName="NUM_SEQ", //시퀀스 이름
        initialValue=1, //시작값
        allocationSize=1 //메모리를 통해 할당할 범위 사이즈
        )
public class Article implements Serializable{
	@Id
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="ARTICLE_SEQ_GEN" //식별자 생성기를 설정해놓은  NUM_SEQ으로 설정        
            )
	@Column(name = "article_no")
	private int articleNo;
	@Column(name = "member_id")
	private String memberId;
	private String title;
	private Date regdate;
	private Date moddate;
	private int readCnt;
	private String content;
	
	@PrePersist
	public void beforeCreate() {
		regdate=new Date();
		moddate=new Date();
	}
}
