-- PERTEMUAN SQL 1

-- buat database
create database db_toko;


-- gunakan database db_toko
use db_toko;
-- buat table baru (barang) di db_toko
create table barang (
	kode int,
	nama varchar(100),
	harga int,
	jumlah int
);

-- drop table untuk menghilangkan table

drop table barang;





-- PERTEMUAN SQL 2


-- Query Alter Table - ADD
alter table barang
add column deskripsi text;

-- Query Alter Table - DROP
alter table barang
drop column deskripsi;

-- Query Alter Table - RENAME
alter table barang
rename column kode to id;

-- Query Alter Table - MODIFY
alter table barang
modify deskripsi text first;

alter table barang
modify deskripsi text after nama_barang;



-- query insert untuk memasukkan data ke dalam table
insert into barang(id, nama_barang,deskripsi,harga,jumlah)
values(1,'Indomie','Indomie Soto Kari',3000,1);

-- query insert untuk memasukkan data ke dalam table > 1 entry
insert into barang(id, nama_barang,deskripsi,harga,jumlah)
values(2,'Indomie','Indomie Soto Kari',3000,1),
	  (3, 'Sarimi','Sarimi Soto Koya',3000,2),
	  (4,'Mie Sedaap','Mie Sedaap Goreng',3000,1);
	  

	 
-- query untuk menambahkan auto increment dalam table creation*
create table admin
(
	id int auto_increment,
	first_name text,
	last_name text,
	primary key (id)
);

-- insert ke table dengan autoincrement
insert into admin(first_name,last_name)
values('Aldi','Fauzan');

-- insert ke table dengan autoincrement > 1 entry
insert into admin(first_name,last_name)
values('Joko','Widodo'),
	  ('Prabowo','Subianto'),
	  ('Ganjar','Pranowo'),
	  ('Anies','Baswedan');
	  
	 
	 
	 
	 
	 
-- Pertemuan SQL 3
	 
	 
	 
-- menambahkan auto increment pada table yang sudah dicreate
alter table barang 
add primary key(id);

-- auto increment dengan modify
alter table barang
modify column id int auto_increment;


-- query insert untuk memasukkan data ke dalam table tanpa id
insert into barang(nama_barang,deskripsi,harga,jumlah)
values('Sarimie2','Indomie Soto Kari',3000,1);




-- query update untuk menambahkann data pada salah satu kolom
update barang
set deskripsi = 'Mie sedaap goreng'
where id = 4;

-- query update untuk menambahkann data pada beberapa kolom
update barang 
set deskripsi = 'Mie Sedaap Goreng Spesial',
	harga = 4500
where id = 4;

-- query delete untuk menghapus data
delete
from barang
where id = 5;

-- query select untuk mengambil data dari table
-- * untuk mengambil seluruh table
select *
from barang;

-- Mengambil beberapa kolom
select id, harga
from barang;





-- Query select dan where untuk mengambil data dengan kondisi tertentu
-- Operator = dan !=
select first_name, last_name 
from admin
where first_name = 'Joko';

select first_name, last_name 
from admin
where first_name != 'Joko';



-- Operator <, >, <=, >=
select nama_barang, harga, jumlah
from barang
where harga > 3500;

select nama_barang, harga, jumlah
from barang
where harga < 3500;

select nama_barang, harga, jumlah
from barang
where harga >= 3000;

select nama_barang, harga, jumlah
from barang
where harga <= 3000;


-- Query AND dan OR untuk menambahkan kondisi pada where
select nama_barang, harga, jumlah
from barang
where 	harga >= 3000 
		and nama_barang ='Sarimi';

select nama_barang, harga, jumlah
from barang
where 	harga >= 3500 
		or jumlah = 2;
		
	
	
-- Pertemuan 4

select address_id, address,address2
from address
where address2 is null;


select film_id, title, release_year, rental_rate 
from film
order by rental_rate;

select film_id, title, release_year, rental_rate 
from film
order by rental_rate desc;

select film_id, title, release_year, rental_rate 
from film
order by rental_rate asc;

select film_id, title, release_year, rental_rate 
from film
order by 4 asc;



