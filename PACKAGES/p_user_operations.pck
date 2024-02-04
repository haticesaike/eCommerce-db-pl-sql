create or replace noneditionable package p_user_operations as
  -- user kayit
  procedure register_user(p_first_name t_users.first_name%type,
                          p_last_name  t_users.last_name%type,
                          p_email      t_users.email%type,
                          p_password   t_users.password%type);

  -- user giris
  procedure login_user(p_email  t_users.email%type, p_password  t_users.password%type);


--password degistirme
  procedure change_password(
        p_user_email t_users.email%type,
        p_new_password t_users.password%type);
  end p_user_operations;
/
create or replace noneditionable package body p_user_operations as
-- kayit ekle
procedure register_user(p_first_name t_users.first_name%type,
                          p_last_name  t_users.last_name%type,
                          p_email      t_users.email%type,
                          p_password   t_users.password%type) is
v_hashed_password raw(64);
v_user_count number;

begin
-- eposta kontrolu
  select count(*) into v_user_count
    from t_users
    where email = p_email;
    if v_user_count > 0 then
      raise_application_error(-20001, 'Bu email adresi ile kayitli bir kullanici zaten var.');
    end if;

-- parola hash
v_hashed_password := DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(p_password), DBMS_CRYPTO.HASH_SH256);

-- user ekle
insert into t_users(id, first_name, last_name, email, password)
values(sequence1.nextval, p_first_name, p_last_name, p_email, v_hashed_password);
commit;
-- Hata varsa
exception
when others then
rollback; --  geri al
raise;
end register_user;

-- kayitli kullanici girisi
procedure login_user(p_email  t_users.email%type, p_password  t_users.password%type) is
v_hashed_password raw(64);
v_user_id t_users.id%type;
begin
-- parola hash
v_hashed_password := DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(p_password), DBMS_CRYPTO.HASH_SH256);

-- user check
select id
  into v_user_id
  from t_users
  where email = p_email and password = v_hashed_password;

if v_user_id is not null then
  dbms_output.put_line('Giris basarili. Kullanici ID: ' || v_user_id);
end if;
-- Hata kontrolu
exception when no_data_found then
  dbms_output.put_line('Giris basarisiz. Kullanici bulunamadi veya parola hatali.');
  when others then
    dbms_output.put_line('Bilinmeyen bir hata olustu' || sqlerrm);
  raise;
  end login_user;

--parola degistirme
procedure change_password(
        p_user_email t_users.email%type,
        p_new_password t_users.password%type) is v_hashed_password RAW(64);

begin
-- Parola hash
v_hashed_password := DBMS_CRYPTO.HASH(UTL_RAW.CAST_TO_RAW(p_new_password), DBMS_CRYPTO.HASH_SH256);

-- parola update
declare
v_user_count number;
begin
  select count(*) into v_user_count from t_users
  where email = p_user_email;
  if v_user_count > 0 then
   update t_users set password = v_hashed_password
   where email = p_user_email;
   dbms_output.put_line('Sifre degistirme islemi basarili');
   commit;
  else
    dbms_output.put_line('Sifre degistirme tamamlanamadi. Hatali bilgi girdiniz.');
   end if;
end;
-- Hata varsa
exception
  when no_data_found then
    dbms_output.put_line('Kullanici bulunamadi.');
  when others then
    dbms_output.put_line('Sifre degistirme tamamlanamadi. Bilinmeyen bir hata olustu' || sqlerrm);
    rollback; -- geri al
    raise;
   end change_password;
end p_user_operations;
/
