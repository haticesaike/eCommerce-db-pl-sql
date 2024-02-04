create or replace noneditionable package p_purchase as
   procedure purchase_items(p_user_id t_users.id%type);
end p_purchase;
/
create or replace noneditionable package body p_purchase as
   procedure purchase_items(p_user_id t_users.id%type) is
      v_purchase_date date := sysdate; -- islem tarihi
   begin
     declare
      v_user_exists number;
   begin
      select count(*) into v_user_exists from t_users where id = p_user_id;
      if v_user_exists = 0 then
      raise_application_error(-20001, 'hata: belirtilen kullanici bulunamadi.');
      end if;
   end;
      for rec in (select * from t_basket where user_id = p_user_id) loop
         insert into t_purchase (
            id,
            user_id,
            product_id,
            purchase_date,
            p_count,
            total_price,
            invoice_no
         ) values (
            sequence1.nextval,
            p_user_id,
            rec.product_id,
            v_purchase_date,
            rec.product_count,
            rec.product_count * (select price from t_product p where p.id = rec.product_id),
            to_number(to_char(v_purchase_date, 'yyyymmddhh24miss'))
         );
      end loop;
      delete from t_basket where user_id = p_user_id; --satin alinan urun basket tableden silinmeli cunku islem tamamlandi
      commit;
      dbms_output.put_line('Satin alma islemi tamamlandi.');
   exception
      when others then
         rollback;
         dbms_output.put_line('Hata: ' || sqlerrm);
   end purchase_items;
end p_purchase;
/
