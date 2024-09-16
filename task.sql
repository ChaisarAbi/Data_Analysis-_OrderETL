-- Cari penjualan terbanyak 
select * from df_orders

select order_id, SUM(quantity) as TotalQuantity
from df_orders
group by order_id
order by TotalQuantity desc

-- Cari 5 Barang atau Item dengan Profit Generating Tertinggi
use python
select * from df_orders

select top 5 product_id,category,sub_category, sum(quantity * profits) as TotalProfit
from df_orders
group by product_id,category,sub_category
order by TotalProfit desc;

-- Identifikasi Item dengan Persentase Penjualan Tertinggi
with persentase as (
    select product_id, 
           sum(quantity) as TotalQuantity,
           (sum(quantity) * 100.0 / (select sum(quantity) from df_orders)) as PersentasePenjualan
    from df_orders
    group by product_id
)
select product_id, PersentasePenjualan
from persentase
order by PersentasePenjualan desc;

with persentase as (
    select category, 
           sum(quantity) as TotalQuantity,
           (sum(quantity) * 100.0 / (select sum(quantity)from df_orders)) as PersentasePenjualan
    from df_orders
    group by category
)
select category, TotalQuantity, PersentasePenjualan
from persentase
order by PersentasePenjualan desc;

with persentase as (
    select category, 
           sub_category, 
           product_id, 
           sum(quantity) as TotalQuantity,
           (sum(quantity) * 100.0 / (select sum(quantity) from df_orders)) as PersentasePenjualan
    from df_orders
    group by category, sub_category, product_id
)
select category, sub_category, product_id, TotalQuantity, PersentasePenjualan
from persentase
order by PersentasePenjualan desc;

-- Buat visualisai data (powerbi)


-- Analisis Data Order

select * from df_orders
select order_date,product_id,sub_category, sum(quantity) as TotalQuantity
from df_orders
group by order_date,product_id,sub_category
order by order_date,TotalQuantity desc


-- Cari Item dengan Persentase Profit Tertinggi
with profit as (
select product_id,category,sub_category,
sum(quantity * profits) as TotalProfit, 
(sum(quantity) * 100.0 / (select sum(quantity)from df_orders)) as PersentasePenjualan
from df_orders
group by product_id,category,sub_category)

select product_id,category,sub_category,TotalProfit
from profit
order by PersentasePenjualan desc

-- Buat Laporan Penjualan Bulanan/Mingguan/Tahunan

select DATEPART(year, order_date) as Tahun,
DATEPART(month, order_date) as Bulan,
DATEPART(week, order_date) as Minggu,
--DATEPART(day, order_date) as Hari,
sum(quantity) as TotalQuantity
from df_orders
group by DATEPART(year, order_date),DATEPART(month, order_date),
DATEPART(week, order_date)--,DATEPART(day, order_date) 
order by Tahun,Bulan,Minggu--Hari

select order_date from df_orders

-- Identifikasi Pelanggan yang Paling Aktif

select * from df_orders

with aktivitas as(
select segment,
count(DISTINCT order_id) as FrekuensiOrder

from df_orders
group by segment)

select segment, FrekuensiOrder
from aktivitas
order by FrekuensiOrder desc

-- Analisis Data Keterlambatan Pengiriman


-- Cari Item yang Paling Banyak Dibeli Bersamaan 


-- Buat Visualisasi Data Profit Gunakan tools seperti Power BI atau SSRS untuk menghasilkan grafik berdasarkan data yang telah diolah.


-- Identifikasi Pelanggan yang Paling Menguntungkan


-- Analisis Data Retur


-- Cari Item dengan Persentase Retur Tertinggi


-- Buat Laporan Kinerja Penjualan


-- Identifikasi Faktor yang Mempengaruhi Penjualan


-- Analisis Data Pelanggan


-- Cari Item yang Paling Banyak Dibeli di Tanggal Spesifik


-- Buat Visualisasi Data Keterlambatan Pengiriman Gunakan tools seperti Power BI atau SSRS untuk menghasilkan grafik berdasarkan data yang telah diolah.


-- Identifikasi Area yang Perlu Diperbaiki dalam Proses Pengiriman


--Cari Item dengan Jumlah Penjualan Tertinggi di Setiap Region


--Identifikasi Pelanggan yang Paling Menguntungkan Berdasarkan Nilai Transaksi


--Analisis Data Retur Berdasarkan Alasan Retur


--Cari Item yang Paling Banyak Dibeli Bersamaan dengan Lainnya


--Buat Visualisasi Data Keterlambatan Pengiriman


--Identifikasi Faktor yang Mempengaruhi Penjualan


--Analisis Data Pelanggan Berdasarkan Preferensi Pembelian


--Cari Item yang Paling Banyak Dibeli di Tanggal Spesifik
