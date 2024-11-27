--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;



-- Comptabilité par prestation
select 
    'divider'  as component,
    5 as size,
    'Bilan financier des prestations' as contents,
    'orange' as color;
    
SELECT 'table' as component,
    TRUE as compact,
    TRUE as sort,
    TRUE as search,
    'Menu' as markdown;
SELECT
    strftime('%d/%m/%Y',jour) as Date, 
    (SELECT formule from formules WHERE formule_id=formules.id) as Formule,
    (SELECT service from services WHERE service_id=services.id) as Service,
    SUM(nombre) as Quantité,
    group_concat(distinct entree||CHAR(10) || CHAR(10)|| plat||CHAR(10) || CHAR(10)|| dessert) as Menu,
    coalesce((SELECT printf("%.2f",prix) FROM menu WHERE menu.repas_id=repas.id),'-')||'€' as Unité,
    printf("%.2f",SUM(addition))||'€' as Total
    from clients JOIN repas on repas.id=clients.repas_id join menu on repas.id=menu.repas_id GROUP BY repas.id;
SELECT
    '' as Date,
    '' as Formule,
    '' as Service,    
    '' as Quantité,
    '' as Menu,
    '' as Unité,
    printf("%.2f",SUM(addition))||'€' as Total
    from clients;


