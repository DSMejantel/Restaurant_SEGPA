SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 

-- create a temporary table to preprocess the data
create temporary table if not exists panier_actu(product_id,inventaire,id INTEGER PRIMARY KEY);
delete  from panier_actu; 
insert into panier_actu(product_id,inventaire)
SELECT produits.id, reste-vendus-panier.quantity
FROM panier LEFT JOIN produits on panier.product_id=produits.id LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles WHERE reste-vendus-panier.quantity<0;

--Panier
 select 
    'title'   as component,
    'Votre panier :' as contents,
    TRUE as center,
    3         as level;
    
SELECT 'table' as component,
     'Panier' as markdown;
SELECT
    (SELECT produits FROM produits where product_id=produits.id) as Produits,
    quantity as Commandés,
    reste-vendus as Disponibilité,
    CASE WHEN EXISTS (SELECT panier.product_id FROM panier_actu WHERE panier.product_id=panier_actu.product_id AND inventaire<0)
    THEN 'red'
    END as _sqlpage_color,
    CASE WHEN reste-vendus>0 AND EXISTS (SELECT panier.product_id FROM panier_actu WHERE panier.product_id=panier_actu.product_id AND inventaire<0) THEN
    '[![](/icons/refresh.svg)
](/panier/refresh.sql?id='||$id||'&product='||produits.id||' "Ajuster")'
    ELSE
    '[![](/icons/trash.svg)
](/panier/delete.sql?id='||$id||'&product='||produits.id||' "Supprimer")' END as Panier
FROM panier LEFT JOIN produits on panier.product_id=produits.id LEFT JOIN gest_inventaire on produits.id=gest_inventaire.articles
WHERE panier_id=$id;



