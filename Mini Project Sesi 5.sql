-- 1. Tim Product ingin mengetahui karakteristik produk yang dijual. Tampilkan nama produk,kategori, department, merek, dan harga retail dari tabel products. Batasi hasil menjadi 20 produk pertama

Select 
id,
name,
category,
department,
brand,
retail_price
FROM bigquery-public-data.thelook_ecommerce.products
order by id ASC;

--2. Tim Marketing ingin menyiapkan kampanye untuk produk premium. Cari produk dengan retail_price di atas 100. Tampilkan nama produk, kategori, merek, dan harga retail, lalu urutkan dari harga tertinggi ke terendah.

Select
name,
category,
brand,
retail_price
FROM bigquery-public-data.thelook_ecommerce.products
where retail_price > 100
order by retail_price DESC;

--3. Evaluasi Kategori Produk : Tim Product ingin mengetahui kategori dengan jumlah produk terbanyak. Hitung jumlah produk pada setiap kategori dari tabel products, lalu urutkan hasil dari jumlah produk  terbesar.

Select
category,
count (*) Jumlah_Produk,
FROM bigquery-public-data.thelook_ecommerce.products
Group by category
order by 1 DESC;

--4.Mengenal Pelanggan dan Pesanan : Tim CRM ingin melihat pelanggan yang melakukan pemesanan. Gabungkan tabel users dan orders untuk menampilkan ID pesanan, status pesanan, tanggal pesanan dibuat, serta nama depan dan nama belakang pelanggan.

SELECT
o.order_id,
o.status,
o.created_at,
u.first_name,
u.last_name
From bigquery-public-data.thelook_ecommerce.orders o
INNER JOIN bigquery-public-data.thelook_ecommerce.users u
on o.user_id = u.id;

--5. Analisis Penjualan per Kategori : Manajer bisnis ingin mengetahui kategori produk dengan nilai penjualan terbesar. Gabungkan tabel order_items dan products, lalu hitung total nilai penjualan berdasarkan kategori. Tampilkan kategori dan total penjualan, kemudian urutkan dari nilai terbesar. Gunakan order_items.sale_price sebagai nilai transaksi per item.

Select distinct(status)
From bigquery-public-data.thelook_ecommerce.order_items;

SELECT
p.category,
round(sum (oi.sale_price),2) as Total_Penjualan
From bigquery-public-data.thelook_ecommerce.orders o
Join bigquery-public-data.thelook_ecommerce.order_items oi
on o.order_id = oi.order_id
join bigquery-public-data.thelook_ecommerce.products p
on oi.product_id = p.id
where oi.status = 'Complete'
group by p.category
order by 2 DESC
