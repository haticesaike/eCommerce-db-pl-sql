create type t_top_sales_type as object (
   product_id number,
   product_name varchar2(50),
   price number(10, 2),
   total_count number
);
create or replace type t_top_sales_table_type as table of t_top_sales_type;

create or replace function sorted_by_purchase_desc
return t_top_sales_table_type as
   v_sales_data t_top_sales_table_type := t_top_sales_table_type();
   
begin
   select t_top_sales_type(pu.product_id,pr.product_name,pr.price,sum(pu.p_count))
   bulk collect into v_sales_data
   from t_purchase pu
   join t_product pr on pu.product_id = pr.id
   group by pu.product_id, pr.product_name, pr.price
   order by sum(pu.p_count) desc;
   return v_sales_data;
end sorted_by_purchase_desc;

create or replace function sorted_by_purchase_asc
return t_top_sales_table_type as
   v_sales_data t_top_sales_table_type := t_top_sales_table_type();
   
begin
   select t_top_sales_type(pu.product_id,pr.product_name,pr.price,sum(pu.p_count))
   bulk collect into v_sales_data
   from t_purchase pu
   join t_product pr on pu.product_id = pr.id
   group by pu.product_id, pr.product_name, pr.price
   order by sum(pu.p_count) asc;
   return v_sales_data;
end sorted_by_purchase_asc;
