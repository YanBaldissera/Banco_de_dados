create database func;
use func;

DELIMITER $$
create function fn_soma (a int, b int) returns int
deterministic
begin
	return a + b;
end$$
DELIMITER ;

select fn_soma(10, 30) as resultado;

DELIMITER $$
create function fn_sub (c int, d int) returns int
DETERMINISTIC
begin

	return c - d;
end$$
DELIMITER ;
select fn_sub(40, 20) as resultado_sub;

DELIMITER $$
create function fn_mult(z float, n float) returns float
DETERMINISTIC
begin
	return z * n;
end$$
DELIMITER ; 

select fn_mult(5, 10) as resultado_mult;


DELIMITER $$
create function fn_div(v float, t float) returns float
DETERMINISTIC
begin
	return v / t;
end$$
DELIMITER ;
select fn_div(50, 10) as resultado_div;




create table idade(
Nome VARCHAR(255),
Idade INT,
CPF VARCHAR(255),
primary key(CPF)
);

insert into idade(Nome, Idade, CPF)
values
('ignotoss', '25', '156.865.890-97'),
('alamo', '26', '102.855.255-31'),
('Aton', '52', '542.255.699-15');

DELIMITER $$
create function menor_idade() returns int
reads sql data
deterministic
begin
	DECLARE menor int;
    select min(Idade) from idade into menor;
    return menor;
end$$
DELIMITER ;
select menor_idade() as resultado;

DELIMITER $$
create function diferenca_idade() returns  int
reads sql data
deterministic
begin
	declare menor int;
    declare maior int;
    select min(Idade) from idade into menor;
    select max(Idade) from idade into maior;
    return maior - menor;
end$$
Delimiter ;
select diferenca_idade() as  resultado;







DELIMITER $$
create function soma(n int) returns int
deterministic
begin
declare cont int default 0;
declare soma int default 0;
	while cont <= n do
		set soma = soma + cont;
        set cont = cont + 1;
	end while;
    return soma;
end$$
DELIMITER ;
select soma(10) as resultado;

drop function soma;

DELIMITER $$
create function fibo(n int) returns int
deterministic
begin
	declare a int default 1;
	declare b int default 1;
    declare temp int;
    declare c int default 0;
    while c < n do
		set temp = a;
        set a = a + b;
        set b = temp;
        set c = c + 1;
	end while;
    return temp;
end$$
DELIMITER ;

select fibo(8) as resultado;

drop function fibo;