-- query limit untuk membatasi data yang diambil
select actor_id, first_name, last_name 
from actor
where actor_id > 10
order by first_name asc
limit 20;


-- query like untuk mencari string dengan kriteria tertentu

-- Starting with a Specific Letter:
select actor_id ,first_name 
from actor
where first_name like ('P%');

-- Ending with a Specific Letter:
select actor_id ,first_name 
from actor
where first_name like ('%A');

-- Containing a Specific Word or Letter:
select actor_id ,first_name 
from actor
where first_name like ('%DAN%');

-- Excluding a Specific Word or Letter:
select actor_id ,first_name 
from actor
where first_name not like ('%DAN%');


select  actor_id, first_name, last_name
from actor
where actor_id between 10 and 20;


select  actor_id, first_name, last_name
from actor
where actor_id in (10, 15, 20);





-- Pertemuan 28 Agustus

-- Query between mencari nilai antara kondisi 1 dan kondisi 2
select film_id, title, rental_rate, replacement_cost 
from film
where replacement_cost between 10 and 20 and rental_rate between 2 and 5;

-- Query In untuk mencari nilai multiple string tertentu
select film_id, title, rental_rate, replacement_cost, rating 
from film
where rating in('PG','G');

-- Query Distinct untuk mencari nilai unique pada suatu data / drop duplicate
select distinct (rental_rate) 
from film
where rating in('PG','G');


-- Alias untuk memberi nama sementara

-- Alias untuk kolom
select 	film_id as 'id',
		title as 'film name', 
		description as 'film desc', 
		rating as 'film_rating'
from film;


-- Alias untuk table
select f.film_id, f.title 
from film f;

-- dengan as juga bisa
select f.film_id, f.title 
from film as f;


-- Query untuk Numeric Function
-- Arithmetic Operator
select 10+10 as hasil;
select 20-10 as hasil;

select 	f.film_id,
		f.title as film_name,
		f.replacement_cost*2 as double_replacement_cost,
		f.replacement_cost/2 as half_replacement_cost
from film f;


-- Mathematical Function

select	f.film_id,
		f.title as film_name, 	
		abs(f.replacement_cost-1000) as absolute_values,
		pow(f.replacement_cost,2) as power2_values
from film f;



-- avg, min, max, sum
select 	avg(f.replacement_cost) as average_replacement_cost,
		min(f.replacement_cost) as minimum_replacement_cost,
		max(f.replacement_cost) as maximum_replacement_cost,
		sum(f.replacement_cost) as total_replacement_cost
from film f;





-- Pertemuan 29 Agustus

-- Query Grouping
select f.rating, count(*) as row_count, avg(f.rental_rate) as avg_rate
from film f
group by 1;


select 	f.rating,
		f.special_features,
		count(*),
		avg(f.rental_rate) as avg_rate
from film f 
group by f.rating, f.special_features; 


-- Query Having
select f.rating, count(*) as row_count
from film f 
group by f.rating
having row_count > 200;

-- Having vs Where
select f.rating, count(*) as row_count
from film f 
where f.replacement_cost > 20
group by f.rating
having row_count > 100;


-- Query String Function
-- CONCAT, menggabungkan 2 string atau lebih
select 	a.first_name, a.last_name,
		concat(a.first_name,' ', a.last_name) as fullname,
		lower(a.first_name) as lower_firstname,
		reverse(a.last_name) as reverse_name
from actor a ;


-- EXTRACT
select 	extract (year from p.payment_date) as payment_year,
		extract(month from p.payment_date) as payment_month,
		count(*) as row_count,
		avg(p.amount) as avg_amount
from payment p
group by payment_year, payment_month;


-- Query Flow Control

-- Case When
select rental_rate as rr,
	(case 
	   when rental_rate < 1 then 'Murah' 
	   when rental_rate between 1 and 3 then 'Normal'
	   else 'Mahal'
	end) as harga_kategori
from film f;


-- IF 
select f.rental_rate,
		if
		(f.rental_rate < 1,'Murah',
			if
			(f.rental_rate between 1 and 3,'B','C')
			) as kategori_harga	
from film f;


