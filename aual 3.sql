create database aula_transi;
use aula_transi;


create table Usuario(
ID  int auto_increment,
Nome varchar(255),
Idade int,
primary key(ID)
);

drop table Usuario;
start transaction;

insert into Usuario(Nome, Idade)
values
('Yan', '25');

insert into Usuario(Nome, Idade)
values
('Eliza', '26');

create view lalal as
	select Idade from Usuario where Nome like 'y%';
    
    select * from lalal;
    
    drop view lalal;

select * from Usuario;

commit;

select * from Usuario;