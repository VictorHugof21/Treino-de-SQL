create database balada_neon;

use balada_neon;

create table eventos(
id_eventos int primary key auto_increment,
nome varchar(80),
estilo_musica varchar(40),
data_evento date,
di_principal varchar(60),
capacidade int

);

create table ingresso (
id_ingresso int primary key auto_increment,
tipo varchar (30),
preco decimal (10,2),
quantidade_vendida int,
lote int,

fk_id_eventos int,

foreign key (fk_id_eventos)
references eventos (id_eventos)
);

INSERT INTO eventos (nome, estilo_musica, data_evento, di_principal, capacidade) VALUES
('Rock Caramujo', 'Rock', '2027-09-20', 'DJ Marcelo Rock', 500),
('Noite Eletronica', 'Eletronica', '2027-10-15', 'DJ Luna', 1000),
('Samba na Neon', 'Samba', '2027-11-05', 'DJ Pagodeiro', 800),
('Funk das Estrelas', 'Funk', '2027-12-12', 'DJ Kevin Mix', 1500),
('Festival Pop', 'Pop', '2028-01-20', 'DJ Melody', 1200),
('Reggae Sunset', 'Reggae', '2028-02-18', 'DJ Marley Jr', 600),
('Techno Night', 'Techno', '2028-03-10', 'DJ Shadow', 2000),
('Noite Sertaneja', 'Sertanejo', '2028-04-22', 'DJ Bia Country', 900),
('Hip Hop Party', 'Hip Hop', '2028-05-13', 'DJ King Beats', 400),
('Neon Festival', 'Eletronica', '2028-06-25', 'DJ Aurora', 1800);

INSERT INTO ingresso (tipo, preco, quantidade_vendida, lote, fk_id_eventos) VALUES
('Pista', 50.00, 200, 1, 1),
('VIP', 120.00, 100, 2, 1),
('Pista', 40.00, 300, 1, 2),
('Camarote', 250.00, 80, 2, 2),
('Pista', 30.00, 250, 1, 3),
('VIP', 100.00, 150, 1, 4),
('Camarote', 300.00, 200, 2, 5),
('Pista', 60.00, 180, 1, 6),
('VIP', 180.00, 120, 1, 7),
('Camarote', 280.00, 90, 1, 8);

-- 1. Mostre todos os eventos cadastrados.

select * from eventos;

-- 2. Mostre somente nome, estilo musical e data dos eventos.

select nome, estilo_musica, data_evento from eventos;

-- 3. Liste todos os registros de ingresso.

select * from ingresso;

-- 3. Liste todos os registros de ingresso.

select * from eventos 
where estilo_musica = 'Funk';

 -- 5. Liste os eventos com capacidade superior a 800 pessoas.
 
 select * from eventos 
 where capacidade > 800;
 
 -- 6. Mostre os ingressos com preço acima de R$ 100.

select * from ingresso 
where preco > 100.00;

-- 7. Liste os ingressos do tipo VIP.

select * from ingresso
where tipo = 'Vip';

-- 8. Mostre os eventos cujo nome começa com a letra N.

select * from eventos
where nome like'N%';

-- 9. Liste os estilos musicais existentes sem repetições (DISTINCT).

select distinct estilo_musica from eventos;

-- 10. Ordene os eventos da data mais próxima para a mais distante.

select * from eventos
order by data_evento;

-- 11. Ordene os ingressos do mais caro para o mais barato.

select * from ingresso
order by preco desc;

-- 12. Mostre os ingressos com preço entre R$ 50 e R$ 150.

select * from ingresso
where preco between 50 and 150;

-- B — Funções e agrupamentos

-- 13. Conte quantos eventos foram cadastrados.

select count(*) total_de_eventos from eventos;

-- 14. Mostre o menor e o maior preço de ingresso.

select max(preco) maximo from ingresso;

select min(preco) minimo from ingresso;

-- 15. Calcule o preço médio dos registros de ingresso.

select avg(preco) media from ingresso;

-- 16. Calcule o total de unidades vendidas em todos os registros de ingresso.

select sum(quantidade_vendida) total_vendas from ingresso;

-- 17. Mostre quantos eventos existem em cada estilo musical.

select estilo_musica, count(*) quantidade from eventos
group by estilo_musica;

-- 18. Mostre o total de unidades vendidas por tipo de ingresso.

select tipo, sum(quantidade_vendida) from ingresso
group by tipo;

-- 19. Calcule a arrecadação estimada de cada registro de ingresso (preço × quantidade_vendida).

select id_ingresso, tipo, preco, quantidade_vendida, preco * quantidade_vendida as arrecadacao from ingresso;

-- C — Consultas com JOIN

-- 20. Use INNER JOIN para mostrar o nome do evento e o tipo de ingresso associado.

select e.nome, i.tipo 
from eventos as e
inner join ingresso as i
on e.id_eventos = i.fk_id_eventos;

-- 21. Use INNER JOIN para mostrar evento, tipo, preço e quantidade vendida.

select e.nome, i.preco, i.quantidade_vendida
from eventos as e
inner join ingresso as i
on e.id_eventos = i.fk_id_eventos;


















