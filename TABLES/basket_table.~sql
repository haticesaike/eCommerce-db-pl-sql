create table t_basket (
    id number primary key,
    user_id number,
    product_id number,
    product_count number,
    constraint fk_basket_user foreign key (user_id) references t_users(id),
    constraint fk_basket_product foreign key (product_id) references t_product(id)
);
