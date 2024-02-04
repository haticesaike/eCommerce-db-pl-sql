create type t_purchase_type as object (
  product_id number,
  product_name varchar2(50),
  invoice_no number,
  purchase_date date
);
   
create or replace type t_purchase_table_type as table of t_purchase_type;

create or replace function t_shopping_history(p_user_id t_users.id%type) return t_purchase_table_type as
     v_purchase_data t_purchase_table_type := t_purchase_table_type();
     begin
     select t_purchase_type(pu.product_id, pr.product_name, pu.invoice_no, pu.purchase_date)
     bulk collect into v_purchase_data
     from t_purchase pu
     join t_product pr on pu.product_id=pr.id
     where pu.user_id = p_user_id
     order by pu.purchase_date;
     
     return v_purchase_data;
end t_shopping_history;

select*from table(t_shopping_history(915));
