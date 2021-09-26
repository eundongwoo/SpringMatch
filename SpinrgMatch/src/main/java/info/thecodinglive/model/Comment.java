package info.thecodinglive.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.Data;
import lombok.Getter;
import lombok.ToString;

@Getter
@Entity
@Table(name="article_comment")
@ToString
@SequenceGenerator(
        name="COMMENT_SEQ_GEN", //시퀀스 제너레이터 이름
        sequenceName="NUM_SEQ", //시퀀스 이름, article 시퀀스를 공유함
        initialValue=1, //시작값
        allocationSize=1 //메모리를 통해 할당할 범위 사이즈
        )
public class Comment implements Serializable{
	@Id
	@GeneratedValue(
            strategy=GenerationType.SEQUENCE, //사용할 전략을 시퀀스로  선택
            generator="COMMENT_SEQ_GEN" //식별자 생성기를 설정해놓은  NUM_SEQ으로 설정       
            )
	@Column(name = "comment_num")
	private int commentNum;
	@Column(name = "member_id")
	private String memberId;
	@Column(name = "article_no")
	private int articleNo;
	@Column(name = "comment_date")
	private Date commentDate;
	@Column(name = "comment_content")
	private String commentContent;
	@PrePersist
	public void beforeCreate() {
		commentDate=new Date();
	}
	
//	@ManyToOne(targetEntity=Article.class, fetch = FetchType.LAZY) 
//	@JoinColumn(name="article_no")
//	private Article article;
}
