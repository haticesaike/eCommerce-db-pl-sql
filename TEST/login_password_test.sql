-- Kullanici ekle

begin
   --p_user_operations.register_user('hatice', 'saike', 'hatice@hotmail.com', 'hatice123');
   --p_user_operations.register_user('hasan','berber','hasan@hotmail.com','hasan123');
   --p_user_operations.register_user('ece','yilmaz','ece@hotmail.com','ece123');
   p_user_operations.register_user('ece','ayhan','eceayhan@hotmail.com','ece123'); --kayitli kullanici test
   
end;
select*from t_users

begin
   p_user_operations.register_user('ayse','polat','ayse@hotmail.com','ayse12345');--yeni kullanici test
  
 end;
 
--giris basarili
begin
     p_user_operations.login_user('hasan@hotmail.com','hasan123');
end;


--giris basarisiz sifre hatali
begin
   p_user_operations.login_user('eceayhan@hotmail.com','ece11');
end;

--sifre degistirme
begin
  p_user_operations.change_password('eceayhab@hotmail.com','ece112'); --yanlis email girildiginde
end;

begin
    p_user_operations.change_password('eceayhan@hotmail.com','ece121'); --sifre degistirme basarili
end;

select*from t_users
