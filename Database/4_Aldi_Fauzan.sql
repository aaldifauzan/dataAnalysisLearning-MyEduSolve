-- Aldi Fauzan

-- No. 1 // Tampilkan daftar semua film yang tersedia di toko.
select f.title, f.description 
from film f;


-- No. 2 // Siapa staff yang paling banyak melakukan transaksi peminjaman?
select 	s.first_name, s.last_name, 
    	count(r.rental_id) as rental_count
from staff s
join rental r on s.staff_id = r.staff_id
group by s.staff_id
limit 1;


-- No. 3 // Tampilkan daftar 10 aktor pertama berdasarkan abjad
select 	a.first_name, a.last_name
from actor a
order by 1,2 asc
limit 10;


-- No. 4 // Tampilkan 5 film dengan durasi paling lama
select f.title, f.`length` 
from film f
order by 2 desc
limit 5;


-- No. 5 // Hitung jumlah pinjaman yang dilakukan setiap bulan dalam setiap tahun
select 	extract(year from r.rental_date) as year,
		extract(month from r.rental_date) as month,
		count(r.rental_id) as rental_count
from rental r 
group by 1,2 
order by 1,2;


-- No. 6 // Tampilkan daftar film yang memiliki kata “drama” dalam deskripsi mereka
select f.title
from film f
where f.description like '%DRAMA%'
group by 1;


-- No. 7 // Hitung total pendapatan dari peminjaman pada hari Jumat
select sum(p.amount) as `sum`
from payment p
join rental r on p.rental_id = r.rental_id
where dayname(r.rental_date) = 'Friday';


-- No. 8 // Tampilkan 5 kota dengan total pendapatan peminjaman tertinggi
select ci.city_id, ci.city, sum(p.amount) as total_revenue
from payment p
join customer c on c.customer_id = p.customer_id
join address a on a.address_id = c.address_id
join city ci on ci.city_id = a.city_id
group by 1, 2
order by 3 desc
limit 5;


-- No. 9 // Tampilkan 7 pelanggan yang paling sering terlambat mengembalikan film
select 	c.customer_id,
    	c.first_name,
    	c.last_name,
    	count(r.rental_id) as late_return_count
from customer c
join rental r on c.customer_id = r.customer_id
where r.return_date > r.rental_date  
group by 1,2,3
order by late_return_count desc
limit 7;


-- No. 10 // Tampilkan daftar film film yang tidak pernah dipinjam
select f.film_id, f.title 
from film f 
left join inventory i on i.film_id = f.film_id 
left join rental r on r.inventory_id = i.inventory_id
where r.inventory_id is null;
