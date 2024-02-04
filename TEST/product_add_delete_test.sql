select*from t_product
--urun ekle
begin
  p_product_management.add_product(sequence1.nextval,415,430,'MaviEtek',389.99);
  end;
--hatali id ile urun eklemeye calisma

begin
p_product_management.add_product(sequence1.nextval,415,9030,'MaviEtek',389.99);
end;
--urun sil soft delete

begin
     p_product_management.delete_product(920);
end;
