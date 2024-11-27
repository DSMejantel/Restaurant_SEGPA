--Menu
SELECT 'dynamic' AS component, sqlpage.read_file_as_text('menu.json') AS properties;

--Onglets
SET tab=coalesce($tab,'1');
select 'tab' as component;
select  'En cours'  as title, 'receipt' as icon, 'livre.sql?tab=1' as link, CASE WHEN $tab='1' THEN 'orange' ELSE 'green' END as color;
select  'Archives' as title, 'receipt-euro' as icon, 'livre.sql?tab=2' as link, CASE WHEN $tab='2' THEN 'orange' ELSE 'green' END as color;
select  'Détails' as title, 'users' as icon, 'livre.sql?tab=3' as link, CASE WHEN $tab='3' THEN 'orange' ELSE 'green' END as color where $tab=3;
select  'Comptabilité' as title, 'coins' as icon, 'livre.sql?tab=4' as link, CASE WHEN $tab='4' THEN 'orange' ELSE 'green' END as color where $tab=4;

-- Comptabilité par prestation
select 
    'divider'  as component,
    5 as size,
    strftime('%d/%m/%Y',jour)  as contents,
    'orange' as color 
    FROM repas WHERE id=$id AND $tab=4;
    
SELECT 'table' as component,
    'Bilan du '||(SELECT formule from formules WHERE formule_id=formules.id)||' '||(SELECT service from services WHERE service_id=services.id)||' ('||strftime('%d/%m/%Y',jour)||')' as title,
    TRUE as compact,
    TRUE as sort,
    TRUE as search,
    'Menu' as markdown
    FROM repas WHERE id=$id AND $tab=4;
SELECT
    nom  as Client,
    nombre as Quantité,
    group_concat((SELECT entree FROM menu WHERE menu.repas_id=repas.id)||CHAR(10) || CHAR(10) ||(SELECT plat FROM menu WHERE menu.repas_id=repas.id)||CHAR(10) || CHAR(10)|| (SELECT dessert FROM menu WHERE menu.repas_id=repas.id)) as Menu,
    coalesce((SELECT printf("%.2f",prix) FROM menu WHERE menu.repas_id=repas.id),'-')||'€' as Unité,
    printf("%.2f",addition)||'€' as Total
    from clients JOIN repas on repas.id=clients.repas_id WHERE repas.id=$id AND $tab=4 GROUP BY nom;
SELECT
    '' as Client,
    '' as Quantité,
    '' as Menu,
    '' as Unité,
    printf("%.2f",SUM(addition))||'€' as Total
    from clients WHERE repas_id=$id AND $tab=4;

-- Liste des repas à venir 
SELECT 
    'columns' as component WHERE $tab=1;

select 
    strftime('%d/%m/%Y',jour)           as title,
    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    '### '||(SELECT service from services WHERE service_id=services.id) as description_md,
    CASE WHEN entree is not Null THEN json_object('icon','salad','color','green','description',entree) END as item,
    CASE WHEN plat is not Null THEN json_object('icon','meat','color','red','description',plat) END as item,
    CASE WHEN dessert is not Null THEN json_object('icon','cheese','color','orange','description',dessert) END as item,
    json_object('icon','basket','color','vk','description',coalesce(resa,0) ||' en commande') as item,
    'livre.sql?tab=3&id='||repas.id as link,
    'Détails' as button_text,
    'green'  as button_color
    FROM repas JOIN menu on menu.repas_id=repas.id WHERE jour> datetime(date('now'), '-1 day') AND  $tab=1 ORDER BY jour;

    
-- Liste des repas passés 
SELECT 
    'columns' as component WHERE  $tab=2;

select 
    strftime('%d/%m/%Y',jour)           as title,
    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    '### '||(SELECT service from services WHERE service_id=services.id) as description_md,
    CASE WHEN entree is not Null THEN json_object('icon','salad','color','green','description',entree) END as item,
    CASE WHEN plat is not Null THEN json_object('icon','meat','color','red','description',plat) END as item,
    CASE WHEN dessert is not Null THEN json_object('icon','cheese','color','orange','description',dessert) END as item,
    json_object('icon','basket','color','vk','description',coalesce(resa,0) ||' en commande') as item,
    'livre.sql?tab=3&id='||repas.id as link,
    'Détails' as button_text,
    'green'  as button_color
    FROM repas JOIN menu on menu.repas_id=repas.id WHERE jour< datetime(date('now')) AND  $tab=2 ORDER BY jour;
    
-- Liste des Réservations
select 
    'divider'            as component,
    strftime('%d/%m/%Y',jour)  as contents,
    'orange'               as color 
    FROM repas WHERE id=$id AND $tab=3;

    
SELECT 
    'columns' as component WHERE  $tab=3;
select 
    strftime('%d/%m/%Y',jour)           as title,
    (SELECT formule from formules WHERE formule_id=formules.id) as value,
    '### '||(SELECT service from services WHERE service_id=services.id) as description_md,
    CASE WHEN entree is not Null THEN json_object('icon','salad','color','green','description',entree) END as item,
    CASE WHEN plat is not Null THEN json_object('icon','meat','color','red','description',plat) END as item,
    CASE WHEN dessert is not Null THEN json_object('icon','cheese','color','orange','description',dessert) END as item,
    json_object('icon','basket','color','vk','description',coalesce(resa,0) ||' en commande') as item,
    'livre.sql?tab=4&id='||repas.id as link,
    'Comptabilité' as button_text,
    'red'  as button_color
    FROM repas JOIN menu on menu.repas_id=repas.id WHERE repas.id=$id AND  $tab=3;

select 
    nom           as title,
    nombre                 as value,
    'commandes'              as small_text,
    CASE WHEN infos is not Null THEN json_object('icon','alert-triangle','color','red','description',infos) END  as item,
    json_object('icon','phone','color','green','description',tel) as item,
    json_object('icon','mail','color','green','description',courriel) as item,
    printf("%.2f",addition)||' euros' as button_text,
    'green'  as button_color
    FROM clients LEFT JOIN menu on menu.repas_id=clients.repas_id WHERE clients.repas_id=$id AND  $tab=3;
    


