create table t_purchase (
    id number primary key,
    user_id number,
    product_id number,
    purchase_date date,
    p_count number, --alter ile isim degisti
    total_price number,
    invoice_no number,
    constraint fk_purchase_user foreign key  (user_id) references t_users(id),
    constraint fk_purchase_product foreign key (product_id) references t_product(id)
);  

