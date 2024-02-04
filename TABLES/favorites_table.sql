create table  t_favorites (
    user_id number not null,
    product_id number not null,
    --bir urunu bir kullanici sadece bir kere tabloya ekleyebilsin
    constraint pk_favorites primary key (user_id, product_id),
    constraint fk_user foreign key (user_id) references t_users(id),
    constraint fk_product foreign key (product_id) references t_product(id)
);

select*from t_favorites


