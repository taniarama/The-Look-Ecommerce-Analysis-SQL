--Jumlah Order dari keseluruhan
SELECT COUNT (*) Jumlah_Order
FROM bigquery-public-data.thelook_ecommerce.orders;

--Jumlah order dari tabel order.items
SELECT COUNT (*) Tes_Jumlah_Order_IDOrderItems
From bigquery-public-data.thelook_ecommerce.order_items;

--Jumlah Order untuk masing-masing Status
Select status, Count(*) as Jumlah_Order
From bigquery-public-data.thelook_ecommerce.orders
Group by status;

--Produk terlaris berdasarkan jumlah order 
select product_id, count (*) as jumlah_order_product
From bigquery-public-data.thelook_ecommerce.order_items
Group by product_id
order by 2 desc
limit 10;

--Mendapatkan customer per negara
select country, count (*) jumlah_cust
FROM bigquery-public-data.thelook_ecommerce.users
Group by 1
order by 2 desc
limit 10;

--Performa Penjualan berdasarkan status pesanan jumlah item, jumlah order unik, total nilai penjualan, dan rata-rata harga jual. Tampilkan hanya status dengan minimal 100 item, kemudian urutkan berdasarkan total penjualan dari yang terbesar hingga terkecil.

SELECT 
status,
count (*) Jumlah_Item,
Count (distinct order_id) as Jumlah_Order,
ROUND(SUM(sale_price),2) total_sales,
ROUND (Avg(sale_price),2) Rata_Harga_Jual,
FROM bigquery-public-data.thelook_ecommerce.order_items
Group by 1
Order by 4 DESC;

--Jumlahkan nilai sale_price pada item Order
Select 
round(Sum(sale_price)/1000000,2) total_revenue_in_Million
FROM bigquery-public-data.thelook_ecommerce.order_items;

--Berapa rata-rata harga produk per kategori?
Select 
category,
count (*) Total_Item,
avg(retail_price) as rata_harga_product
FROM bigquery-public-data.thelook_ecommerce.products
group by 1
Order by 3 desc;

--Berapa jumlah transaksi, jumlah sale price, rata-rata nilai per transaksi (AOV) untuk masing-masing user (Bagi dengan jumlah order user), Tampilkan hanya 10 user

SELECT 
user_id,
Count (distinct order_id) as Jumlah_Order,
ROUND(SUM(sale_price),2) total_sales,
ROUND(SUM(sale_price)/Count (distinct order_id),2) as AOV
FROM bigquery-public-data.thelook_ecommerce.order_items
Group by 1
Order by 3 DESC
LIMIT 10;


