create or replace directory PURCHASE_HISTORY_CSV_EXPORT as 'D:/csv_export';

declare
  v_file utl_file.file_type;
begin
  v_file := utl_file.fopen('PURCHASE_HISTORY_CSV_EXPORT', 'purchase_history.csv', 'w'); --csv dosya acma
  utl_file.put_line(v_file, 'product_id,purchase_date,invoice_no'); --ilk satir
  for rec in (select * from table(t_shopping_history(900))) loop
    utl_file.put_line(v_file, rec.product_id || ',' || to_char(rec.purchase_date, 'YYYY-MM-DD HH24:MI:SS') || ',' || rec.invoice_no);
  end loop;
  utl_file.fclose(v_file);
    dbms_output.put_line('CSV dosyasi basariyla olusturu.');
exception
  when others then
    dbms_output.put_line('Hata: ' || sqlerrm);
end;