-- IFNULL
select f.rental_rate,
       IFNULL(
           select(f.rental_rate < 1,'Murah',
             if
             (f.rental_rate between 1 and 3,'B','C')
           ),
           'Tidak Diketahui'
       ) as kategori_harga
from film f;




-- Pertemuan 7

use db_toko;


-- Primary Key
create table product(
	id varchar(100) not null,
	nama varchar(100) not null,
	description text,
	price int not null,
	quantity int not null,
	created_at timestamp not null default current_timestamp,
	primary key(id)
);


-- Foreign Key
create table wishlist(
	id int not null auto_increment,
	id_product varchar(100) not null,
	description text,
	primary key(id),
	constraint fk_wishlist_product
		foreign key(id_product) references product(id)
);

-- Drop Constraint
alter table wishlist
drop constraint fk_wishlist_product;

-- Add Constraint
alter table wishlist
add constraint fk_wishlist_product
	foreign key(id_product) references product(id);
	

-- Unique Key
create table customers(
	id int not null auto_increment,
	email varchar(100),
	first_name varchar(100),
	last_name varchar(100),
	primary key(id),
	unique key email_unique(email)
);

-- Drop Unique Key
alter table customers 
drop constraint email_unique;

-- Add Unique Key
alter table customers 
add constraint email_unique unique(email);


-- Composite Key
create table product2(
	id int not null,
	nama varchar(100),
	manufacturer varchar(100),
	primary key(nama, manufacturer)
);

-- Insert values pada composite key
insert into product2(id,nama,manufacturer)
values	(1,'Soap','Hamam'),
		(2,'Shampoo','Teresme'),
		(3,'Oil','Almond');
	
insert into product2(id,nama,manufacturer)
values	(4,'Soap2','Hamam');

-- Error karena 2 primary key nya sama dg sebelumnya
insert into product2(id,nama,manufacturer)
values	(5,'Soap','Hamam');


-- Constraint pada table
create table product3(
	id varchar(100) not null,
	nama varchar(100),
	description text,
	price int,
	primary key(id),
	constraint price_check check(price>10000)
);

-- Insert data yang sesuai dengan constraint
insert into product3(id,nama,price)
values	(1,'Indomie','11000');

-- Insert data yang tidak sesuai dengan constraint
insert into product3(id,nama,price)
values	(1,'Indomie','8000');

-- Drop Constraint
alter table product3
drop constraint price_check;

-- Add Constraint
alter table product3
add constraint price_check check(price>1000);




-- Pertemuan 8

-- Query untuk Join Table
select *
from film
join film_actor on film_actor.film_id = film.film_id;


-- Query untuk Join Table dengan Alias
select 	pay.payment_id, pay.payment_id, pay.amount,
		cust.first_name,cust.last_name,cust.email
from payment pay
join customer cust on cust.customer_id = pay.customer_id;


-- lebih dari 2 tabel
select 	pay.payment_id, pay.payment_id, pay.amount,
		cust.first_name,cust.last_name,cust.email,
		addr.address,addr.district
from payment pay
join customer cust on cust.customer_id = pay.customer_id
join address addr on addr.address_id = cust.address_id;


-- Query untuk Inner Join
select 	sto.store_id, cust.first_name, addr.address
from customer cust
inner join store sto on sto.store_id = cust.store_id
inner join address addr on addr.address_id = cust.address_id;


-- Query untuk Left Join
select 	sto.store_id, cust.first_name, addr.address
from customer cust
left join store sto on sto.store_id = cust.store_id
left join address addr on addr.address_id = cust.address_id;


-- Query untuk Right Join
select 	sto.store_id, cust.first_name, addr.address
from customer cust
right join store sto on sto.store_id = cust.store_id
right join address addr on addr.address_id = cust.address_id;

-- Query untuk Right Join
select 	st.first_name, addr.address
from staff st
cross join address addr;





--  Pertemuan 9
-- Query Union untuk menggabungkan tabel
select a.first_name,a.last_name from actor a
union
select c.first_name,c.last_name from customer c;


