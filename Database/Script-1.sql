
-- Buat sebuah Datamart dari database DVD rental yang bisa memberikan informasi di bawah ini. Semua informasi bisa dilihat berdasarkan tahun, bulan, dan tanggal.

-- 1.	Melihat pendapatan sewa dari film berdasarkan:
-- a.	Judul Film
-- b.	Rating Film
-- c.	Kategori Film

-- 2.	Melakukan segmentasi customer:
-- a.	Frekuensi Peminjaman
-- b.	Total Biaya Sewa
-- c.	Jenis film yang sering di sewa (kategori film dan rating film)

-- 3.	Melihat informasi keterlambatan sewa seperti:
-- a.	Film yang paling sering terlambat dikembalikan
-- b.	Berapa jumlah pembatalan dalam periode tertentu

-- Hint : Rumus untuk mengecek apakah penyewaan tersebut dinyatakan terlambat adalah, membandingkan rental duration film dan jarak antara tanggal peminjaman dan tanggal kembali.

-- No. 1
select 	fil.film_id, cat.category_id, date(fil.last_update) as film_last_update,
		fil.title as film_title, fil.release_year as film_release_year,
		cat.name as category_name, fil.rating as film_rating, fil.rental_rate
from film fil
left join film_category fcat on fcat.film_id = fil.film_id 
left join category cat on cat.category_id = fcat.category_id;
    
-- No. 2
select 	cust.customer_id, r.rental_id, pay.amount,
		concat(cust.first_name, ' ', cust.last_name) as customer_name,
		fil.title as film_title,
		fil.rating as film_rating,
		cat.name as category_name,
		date(r.rental_date) as rental_date
from customer cust
left join rental r on r.customer_id = cust.customer_id 
left join payment pay on pay.rental_id = r.rental_id 
left join inventory inv on inv.inventory_id = r.inventory_id 
left join film fil on fil.film_id = inv.film_id 
left join film_category fc on fc.film_id  = fil.film_id 
left join category cat on fc.category_id = cat.category_id


select 	r.rental_id,
		f.title,
		f.rental_duration,
		date(r.rental_date) as tanggal_peminjaman,
		date(r.return_date) as tanggal_pengembalian
from rental r 
left join inventory i on i.inventory_id = r.inventory_id 
left join film f on f.film_id = i.film_id
where title = 'GRIT CLOCKWORK' and return_date > rental_date + INTERVAL rental_duration DAY


SELECT COUNT(jumlah_terlambat)
FROM rental
WHERE tanggal_pengembalian > tanggal_peminjaman + INTERVAL rental_duration DAY
AND tanggal_peminjaman BETWEEN '2005-06-20' AND '2006-06-20';




