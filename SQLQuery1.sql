create table df_orders (
order_id int primary key,
order_date date,
ship_mode varchar (20),
segment varchar (20),
country varchar (30),
city varchar (30),
[state] varchar (30),
postal_code varchar (30),
regon varchar (30),
category varchar (30),
sub_category varchar (30),
product_id varchar (50),
quantity int,
discount decimal (7,2),
sale_price decimal (7,2),
profit decimal (7,2))

--Wrong Column Name (Cannot Use this in mssql)
-- alter table df_orders Rename column regon to region

EXEC sp_rename 'df_orders.regon', 'region', 'COLUMN';

EXEC sp_rename 'df_orders.profit', 'profits', 'COLUMN';

select * from df_orders
