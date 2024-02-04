create table t_sub_category (
    id number primary key,
    category_id number,
    name varchar2(50) not null,
    constraint fk_category_parent foreign key (category_id) references t_category(id)
);
select*from t_sub_category

declare
begin
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,415,'gomlek');
  
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,415,'etek');
  
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,415,'pantolon');
  
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,420,'bot');
  
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,420,'sandalet');
  
  insert into  t_sub_category(id,category_id,name)
  values(sequence1.nextval,420,'spor');
end;
