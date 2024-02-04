create table t_product
(
    id number primary key,
    product_name varchar2(50) not null,
    price number(10, 2) not null,
    fk_category_id number,
    fk_sub_category_id number,
    --is_sale number(1,0) default 1 sonradan alter ile eklendi
    constraint fk_category foreign key (fk_category_id) references t_category(id),
    constraint fk_sub_category foreign key (fk_sub_category_id) references t_sub_category(id)
);

begin
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'SlimFitGomlek', 400);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'ClassicGomlek', 450);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'DenimGomlek', 700);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'JeanGomlek', 600);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'CottonGomlek', 650);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'RegularFitGomlek', 600);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'CropGomlek', 750);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'LooseFitGomlek', 500);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'ModalGomlek', 1500);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 425, 'FittedGomlek', 1200);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'KumasEtek', 600);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'DesenliEtek', 200);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'PliseEtek', 250);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'VolanliEtek', 800);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'PileliEtek', 400);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'KanvasEtek', 1100);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'JeanMiniEtek', 300);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'DeriEtek', 350);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'KargoEtek', 700);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 430, 'TrikoEtek', 320);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'SlimFitPant', 450);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'CizgiliPant', 400);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'KlasikPant', 1300);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'KargoPant', 500);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'KotPant', 800);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'KumasSkinnyPant', 750);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'SortPant', 400);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'YuksekBelPant', 640);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'DenimPant', 600);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 415, 435, 'GenisPacaPant', 720);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'TrendTabanBot', 1200);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'SneakerBot', 1299);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'KlasikBot', 1400);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'TopukluBot', 1700);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'BikerBot', 1150);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'DolguTopukBot', 899);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'WorkerBot', 1100);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'KarBot',799) ;
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'ChelseaBot', 1499);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 440, 'VizonKarBot', 939);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'TopukluSand', 599);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'BodrumSand', 649);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'CompfortSand', 719);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'RuganSand', 450);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'DeriSand', 765);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'ParmakSand', 820);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'NubukSand', 585);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'SatenSand', 895);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'HasirSand', 1780);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 445, 'TabaDeriSand', 715);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'SneakerSpor', 1399);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'SkechersSpor', 2519);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'ArchFitSpor', 1890);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'KosuSpor', 755);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'RunnerSpor', 1365);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'KramponSpor', 699);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'JordanSpor', 1099);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'CreeperSpor', 2599);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'RetroSpor', 2290);
    insert into t_product(id, fk_category_id, fk_sub_category_id, product_name, price)
    values (sequence1.nextval, 420, 450, 'ReBoundSpor', 1430);
end;

