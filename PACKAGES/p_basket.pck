create or replace noneditionable package p_basket as
  procedure add_product_basket(p_user_id       t_users.id%type,
                               p_product_id    t_product.id%type,
                               p_product_count t_basket.product_count%type default 1);

  procedure remove_product_basket(p_user_id    t_users.id%type,
                                  p_product_id t_product.id%type,
                                  p_remove_count t_basket.product_count%type default 1);

  function get_basket(p_user_id t_users.id%type) return sys_refcursor;
end p_basket;
/
create or replace noneditionable package body p_basket as
-- Sepete ekle
  procedure add_product_basket(p_user_id       t_users.id%type,
                               p_product_id    t_product.id%type,
                               p_product_count t_basket.product_count%type default 1) is
  begin
    update t_basket
    set product_count = product_count + p_product_count
    where user_id = p_user_id and product_id = p_product_id;

    -- Eger urun sepette yoksa, yeni bir kayit ekle
    if sql%notfound then
       insert into t_basket(id, user_id, product_id, product_count)
       values (sequence1.nextval, p_user_id, p_product_id, p_product_count);
       end if;
       commit;
       dbms_output.put_line('Urun sepete eklendi');
       exception
         when others then
           dbms_output.put_line('Hata: ' || sqlerrm);
           rollback;
  end add_product_basket;

-- sepetten sil
 procedure remove_product_basket(p_user_id    t_users.id%type,
                                  p_product_id t_product.id%type,
                                  p_remove_count t_basket.product_count%type DEFAULT 1) is
  l_product_count t_basket.product_count%type;
  begin
        update t_basket
        set product_count = product_count - p_remove_count
        where user_id = p_user_id and product_id = p_product_id;

        select product_count
        into l_product_count
        from t_basket
        where user_id = p_user_id and product_id = p_product_id;

        if l_product_count < 1 then
          delete from t_basket
          where user_id = p_user_id and product_id = p_product_id;
          end if;
          commit;
          dbms_output.put_line('Urun sepetten cikarildi');
          exception
             when others then
             dbms_output.put_line('Hata: ' || sqlerrm);
             rollback;
  end remove_product_basket;
-- sepetteki urunler
   function get_basket(p_user_id t_users.id%type) return sys_refcursor is
    v_cursor sys_refcursor;
  begin
    open v_cursor for
      select b.product_id, b.product_count, p.product_name, p.price
      from t_basket b
      join t_product p on b.product_id = p.id
      where b.user_id = p_user_id;
    return v_cursor;
  end;
end p_basket;
/