-- Query Union untuk menggabungkan tabel dengan limit dan alias
(	select act.actor_id,act.first_name,act.last_name  
	from actor act 
	limit 10)
union
(	select cust.customer_id,cust.first_name,cust.last_name  
	from customer cust 
	limit 10);


-- Query Union All untuk menggabungkan semua data table
select a.actor_id,a.first_name,a.last_name, a.last_update 
from actor a
union all
select c.customer_id,c.first_name,c.last_name,c.last_update 
from customer c;

-- bedanya dengan union
(select act.actor_id,act.first_name,act.last_name, act.last_update 
from actor act
limit 10)
union all
(select cust.customer_id,cust.first_name,cust.last_name, cust.last_name 
from customer cust
limit 10);


-- Query Intersect dengan Inner Join
select distinct (addr.district)
from address a
inner join staff s on s.address_id = a.address_id;


-- Query untuk membuat Index pada table
use db_toko;
create table seller(
	id int not null auto_increment,
	name varchar(100),
	email varchar(100),
	primary key(id),
	unique key email_unique (email),
	index name_index(name)
)

-- Query alter untuk add index
alter table seller
add index email_index(email);

alter table seller
drop index email_index;

drop table seller


-- Pertemuan 10
use sakila;

select 	rating,
		count(distinct film_id) as film_count, 
		sum(rental_rate) as total_rental_rate 
from film
group by rating
order by rating asc;


-- Query Create View
create view film_rental_cost as (
	select 	rating,
		count(distinct film_id) as film_count, 
		sum(rental_rate) as total_rental_rate 
from film
group by rating
order by rating asc
);

show full tables;

select * from film_rental_cost;


-- Replace view yang sudah ada, dengan membuat yang ingin dijadikan view terlebih dahulu
select 	f.rating,
		count(distinct a.first_name) as actor_count,
		count(distinct f.film_id) as film_count, 
		sum(f.rental_rate) as total_rental_rate
from film f
left join film_actor fa on fa.film_id = f.film_id 
left join actor a on a.actor_id = fa.actor_id 
group by rating
order by rating asc;

-- Query untuk membuat view dengan create or replace
create or replace view film_rental_cost as(
select 	f.rating,
		count(distinct a.first_name) as actor_count,
		count(distinct f.film_id) as film_count, 
		sum(f.rental_rate) as total_rental_rate
from film f
left join film_actor fa on fa.film_id = f.film_id 
left join actor a on a.actor_id = fa.actor_id 
group by rating
order by rating asc
);


-- Query untuk alter view
alter view film_rental_cost as(
	select 	f.rating,
		count(distinct a.first_name) as actor_count,
		count(distinct f.film_id) as film_count, 
		sum(f.rental_rate) as total_rental_rate
from film f
left join film_actor fa on fa.film_id = f.film_id 
left join actor a on a.actor_id = fa.actor_id 
group by rating
order by rating desc
);




-- Pertemuan 11
-- Query untuk membuat subquery 
-- Setelah From

select act.* 
from(
	select actor_id, first_name,last_name
	from actor
	where actor_id < 10
	) act where act.first_name like ('P%');


-- Subquery tabel utama
select sub_tab.*
from(
	select stf.first_name, sum(pay.amount) as total_income
	from store sto
	join staff stf on stf.store_id = sto.store_id 
	join payment pay on pay.staff_id = stf.staff_id 
	group by 1
)sub_tab;


-- Variasi join pada tabel di database
select sub_tab.first_name, sum(pay.amount) as total_income
from(
	select stf.staff_id, stf.first_name
	from store sto
	join staff stf on stf.store_id = sto.store_id 
)sub_tab
join payment pay on pay.staff_id = sub_tab.staff_id
group by 1;


-- Variasi join subquery lain
select sub_store.first_name, sum(sub_pay.amount) as total_income
from(
	select stf.staff_id, stf.first_name
	from store sto
	join staff stf on stf.store_id = sto.store_id 
) sub_store
join(
	select pay.staff_id, pay.amount
	from payment pay
) sub_pay on sub_pay.staff_id =  sub_pay.staff_id = sub_store.staff_id
group by 1;



