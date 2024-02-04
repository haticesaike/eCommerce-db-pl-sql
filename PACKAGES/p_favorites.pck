create or replace noneditionable package p_favorites as
    procedure add_favorite(p_user_id number, p_product_id number);

    procedure remove_favorite(p_user_id number, p_product_id number);
end p_favorites;
/
create or replace noneditionable package body p_favorites as
    procedure add_favorite(p_user_id number, p_product_id number) is
        begin
            insert into t_favorites(user_id, product_id) values (p_user_id, p_product_id);
            commit;
        exception
            when others then
                dbms_output.put_line('Favori eklerken bir hata olustu:' || sqlerrm);
    end add_favorite;

    procedure remove_favorite(p_user_id number, p_product_id number) is
        begin
            delete from t_favorites where user_id = p_user_id and product_id = p_product_id;
            commit;
        exception
            when others then
                dbms_output.put_line('Favori cikarirken bir hata olustu:' || sqlerrm);

    end remove_favorite;
end p_favorites;
/
