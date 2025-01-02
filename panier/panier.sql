SET group_id = coalesce((SELECT user_info.groupe FROM login_session join user_info on user_info.username=login_session.username WHERE id = sqlpage.cookie('session')),0); 


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
    quantity as Quantité,
    '[![](/icons/trash.svg)
](/panier/delete.sql?id='||$id||'&product='||product_id||' "Supprimer")' as Panier
FROM panier
WHERE panier_id=$id;