-- Query untuk membuat subquery (where)
-- pertama buat query untuk tabel utama
select film_id, title, release_year,rating
from film
where rating in ('PG','G');


select film_id, title, release_year,rating
from film 
where film_id not in (
	select film_id
	from film
	where rating in ('PG','G')
);



select avg(sub_tab.total_amount) as avg_amount
from (
	select sum(amount) as total_amount
	from payment
	group by customer_id
	)sub_tab;
	

select cust.customer_id, cust.first_name, cust.last_name, sum(pay.amount) as total_payment
from payment pay
left join customer cust on cust.customer_id = pay.customer_id
group by 1,2,3
having total_payment > (
	select avg(sub_tab.total_amount) as avg_total_amount
	from(
		select sum(amount) as total_amount
		from payment
		group by customer_id 
	)sub_tab
);




-- Pertemuan 12

-- Query Control Flow Case
select film_id,title,rating,
	(case
		when rating in ('PG','G') then 'Kids'
		when rating in ('NC-17','R') then 'Adults'
	end) as rating_category
from film;


select film_id, title, rental_rate,
	(case
		when rental_rate  < 2 then 'Budget'
		when rental_rate between 2 and 3 then 'Normal'
		else 'Expensive'
	end)as rental_price_category
from film;


-- Query Control Flow IF
select film_id, title, rental_rate,
	if(rental_rate < 2, 'Budget',
	if(rental_rate between 2 and 3, 'Normal Price','Expensive')
	)as rental_price_category
from film;



-- Query Control Flow gabungan IF dan CASE
select film_id, title, rental_rate,
	(case
		when rating in ('PG','G') then 'Kids'
		when rating in ('NC-17','R') then 'Adults'
	end) as rating_category,
	if(rental_rate < 2, 'Budget',
	if(rental_rate between 2 and 3, 'Normal Price','Expensive')
	)as rental_price_category
from film;


-- Query Control Flow Case harus berurutan jika tida, maka hasilnya bisa tidak sesuai
select film_id, title, `length` as film_duration,
	(case
		when `length` < 60 then 'Short'
		when `length` between 60 and 120 then 'Medium'
		when `length` between 120 and 150 then 'Long'
		when `length` > 150 then 'Extra Long'
	end) as film_duration_category
from film;


-- Query Case dengan Subquery
select film_id, title, `length` as film_duration,
	(case
		when `length` < (select 0.5 * avg(`length`) from film) then 'Short Film'
		when `length` between (select 0.2 * avg(`length`) from film) and (select 0.7 * avg(`length`) from film) then 'Medium Film'
		when `length` > (select avg(`length`) from film) then 'Long Film'
		else 'Uncategorized'
	end) as film_categorization
from film;


select film_id,title,
	(case
		when	(	select count(*)
					from rental
					where inventory_id in ( select 	inventory_id
													from inventory
													where film_id = film.film_id)
		) < (
			select avg(rental_count)
			from (	select film_id, count(*) as rental_count
					from rental
					join inventory on rental.inventory_id = inventory.inventory_id 
					group by film_id) as sub_tab
		) then 'CAT A'
		else  'CAT B'
	end) as rental_category
from film;






-- Pertemuan 13
-- Query CTE
with cte1 as(
	select actor_id,first_name,last_name 
	from actor
)
select * from cte1;


-- Query CTE > 1
-- table yang ingin dijadikan CTE
select film_id, title, rating, rental_rate
from film 

select actor_id, film_id
from film_actor

select actor_id, first_name, last_name 
from actor

-- Ubah ke CTE
with cte_film as(
	select film_id, title, rating, rental_rate
	from film 
), cte_film_actor as(
	select actor_id, film_id
	from film_actor
), cte_actor as(
	select actor_id, first_name, last_name 
	from actor
)
select 	fil.film_id, fil.title, fil.rating,
		act.first_name, act.last_name
from cte_film fil
left join cte_film_actor fa on fa.film_id = fil.film_id
left join cte_actor act on act.actor_id = fa.actor_id;


