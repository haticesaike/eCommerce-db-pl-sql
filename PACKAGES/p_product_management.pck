create or replace noneditionable package p_product_management as
  -- product ekle
  procedure add_product(p_id                t_product.id%type,
                        p_category_id       t_product.fk_category_id%type,
                        p_sub_category_id   t_product.fk_sub_category_id%type,
                        p_product_name      t_product.product_name%type,
                        p_price             t_product.price%type);

  -- product sil
  procedure delete_product(p_product_id  t_product.id%type);
  end p_product_management;
/
create or replace noneditionable package body p_product_management as
   -- product ekle
  procedure add_product(p_id                t_product.id%type,
                        p_category_id       t_product.fk_category_id%type,
                        p_sub_category_id   t_product.fk_sub_category_id%type,
                        p_product_name      t_product.product_name%type,
                        p_price             t_product.price%type) is
begin
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values(p_id, p_category_id, p_sub_category_id, p_product_name, p_price);
    commit;
    dbms_output.put_line('urun basariyla eklendi');
exception
    when others then dbms_output.put_line('hata: ' || sqlerrm);
    rollback;
end add_product;

-- product sil
   procedure delete_product(p_product_id  t_product.id%type) is
begin
   --delete from t_product where id = p_product_id;
   update t_product
   set is_sale = 0
   where id = p_product_id;
   commit;
   dbms_output.put_line('urun basariyla silindi');
exception
   when others then dbms_output.put_line('hata: ' || sqlerrm);
   rollback;
   end delete_product;
end p_product_management;
/
