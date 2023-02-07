
create database gym
use gym
create table masures_custmer(id int primary key identity,
age int constraint con_age check(age>14),
height int ,
weigh int,
chest int,
waist int,
)
create table sports(id int primary key identity,
name_sport varchar(20),
id_trainer int references trainer(id), 
)
create table trainer(id int primary key identity,
name_trainer varchar(50),
num_year_experience int,

)
create table payments(id int primary key identity,
cost decimal ,
paymentDate date constraint d_date default getdate(),

)
create table log_in(id int primary key identity,
name nvarchar(50) not null,
addresse nvarchar(20) not null,
id_caost int  references payments (id),
id_masures_custmer int references masures_custmer(id),
id_sports int  references sports(id),
)

insert into masures_custmer 
values(16,60,40,30,30),
(17,60,40,30,30),
(18,60,40,30,30),
(19,60,40,30,30),
(20,60,40,30,30)

insert into sports 
values('Yoga',1),
('Lose weight',2),
('Fitness',3),
('Body Building',5),
('Exercises',4)


insert into trainer 
values('Ahed Bamatraf',1),
('Ashwag mohsen',2),
('Mohsen Omer',3),
('omer Abd allah',4),
('Abd allah bamatraf',6)

insert into payments 
values(5000,default),
(6000,default),
(7000,default),
(8000,default),
(10000,default)
insert into log_in 
values('ahmed','mukalla',1,2,4),
('omer','dees',4,2,4),
('huseen','mukalla',3,2,4),
('sara','foa',1,2,3),
('mariam','shaher',2,2,2)
select * from trainer right join sports
on trainer.id=sports.id_trainer
right join log_in 
on sports.id=log_in.id_sports
union 
select * from trainer right join sports
on trainer.id=sports.id_trainer
left join log_in 
on sports.id=log_in.id_sports
union 
select * from trainer left join sports
on trainer.id=sports.id_trainer
left join log_in 
on sports.id=log_in.id_sports
union 
select * from trainer left join sports
on trainer.id=sports.id_trainer
right join log_in 
on sports.id=log_in.id_sports


select * from masures_custmer right join log_in
on log_in.id_masures_custmer=masures_custmer.id
left join sports 
on sports.id=log_in.id_sports

select trainer.name_trainer from trainer right join sports
on trainer.id=sports.id_trainer
right join log_in 
on log_in.id_sports=sports.id
where log_in.name='ahmed'
