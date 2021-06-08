create table player_tbl_09(
player_no number not null primary key,
player_name varchar2(20) not null,
team_no number,
player_phone varchar2(14),
player_birth date,
player_email varchar2(50),
back_no number
);

insert into player_tbl_09 values(10001,'홍명보',10,'1112223333','80/08/10','',15);
insert into player_tbl_09 values(10002,'추신수',10,'2223334444','81/07/10','',20);
insert into player_tbl_09 values(10003,'홍길동',10,'3334445555','80/03/20','',21);
insert into player_tbl_09 values(10004,'이순신',10,'4445556666','82/11/20','',5);

select * from player_tbl_09;

--select2
select match_no, sum(player_score) player_score,
sum(yellow_card) yellow_card, sum(red_card) red_card
from record_tbl_09
group by match_no
order by 1;

--select2_2
select player_no, sum(player_score) player_score,
rank() over(order by sum(player_score) desc,sum(yellow_card),sum(red_card)) rank
from record_tbl_09
group by player_no
order by 3;

select player_no, player_name, player_score||'골'
from player_tbl_09 natural join (select player_no, sum(player_score) player_score,
								rank() over(order by sum(player_score) desc,
								sum(yellow_card),sum(red_card)) rank
								from record_tbl_09
								group by player_no)
where rank=1;	

create table record_tbl_09(
record_no number not null primary key,
player_no number,
match_no number,
p_time number(3),
player_score number(2),
yellow_card number(2),
red_card number(2)
);

insert into record_tbl_09 values(1,10001,111,5,0,0,0);
insert into record_tbl_09 values(2,10002,111,90,1,0,1);
insert into record_tbl_09 values(3,10003,111,90,0,2,0);
insert into record_tbl_09 values(4,10004,111,45,2,0,0);
insert into record_tbl_09 values(5,10005,111,45,0,0,0);
insert into record_tbl_09 values(6,10001,112,90,1,0,0);
insert into record_tbl_09 values(7,10002,112,90,1,0,0);
insert into record_tbl_09 values(8,10003,112,90,0,1,0);
insert into record_tbl_09 values(9,10004,112,90,1,1,0);
insert into record_tbl_09 values(10,10005,112,90,0,0,1);
insert into record_tbl_09 values(11,10001,113,45,3,2,1);
insert into record_tbl_09 values(12,10002,113,90,1,1,0);
insert into record_tbl_09 values(13,10003,113,45,2,1,0);
insert into record_tbl_09 values(14,10004,113,45,0,0,0);
insert into record_tbl_09 values(15,10005,113,45,0,0,0);

select * from record_tbl_09;




--select
select player_no,player_name,team_no,player_phone,back_no,
to_char(player_birth,'mm/dd') player_birth
from player_tbl_09
order by 5;

--update
select player_no,player_name,team_no,player_phone,
to_char(player_birth,'yy/mm/dd') player_birth,player_email,back_no
from player_tbl_09
where player_no=10001;