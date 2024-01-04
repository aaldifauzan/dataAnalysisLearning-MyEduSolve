
-- No. 1
create database mini_project;

use mini_project

select 	date(film_last_update) as film_last_update,
		film_id,
		film_title,
		film_rating,
		category_name,
		sum(rental_rate) as total_rental_rate
from film
group by 1,2,3,4,5
order by 6 desc;


-- No. 2
-- Frekuensi Peminjaman dan Total Biaya Sewa
select 	customer_id,
		customer_name,
		count(rental_id) as frekuensi_peminjaman,
		sum(amount) as total
from customer
group by 1,2

-- Jenis film yang sering disewa (kategori film dan rating film)
select 	film_rating as rating,
		category_name AS category,
		count(rental_id) AS jumlah_sewa
from customer
group by film_rating, category_name
order by jumlah_sewa desc



-- select 	customer_id, film_title as title, film_rating as rating,
-- 	    category_name as category, count(rental_id) as Jumlah_Sewa
-- from customer
-- where film_title = 'SHOCK CABIN'
-- GROUP BY customer_id, film_title, film_rating, category_name


SELECT
    title,
    rental_duration,
    tanggal_peminjaman,
    tanggal_pengembalian,
    COUNT(rental_id) AS jumlah_terlambat
FROM
    rental
WHERE
    tanggal_pengembalian > tanggal_peminjaman + INTERVAL rental_duration DAY
GROUP BY
    1,2,3,4
ORDER BY
    jumlah_terlambat DESC;
   
   
SELECT COUNT(rental_id) as jumlah_Keterlambatan
FROM rental
WHERE tanggal_pengembalian > tanggal_peminjaman + INTERVAL rental_duration DAY
AND tanggal_peminjaman BETWEEN '2005-06-20' AND '2006-06-20';


