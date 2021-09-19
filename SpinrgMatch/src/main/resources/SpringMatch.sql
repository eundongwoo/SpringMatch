/*회원*/
create table member(
	member_id varchar(50) primary key,
	member_name varchar(50) not null,
	member_password varchar(50) not null,
	member_tel varchar(50) not null,
	author char(1) default '0',
	regdate timestamp 
);

insert into member values('admin', '관리자', 'admin', '1234', '1');

/*예약 */
create table reservation(
	reserve_num int primary key,
	member_id varchar(50) not null CONSTRAINT fk_member_id  REFERENCES member(member_id) ON DELETE CASCADE,
	place_id int not null CONSTRAINT fk_place_id  REFERENCES place(place_id),
	operation_id int not null CONSTRAINT fk-operation_id references operation(operation_id),
	reserve_date varchar(50) not null,
	state varchar(25) default '예약대기',
	reg_time date default sysdate
);
create sequence reserve_num increment by 1 start with 1;

/*place*/

create table place(
	place_id int primary key,
	place_name varchar(50) not null,
	place_addr varchar(50) not null,
	place_tel varchar(50) not null,
	manager varchar(50) not null
);
create sequence place_num increment by 1 start with 1;
insert into place values(place_num.NEXTVAL,'북현풋살구장','대구 북구 복현동 302-16','053-383-2630');
insert into place values(place_num.NEXTVAL,'lfc풋살파크','대구 달서구 달구벌대로 1820','650-81-00575');

/*operation*/

create table operation(
	id int PRIMARY key,
	place_id int not null CONSTRAINT operation_place_id  REFERENCES place(place_id),
	start_time varchar(10),
	end_time varchar(10)
	);
create sequence operation_num increment by 1 start with 1; /*시퀀스 */
	
insert into operation values(operation_num.NEXTVAL,1,'09:00~12:00');
insert into operation values(operation_num.NEXTVAL,1,'13:00~16:00');
insert into operation values(operation_num.NEXTVAL,1,'18:00~21:00');
insert into operation values(operation_num.NEXTVAL,2,'10:00~13:00');
insert into operation values(operation_num.NEXTVAL,2,'14:00~17:00');
insert into operation values(operation_num.NEXTVAL,2,'19:00~22:00');
insert into operation values(operation_num.NEXTVAL,2,'22:00~00:00');

/*notice*/

create table notice(
	notice_no int primary key,
	member_id varchar(50) not null constraint fk_notice references member(member_id) ON DELETE CASCADE,
	title varchar(225) not null,
	regdate timestamp not null,
	moddate timestamp not null,
	read_cnt int,
	content varchar2(2000) not null,
	);

/*article*/
	
create table article(
	article_no int primary key,
	member_id varchar(50) not null constraint fk_article references member(member_id) ON DELETE CASCADE,
	title varchar(225) not null,
	regdate timestamp not null,
	moddate timestamp not null,	
	read_cnt int,
	content varchar(2000) not null,
	);
	
create sequence num_seq increment by 1 start with 1;

/*article comment*/

create table article_comment (
	comment_num int not null primary key,
	member_id varchar(50) not null constraint fk_comment_member references member(member_id) ON DELETE CASCADE,	
	article_no int constraint fk_comment references article(article_no) ON DELETE CASCADE,
	comment_date timestamp not null,
	comment_content varchar(1000) not null
	);

