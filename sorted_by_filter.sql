create type t_product_type as object (
   id number,
  product_name varchar2(50),
  price number(10, 2),
  fk_category_id number,
  fk_sub_category_id number,
  is_sale number
);
create or replace type t_product_table_type as table of t_product_type;

create or replace function sorted_by_filter(
   p_id t_product.id%type default null
)
return t_product_table_type as
   v_product_data t_product_table_type := t_product_table_type();
begin
   select t_product_type(id, product_name, price, fk_category_id, fk_sub_category_id,is_sale)
   bulk collect into v_product_data
   from t_product
   where (p_id is null or fk_category_id = p_id or fk_sub_category_id = p_id) and is_sale = 1;
   return v_product_data;
end sorted_by_filter;