-- Query CTE dari CTE
with cte_film as(
	select f.film_id, f.title,  f.rating, f.rental_rate, fa.actor_id 
	from film f
	left join film_actor fa on fa.film_id = f.film_id 
), cte_actor as(
	select 	act.first_name, act.last_name,
			cf.title, cf.rating, cf.rental_rate
	from actor act
	left join cte_film cf on cf.actor_id = act.actor_id 
)
select * from cte_actor;



-- Pertemuan 14

-- Query untuk membuat procedure (Stored Procedure)
CREATE PROCEDURE get_actor()
	BEGIN
    	SELECT actor_id, first_name, last_name 
    	FROM actor
    	ORDER BY actor_id DESC
    	LIMIT 10;
	END

-- Call Stored Procedure
call get_actor;

-- Drop Stored Procedure
drop procedure if exists get_actor


-- Query parameter in dalam stored procedure
-- template
select actor_id, first_name, last_name 
from actor
where actor_id = 1;

-- Query Stored Procedure IN
create procedure get_actor_id(in param int)
	begin
		select actor_id, first_name, last_name
		from actor
		where actor_id = param;
	end
	
call get_actor_id(10)


create procedure get_actor_id_name(in param int, in nama_film varchar(100))
	begin
		select act.actor_id, act.first_name, act.last_name, fil.title, fil.rating 
		from actor act
		left join film_actor fa on fa.actor_id = act.actor_id 
		left join film fil on fil.film_id = fa.film_id
		where	act.actor_id = param
				and fil.title like (nama_film);
	end

call get_actor_id_name(50, 'C%')

drop procedure get_actor_id_name 


-- Pertemuan 15
-- Query Stored Procedure OUT
select 	cus.customer_id, cust.first_name, cust.last_name, cust.email
		addr.address_id, addr.district, ct.city_id 
from customer cust
left join address addr on addr.address_id = cust.address_id 
left join city ct on ct.city_id = addr.address_id
where cust.customer_id = id_customer

create procedure get_customer_id(in id_customer int, out cust_output varchar(100))
	begin
		select 	first_name 
		into cust_output
		from customer
		where customer_id = id_customer;
	end
	
-- Query untuk call stored procedure IN OUT
call get_customer_id(43, @cust_output);
select @cust_output;


-- Query untuk stored procedure untuk in dan out, in > 1
create procedure get_customer_name(	in cust_name varchar(100),
									in cust_address varchar(100),
									out cust_firstname varchar(100),
									out cust_district varchar(100))
	begin
		select 	cust.first_name, addr.address
		into cust_firstname, cust_district
		from customer cust
		left join address addr on addr.address_id = cust.address_id
		where 	cust.customer_id = cust_name
				or addr.address_id = cust_address;
	end

-- Query untuk call stored procudure in out > 1
call get_customer_name(2, 3, @cust_firstname, @cust_district);
select @cust_firstname, @cust_district;




-- Pertemuan 15
use db_toko;

-- Query untuk melihat user dan password
select user, host from mysql.user;

-- Query untuk membuat / menambahkan user baru
create user 'root2'@'localhost';

-- Query lain untuk membuat / menambahkan user baru
create user 'root3'@'localhost' identified by 'passuser';

-- Query untuk membuat / mengganti password untuk user
set password for 'root2'@'localhost' = 'password2';

-- Query untuk drop / Menghilangkan user
drop user root2@localhost

-- Buat user baru
create user 'root4'@'localhost' identified by 'password4';

-- Query untuk melihat privileges pada user
show grants for root4@localhost

-- Query untuk menambahkan privileges pada user tertentu
-- Grant Select pada user baru ke semua table pada satu database
grant select on db_toko.* to root4@localhost;

-- Grant beberapa privileges pada user baru
grant select, insert, update, delete, alter on db_toko.* to root4@localhost;

-- Grant beberapa privileges untuk satu table pada satu database
grant select, insert, alter on sakila.actor to root4@localhost;
grant select, insert, alter on sakila.city to root4@localhost;

-- Query untuk apply privileges
flush privileges;

-- Query untuk revoke privileges
revoke select, insert, alter on sakila.city from root4@localhost

create table road(
	RoadID int not null,
	Distance int not null
);

insert into road
values(1234, 36)