create database jogo;
use jogo;

create table Usuário(
ID int auto_increment,
Usuario varchar(50),
senha varchar(50),
email varchar(50),
nivel int,
ouro int,
primary key(ID)
);

create table cidade(
ID_CIDADE int auto_increment,
lider int,
nome_cidade varchar(50),
pontos int,
coordenada_x int,
coordenada_y int,
soldados int,
primary key(ID_CIDADE),
foreign key (lider) references Usuário(ID)
);
drop table cidade;

create table ataque(
ID_ATAQUE int auto_increment,
origem int,
destino int,
numero_soldados int,
primary key(ID_ATAQUE),
foreign key (origem) references cidade(ID_CIDADE),
foreign key (destino) references cidade(ID_CIDADE)
);

insert into Usuário(Usuario, senha, email, nivel, ouro)
values
('Jose', '1234', 'jose@fina.com', '58', '35000'),
('Yan', '12345', 'yan@reubouças.com', '58', '35000'),
('Ruan', '12345', 'ruan@botanico.com', '58', '35000'),
('Jonathan', '12345', 'jonathan@caximba.com', '58', '35000');

insert into cidade(lider, nome_cidade, pontos, coordenada_x, coordenada_y, soldados)
values
('1', 'donagilsy', '25', '30', '31', '42'),
('1', 'kellycristina', '12', '28', '29', '19'),
('2', 'reubouças', '25', '34', '35', '42'),
('2', 'acapulco', '12', '26', '27', '19'),
('3', 'botanico', '25', '12', '13', '42'),
('3', 'arvore', '12', '10', '11', '19'),
('4', 'caximba', '12', '6', '7', '19'),
('4', 'araucaria', '12', '4', '5', '19');

insert into ataque(origem, destino, numero_soldados)
values
('1', '8', '25'),
('2', '7', '10'),
('3', '6', '28'),
('4', '5', '19');


select * from ataque;
select * from cidade;

#1
select usuario, senha from Usuário;

#2
select coordenada_x, coordenada_y, pontos from cidade;

#3
select origem, destino from ataque;

#4
create view usuario_cidade as
	select Usuário.usuario as lider, cidade.nome_cidade,  cidade.coordenada_x, cidade.coordenada_y from Usuário join cidade on Usuário.ID = cidade.lider;
    
    select * from usuario_cidade;
    
#5

delimiter $$
create function func(n int) returns int
DETERMINISTIC
begin
	declare x int;
    set x = n;
return x * 3;
end$$
delimiter ;

select func(3);

#6

delimiter $$
create function cidade_soldado(var_ID int, var_numero_soldado int) returns int
deterministic
begin
	declare n_soldados int;
	select soldados from cidade where ID_CIDADE = var_ID  into n_soldados;
    if n_soldados >= var_numero_soldado then
		return '1';
	else
		return '0';
	end if;
end$$
delimiter ;
    
select cidade_soldado(2,10);
    
DROP function cidade_soldado;